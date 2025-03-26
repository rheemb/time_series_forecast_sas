# Unemployment Rate Forecasting Using SAS Time Series Analysis


## Project Overview
The unemployment rate is a key economic indicator used to assess labor market health and inform policy decisions. This project focused on forecasting the U.S. unemployment rate using a dataset spanning over six decades (January 1960 to July 2023), sourced from the Federal Reserve Economic Data (FRED). The dataset included monthly unemployment rates, job openings, and federal interest rates. We used SAS to build and compare time series models, including ARIMA, ARMA, and ARMAX, to generate forecasts and provide actionable insights.

## What We Did
1. **Data Collection and Description**:
   - Sourced data from FRED Economic Research Institute, covering monthly U.S. unemployment rates, job openings, and federal interest rates from January 1960 to July 2023 (763 rows, 4 columns).
   - Variables:
     - `Time Series (mm/dd/yyyy)`: Date (1st of each month).
     - `UNRATE`: Unemployment rate (dependent variable).
     - `Job Openings`: Unfilled jobs on the last business day of the month (exogenous variable).
     - `Federal Interest Rate`: Overnight interbank trading rate (exogenous variable).

2. **Data Preprocessing**:
   - **Data Cleaning and Transformation**:
     - Identified missing values in the `Job Openings` column from 1960 to 2000.
     - Imputed missing values using the median of the time series to ensure data completeness.
   - **Stationarity Testing**:
     - Used the Augmented Dickey-Fuller (ADF) test to confirm the data was slightly stationary, making it suitable for time series modeling.
   - **Noise Reduction**:
     - Conducted a white noise probability test to assess error distribution and ensure the data was suitable for modeling.
   - **Pre-Whitening for Exogenous Variables**:
     - Applied pre-whitening to `Job Openings` and `Federal Interest Rate` to remove autocorrelation, improving their suitability for modeling in ARMAX.

3. **Time Series Exploration**:
   - Analyzed the unemployment rate data for trends and seasonality.
   - Found no clear trend or seasonal patterns, but noted increases during economic disruptions like the 1983 recession and 2020 COVID-19 pandemic.
   - Determined that including exogenous variables (job openings, federal interest rates) could improve forecasting accuracy.

4. **Model Development**:
   - **Model 1: ARMA(2,0,0)**:
     - Built an ARMA model with two autoregressive terms to capture patterns in the data.
   - **Model 2: ARIMA(1,1,0)**:
     - Used an ARIMA model with differencing (order 1) to ensure stationarity.
   - **Model 3: ARMA(1,0,0)**:
     - Built an ARMA model with one autoregressive term for comparison.
   - **Model 4: ARMAX(1,0,0)**:
     - Incorporated exogenous variables (`Job Openings`, `Federal Interest Rate`) after pre-whitening.

5. **Model Comparison**:
   - Compared models using accuracy, MAPE, AIC, and SBC:
     | Model         | Accuracy | MAPE  | AIC    | SBC    |
     |---------------|----------|-------|--------|--------|
     | ARMA(2,0,0)   | 87.05%   | 12.95%| 884.02 | 897.93 |
     | ARMA(1,0,0)   | 88.10%   | 11.90%| 883.76 | 893.03 |
     | ARIMA(1,1,0)  | 97.15%   | 2.85% | 891.73 | 901.00 |
     | ARMAX(1,0,0)  | 90.45%   | 9.55% | 831.34 | 849.88 |
   - **Best Model**: Selected ARIMA(1,1,0) as the best model due to its highest accuracy (97.15%) and lowest MAPE (2.85%).

6. **Recommendations and Insights**:
   - **Implications for Unemployment**:
     - Including `Job Openings` and `Federal Interest Rate` as exogenous variables in ARMAX improved forecast accuracy.
     - Pre-whitening enhanced the quality of exogenous variables, making them more suitable for modeling.
     - Accurate forecasts can help policymakers make evidence-based decisions, such as adjusting unemployment benefits or job training programs.
     - Businesses can use predictions for workforce planning and investment strategies.
   - **Business Insights**:
     - Policymakers can use forecasts to create targeted labor market policies.
     - Governments and organizations can allocate resources efficiently based on expected labor market conditions.
     - Financial institutions can assess risks in lending and investments using unemployment rate predictions.
   - **Limitations and Challenges**:
     - Missing data from 1960-2000 in `Job Openings` affected long-term forecast accuracy.
     - ARMAX assumes linear relationships, which may not fully capture complex dynamics.
     - External events (e.g., policy changes, economic shocks) not included in the model could impact predictions.

## Approach and Methods
- **Tools Used**:
  - **SAS**: For time series analysis, modeling (PROC ARIMA, PROC ARMAX), and forecasting.
  - **Excel**: For initial data inspection (`US_Unemployment_Dataset_Raw.xlsx`).

## Files
- **Accuracy_Macros_Code.sas**: SAS code for calculating model accuracy metrics.
- **ARIMA(1,1,0).ctk**: ARIMA model checkpoint file.
- **ARMA(1,0,0).ctk**: ARMA(1,0,0) model checkpoint file.
- **ARMA(2,0,0).ctk**: ARMA(2,0,0) model checkpoint file.
- **ARMAX(1,0,0)_after_pre-whitening.ctk**: ARMAX model checkpoint after pre-whitening.
- **ARMAX(1,0,0)_before_pre-whitening.ctk**: ARMAX model checkpoint before pre-whitening.
- **Federal_interest_Pre-whitening_code.sas**: SAS code for pre-whitening federal interest rate.
- **Job_Opening_Pre-whitening_Code.sas**: SAS code for pre-whitening job openings.
- **Un_Employment_rate_Final_version.xlsx**: Processed dataset used for analysis.
- **US_Unemployment_Dataset_Raw.xlsx**: Raw dataset before preprocessing.
- **Unemployment_Rate_Prediction_Report.docx**: Detailed project report with in-depth analysis and visualizations.
