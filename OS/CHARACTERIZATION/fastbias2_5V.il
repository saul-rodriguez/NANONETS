/*
*  FAST BIAS AMS 0.18
*  Author: Saul Rodriguez
*  Date: 2015-01-30
*/


simulator( 'spectre )
;design(	 "/afs/ict.kth.se/home/s/a/saul/projects/AMS_IL3601/Sim/FASTBIAS/spectre/schematic/netlist/netlist")
;resultsDir( "/afs/ict.kth.se/home/s/a/saul/projects/AMS_IL3601/Sim/FASTBIAS/spectre/schematic" )

design(	 "CHARACTERIZATION" "FASTBIAS2_5V" "schematic")
resultsDir( "./Sim/FASTBIAS2_5V/spectre/schematic" )

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
modelFile( 
    '("/pkg/AMS/spectre/h18/soac/mcparams.scs" "")
    '("/pkg/AMS/spectre/h18/soac/design.scs" "noitm")
    '("/pkg/AMS/spectre/h18/soac/res.scs" "restm")
    '("/pkg/AMS/spectre/h18/soac/cap.scs" "captm")
    '("/pkg/AMS/spectre/h18/soac/bip.scs" "biptm")
    '("/pkg/AMS/spectre/h18/soac/esddi.scs" "esdditm")
    '("/pkg/AMS/spectre/h18/soac/cmos53.scs" "cmostm")
)
*/
/*
definitionFile(
    "/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/mcparams.scs"
)
*/
analysis('dc ?saveOppoint t  ?param ""  ?start ""  
		?stop ""  ?step ""  )


W1 = W1T/32.0
W2 = W2T/32.0
W3 = W3T/32.0
W4 = W4T/32.0
W5 = W5T/32.0
W6 = W6T/32.0

desVar(	  "IDS1" IDS1	)
desVar(	  "IDS2" IDS2	)
desVar(	  "IDS3" IDS3	)
desVar(	  "IDS4" IDS4	)
desVar(	  "IDS5" IDS5	)
desVar(	  "IDS6" IDS6	)
desVar(	  "L1" L1	)
desVar(	  "L2" L2	)
desVar(	  "L3" L3	)
desVar(	  "L4" L4	)
desVar(	  "L5" L5	)
desVar(	  "L6" L6	)
desVar(	  "VDS1" VDS1	)
desVar(	  "VDS2" VDS2   )
desVar(	  "VDS3" VDS3	)
desVar(	  "VDS4" VDS4	)
desVar(	  "VDS5" VDS5	)
desVar(	  "VDS6" VDS6	)
desVar(	  "W1" W1	)
desVar(	  "W2" W2	)
desVar(	  "W3" W3	)
desVar(	  "W4" W4	)
desVar(	  "W5" W5	)
desVar(	  "W6" W6	)

temp( 27 ) 
run()

selectResults('dcOpInfo)

gm1 = getData("N0.TN1")->gm
rds1 = 1/getData("N0.TN1")->gds
cgd1 = 1e15*mag(getData("N0.TN1")->cgdol)
cgs1 = 1e15*mag(getData("N0.TN1")->cgs)
cgg1 = 1e15*mag(getData("N0.TN1")->cgg)
cds1 = 1e15*mag(getData("N0.TN1")->cds)
cdb1 = 1e15*mag(getData("N0.TN1")->cdb)
vgs1 = getData("N0.TN1")->vgs
G1 = gm1*rds1
gm_id1 = gm1/IDS1
Ft1 = gm1/(2*3.1415927*(cgs1+cgd1))*1e15/1e6 ;Ft in MHz
Ft1g = gm1/(2*3.1415927*cgg1)*1e15/1e6 ;Ft in MHz

gm2 = getData("N1.TN1")->gm
rds2 = 1/getData("N1.TN1")->gds
cgd2 = 1e15*mag(getData("N1.TN1")->cgdol)
cgs2 = 1e15*mag(getData("N1.TN1")->cgs)
cgg2 = 1e15*mag(getData("N1.TN1")->cgg)
cds2 = 1e15*mag(getData("N1.TN1")->cds)
cdb2 = 1e15*mag(getData("N1.TN1")->cdb)
vgs2 = getData("N1.TN1")->vgs
G2 = gm2*rds2
gm_id2 = gm2/IDS2
Ft2 = gm2/(2*3.1415927*(cgs2+cgd2))*1e15/1e6 ;Ft in MHz
Ft2g = gm2/(2*3.1415927*cgg2)*1e15/1e6 ;Ft in MHz

gm3 = getData("N2.TN1")->gm
rds3 = 1/getData("N2.TN1")->gds
cgd3 = 1e15*mag(getData("N2.TN1")->cgdol)
cgs3 = 1e15*mag(getData("N2.TN1")->cgs)
cgg3 = 1e15*mag(getData("N2.TN1")->cgg)
cds3 = 1e15*mag(getData("N2.TN1")->cds)
cdb3 = 1e15*mag(getData("N2.TN1")->cdb)
vgs3 = getData("N2.TN1")->vgs
G3 = gm3*rds3
gm_id3 = gm3/IDS3
Ft3 = gm3/(2*3.1415927*(cgs3+cgd3))*1e15/1e6 ;Ft in MHz
Ft3g = gm3/(2*3.1415927*cgg3)*1e15/1e6 ;Ft in MHz

gm4 = getData("P1.TP0")->gm
rds4 = 1/getData("P1.TP0")->gds
cgd4 = 1e15*mag(getData("P1.TP0")->cgdol)
cgs4 = 1e15*mag(getData("P1.TP0")->cgs)
cgg4 = 1e15*mag(getData("P1.TP0")->cgg)
cds4 = 1e15*mag(getData("P1.TP0")->cds)
cdb4 = 1e15*mag(getData("P1.TP0")->cdb)
vgs4 = getData("P1.TP0")->vgs
G4 = gm4*rds4
gm_id4 = gm4/IDS4
Ft4 = gm4/(2*3.1415927*(cgs4+cgd4))*1e15/1e6 ;Ft in MHz
Ft4g = gm4/(2*3.1415927*cgg4)*1e15/1e6 ;Ft in MHz

gm5 = getData("P2.TP0")->gm
rds5 = 1/getData("P2.TP0")->gds
cgd5 = 1e15*mag(getData("P2.TP0")->cgdol)
cgs5 = 1e15*mag(getData("P2.TP0")->cgs)
cgg5 = 1e15*mag(getData("P2.TP0")->cgg)
cds5 = 1e15*mag(getData("P2.TP0")->cds)
cdb5 = 1e15*mag(getData("P2.TP0")->cdb)
vgs5 = getData("P2.TP0")->vgs
G5 = gm5*rds5
gm_id5 = gm5/IDS5
Ft5 = gm5/(2*3.1415927*(cgs5+cgd5))*1e15/1e6 ;Ft in MHz
Ft5g = gm5/(2*3.1415927*cgg5)*1e15/1e6 ;Ft in MHz

gm6 = getData("P3.TP0")->gm
rds6 = 1/getData("P3.TP0")->gds
cgd6 = 1e15*mag(getData("P3.TP0")->cgdol)
cgs6 = 1e15*mag(getData("P3.TP0")->cgs)
cgg6 = 1e15*mag(getData("P3.TP0")->cgg)
cds6 = 1e15*mag(getData("P3.TP0")->cds)
cdb6 = 1e15*mag(getData("P3.TP0")->cdb)
vgs6 = getData("P3.TP0")->vgs
G6 = gm6*rds6
gm_id6 = gm6/IDS6
Ft6 = gm6/(2*3.1415927*(cgs6+cgd6))*1e15/1e6 ;Ft in MHz
Ft6g = gm6/(2*3.1415927*cgg6)*1e15/1e6 ;Ft in MHz

;****** Printing Results on the CIW log ********

printf("\n\n\n***********************\n")
printf("* FAST BIASING RESULTS 5V*  \n")
printf("***********************\n\n")

printf("NMOS1: W1_tot = %4.2fum  L1 = %4.2fum  IDS1 = %4.4fmA  VDS1 = %4.2fV\n" 1e6*W1T 1e6*L1 1e3*IDS1 VDS1)
printf("  gm1 = %4.3fm\n  rds1 = %4.2f\n  cgs1 = %4.2ff\n  cgg1 = %4.2ff\n  cgd1 = %4.2ff\n  cds1 = %4.2ff\n  cdb1 = %4.2ff\n  vgs1 = %5.4f\n  Gain1 = %4.2f\n" 1e3*gm1 rds1 cgs1 cgg1 cgd1 cds1 cdb1 vgs1 G1)
printf("  gm_id1 = %4.2f\n  Ft1 = %4.2f MHz\n  Ft1g = %4.2f MHz\n\n" gm_id1 Ft1 Ft1g)

printf("NMOS2: W2_tot = %4.2fum  L2 = %4.2fum  IDS2 = %4.4fmA  VDS2 = %4.2fV\n" 1e6*W2T 1e6*L2 1e3*IDS2 VDS2)
printf("  gm2 = %4.3fm\n  rds2 = %4.2f\n  cgs2 = %4.2ff\n  cgg2 = %4.2ff\n  cgd2 = %4.2ff\n  cds2 = %4.2ff\n  cdb2 = %4.2ff\n  vgs2 = %5.4f\n  Gain2 = %4.2f\n"
1e3*gm2 rds2 cgs2 cgg2 cgd2 cds2 cdb2 vgs2 G2)
printf("  gm_id2 = %4.2f\n  Ft2 = %4.2f MHz\n  Ft2g = %4.2f MHz \n\n" gm_id2 Ft2 Ft2g)

printf("NMOS3: W3_tot = %4.2fum  L3 = %4.2fum  IDS3 = %4.4fmA  VDS3 = %4.2fV\n" 1e6*W3T 1e6*L3 1e3*IDS3 VDS3)
printf("  gm3 = %4.2fm\n  rds3 = %4.2f\n  cgs3 = %4.2ff\n  cgg3 = %4.2ff\n  cgd3 = %4.2ff\n  cds3 = %4.2ff\n  cdb3 = %4.2ff\n  vgs3 = %5.4f\n  Gain3 = %4.2f\n"
1e3*gm3 rds3 cgs3 cgg3 cgd3 cds3 cdb3 vgs3 G3)
printf("  gm_id3 = %4.2f\n  Ft3 = %4.2f MHz\n  Ft3g = %4.2f MHz\n\n" gm_id3 Ft3 Ft3g)

printf("PMOS1: W4_tot = %4.2fum  L4 = %4.2fum  IDS4 = %4.4fmA  VDS4 = %4.2fV\n" 1e6*W4T 1e6*L4 1e3*IDS4 VDS4)
printf("  gm4 = %5.4fm\n  rds4 = %4.2f\n  cgs4 = %4.2ff\n  cgg4 = %4.2ff\n  cgd4 = %4.2ff\n  cds4 = %4.2ff\n  cdb4 = %4.2ff\n  vgs4 = %5.4f\n  Gain4 = %4.2f\n"
1e3*gm4 rds4 cgs4 cgg4 cgd4 cds4 cdb4 vgs4 G4)
printf("  gm_id4 = %4.2f\n  Ft4 = %4.2f MHz \n\n" gm_id4 Ft4)

printf("PMOS2: W5_tot = %4.2fum  L5 = %4.2fum  IDS5 = %4.4fmA  VDS5 = %4.2fV\n" 1e6*W5T 1e6*L5 1e3*IDS5 VDS5)
printf("  gm5 = %5.4fm\n  rds5 = %4.2f\n  cgs5 = %4.2ff\n  cgg5 = %4.2ff\n  cgd5 = %4.2ff\n  cds5 = %4.2ff\n  cdb5 = %4.2ff\n  vgs5 = %5.4f\n  Gain5 = %4.2f\n"
 1e3*gm5 rds5 cgs5 cgg5 cgd5 cds5 cdb5 vgs5 G5)
printf("  gm_id5 = %4.2f\n  Ft5 = %4.2f MHz \n\n" gm_id5 Ft5)

printf("PMOS3: W6_tot = %4.2fum  L6 = %4.2fum  IDS6 = %4.4fmA  VDS6 = %4.2fV\n" 1e6*W6T 1e6*L6 1e3*IDS6 VDS6)
printf("  gm6 = %5.4fm\n  rds6 = %4.2f\n  cgs6 = %4.2ff\n  cgg6 = %4.2ff\n  cgd6 = %4.2ff\n  cds6 = %4.2ff\n  cdb6 = %4.2ff\n  vgs6 = %5.4f\n  Gain6 = %4.2f\n" 
1e3*gm6 rds6 cgs6 cgg6 cgd6 cds6 cdb6 vgs6 G6)
printf("  gm_id6 = %4.2f\n  Ft6 = %4.2f MHz \n\n" gm_id6 Ft6)






