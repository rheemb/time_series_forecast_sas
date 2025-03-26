/*
 *
 * Task code generated by SAS Studio 3.8 
 *
 * Generated on '10/10/23, 5:46 PM' 
 * Generated by 'rahee' 
 * Generated on server 'ABDUL_RAHEEM.HSD1.CT.COMCAST.NET' 
 * Generated on SAS platform 'X64_10HOME WIN' 
 * Generated on SAS version '9.04.01M6P11152018' 
 * Generated on browser 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36 OPR/102.0.0.0' 
 * Generated on web client 'http://localhost:51226/main?locale=en_US&zone=GMT-04%253A00&sutoken=%257BD4ECF471-13E0-43DD-B09A-51882ED05354%257D' 
 *
 */

ods noproctitle;
ods graphics / imagemap=on;

proc sort data=STSM.'DM FC PRJ'n out=Work.preProcessedData;
	by 'Time Series'n;
run;

proc arima data=Work.preProcessedData plots
    (only)=(series(corr crosscorr) residual(corr normal) 
		forecast(forecastonly));
	identify var='Job opening'n;
	estimate p=(1 2 3 4 5 6 7 8 9 10 11 12 13) q=(1 2 3 4 5 6 7 8 9 10 11) method=ML;
	identify var=UNRATE crosscorr=('Job opening'n);
	estimate input=('Job opening'n) method=ML;
	run;
quit;

proc delete data=Work.preProcessedData;
run;