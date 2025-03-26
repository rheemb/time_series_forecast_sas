

%let nhold=12;
%include "&programloc/Macros2.sas" / source2;
%accuracy_prep(indsn=stsm.'DM FC PRJ'n, series=UNRATE, timeid='Time Series'n, 
    numholdback=&nhold);



/*Loading Macros for ARMA & ARIMA for data set*/

proc arima data=WORK._TEMP plots=none;
    identify var=_y_fit;
    estimate p=(1 2) method=ML;
    forecast lead=&nhold id='Time Series'n interval=month out=WORK.OUTARM2 nooutall;
    run;
    
proc arima data=WORK._TEMP plots=none;
    identify var=_y_fit(1);
    estimate p=(1) method=ML;
    forecast lead=&nhold id='Time Series'n interval=month out=WORK.OUTARIM1 nooutall;
    run;
    
proc arima data=WORK._TEMP plots=none;
    identify var=_y_fit;
    estimate p=(1) method=ML;
    forecast lead=&nhold id='Time Series'n interval=month out=WORK.OUTARM1 nooutall;
    run;

proc arima data=WORK._TEMP plots=none;
    identify var=_y_fit crosscorr=('Job opening'n 'federal interest rates'n);
    estimate p=(1) input=(1 $ 'Job opening'n 1 $ 'federal interest rates'n) method=ML;
    forecast lead=&nhold id='Time Series'n interval=month out=WORK.OUTARMX1 nooutall;
    run;
    
quit;


/*  Using the %ACCURACY macro to calculate accuracy measures */


%accuracy(indsn=work.OUTARM2, timeid='Time Series'n, series=UNRATE, 
    numholdback=&nhold);
    
%accuracy(indsn=work.OUTARIM1, timeid='Time Series'n, series=UNRATE, 
    numholdback=&nhold);
    
%accuracy(indsn=work.OUTARM1, timeid='Time Series'n, series=UNRATE, 
    numholdback=&nhold);
    
%accuracy(indsn=work.OUTARMX1, timeid='Time Series'n, series=UNRATE, 
    numholdback=&nhold);
    