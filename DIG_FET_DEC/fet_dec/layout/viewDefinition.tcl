create_library_set -name libs_typ\
   -timing\
    [list /pkg/AMS414/liberty/ac18_1.8V/ac18_CORELIB_TYP.lib]
create_library_set -name libs_min\
   -timing\
    [list /pkg/AMS414/liberty/ac18_1.8V/ac18_CORELIB_BC.lib]
create_library_set -name libs_max\
   -timing\
    [list /pkg/AMS414/liberty/ac18_1.8V/ac18_CORELIB_WC.lib]
create_rc_corner -name ams_rc_corner_minCaR2\
   -cap_table /pkg/AMS414/cds/HK_AC18/LEF/ac18a6/ac18a6-best.capTable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 150\
   -qx_tech_file /pkg/AMS414/assura/ac18a6/ac18a6/QRC-best/qrcTechFile
create_rc_corner -name ams_rc_corner_maxCaR2\
   -cap_table /pkg/AMS414/cds/HK_AC18/LEF/ac18a6/ac18a6-worst.capTable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T -50\
   -qx_tech_file /pkg/AMS414/assura/ac18a6/ac18a6/QRC-worst/qrcTechFile
create_rc_corner -name ams_rc_corner_typ\
   -cap_table /pkg/AMS414/cds/HK_AC18/LEF/ac18a6/ac18a6-typical.capTable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 25\
   -qx_tech_file /pkg/AMS414/assura/ac18a6/ac18a6/QRC-typical/qrcTechFile
create_rc_corner -name ams_rc_corner_minCaR\
   -cap_table /pkg/AMS414/cds/HK_AC18/LEF/ac18a6/ac18a6-best.capTable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T -50\
   -qx_tech_file /pkg/AMS414/assura/ac18a6/ac18a6/QRC-best/qrcTechFile
create_rc_corner -name ams_rc_corner_maxCaR\
   -cap_table /pkg/AMS414/cds/HK_AC18/LEF/ac18a6/ac18a6-worst.capTable\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 150\
   -qx_tech_file /pkg/AMS414/assura/ac18a6/ac18a6/QRC-worst/qrcTechFile
create_delay_corner -name corner_typ\
   -library_set libs_typ\
   -opcond_library ac18_CORELIB_TYP\
   -opcond typical\
   -rc_corner ams_rc_corner_typ
create_delay_corner -name corner_min\
   -library_set libs_min\
   -opcond_library ac18_CORELIB_BC\
   -opcond best\
   -rc_corner ams_rc_corner_minCaR
create_delay_corner -name corner_max\
   -library_set libs_max\
   -opcond_library ac18_CORELIB_WC\
   -opcond worst\
   -rc_corner ams_rc_corner_maxCaR
create_delay_corner -name corner_max2\
   -library_set libs_max\
   -opcond_library ac18_CORELIB_WC\
   -opcond worst\
   -rc_corner ams_rc_corner_minCaR2
create_delay_corner -name corner_min2\
   -library_set libs_min\
   -opcond_library ac18_CORELIB_BC\
   -opcond best\
   -rc_corner ams_rc_corner_maxCaR2
create_constraint_mode -name test\
   -sdc_files\
    [list ${cvd}/mmmc/modes/test/test.sdc]
create_constraint_mode -name func\
   -sdc_files\
    [list ${cvd}/mmmc/modes/func/func.sdc]
create_analysis_view -name test_max -constraint_mode test -delay_corner corner_max -latency_file /home/saul/projects/DIGIMP/NNSENSE_FET_SEL/PLACE_ROUTE/OADB/fet_dec_OADB/fet_dec/final/mmmc/views/test_max/latency.sdc
create_analysis_view -name func_max -constraint_mode func -delay_corner corner_max -latency_file /home/saul/projects/DIGIMP/NNSENSE_FET_SEL/PLACE_ROUTE/OADB/fet_dec_OADB/fet_dec/final/mmmc/views/func_max/latency.sdc
create_analysis_view -name test_max2 -constraint_mode test -delay_corner corner_max2
create_analysis_view -name func_max2 -constraint_mode func -delay_corner corner_max2
create_analysis_view -name test_typ -constraint_mode test -delay_corner corner_typ
create_analysis_view -name func_typ -constraint_mode func -delay_corner corner_typ
create_analysis_view -name test_min -constraint_mode test -delay_corner corner_min -latency_file /home/saul/projects/DIGIMP/NNSENSE_FET_SEL/PLACE_ROUTE/OADB/fet_dec_OADB/fet_dec/final/mmmc/views/test_min/latency.sdc
create_analysis_view -name func_min -constraint_mode func -delay_corner corner_min -latency_file /home/saul/projects/DIGIMP/NNSENSE_FET_SEL/PLACE_ROUTE/OADB/fet_dec_OADB/fet_dec/final/mmmc/views/func_min/latency.sdc
create_analysis_view -name test_min2 -constraint_mode test -delay_corner corner_min2
create_analysis_view -name func_min2 -constraint_mode func -delay_corner corner_min2
set_analysis_view -setup [list func_max test_max] -hold [list func_min test_min]
