; /*
; *  FT AMS 0.18
; *  Author: Saul Rodriguez
; *  Date: 2015-01-30
; */


;====================== Set to XL mode =========================================
ocnSetXLMode()
ocnxlProjectDir( "./SimVM" )
ocnxlTargetCellView( "CHARACTERIZATION" "FT" "adexl" )
ocnxlResultsLocation( "" )
ocnxlSimResultsLocation( "" )

load("OS/CHARACTERIZATION/global.il")

;====================== Tests setup ============================================

;---------- Test "CHARACTERIZATION:FT:1" ------------- 
ocnxlBeginTest("CHARACTERIZATION:FT:1")
simulator( 'spectre )
design( "CHARACTERIZATION" "FT" "schematic")

createNetlist


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

analysis('ac ?start "10"  ?stop "100G"  ?dec "10"  )
desVar(	  "IDC" IDS1	)
desVar(	  "L" L1	)
desVar(	  "VDS" VDS1	)
desVar(	  "W" W1	)
envOption(
	'analysisOrder  list("dc" "ac") 
)
save( 'i "/TN0/D" "/TN1/D" "VIN" )
temp( 27 ) 
ocnxlOutputTerminal( "/TN0/D" ?plot t ?save t)
ocnxlOutputTerminal( "/TN1/D" ?plot t ?save t)
ocnxlEndTest() ; "CHARACTERIZATION:FT:1"

;====================== Sweeps setup ===========================================
ocnxlSweepVar("IDC" "{Inclusion List}1u{Inclusion List}{From/To}Decade:.01u:10:1u{From/To}")
ocnxlSweepVar("L" "L1")
ocnxlSweepVar("VDS" "VDS1")
ocnxlSweepVar("W" "W1")

;====================== Model Group setup ==========================================

;====================== Corners setup ==========================================

;====================== Job setup ==============================================
ocnxlJobSetup( '(
	"blockemail" "1"
	"configuretimeout" "300"
	"distributionmethod" "Local"
	"lingertimeout" "300"
	"maxjobs" "4"
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

;====================== Run Mode Options ======================================

;====================== Starting Point Info ======================================

;====================== Run command ============================================
ocnxlRun( ?mode 'sweepsAndCorners ?nominalCornerEnabled t ?allCornersEnabled t ?allSweepsEnabled t)
ocnxlOutputSummary(?exprSummary t ?specSummary t ?detailed t ?wave t)

;====================== End XL Mode command ===================================
ocnxlEndXLMode()


; ****************************
;        Generate FT
; ****************************

Gain = dB20(i("/TN0/D" ?result "ac"))
FT = cross( Gain 0 1 'falling )

newWindow
plot( Gain ?expr '( "Gain" ) )
addSubwindowTitle( "Current Gain vs. Freq" )
addSubwindow()
plot(FT)
addSubwindowTitle( "FT vs. IDS" )

; *********************
; * Generate FT vs GM
; *********************

;IDS = xval(FT)

vin = v("VIN" ?result "ac")
gm1 = i("/TN0/D" ?result "ac")/vin
gm1_v = value(gm1 10)

IDS = xval(gm1_v)
gm_id = gm1_v/IDS

newWindow()
plot(gm_id)
addSubwindowTitle( "GM/ID vs. ID" )

addSubwindow()
ocnYvsYplot(?wavex gm_id ?wavey FT)
addSubwindowTitle( "FT vs. GM/ID" )


