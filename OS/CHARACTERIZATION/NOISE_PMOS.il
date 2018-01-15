simulator( 'spectre )


FLOW = 0.1;
FHIGH = 100.0;


design(	 "CHARACTERIZATION" "NOISE_PMOS" "schematic")
resultsDir( "./SimVM/NOISE_PMOS/spectre/schematic" )

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

;*********************************
;* Input refferred noise current *
;*********************************

analysis('noise ?start FLOW  ?stop FHIGH  ?dec "10"  
		?oprobe "/IPRB1"  ?iprobe "/I55"  )

desVar(	  "IDS" IDS4	)
desVar(	  "L" L4	)
desVar(	  "VDS" VDS4	)
desVar(	  "W" W4	)
envOption(
	'analysisOrder  list("noise") 
)
temp( 27 ) 
run()

in_in = getData("in" ?result "noise")
in_in_dB = dB20(in_in)

newWindow()
plot( in_in ?expr '( "Input noise Current A"))
addSubwindow()
plot( in_in_dB ?expr '( "Input noise Current dB"))

;noiseSummary( 'integrated ?result "noise" ?noiseUnit "V" ?from FLOW ?to FHIGH )

;*********************************
;* Input refferred noise voltage *
;*********************************

analysis('noise ?start FLOW  ?stop FHIGH  ?dec "10"  
		?oprobe "/IPRB0"  ?iprobe "/V2"  )
run()

vn_in = getData("in" ?result "noise")
vn_in_dB = dB20(vn_in)

vn_out = getData("out" ?result "noise")
vn_out_dB = dB20(vn_out)

newWindow()
;clearAll()
plot( vn_in ?expr '( "input noise V PMOS"))

addSubwindow()
plot( vn_in_dB ?expr '( "input noise V PMOS dB"))

addSubwindow()
plot( vn_out_dB ?expr '( "Output noise I PMOS dB"))


noiseSummary( 'integrated ?result "noise" ?noiseUnit "V" ?from FLOW ?to FHIGH )

/*
vn_in_2 = pow(vn_in,2)
NBand = FHIGH - FLOW
IN_Noise_2 = integ( vn_in_2, FLOW, FHIGH)/NBand
IN_Noise = sqrt(IN_Noise_2)

printf("AVERAGE INPUT REFERRED NOISE VOLTAGE = %4.2e V/sqrt(Hz) \n" IN_Noise)
printf("From: %4.2eHz to %4.2eHz" FLOW FHIGH)

*/
vn_in_2 = pow(vn_in,2)
NBand = FHIGH - FLOW
IN_Noise_2 = integ( vn_in_2, FLOW, FHIGH)
IN_Noise = sqrt(IN_Noise_2)

IN_Noise_2_aver = IN_Noise_2/NBand
IN_Noise_aver = sqrt(IN_Noise_2_aver)

printf("INPUT REFERRED NOISE VOLTAGE = %4.2e V(Hz) \n" IN_Noise)

printf("AVERAGE INPUT REFERRED NOISE VOLTAGE = %4.2e V/sqrt(Hz) \n" IN_Noise_aver)
printf("From: %4.2eHz to %4.2eHz" FLOW FHIGH)

;input\ noise\;\ A\ \/\ sqrt\(Hz\) = getData("in" ?result "noise")
;plot( input\ noise\;\ A\ \/\ sqrt\(Hz\) ?expr '( "input noise; A / sqrt(Hz)" ) )


