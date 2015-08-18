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
proc contents data=geo.sas_ptype_all_2015;
%mend show_vars;

*%show_vars();

%macro clean_pin();
/*
data mls_pin1;
	set mls.all_detachedsingle_2015 
		mls.all_detachedsingle_2014 
		mls.all_detachedsingle_2013 
		mls.all_detachedsingle_2012  
		mls.all_detachedsingle_2011;
	keep pin;
run;
*/
/* prepare mls data */
/*
data f.mls_pin;
	*set folder.pin_unmatched_trailing;
 	format pin1 best14.;
 	set mls_pin1;
 	pin1 = pin;
 	pin_tmp =tranwrd(upcase(pin), 'O' ,'0' ); 
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
*/
data f.geo_pin;
	set geo.geo_master;
	pin0 = pin1;
	keep pin0;
run;


proc sql;
	CREATE TABLE f.mls_geo_match AS
		SELECT  m.pin1, m.pin3, g.pin0 
		FROM f.mls_pin m, f.geo_pin g
		WHERE m.pin3 = g.pin0;
quit;

%mend clean_pin;

%clean_pin();

/*
data f.mls_tmp;
set mls.all_detachedsingle_2015(obs=300);
run;

data f.geo_tmp;
set geo.geo_master (obs=300);
run;
*/