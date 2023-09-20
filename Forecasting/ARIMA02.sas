/*
 *
 * Task code generated by SAS Studio 3.8 
 *
 * Generated on '5/14/23, 10:44 PM' 
 * Generated by 'Anant UConn' 
 * Generated on server 'DESKTOP-DVMNLUN' 
 * Generated on SAS platform 'X64_10HOME WIN' 
 * Generated on SAS version '9.04.01M6P11152018' 
 * Generated on browser 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.42' 
 * Generated on web client 'http://localhost:63280/main?locale=en_US&zone=GMT-04%253A00&sutoken=%257B92A88B2F-781F-4CC1-AFD1-1A59C4C7ABBC%257D' 
 *
 */

ods noproctitle;
ods graphics / imagemap=on;

proc sort data=WORK.IMPORT out=Work.preProcessedData;
	by Date;
run;

proc arima data=Work.preProcessedData plots
    (only)=(series(corr crosscorr) residual(corr normal) 
		forecast(forecastonly)) out=work.out1;
	identify var=mean;
	estimate q=(1 2) method=ML outstat=work.outstat1;
	forecast lead=24 back=12 alpha=0.05 id=Date interval=week.3;
	outlier;
	run;
quit;

proc delete data=Work.preProcessedData;
run;