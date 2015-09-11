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

%macro get_pin_m();

* total 18 property types;

data f.mls_pin_at;
	set mls.other_attachedsingle_2004
		mls.other_attachedsingle_2005
		mls.other_attachedsingle_2006
		mls.other_attachedsingle_2007
		mls.other_attachedsingle_2008
		mls.other_attachedsingle_2009
		mls.other_attachedsingle_2010
		mls.other_attachedsingle_2011
		mls.other_attachedsingle_2012
		mls.other_attachedsingle_2013
		mls.other_attachedsingle_2014
		mls.other_attachedsingle_2015;
	property_type = 'attached single';
	keep pin cny property_type ad;
run;

data f.mls_pin_bu;
	set mls.other_business_2005
		mls.other_business_2006
		mls.other_business_2007
		mls.other_business_2008
		mls.other_business_2009
		mls.other_business_2010
		mls.other_business_2011
		mls.other_business_2012
		mls.other_business_2013
		mls.other_business_2014
		mls.other_business_2015;
	property_type = 'business';
	keep pin cny property_type ad;
run;

data f.mls_pin_co;
	set mls.other_commercial_2005
	    mls.other_commercial_2006
	    mls.other_commercial_2007
	    mls.other_commercial_2008
	    mls.other_commercial_2009
	    mls.other_commercial_2010
	    mls.other_commercial_2011
	    mls.other_commercial_2012
	    mls.other_commercial_2013
	    mls.other_commercial_2014
	    mls.other_commercial_2015;
	property_type = 'commercial';
	keep pin cny property_type ad;
run;

data f.mls_pin_dp;
	set mls.other_deededparking_2004
		mls.other_deededparking_2005
		mls.other_deededparking_2006
		mls.other_deededparking_2007
		mls.other_deededparking_2008
		mls.other_deededparking_2009
		mls.other_deededparking_2010
		mls.other_deededparking_2011
		mls.other_deededparking_2012
		mls.other_deededparking_2013
		mls.other_deededparking_2014
		mls.other_deededparking_2015;
	property_type = 'deeded parking';
	keep pin cny property_type ad;	
run;

data f.mls_pin_dt;
	set mls.other_detachedsingle_2004
		mls.other_detachedsingle_2005
		mls.other_detachedsingle_2006
		mls.other_detachedsingle_2007
		mls.other_detachedsingle_2008
		mls.other_detachedsingle_2009
		mls.other_detachedsingle_2010
		mls.other_detachedsingle_2011
		mls.other_detachedsingle_2012
		mls.other_detachedsingle_2013
		mls.other_detachedsingle_2014
		mls.other_detachedsingle_2015;
	property_type = 'detached single';
	keep pin cny property_type ad;
run;

data f.mls_pin_in;
	set mls.other_industrial_2005
		mls.other_industrial_2006
		mls.other_industrial_2007
		mls.other_industrial_2008
		mls.other_industrial_2009
		mls.other_industrial_2010
		mls.other_industrial_2011
		mls.other_industrial_2012
		mls.other_industrial_2013
		mls.other_industrial_2014
		mls.other_industrial_2015;
	property_type = 'industrial';
	keep pin cny property_type ad;
run;

data f.mls_pin_id;
	set mls.other_instuttodevelop_2005
		mls.other_instuttodevelop_2006
		mls.other_instuttodevelop_2007
		mls.other_instuttodevelop_2008
		mls.other_instuttodevelop_2009
		mls.other_instuttodevelop_2010
		mls.other_instuttodevelop_2011
		mls.other_instuttodevelop_2012
		mls.other_instuttodevelop_2013
		mls.other_instuttodevelop_2014
		mls.other_instuttodevelop_2015;
	property_type = 'instutto develop';
	keep pin cny property_type ad;
run;

data f.mls_pin_ll;
	set mls.other_lotsandland_2005
		mls.other_lotsandland_2006
		mls.other_lotsandland_2007
		mls.other_lotsandland_2008
		mls.other_lotsandland_2009
		mls.other_lotsandland_2010
		mls.other_lotsandland_2011
		mls.other_lotsandland_2012
		mls.other_lotsandland_2013
		mls.other_lotsandland_2014
		mls.other_lotsandland_2015;
	property_type = 'lots and land';
	keep pin cny property_type ad;
run;

data f.mls_pin_md;
	set mls.other_mixeduse_2005
		mls.other_mixeduse_2006
		mls.other_mixeduse_2007
		mls.other_mixeduse_2008
		mls.other_mixeduse_2009
		mls.other_mixeduse_2010
		mls.other_mixeduse_2011
		mls.other_mixeduse_2012
		mls.other_mixeduse_2013
		mls.other_mixeduse_2014
		mls.other_mixeduse_2015;
	property_type = 'mixed use';
	keep pin cny property_type ad;
run;

data f.mls_pin_mh;
	set mls.other_mobilehomes_2004
		mls.other_mobilehomes_2005
		mls.other_mobilehomes_2006
		mls.other_mobilehomes_2007
		mls.other_mobilehomes_2008
		mls.other_mobilehomes_2009
		mls.other_mobilehomes_2010
		mls.other_mobilehomes_2011
		mls.other_mobilehomes_2012
		mls.other_mobilehomes_2013
		mls.other_mobilehomes_2014
		mls.other_mobilehomes_2015;
	property_type = 'mobile home';
	keep pin cny property_type ad;
run;

data f.mls_pin_mf;
	set mls.other_multifamily_2004
		mls.other_multifamily_2005
		mls.other_multifamily_2006
		mls.other_multifamily_2007
		mls.other_multifamily_2008
		mls.other_multifamily_2009
		mls.other_multifamily_2010
		mls.other_multifamily_2011
		mls.other_multifamily_2012
		mls.other_multifamily_2013
		mls.other_multifamily_2014
		mls.other_multifamily_2015;
	property_type = 'multifamily';
	keep pin cny property_type ad;
run;

data f.mls_pin_of;
	set mls.other_officetech_2005
		mls.other_officetech_2006
		mls.other_officetech_2007
		mls.other_officetech_2008
		mls.other_officetech_2009
		mls.other_officetech_2010
		mls.other_officetech_2011
		mls.other_officetech_2012
		mls.other_officetech_2013
		mls.other_officetech_2014
		mls.other_officetech_2015;
	property_type = 'office tech';
	keep pin cny property_type ad;
run;

data f.mls_pin_re;
	set mls.other_rentals_2004
		mls.other_rentals_2005
		mls.other_rentals_2006
		mls.other_rentals_2007
		mls.other_rentals_2008
		mls.other_rentals_2009
		mls.other_rentals_2010
		mls.other_rentals_2011
		mls.other_rentals_2012
		mls.other_rentals_2013
		mls.other_rentals_2014
		mls.other_rentals_2015;
	property_type = 'rentails';
	keep pin cny property_type ad;
run;

data f.mls_pin_rp;
	set mls.other_residentialproperty_2005
		mls.other_residentialproperty_2006
		mls.other_residentialproperty_2007
		mls.other_residentialproperty_2008
		mls.other_residentialproperty_2009
		mls.other_residentialproperty_2010
		mls.other_residentialproperty_2011
		mls.other_residentialproperty_2012
		mls.other_residentialproperty_2013
		mls.other_residentialproperty_2014
		mls.other_residentialproperty_2015;
	property_type = 'residential property';
	keep pin cny property_type ad;
run;

data f.mls_pin_rr;
	set mls.other_residentialrental_2005
		mls.other_residentialrental_2006
		mls.other_residentialrental_2007
		mls.other_residentialrental_2008
		mls.other_residentialrental_2009
		mls.other_residentialrental_2010
		mls.other_residentialrental_2011
		mls.other_residentialrental_2012
		mls.other_residentialrental_2013
		mls.other_residentialrental_2014
		mls.other_residentialrental_2015;
	property_type = 'residentail rentals';
	keep pin cny property_type ad;
run;

data f.mls_pin_rs;
	set mls.other_retailstores_2005
		mls.other_retailstores_2006
		mls.other_retailstores_2007
		mls.other_retailstores_2008
		mls.other_retailstores_2009
		mls.other_retailstores_2010
		mls.other_retailstores_2011
		mls.other_retailstores_2012
		mls.other_retailstores_2013
		mls.other_retailstores_2014
		mls.other_retailstores_2015;
	property_type = 'retail stores';
	keep pin cny property_type ad;
run;

data f.mls_pin_24;
	set mls.other_twotofour_2004
		mls.other_twotofour_2005
		mls.other_twotofour_2006
		mls.other_twotofour_2007
		mls.other_twotofour_2008
		mls.other_twotofour_2009
		mls.other_twotofour_2010
		mls.other_twotofour_2011
		mls.other_twotofour_2012
		mls.other_twotofour_2013
		mls.other_twotofour_2014
		mls.other_twotofour_2015;
	property_type = 'two-to-four';
	keep pin cny property_type ad;
run;

data f.mls_pin_vl;
	set mls.other_vacantland_2004
		mls.other_vacantland_2005
		mls.other_vacantland_2006
		mls.other_vacantland_2007
		mls.other_vacantland_2008
		mls.other_vacantland_2009
		mls.other_vacantland_2010
		mls.other_vacantland_2011
		mls.other_vacantland_2012
		mls.other_vacantland_2013
		mls.other_vacantland_2014
		mls.other_vacantland_2015;
	property_type = 'vacantland';
	keep pin cny property_type ad;
run;

%mend get_pin_m;

%macro comb_pin_m();
data f.mls_pin_all;
	set f.mls_pin_at
		f.mls_pin_bu
		f.mls_pin_co
		f.mls_pin_dp
		f.mls_pin_dt
		f.mls_pin_in
		f.mls_pin_id
		f.mls_pin_ll
		f.mls_pin_md
		f.mls_pin_mh
		f.mls_pin_mf
		f.mls_pin_of
		f.mls_pin_re
		f.mls_pin_rp
		f.mls_pin_rr
		f.mls_pin_rs
		f.mls_pin_24
		f.mls_pin_vl;
run;
%mend comb_pin_m;



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
 	if cny_tmp='K' or cny_tmp='KA' or cny_tmp='KAD' or cny_tmp='KAJ' or cny_tmp='KAK' or
 		cny_tmp='KANE' or cny_tmp='KAN' or cny_tmp='KANKAKEE' or cny_tmp='KANK'  
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
	if cny = 'DUPAGE' or cny = 'KANE' or cny = 'LAKE' or cny = 'MCHENRY' or cny = 'WILL';
run;

proc sql;
	CREATE TABLE f.m_pin AS
		SELECT DISTINCT pin3, cny
		FROM f.m_pin_tmp2;
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
%mend get_pin_g;


%macro get_addr_g();
data f.geo_addr;
	set geo.sas_ptype_all_2015;
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
			cln_assessor_zip_cd		= zip
			county_cd 				= county;
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
			cln_assessor_zip_cd
			county_cd;
	run;
%mend get_addr_g;




%macro clean_pin_g();
proc sql;
	CREATE TABLE f.g_pin AS
		SELECT DISTINCT pin0, county
		FROM f.geo_pin
		WHERE county = 'DUPAGE' OR county = 'KANE' OR county = 'LAKE' OR county = 'MCHENRY' OR county = 'WILL';
quit;
%mend clean_pin_g;



%macro g_pin_addr();
proc sql;
	CREATE TABLE f.g_pin_addr AS 
		SELECT * 
		FROM f.g_pin p LEFT JOIN f.geo_addr a 
		ON p.pin0 = a.pin AND p.county = a.county;
quit;
%mend g_pin_addr;



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




*%get_pin_m();
*%comb_pin_m();
*%clean_pin_m(all);

*%get_pin_g();
*%clean_pin_g();
*%get_addr_g();
*%g_pin_addr();
*%match_pin();

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


