simulator( 'spectre )
;design(	 "/home/saul/Sim/s1/spectre/schematic/netlist/netlist")
design(	 "IMP_AN_SIGNAL_GEN_GM" "S1" "schematic")
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



;  rc = 80k
;  cc = 5p
  rf = 100k
;  rf = 30k
;  rf = 60k
cl = 0f

/*
;NMOS1: W1_tot = 100.00um  L1 = 1.00um  IDS1 = 0.0002mA  VDS1 = 0.50V
  gm1 = 0.005m
  rds1 = 144677833.48
  cgs1 = 2.28f
 ; cgg1 = 152.05f
  cgs1 = 152.05f
  cgd1 = 31.44f
  cds1 = 0.90f
  cdb1 = 0.18f
  vgs1 = 0.1747
  Gain1 = 793.73
  gm_id1 = 27.43
;  Ft1 = 25.90 MHz
;  Ft1g = 5.74 MHz


;NMOS1: W1_tot = 100.00um  L1 = 0.30um  IDS1 = 0.0010mA  VDS1 = 0.50V
  gm1 = 0.027m
  rds1 = 5207250.75
  cgs1 = 0.66f
  cgs1 = 33.35f
  cgd1 = 31.83f
  cds1 = 0.22f
  cdb1 = 0.04f
  vgs1 = 0.2390
  Gain1 = 141.16
  gm_id1 = 27.11
;  Ft1 = 132.82 MHz
;  Ft1g = 129.39 MHz
*/

/*
; NMOS1: W1_tot = 50.00um  L1 = 0.30um  IDS1 = 0.0010mA  VDS1 = 0.50V
  gm1 = 0.027m
  rds1 = 5268076.55
  cgs1 = 0.68f
  cgg1 = 16.64f
  cgd1 = 15.88f
  cds1 = 0.25f
  cdb1 = 0.05f
  vgs1 = 0.2631
  Gain1 = 142.33
 ; gm_id1 = 27.02
 ; Ft1 = 259.61 MHz
 ; Ft1g = 258.36 MHz
*/

/*
; NMOS1: W1_tot = 50.00um  L1 = 0.30um  IDS1 = 0.0020mA  VDS1 = 0.50V
  gm1 = 0.054m
  rds1 = 2611142.89
  cgs1 = 1.30f
  cgg1 = 17.02f
  cgd1 = 15.95f
  cds1 = 0.50f
  cdb1 = 0.10f
  vgs1 = 0.2888
  Gain1 = 140.36
  gm_id1 = 26.88
;  Ft1 = 495.92 MHz
;  Ft1g = 502.52 MHz
*/

/*
; NMOS1: W1_tot = 50.00um  L1 = 0.30um  IDS1 = 0.0030mA  VDS1 = 0.50V
  gm1 = 0.080m
  rds1 = 1727003.98
  cgs1 = 1.89f
  cgg1 = 17.44f
  cgd1 = 15.99f
  cds1 = 0.73f
  cdb1 = 0.14f
  vgs1 = 0.3040
  Gain1 = 138.42
  gm_id1 = 26.72
  ;Ft1 = 713.21 MHz
  ;Ft1g = 731.54 MHz
*/

/*
;NMOS1: W1_tot = 50.00um  L1 = 0.25um  IDS1 = 0.0040mA  VDS1 = 0.50V
  gm1 = 0.106m
  rds1 = 816862.68
  cgs1 = 1.49f
  cgg1 = 13.07f
  cgd1 = 16.03f
  cds1 = 0.56f
  cdb1 = 0.11f
  vgs1 = 0.3199
  Gain1 = 86.98
  gm_id1 = 26.62
;  Ft1 = 966.78 MHz
;  Ft1g = 1296.86 MHz
*/

/*
;NMOS1: W1_tot = 50.00um  L1 = 3.00um  IDS1 = 0.0020mA  VDS1 = 0.50V
  gm1 = 0.049m
  rds1 = 6819230.94
  cgs1 = 174.63f
  cgg1 = 369.01f
  cgd1 = 16.00f
  cds1 = 75.58f
  cdb1 = 14.49f
  vgs1 = 0.3063
  Gain1 = 332.44
  gm_id1 = 24.37
;  Ft1 = 40.70 MHz
;  Ft1g = 21.03 MHz
*/

;NMOS1: W1_tot = 50.00um  L1 = 2.50um  IDS1 = 0.0020mA  VDS1 = 0.50V
  gm1 = 0.050m
  rds1 = 6936944.06
  cgs1 = 126.18f
  cgg1 = 290.91f
  cgd1 = 15.98f
  cds1 = 54.24f
  cdb1 = 10.42f
  vgs1 = 0.3011
  Gain1 = 345.59
  gm_id1 = 24.91
;  Ft1 = 55.77 MHz
;  Ft1g = 27.26 MHz


/*
;PMOS1: W4_tot = 60.00um  L4 = 2.00um  IDS4 = 0.0150mA  VDS4 = 0.50V
  gm4 = 0.1605m
  rds4 = 861369.16
  cgs4 = 424.67f
  cgg4 = 528.03f
  cgd4 = 21.50f
  cds4 = 208.04f
  cdb4 = 45.92f
  vgs4 = 0.5329
  Gain4 = 138.26
;  gm_id4 = 10.70
;  Ft4 = 57.26 MHz 


;PMOS1: W4_tot = 60.00um  L4 = 1.00um  IDS4 = 0.0150mA  VDS4 = 0.50V
  gm4 = 0.2051m
  rds4 = 628955.45
  cgs4 = 171.37f
  cgg4 = 227.74f
  cgd4 = 21.37f
  cds4 = 81.72f
  cdb4 = 18.24f
  vgs4 = 0.4868
  Gain4 = 128.97
;  gm_id4 = 13.67
;  Ft4 = 169.32 MHz 

*/

/*
;PMOS1: W4_tot = 60.00um  L4 = 0.30um  IDS4 = 0.0050mA  VDS4 = 0.50V
  gm4 = 0.1172m
  rds4 = 511654.19
  cgs4 = 11.84f
  cgs4 = 30.41f
  cgd4 = 21.03f
  cds4 = 4.83f
  cdb4 = 1.08f
  vgs4 = 0.3756
  Gain4 = 59.98
  gm_id4 = 23.44
;  Ft4 = 567.62 MHz 
*/


/*
; PMOS1: W4_tot = 60.00um  L4 = 0.30um  IDS4 = 0.0015mA  VDS4 = 0.50V
  gm4 = 0.0385m
  rds4 = 1634830.61
  cgs4 = 4.55f
  cgg4 = 25.02f
  cgd4 = 20.86f
  cds4 = 1.77f
  cdb4 = 0.40f
  vgs4 = 0.3269
  Gain4 = 62.93
  gm_id4 = 25.66
;  Ft4 = 241.10 MHz
*/

/*
; PMOS1: W4_tot = 30.00um  L4 = 0.30um  IDS4 = 0.0015mA  VDS4 = 0.50V
  gm4 = 0.0368m
  rds4 = 1679022.94
  cgs4 = 4.27f
  cgg4 = 13.88f
  cgd4 = 10.38f
  cds4 = 1.71f
  cdb4 = 0.38f
  vgs4 = 0.3617
  Gain4 = 61.78
  gm_id4 = 24.53
;  Ft4 = 399.77 MHz 
*/

/*
;PMOS1: W4_tot = 30.00um  L4 = 0.30um  IDS4 = 0.0020mA  VDS4 = 0.50V
  gm4 = 0.0477m
  rds4 = 1274303.21
  cgs4 = 5.30f
  cgg4 = 14.65f
  cgd4 = 10.40f
  cds4 = 2.15f
  cdb4 = 0.48f
  vgs4 = 0.3736
  Gain4 = 60.85
  gm_id4 = 23.87
;  Ft4 = 483.97 MHz 
*/

/*
;PMOS1: W4_tot = 30.00um  L4 = 0.30um  IDS4 = 0.0040mA  VDS4 = 0.50V
  gm4 = 0.0870m
  rds4 = 663927.75
  cgs4 = 8.42f
  cgg4 = 17.01f
  cgd4 = 10.45f
  cds4 = 3.51f
  cdb4 = 0.78f
  vgs4 = 0.4039
  Gain4 = 57.77
  gm_id4 = 21.75
;  Ft4 = 733.88 MHz 
*/

/*
;PMOS1: W4_tot = 20.00um  L4 = 0.25um  IDS4 = 0.0020mA  VDS4 = 0.50V
  gm4 = 0.0467m
  rds4 = 961063.70
  cgs4 = 3.10f
  cgg4 = 7.54f
  cgd4 = 6.87f
  cds4 = 1.23f
  cdb4 = 0.27f
  vgs4 = 0.3839
  Gain4 = 44.92
  gm_id4 = 23.37
;  Ft4 = 746.21 MHz 
*/

;PMOS1: W4_tot = 10.00um  L4 = 0.25um  IDS4 = 0.0020mA  VDS4 = 0.50V
  gm4 = 0.0417m
  rds4 = 1032535.91
  cgs4 = 2.43f
  cgg4 = 4.32f
  cgd4 = 3.33f
  cds4 = 0.98f
  cdb4 = 0.21f
  vgs4 = 0.4075
  Gain4 = 43.07
  gm_id4 = 20.86
;  Ft4 = 1152.49 MHz 



analysis('ac ?start "1"  ?stop "1000M"  ?dec "10"  )
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
desVar(	  "CL" cl	)
;desVar(	  "RC" rc	)
;desVar(	  "RL" rl	)
desVar(	  "RF" rf	)


temp( 27 ) 
save( 'v "/VB")
save( 'i "/I2/D" )
;save( 'i "/I22/D" )

/***************************************************/
/* Closed loop Gain                                */
/* The source must be active, and the loop closed  */
/* Set the IS = 1, gm = gm1, and IT = 0            */  
/***************************************************/

desVar(	  "VIN" 1	)
desVar(	  "IT" 0	)
desVar(	  "gm1" gm1	)

option( ?categ 'turboOpts
	'uniMode  "APS" 
)

analysis('ac ?start "100"  ?stop "1000M" ?dec "10"  )
analysis('pz ?p ""  ?n ""  ?oprobe "/IPRB0" ?iprobe "/V0"  ?porti "1"  )
envOption(
	'analysisOrder  list("ac" "pz") 
)

run()

selectResult( 'ac )

newWindow
Iout = i("/I2/D" ?result "ac")
Iout_phase = phaseDeg(Iout)

;Ioutc = i("/I22/D" ?result "ac")
;Ioutc_phase = phaseDeg(Ioutc) + 180

plot(Iout)
;plot(Ioutc)
addSubwindowTitle("Gain")

addSubwindow
plot(Iout_phase)
;plot(Ioutc_phase)
addSubwindowTitle("Phase")


addSubwindow
pzPlot( ?result "pz" )  
addSubwindowTitle("Pole-Zero Gain")


/*****************************************************/
/* Asymptotic Gain                                   */
/* the source must be active (IS=1), the loop closed */
/* with gm -> INF and the test source inactive       */
/*****************************************************/

analysis('ac ?start "100"  ?stop "1000M"  ?dec "10"  )
analysis('pz ?p ""  ?n ""  ?oprobe "/IPRB0" ?iprobe "/V0"  ?porti "1"  )

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
Iout = i("/I2/D" ?result "ac")
plot(Iout)
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
analysis('ac ?start ".01"  ?stop "1000M"  ?dec "10"  )
analysis('pz ?p "/VB" ?n ""  ?iprobe "/I5"  )

envOption(
        'analysisOrder  list("ac" "pz")
)


desVar(   "VIN"  0      )
desVar(   "IT"  1      )
desVar(   "gm1" 0      )

save( 'v "/VB" )

run()

selectResult( 'ac )

B = v("/VB" ?result "ac")
AB = B*gm1

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

;analysis('pz ?p "/VOUT"  ?iprobe "/V0" ?param "gm1" ?start "0.0"  ?stop gm1  ?step ".5u"  )

analysis('pz ?p ""  ?n ""  ?oprobe "/IPRB0" ?iprobe "/V0"  ?porti "1" ?param "gm1" ?start "0.0"  ?stop gm1  ?step ".5u" )

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


 AB_calc = gm1*rds1*gm4*rds4*rf/(rds4+rf+gm4*rds4*rf)
 P1 = 1/(2*PI*rds1*(cgs4+cgd4))

printf("AB_calc: %4.2f\n" AB_calc)
printf("P1: %4.2f\n" P1)
