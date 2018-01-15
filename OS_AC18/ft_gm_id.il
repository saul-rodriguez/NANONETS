;====================== Set to XL mode =========================================
ocnSetXLMode()
ocnxlProjectDir( "./Sim" )
ocnxlTargetCellView( "CHARACT_AC8" "FT" "adexl" )
ocnxlResultsLocation( "" )
ocnxlSimResultsLocation( "" )

load("OS_AC18/global.il")
;====================== Tests setup ============================================

;---------- Test "CHARACT_AC8:FT:1" ------------- 
ocnxlBeginTest("CHARACT_AC8:FT:1")
simulator( 'spectre )
design( "CHARACT_AC8" "FT" "schematic")

createNetlist

modelFile( 
    '("/pkg/AMS414/spectre/ac18/processOption.scs" "")
    '("/pkg/AMS414/spectre/ac18/design.scs" "noitm")
    '("/pkg/AMS414/spectre/ac18/res.scs" "restm")
    '("/pkg/AMS414/spectre/ac18/cap.scs" "captm")
    '("/pkg/AMS414/spectre/ac18/bip.scs" "biptm")
    '("/pkg/AMS414/spectre/ac18/esddiode.scs" "esddiodetm")
    '("/pkg/AMS414/spectre/ac18/cmos.scs" "cmostm")
    '("/pkg/AMS414/spectre/ac18/cmosm.scs" "cmosmtm")
)
definitionFile(
    "/pkg/AMS414/spectre/ac18/soac.scs"
)
analysis('dc ?saveOppoint t  )
analysis('ac ?start "10"  ?stop "100G"  ?dec "10"  )
desVar(	  "IDC" IDS1	)
desVar(	  "L"  L1	)
desVar(	  "VDS" VDS1	)
desVar(	  "W" W1	)
envOption(
	'firstRun  t 
	'analysisOrder  list("dc" "ac" "pz" "dcmatch" "stb" "tran" "envlp" "lf" "noise" "xf" "sp" "pss" "pac" "pstb" "pnoise" "pxf" "psp" "qpss" "qpac" "qpnoise" "qpxf" "qpsp" "hb" "hbac" "hbnoise" "sens" "acmatch") 
)
option( ?categ 'turboOpts
	'apsplus  t 
	'uniMode  "APS" 
)
saveOption( ?outputParamInfo t )
saveOption( ?elementInfo t )
saveOption( ?modelParamInfo t )
save( 'i "/TN0/D" "/TN1/D" )
temp( 27 ) 
ocnxlOutputTerminal( "/TN0/D" ?plot t ?save t)
ocnxlOutputTerminal( "/TN1/D" ?plot t ?save t)
ocnxlOutputExpr( "(value((IF(\"/TN0/D\") / VF(\"/VIN\")) 10) / IDC(\"/TN0/D\"))" ?name "gm_id" ?plot t)
ocnxlOutputExpr( "abs(value((IF(\"/TN0/D\") / VF(\"/VIN\")) 10))" ?name "gm" ?plot t)
ocnxlOutputExpr( "cross(dB20(IF(\"/TN0/D\")) 0 1 \"either\" nil nil)" ?name "Ft" ?plot t ?save t)
ocnxlEndTest() ; "CHARACT_AC8:FT:1"

;====================== Sweeps setup ===========================================
ocnxlSweepVar("IDC" "{From/To}Decade:1u:10:100m{From/To}")
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
	"maxjobs" "10"
	"name" "ADE XL Default"
	"preemptivestart" "1"
	"reconfigureimmediately" "1"
	"runtimeout" "-1"
	"showerrorwhenretrying" "1"
	"showoutputlogerror" "0"
	"startmaxjobsimmed" "1"
	"starttimeout" "300"
	"usesameprocess" "1"
) )

;====================== Disabled items =========================================

;====================== Run Mode Options ======================================

;====================== Starting Point Info ======================================

;====================== Run command ============================================
ocnxlRun( ?mode 'sweepsAndCorners ?nominalCornerEnabled t ?allCornersEnabled t ?allSweepsEnabled t)
ocnxlOutputSummary(?exprSummary t ?specSummary t ?detailed t ?wave t)
ocnxlOpenResults()

;====================== End XL Mode command ===================================
ocnxlEndXLMode()

; ****************************
;        Generate FT
; ****************************

Gain = dB20(IF("/TN0/D"))
FT =  cross(dB20(IF("/TN0/D")) 0 1 "either" nil nil)

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

;vin = v("VIN" ?result "ac")
;gm1 = i("/TN0/D" ?result "ac")/vin
;gm1_v = value(gm1 100)
gm1_v = abs(value((IF("/TN0/D") / VF("/VIN")) 10))

IDS = xval(gm1_v)
gm_id = gm1_v/IDS

newWindow()
plot(gm_id)
addSubwindowTitle( "GM/ID vs. ID" )

addSubwindow()
ocnYvsYplot(?wavex gm_id ?wavey FT)
addSubwindowTitle( "FT vs. GM/ID" )


