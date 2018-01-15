/*
*  BIAS MOS AMS 0.18
*  Author: Saul Rodriguez
*  Date: 2015-01-30
*/


;====================== Set to XL mode =========================================
ocnSetXLMode()
ocnxlProjectDir( "./SimVM" )
ocnxlTargetCellView( "CHARACTERIZATION" "DCBIAS" "adexl" )
ocnxlResultsLocation( "" )
ocnxlSimResultsLocation( "" )

;====================== Tests setup ============================================

;****************** 
;L1 = 180n
;W1T = 10u
;W1 = W1T/8

load("OS/CHARACTERIZATION/global.il")

VDS_START = 0
VDS_STOP = 1.8
VDS_STEP = 0.05

VGS_START = 0
VGS_STOP = 1.8
VGS_STEP = 0.05
;******************


;---------- Test "CHARACTERIZATION:DCBIAS:1" ------------- 
ocnxlBeginTest("CHARACTERIZATION:DCBIAS:1")
simulator( 'spectre )
design( "CHARACTERIZATION" "DCBIAS" "schematic")

/*
modelFile( 
    '("/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/design.scs" "noitm")
    '("/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/res.scs" "restm")
    '("/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/cap.scs" "captm")
    '("/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/bip.scs" "biptm")
    '("/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/esddi.scs" "esdditm")
    '("/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/cmos53.scs" "cmostm")
)
definitionFile(
    "/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/mcparams.scs"
)
*/

modelFile( 
    '("$AMS_DIR/spectre/h18/soac/mcparams.scs" "")
    '("$AMS_DIR/spectre/h18/soac/design.scs" "noitm")
    '("$AMS_DIR/spectre/h18/soac/res.scs" "restm")
    '("$AMS_DIR/spectre/h18/soac/cap.scs" "captm")
    '("$AMS_DIR/spectre/h18/soac/bip.scs" "biptm")
    '("$AMS_DIR/spectre/h18/soac/esddi.scs" "esdditm")
    '("$AMS_DIR/spectre/h18/soac/cmos53.scs" "cmostm")
)

analysis('dc ?saveOppoint t  ?param "VDS"  ?start VDS_START  
		?stop VDS_STOP  ?step VDS_STEP  )
desVar(	  "L" L1	)
desVar(	  "W" W1	)
desVar(	  "VDS" 1	)
desVar(	  "VGS" 1	)
option( ?categ 'turboOpts
	'uniMode  "APS" 
)
save( 'i "/TN0/D" )
temp( 27 ) 
ocnxlOutputTerminal( "/TN0/D" ?plot t ?save t)
ocnxlEndTest() ; "CHARACTERIZATION:DCBIAS:1"

;====================== Sweeps setup ===========================================
ocnxlSweepVar("VDS" "1")
ocnxlSweepVar("VGS" "{From/To}Linear:0:0.1:1{From/To}")
ocnxlSweepVar("L" "150n") ;Disabled item, desVar active
ocnxlSweepVar("W" "1u")   ;Disabled item, desVar active

;====================== Model Group setup ==========================================

;====================== Corners setup ==========================================

;====================== Job setup ==============================================
ocnxlJobSetup( '(
	"blockemail" "1"
	"configuretimeout" "300"
	"distributionmethod" "Local"
	"lingertimeout" "300"
	"maxjobs" "8"
	"name" "ADE XL Default"
	"preemptivestart" "1"
	"reconfigureimmediately" "1"
	"runtimeout" "-1"
	"showerrorwhenretrying" "1"
	"showoutputlogerror" "0"
	"startmaxjobsimmed" "1"
	"starttimeout" "300"
) )

;====================== Disabled items =========================================
ocnxlDisableSweepVar("L")
ocnxlDisableSweepVar("W")
;====================== Run Mode Options ======================================

;====================== Starting Point Info ======================================

;====================== Run command ============================================
ocnxlRun( ?mode 'sweepsAndCorners ?nominalCornerEnabled t ?allCornersEnabled t ?allSweepsEnabled t)
ocnxlOutputSummary(?exprSummary t ?specSummary t ?detailed t ?wave t)


ids_vds = i("/TN0/D" ?result "dc")
rds = 1/deriv(ids_vds)

;********** REPEAT FOR VGS **********************

;---------- Test "CHARACTERIZATION:DCBIAS:1" ------------- 
ocnxlBeginTest("CHARACTERIZATION:DCBIAS:1")
simulator( 'spectre )
design( "CHARACTERIZATION" "DCBIAS" "schematic")
/*
modelFile( 
    '("/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/design.scs" "noitm")
    '("/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/res.scs" "restm")
    '("/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/cap.scs" "captm")
    '("/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/bip.scs" "biptm")
    '("/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/esddi.scs" "esdditm")
    '("/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/cmos53.scs" "cmostm")
)
definitionFile(
    "/afs/ict.kth.se/proj/ektlab/PDK/AMS411/spectre/c18/mcparams.scs"
)*/


modelFile( 
    '("$AMS_DIR/spectre/h18/soac/mcparams.scs" "")
    '("$AMS_DIR/spectre/h18/soac/design.scs" "noitm")
    '("$AMS_DIR/spectre/h18/soac/res.scs" "restm")
    '("$AMS_DIR/spectre/h18/soac/cap.scs" "captm")
    '("$AMS_DIR/spectre/h18/soac/bip.scs" "biptm")
    '("$AMS_DIR/spectre/h18/soac/esddi.scs" "esdditm")
    '("$AMS_DIR/spectre/h18/soac/cmos53.scs" "cmostm")
)

analysis('dc ?saveOppoint t  ?param "VGS"  ?start VGS_START  
		?stop VGS_STOP  ?step VGS_STEP  )
desVar(	  "L" L1	)
desVar(	  "W" W1	)
desVar(	  "VDS" 1	)
desVar(	  "VGS" 1	)
option( ?categ 'turboOpts
	'uniMode  "APS" 
)
save( 'i "/TN0/D" )
temp( 27 ) 
ocnxlOutputTerminal( "/TN0/D" ?plot t ?save t)
ocnxlEndTest() ; "CHARACTERIZATION:DCBIAS:1"

;====================== Sweeps setup ===========================================
ocnxlSweepVar("VDS" "{From/To}Linear:0:0.1:1{From/To}")
ocnxlSweepVar("VGS" "1")
ocnxlSweepVar("L" "180n")
ocnxlSweepVar("W" "1u")

;====================== Run command ============================================
ocnxlRun( ?mode 'sweepsAndCorners ?nominalCornerEnabled t ?allCornersEnabled t ?allSweepsEnabled t)
ocnxlOutputSummary(?exprSummary t ?specSummary t ?detailed t ?wave t)


ids_vgs = i("/TN0/D" ?result "dc")
gm = deriv(ids_vgs)
gmid = gm/ids_vgs

;====================== End XL Mode command ===================================
ocnxlEndXLMode()


;************* PLOT RESULTS ********************
envSetVal("wavescan.application" "VIVALicenseCheckoutOrder" 'string "ADE,VIVA")

; Plot IDS and RDS vs. VDS
newWindow
addTitle( "NMOS DC Characterization VDS" )
plot(ids_vds)
addSubwindowTitle( "IDS vs. VDS")
addSubwindow()
plot(rds)
addSubwindowTitle( "RDS vs. VDS")

; Plot IDS and GM vs. VGS
newWindow
addTitle( "NMOS DC Characterization VGS" )
plot(ids_vgs)
addSubwindowTitle( "IDS vs. VGS")
addSubwindow()
plot(gm)
addSubwindowTitle( "GM vs. VDS")

addSubwindow()
ocnYvsYplot(?wavex ids_vgs ?wavey gmid)
addSubwindowTitle( "GMID vs. ID")

