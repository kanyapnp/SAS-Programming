DATA HODGKIN;
INPUT DISEASE$ OUTCOME$ H_PATIENT S_PATIENT;
DATALINES;
Tonsillectomy YES 41 33
No_Tonsillectomy NO 44 52
;
PROC FREQ DATA=HODGKIN ORDER=DATA;
TABLES  /CHISQ;
RUN;