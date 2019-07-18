@echo off

for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set dow=%%i
     set month=%%j
	 set m=%%j
     set day=%%k
     set year=%%l
)
set datestr=%day%_%month%_%year%
echo datestr is %datestr%

setlocal EnableDelayedExpansion
set FILE_LIST=(ADANIPORTS ASIANPAINT AXISBANK BAJAJ-AUTO BAJFINANCE BHARTIARTL BPCL CIPLA COALINDIA DRREDDY  EICHERMOT GAIL GRASIM HCLTECH HDFC HDFCBANK HEROMOTOCO HINDALCO HINDUNILVR IBULHSGFIN ICICIBANK INDUSINDBK INFRATEL INFY IOC ITC JSWSTEEL KOTAKBANK LT MARUTI NTPC ONGC POWERGRID RELIANCE SBIN SUNPHARMA TATAMOTORS TATASTEEL TCS TECHM TITAN ULTRACEMCO UPL VEDL WIPRO YESBANK ZEEL)
set /a "m=(%m%-1)*3"
set month=JANFEBMARAPRMAYJUNJULAUGSEPOCTNOVDEC
set monthName=!month:~%m%,3!
echo %monthName%

set folder = "C:\Data\Desktop\Zerodha\@oneminutedata-20180825T054231Z-001\oneminutedata"
cd %folder%
mkdir %monthName%_2019\%day%%monthName%_temp
::set todayfolder = 
rm -rf %monthName%_2019\%day%%monthName%\*_F1.txt
rm -rf %monthName%_2019\%day%%monthName%\*_F2.txt
mv %monthName%_2019\%day%%monthName%\BANKNIFTY.txt %monthName%_2019\%day%%monthName%\BANKNIFTY_%monthName%%day%.txt
copy %monthName%_2019\%day%%monthName%\BANKNIFTY_%monthName%%day%.txt %monthName%_2019\%day%%monthName%_temp
mv %monthName%_2019\%day%%monthName%\NIFTY.txt %monthName%_2019\%day%%monthName%\NIFTY_%monthName%%day%.txt
copy %monthName%_2019\%day%%monthName%\NIFTY_%monthName%%day%.txt %monthName%_2019\%day%%monthName%_temp

echo %folder%\%monthName%_%year%_temp
for %%i in %FILE_LIST% do copy %monthName%_2019\%day%%monthName%\%%i.txt %monthName%_2019\%day%%monthName%_temp

rm -rf %monthName%_2019\%day%%monthName%
mv %monthName%_2019\%day%%monthName%_temp %monthName%_2019\%day%%monthName%
