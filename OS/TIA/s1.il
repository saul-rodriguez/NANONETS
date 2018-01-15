simulator( 'spectre )

;design(	 "/home/saul/Sim/s1/spectre/schematic/netlist/netlist")

design(	 "IMP_AN_TIA" "s1" "schematic")

resultsDir( "/home/saul/Sim/s1/spectre/schematic" )

createNetlist

modelFile( 
    '("/pkg/AMS/spectre/h18/soac/mcparams.scs" "")
    '("/pkg/AMS/spectre/h18/soac/design.scs" "noitm")
    '("/pkg/AMS/spectre/h18/soac/res.scs" "restm")
    '("/pkg/AMS/spectre/h18/soac/cap.scs" "captm")
    '("/pkg/AMS/spectre/h18/soac/bip.scs" "biptm")
    '("/pkg/AMS/spectre/h18/soac/esddi.scs" "esdditm")
    '("/pkg/AMS/spectre/h18/soac/cmos53.scs" "cmostm")
)
analysis('ac ?start "0.1"  ?stop "1G"  ?dec "10"  )
analysis('pz ?p "/VOUTP"  ?n "/VOUTN"  ?iprobe "/I6"  )


IN = 1
;R1 = 0.45M
R1 = 1.35M
RS = 1M
cl = 200f
cc = 400p
rc = 1k
cc2 = 1p

;NMOS1: W1_tot = 50.00um  L1 = 1.00um  IDS1 = 0.0002mA  VDS1 = 0.50V
  gm1 = 0.005m
  rds1 = 138148609.13
  cgs1 = 2.51f
  cgs1 = 75.28f
  cgd1 = 15.69f
  cds1 = 1.01f
  cdb1 = 0.20f
  vgs1 = 0.1981
  Gain1 = 758.12
  gm_id1 = 27.44
;  Ft1 = 47.99 MHz
;  Ft1g = 11.60 MHz

;PMOS1: W4_tot = 50.00um  L4 = 1.00um  IDS4 = 0.0030mA  VDS4 = 0.50V
  gm4 = 0.0606m
  rds4 = 3406882.40
  cgs4 = 82.73f
  cgs4 = 143.55f
  cgd4 = 17.56f
  cds4 = 37.60f
  cdb4 = 8.49f
  vgs4 = 0.4028
  Gain4 = 206.57
;  gm_id4 = 20.21
;  Ft4 = 96.22 MHz 

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
desVar(	  "rd1" rds1	)
desVar(	  "rd4" rds4	)

desVar(	  "IN" IN	)
desVar(	  "R1" R1	)
desVar(	  "RS" RS	)
desVar(	  "CL" cl	)
desVar(	  "CC" cc	)
desVar(	  "RC" rc	)
desVar(	  "CC2" cc2	)

envOption(
	'analysisOrder  list("ac") 
)
temp( 27 ) 
run()
selectResult( 'ac )

newWindow

vout = v("/VOUTP" ?result "ac") - v("/VOUTN" ?result "ac")
plot(vout)

pzPlot( ?result "pz" ) 
