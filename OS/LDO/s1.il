simulator( 'spectre )

design(	 "IMP_POW_LDO" "s1" "schematic")
resultsDir( "/home/saul/Sim/s1/spectre/schematic" )

createNetlist

load("OS/CHARACTERIZATION/global.il")

modelFile( 
    '("$AMS_DIR/spectre/h18/soac/mcparams.scs" "")
    '("$AMS_DIR/spectre/h18/soac/design.scs" "noitm")
    '("$AMS_DIR/spectre/h18/soac/res.scs" "restm")
    '("$AMS_DIR/spectre/h18/soac/cap.scs" "captm")
    '("$AMS_DIR/spectre/h18/soac/bip.scs" "biptm")
    '("$AMS_DIR/spectre/h18/soac/esddi.scs" "esdditm")
    '("$AMS_DIR/spectre/h18/soac/cmos53.scs" "cmostm")
)

/*
;NMOS1: W1_tot = 50.00um  L1 = 1.00um  IDS1 = 0.0002mA  VDS1 = 0.50V
  gm1 = 0.005m
  rds1 = 138148609.13
  cgs1 = 2.51f
  cgg1 = 75.28f
  cgd1 = 15.69f
  cds1 = 1.01f
  cdb1 = 0.20f
  vgs1 = 0.1981
  Gain1 = 758.12
  gm_id1 = 27.44
 ; Ft1 = 47.99 MHz
 ; Ft1g = 11.60 MHz
*/

/*
;PMOS1: W4_tot = 100.00um  L4 = 1.00um  IDS4 = 0.0040mA  VDS4 = 0.50V
  gm4 = 0.0880m
  rds4 = 2777550.54
  cgs4 = 126.79f
  cgg4 = 259.06f
  cgd4 = 35.23f
  cds4 = 56.72f
  cdb4 = 12.89f
  vgs4 = 0.3798
  Gain4 = 244.29
  gm_id4 = 21.99
;  Ft4 = 86.40 MHz  */
/*
;NMOS1: W1_tot = 50.00um  L1 = 1.00um  IDS1 = 0.0002mA  VDS1 = 0.50V
  gm1 = 0.005m
  rds1 = 62616777.30
  cgs1 = 0.94f
  cgg1 = 23.58f
  cgd1 = 26.18f
  cds1 = 0.41f
  cdb1 = 0.12f
  vgs1 = 0.4323
  Gain1 = 328.98
  gm_id1 = 26.27
;  Ft1 = 30.82 MHz
;  Ft1g = 35.46 MHz*/


;NMOS1: W1_tot = 100.00um  L1 = 1.00um  IDS1 = 0.0002mA  VDS1 = 0.50V
  gm1 = 0.005m
  rds1 = 66279562.15
  cgs1 = 0.99f
  cgg1 = 48.06f
  cgd1 = 52.78f
  cds1 = 0.41f
  cdb1 = 0.12f
  vgs1 = 0.4078
  Gain1 = 348.05
  gm_id1 = 26.26
;  Ft1 = 15.54 MHz
;  Ft1g = 17.39 MHz


; PMOS1: W4_tot = 120.00um  L4 = 1.00um  IDS4 = 0.1000mA  VDS4 = 0.50V
  gm4 = 0.6924m
  rds4 = 81019.88
  cgs4 = 133.24f
  cgg4 = 164.65f
  cgd4 = 48.94f
  cds4 = 67.83f
  cdb4 = 18.63f
  vgs4 = 0.8455
  Gain4 = 56.10
  gm_id4 = 6.92
;  Ft4 = 604.89 MHz 


  rc = 80k
  cc = 5p

  rl = 10k
  cl = 10u


; Razavi B, "Design of Analog CMOS Integrated Circuits", pp 385-
;  (1 + r1/r3)ln(n) = 27.2  
; n = 10 (ratio of diode areas)
; rdiode = id/Vthermal
; calculation for Idiode = 2uA:

  r1 = 250k
  r2 = 125k
;  rdiode = 13k


analysis('ac ?start "1"  ?stop "100M"  ?dec "10"  )
desVar(	  "cdb1" cdb1	)
desVar(	  "cdb4" cdb4	)
desVar(	  "cdg1" cgd1	)
desVar(	  "cdg4" cgd4	)
desVar(	  "cds1" cds1	)
desVar(	  "cds4" cds4	)
desVar(	  "cgs1" cgs1	)
desVar(	  "cgs4" cgs4	)
desVar(	  "gm1" gm1	)
desVar(	  "gm4" gm4	)
desVar(	  "IT" 0	)
desVar(	  "rd1" rds1	)
desVar(	  "rd4" rds4	)

desVar(	  "VIN" 1	)
desVar(	  "CC" cc	)
desVar(	  "RC" rc	)

desVar(	  "CL" cl	)
desVar(	  "R1" r1	)
desVar(	  "R2" r2	)
desVar(	  "RL" rl	)



temp( 27 ) 
save( 'v "/VOUT" "/VA" "/VB")


/***************************************************/
/* Closed loop Gain                                */
/* The source must be active, and the loop closed  */
/* Set the IS = 1, gm = gm1, and IT = 0            */  
/***************************************************/

desVar(	  "VIN" 1	)
desVar(	  "IT" 0	)
desVar(	  "gm1" gm1	)

analysis('ac ?start "100"  ?stop "100M" ?dec "10"  )
;analysis('pz ?p "VIN"  ?n ""  ?oprobe "" ?iprobe "/V0"  ?porti "1"  )
analysis('pz ?p "/VOUT"  ?iprobe "/V0"  )
envOption(
	'analysisOrder  list("ac" "pz") 
)

run()

selectResult( 'ac )

newWindow
Vout = v("VOUT" ?result "ac")
plot(Vout)
addSubwindowTitle("Gain")

addSubwindow
pzPlot( ?result "pz" )  
addSubwindowTitle("Pole-Zero Gain")


/*****************************************************/
/* Asymptotic Gain                                   */
/* the source must be active (IS=1), the loop closed */
/* with gm -> INF and the test source inactive       */
/*****************************************************/

analysis('ac ?start "100"  ?stop "100M"  ?dec "10"  )
;analysis('pz ?p ""  ?n ""  ?oprobe "/IPRB0" ?iprobe "/I1"  ?porti "1"  )
analysis('pz ?p "/VOUT"  ?iprobe "/V0"  )

envOption(
        'analysisOrder  list("ac" "pz")
)

desVar(   "VIN"  1      )
desVar(   "IT"  0      )
desVar(   "gm1" 1000   )

save( 'v "/VOUT" )

run()

selectResult( 'ac )

newWindow
Vout = v("VOUT" ?result "ac")
plot(Vout)
addSubwindowTitle("Asymptotic Gain")

addSubwindow
pzPlot( ?result "pz" )  
addSubwindowTitle("Pole-Zero Asymptotic Gain")


/**********************************************************/
/* Open loop gain                                         */
/* The source must be inactive (IS=0), the loop open      */
/* gm=0, and the a test source inserted IT = 1.           */
/* The returning Vgs is sensed. and Beta (B)is calculated:*/
/* B = Vgs/Itest = Vgs (Itest = 1). Finally the loop gain */
/* is found: AB = B*gm                                    */
/**********************************************************/
analysis('ac ?start ".01"  ?stop "100M"  ?dec "10"  )
analysis('pz ?p "/VOUT" ?n ""  ?iprobe "/I5"  )

envOption(
        'analysisOrder  list("ac" "pz")
)


desVar(   "VIN"  0      )
desVar(   "IT"  1      )
desVar(   "gm1" 0      )

save( 'v "/VOUT" )

run()

selectResult( 'ac )
;va = v("VA" ?result "ac")
vb = v("VB" ?result "ac")
B = - vb

AB = B*gm1/2

newWindow
plot(AB)
addSubwindowTitle("AB")

addSubwindow
pzPlot( ?result "pz" )  
addSubwindowTitle("Pole-Zero AB")



/***********************************************/
/* Root-locus                                  */
/* pole-zero of gain is analyzed when          */
/* gm1 is swept from 0 to its nominal value    */
/***********************************************/

;analysis('pz ?p "/VOUT"  ?iprobe "/I5"  ?param "gm"
;                ?start "0.0"  ?stop gm1  ?step ".1m"  )
;analysis('pz ?p ""  ?n ""  ?oprobe "/IPRB0" ?iprobe "/I1"  ?porti "1"  ?param "gm1"
;                ?start "0.0"  ?stop gm1  ?step ".1m")

analysis('pz ?p "/VOUT"  ?iprobe "/V0" ?param "gm1"
                 ?start "0.0"  ?stop gm1  ?step ".5u"  )
envOption(
        'analysisOrder  list("pz")
)

desVar(   "VIN"  1      )
desVar(   "IT"  0      )

run()

newWindow
pzPlot( ?result "pz" )  
addSubwindowTitle("Root locus")

; Note: The new Visualization and analysis tool do not display correctly this sweep (it plots Mag, vs quality factor Q). 
; A Workaraound is to open the data manually following these steps:
; 1) Create a new window in the vis. and an. tool
; 2) Go to the menu and select Browser->Results->Open Results. Select the results directory for the sim
; 3) A file three appears in the browser at the left. Select "pz". Under the Signals Tab it should appear 
;    the data saved during the pz simualtion. select both "poles" and "zeros" using Ctrl+click
; 4) Right-click on the selected items and select "Plot Signal"
; 5) The data should be plotted con the window, but it is connecting the points with lines. Right click on
;    the display window and select Type->Scatter Plot


va_calc = 2*rds1*gm4*(r1+r3+rdiode)*rdiode/(2*r1 + 2*rdiode + r3)
vb_calc = 2*rds1*gm4*(r1+rdiode)*(r3 + rdiode)/(2*r1 + 2*rdiode + r3)

AB_calc = (va_calc - vb_calc)*gm1/2


printf("\n ***********************************")
printf("\n Calculated AB = %4.2f \n" AB_calc)



