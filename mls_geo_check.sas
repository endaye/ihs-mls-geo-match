* Match MLS data and GEO data by PIN;
* by Yuancheng Zhang;
* Aug 18, 2015;

* Project Path: /opt/data/PRJ/MLS_GEO ;

*libname mls "/opt/data/datamain/MLS/sas_dataset/";
libname mls "/opt/data/datamain/MLS/sas_dataset_final_other/";
libname geo "/opt/data/datamain/GIS_CORE/GIS_CURRENT/";
libname f "./";



option compress=yes;

%macro show_vars();
proc contents data=mls.other_attachedsingle_2004;
proc contents data=geo.geo_master_all_2015;
%mend show_vars;

*%show_vars();

data f.test_m;
set mls.other_attachedsingle_2004(obs=300);
run;


data f.test_g;
set  geo.geo_master_all_2015(obs=300);
run;

data f.test_g2;
set  geo.sas_ptype_all_2015(obs=300);
/*
rename 	pin_nbr 				= pin
		assessor_apt_nbr 		= apt_nbr
		assessor_direction_cd 	= dir
		assessor_street_nbr		= st_nbr
		assessor_street_nm		= st_nm
		assessor_state_cd		= state
		assessor_street_type_cd	= st_tp 
		cln_assessor_city_nm	= city
		assessor_township_nm	= township
		assessor_town_region_nm	= region
		cln_assessor_addr1_ln	= addr1
		cln_assessor_addr2_ln	= addr2
		cln_assessor_zip_cd		= zip;
keep 	pin_nbr 				
		assessor_apt_nbr 
		assessor_direction_cd  
		assessor_street_nbr	 
		assessor_street_nm		 
		assessor_state_cd		 
		assessor_street_type_cd 
		cln_assessor_city_nm	 
		assessor_township_nm	 
		assessor_town_region_nm	   
		cln_assessor_addr1_ln 
		cln_assessor_addr2_ln	 
		cln_assessor_zip_cd;
*/
run;


%macro clean_pin_m(type);

data f.m_pin_tmp1;
	*** clean PIN number;
	*set folder.pin_unmatched_trailing;
 	format pin3 best14.;
 	set f.mls_pin_&type. ;
 	pin_tmp = compress(tranwrd(upcase(pin), 'O' ,'0' ),,'dk'); 
  	len = length(pin_tmp);
  	pin_tmp1 = pin_tmp;
  	if len < 10 then pin_tmp1 = substr("0000000000" || pin_tmp, length("0000000000" || pin_tmp)-9, 10);
  	pin_tmp2 = substr(strip(pin_tmp1) || "0000", 1 ,14 );
 	pin3 = pin_tmp2 * 1;

 	*** clean County Name ;
 	cny_tmp = upcase(strip(compress(cny,,'dc')));
 	cny = cny_tmp;
 	if cny_tmp='DU' or cny_tmp='DU PAG' or cny_tmp='DU PAGE' or cny_tmp='DUP' or cny_tmp='DUPA' or
 		cny_tmp='DOP' or cny_tmp='DP' or cny_tmp='DPG' or cny_tmp='DVP'  
 			then cny='DUPAGE';
 	if cny_tmp='KANE'
 			then cny='KANE'; 
 	if cny_tmp='LAKE' or cny_tmp='LAK' or cny_tmp='LAE'
 			then cny='LAKE'; 
 	if cny_tmp='MCHENRY' or cny_tmp='MC HENRY' or cny_tmp='MC' or cny_tmp='MCH' or cny_tmp='MCHE' or
 		cny_tmp='MCJ' or cny_tmp='MCK' or cny_tmp='MCN' or cny_tmp='MCR' or cny_tmp='MCY'  
 			then cny='MCHENRY'; 
 	if cny_tmp='WILL' or cny_tmp='WIL'
 			then cny='WILL'; 
 	drop cny_tmp;
run;

data f.m_pin_tmp2;
	set f.m_pin_tmp1;
	*if cny = 'DUPAGE' or cny = 'KANE' or cny = 'LAKE' or cny = 'MCHENRY' or cny = 'WILL';
	if cny = 'DUPAGE';
run;

proc sql;
	CREATE TABLE f.m_pin AS
		SELECT DISTINCT pin3, cny
		FROM m_pin_tmp2;
quit;

%mend clean_pin_m;



%macro get_pin_g();
data f.geo_pin;
	format pin0 best14.;
	set geo.geo_master_all_2015;
	pin0 = compress(pin_nbr,,'dk') * 1;
	county = upcase(strip(COUNTY_CD));
	keep pin0 pin_nbr county COUNTY_CD;
run;

data f.geo_pin;
	format pin0 best14.;
	set geo.geo_master_all_2015;
	pin0 = compress(pin_nbr,,'dk') * 1;
	county = upcase(strip(COUNTY_CD));
	keep pin0 pin_nbr county COUNTY_CD;
run;

%mend get_pin_g;



%macro clean_pin_g();
proc sql;
	CREATE TABLE f.g_pin AS
		SELECT DISTINCT pin0, county
		FROM f.geo_pin
		WHERE county = 'DUPAGE';
quit;

*		WHERE county = 'DUPAGE' OR county = 'KANE' OR county = 'LAKE' OR county = 'MCHENRY' OR county = 'WILL';

%mend clean_pin_g;



%macro match_pin();

proc sql;
	CREATE TABLE f.mls_geo_match AS
		SELECT DISTINCT pin0, cny, county, pin3
		FROM f.m_pin m, f.g_pin g
		WHERE m.pin3 = g.pin0 AND cny=county;
quit;

proc contents data=f.m_pin;
proc contents data=f.g_pin;
proc contents data=f.mls_geo_match;

%mend match_pin;



%macro dirty_ds();
proc sql;
	CREATE TABLE f.bad_data AS
	SELECT DISTINCT r.pin3, CEIL(LOG10(r.pin3)) AS len, r.pin AS orig_pin, COUNT(*) AS feq
	FROM f.m_pin_tmp2 r
	WHERE r.pin3 NOT IN (SELECT pin3 FROM f.mls_geo_match) AND (r.pin3 >= 1011000030000 AND r.pin3 <= 10185000010000)
	GROUP BY r.pin
	ORDER BY len DESC, feq DESC;
quit;
%mend dirty_ds;




%macro list_gis_pin();
proc sql;
	CREATE TABLE f.gis_pin_list AS
	SELECT pin0, COUNT(*)
	FROM f.g_pin
	GROUP BY pin0
	ORDER BY pin0;
quit;


%mend list_gis_pin;



*%clean_pin_m(all);
*%dirty_ds();

*%get_pin_g();
*%clean_pin_g();
*%match_pin();
*%list_gis_pin();


proc sql;
	SELECT county, COUNT(*)
	FROM f.g_pin
	GROUP BY county;
quit;

proc sql;
	SELECT cny, COUNT(*)
	FROM f.m_pin
	GROUP BY cny;
quit;

/*


data f.tmp;
set f.mls_geo_match(obs=300);
format x best14.;
x = pin0 * 1;
run;
*/


