/*
 * ----ASSIGMENT_2---------
 * Author: Jose L Rodriguez
 * Assigment: 3
 * Probleml:  1a
 * Date: September 25th, 2014
 * SAS303 - FALL 2014
 * SAS platform 'Linux LIN X64 2.6.32-431.11.2.el6.x86_64' 
 * SAS version '9.04.01M1P12042013' 
 *
 * 
 * 
 */
Proc Format;
Value GENDERFT          1 = "MALE"
                        2 = "FEMALE"
                        Other  = "MISCODED";

Value  $SESFT			"L"="LOW"
						"M"="MEDIUM"
						"H"="HIGH";     
   
Value AGEFT  			LOW-20 	= "20 YEARS OLD AND YOUNGER"
		                21-40 	= "BETWEEN 21 AND 40 YEARS OLD"
                        41-HIGH = "41 YEARS OLD AND OLDER";

Run;

Data HEALTHCARE_DRUGS;
LENGTH COST$ 12;
INPUT ID$ GENDER SES$ DRUG$ AGE;

FORMAT 	GENDER 	GENDERFT.
		SES$ 	SESFT.;
LABEL 	SES ="SOCIALECONOMICS" DRUG="DRUG GROUP" AGE = "AGE OF THE SUBJECT";

IF UPCASE(DRUG)= "A" OR UPCASE(DRUG)= "B" OR UPCASE(DRUG)= "C" OR UPCASE(DRUG)= "F" THEN COST="GENERIC";
IF UPCASE(DRUG)= "D" OR UPCASE(DRUG)= "E" OR UPCASE(DRUG)= "G" OR UPCASE(DRUG)= "H" THEN COST="PREMIUN";
IF COST="" THEN COST="MISCODED";

DATALINES;
001 1   L B 15
002 2 M    Z   35
003    2 H  F 76
004 1 L c 21
005 2 H . 58
006 2 L    G 47
007  2 L  D    23
008 1  M E  51
009 1 H    A  32
010   1  H   g  19
;

PROC PRINT DATA= HEALTHCARE_DRUGS NOOBS;
RUN;
PROC SORT DATA=HEALTHCARE_DRUGS;
BY AGE;
PROC FREQ DATA = HEALTHCARE_DRUGS;
TABLES (SES COST )*AGE AGE;
FORMAT AGE AGEFT.;
Run;