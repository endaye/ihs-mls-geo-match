* Match MLS data and GEO data by PIN;
* by Yuancheng Zhang;
* Aug 18, 2015;

* Project Path: /opt/data/PRJ/MLS_GEO ;

libname mls "/opt/data/datamain/MLS/sas_dataset/";
libname geo "/opt/data/datamain/GIS_CORE/GIS_CURRENT/";
libname f "./";

option compress=yes;

%macro show_vars();
proc contents data=mls.all_detachedsingle_2015;
proc contents data=geo.geo_master_all_2015;
%mend show_vars;

* %show_vars();

%macro get_pin_m();

* total 18 property types;

data f.mls_pin_at;
	set mls.all_attachedsingle_2011
		mls.all_attachedsingle_2012
		mls.all_attachedsingle_2013
		mls.all_attachedsingle_2014
		mls.all_attachedsingle_2015;
	property_type = 'attached single';
	keep pin property_type;	
run;

data f.mls_pin_bu;
	set mls.all_business_2011
		mls.all_business_2012
		mls.all_business_2013
		mls.all_business_2014
		mls.all_business_2015;
	property_type = 'business';
	keep pin property_type;
run;

data f.mls_pin_co;
	set mls.all_commercial_2011
		mls.all_commercial_2012
		mls.all_commercial_2013
		mls.all_commercial_2014
		mls.all_commercial_2015;
	property_type = 'commercial';
	keep pin property_type;	
run;

data f.mls_pin_dp;
	set mls.all_deededparking_2011
		mls.all_deededparking_2012
		mls.all_deededparking_2013
		mls.all_deededparking_2014
		mls.all_deededparking_2015;	
	property_type = 'deeded parking';
	keep pin property_type;	
run;

data f.mls_pin_dt;
	set mls.all_detachedsingle_2011 
		mls.all_detachedsingle_2012 
		mls.all_detachedsingle_2013 
		mls.all_detachedsingle_2014  
		mls.all_detachedsingle_2015;
	property_type = 'detached single';
	keep pin property_type;
run;

data f.mls_pin_in;
	set mls.all_industrial_2011
		mls.all_industrial_2012
		mls.all_industrial_2013
		mls.all_industrial_2014
		mls.all_industrial_2015;
	property_type = 'industrial';
	keep pin property_type;
run;

data f.mls_pin_id;
	set mls.all_instuttodevelop_2011
		mls.all_instuttodevelop_2012
		mls.all_instuttodevelop_2013
		mls.all_instuttodevelop_2014
		mls.all_instuttodevelop_2015;
	property_type = 'instutto develop';
	keep pin property_type;
run;

data f.mls_pin_ll;
	set mls.all_lotsandland_2011
		mls.all_lotsandland_2012
		mls.all_lotsandland_2013
		mls.all_lotsandland_2014
		mls.all_lotsandland_2015;
	property_type = 'lots and land';
	keep pin property_type;
run;

data f.mls_pin_md;
	set mls.all_mixeduse_2011
		mls.all_mixeduse_2012
		mls.all_mixeduse_2013
		mls.all_mixeduse_2014
		mls.all_mixeduse_2015;
	property_type = 'mixed use';
	keep pin property_type;
run;

data f.mls_pin_mh;
	set mls.all_mobilehomes_2011
		mls.all_mobilehomes_2012
		mls.all_mobilehomes_2013
		mls.all_mobilehomes_2014
		mls.all_mobilehomes_2015;
	property_type = 'mobile home';
	keep pin property_type;
run;

data f.mls_pin_mf;
	set mls.all_multifamily_2011
		mls.all_multifamily_2012
		mls.all_multifamily_2013
		mls.all_multifamily_2014
		mls.all_multifamily_2015;
	property_type = 'multifamily';
	keep pin property_type;
run;

data f.mls_pin_of;
	set mls.all_officetech_2011
		mls.all_officetech_2012
		mls.all_officetech_2013
		mls.all_officetech_2014
		mls.all_officetech_2015;
	property_type = 'office tech';
	keep pin property_type;
run;

data f.mls_pin_re;
	set mls.all_rentals_2011
		mls.all_rentals_2012
		mls.all_rentals_2013
		mls.all_rentals_2014
		mls.all_rentals_2015;
	property_type = 'rentails';
	keep pin property_type;
run;

data f.mls_pin_rp;
	set mls.all_residentialproperty_2011
		mls.all_residentialproperty_2012
		mls.all_residentialproperty_2013
		mls.all_residentialproperty_2014
		mls.all_residentialproperty_2015;
	property_type = 'residential property';
	keep pin property_type;
run;

data f.mls_pin_rr;
	set mls.all_residentialrental_2011
		mls.all_residentialrental_2012
		mls.all_residentialrental_2013
		mls.all_residentialrental_2014
		mls.all_residentialrental_2015;
	property_type = 'residentail rentals';
	keep pin property_type;
run;

data f.mls_pin_rs;
	set mls.all_retailstores_2011
		mls.all_retailstores_2012
		mls.all_retailstores_2013
		mls.all_retailstores_2014
		mls.all_retailstores_2015;
	property_type = 'retail stores';
	keep pin property_type;
run;

data f.mls_pin_24;
	set mls.all_twotofour_2011
		mls.all_twotofour_2012
		mls.all_twotofour_2013
		mls.all_twotofour_2014
		mls.all_twotofour_2015;
	property_type = 'two-to-four';
	keep pin property_type;
run;

data f.mls_pin_vl;
	set mls.all_vacantland_2011
		mls.all_vacantland_2012
		mls.all_vacantland_2013
		mls.all_vacantland_2014
		mls.all_vacantland_2015;
	property_type = 'vacantland';
	keep pin property_type;
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



%macro clean_pin_m();

data f.m_pin_tmp;
	*set folder.pin_unmatched_trailing;
 	format pin1 best14.;
 	set f.mls_pin_all;

 	pin_tmp =tranwrd(upcase(pin), 'O' ,'0' ); 
 	
 	pin1 = pin;
 	pin2 =substr(strip(pin1) || "00000000000000", 1 ,14 ) *1;
  	if indexc(pin_tmp,' &/+ ') ^= 0 then do ;
  		pin_tmp1= substr(strip(substr(pin_tmp,1 ,indexc(pin_tmp,' &/+') -1 ))|| "00000000000000" ,1 , 14); * length(pin_tmp);
  		pin2 = compress(pin_tmp1,,'dk') *1 ;
  	end;
  	if count(pin_tmp, '-' )=1 and length(scan(strip(pin_tmp), -1 ,'-' )) <=3 then do ;
  		pin_tmp1 = substr(strip(substr(pin_tmp,1 ,index(pin_tmp, '-') -1 ))|| "00000000000000" ,1 , 14); 
  		pin2 = compress(pin_tmp1,,'dk') *1 ;
  	end;
  	if pin2 = . then pin2 = compress(substr(strip(pin_tmp) ||"00000000000000" , 1, 14 ),,'dk')*1 ;
 	pin3 = compress(pin_tmp,,'dk') *1 ;
run;

proc sql;
	CREATE TABLE f.m_pin AS
		SELECT DISTINCT pin3
		FROM f.m_pin_tmp;
quit;

%mend clean_pin_m;



%macro get_pin_g();
data f.geo_pin;
	set geo.geo_master_all_2015;
	pin0 = compress(pin_nbr,,'dk') *1 ;
	keep pin0 pin_nbr;
run;
%mend get_pin_g;



%macro clean_pin_g();
proc sql;
	CREATE TABLE f.g_pin AS
		SELECT DISTINCT pin0
		FROM f.geo_pin;
quit;
%mend clean_pin_g;



%macro match_pin();

proc sql;
	CREATE TABLE f.mls_geo_match AS
		SELECT DISTINCT pin0, pin3
		FROM f.m_pin m, f.g_pin g
		WHERE m.pin3 = g.pin0;
quit;

proc contents data=f.m_pin;
proc contents data=f.g_pin;
proc contents data=f.mls_geo_match;

%mend match_pin;





/*
data f.mls_tmp;
set mls.all_detachedsingle_2015(obs=300);
run;

data f.geo_tmp;
set geo.geo_master (obs=300);
run;
*/



*%get_pin_m();
*%comb_pin_m();
*%clean_pin_m();

*%get_pin_g();
*%clean_pin_g();
%match_pin();
