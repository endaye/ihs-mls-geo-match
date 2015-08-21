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

* %show_vars();

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
	keep pin property_type;	
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
	keep pin property_type;
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
	keep pin property_type;	
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
	keep pin property_type;	
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
	if CNY ^= 'Cook';
	keep pin property_type;
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
	keep pin property_type;
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
	keep pin property_type;
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
	keep pin property_type;
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
	keep pin property_type;
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
	keep pin property_type;
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
	keep pin property_type;
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
	keep pin property_type;
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
	keep pin property_type;
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
	keep pin property_type;
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
	keep pin property_type;
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
	keep pin property_type;
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
	keep pin property_type;
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
 	*format pin1 best14.;
 	set f.mls_pin_all;
 	pin_tmp = compress(tranwrd(upcase(pin), 'O' ,'0' ),,'dk'); 
  	len = length(pin_tmp);
  	pin_tmp1 = pin_tmp;
  	if len < 10 then pin_tmp1 = substr("0000000000" || pin_tmp, length("0000000000" || pin_tmp)-9, 10);
  	pin_tmp2 = substr(strip(pin_tmp1) || "0000", 1 ,14 );
 	pin3 = pin_tmp2 * 1;
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

data f.mls_sample;
set mls.all_detachedsingle_2011(obs=300);
run;



data f.mls_pin_dt;
	set mls.all_detachedsingle_2011 
		mls.all_detachedsingle_2012 
		mls.all_detachedsingle_2013 
		mls.all_detachedsingle_2014  
		mls.all_detachedsingle_2015;
	property_type = 'detached single';
	if CNY ^= 'Cook';
	keep pin property_type;
run;
*/


*%get_pin_m();
*%comb_pin_m();
*%clean_pin_m();

*%get_pin_g();
*%clean_pin_g();
%match_pin();


