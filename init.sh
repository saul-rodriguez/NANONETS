
# File "init.sh"
# Cadence initialization file for AMS aC18 CMOS 0.18um 
# Author: Saul Rodriguez
# date: 2017-07-03

###########################
# Set path to AMS C18 PDK #
###########################
export AMS_DIR=/pkg/AMS414
export PATH=$PATH:$AMS_DIR/cds/bin:$AMS_DIR/programs/bin

################################
# Set path to Cadence Virtuoso #
################################ 
export CDSDIR=/pkg/Cadence/installs/IC616
export PATH=$PATH:$CDSDIR/tools/bin:$CDSDIR/tools/dfII/bin
export CDS_AUTO_64BIT=ALL
# These lines will enable some modgen options (6.1.5)
export CDS_XL_DUMMY_BA_FLOW=true
export MG_ENABLE_PTOT=true

## CDS_Netlisting_Mode
## Interpretion of CDF properties during netlisting
export CDS_Netlisting_Mode="Analog"

##################################
# Set path to MMSIM (simulators) #
##################################
export MMSIM_HOME=/pkg/Cadence/installs/MMSIM141
export PATH=$PATH:$MMSIM_HOME/tools/bin
export CDS_AHDLCMI_ENABLE=NO

############################
# Set ASSURA DRC/LVS tools #
############################
export ASSURAHOME=/pkg/Cadence/installs/ASSURA41_616
export PATH=$PATH:$ASSURAHOME/tools/bin:$ASSURAHOME/tools/assura/bin
export ASSURA_AUTO_64BIT=ALL

################################
# Set QRC Parasitic Extraction #
################################
export QRC_HOME=/pkg/Cadence/installs/EXT152
export PATH=$PATH:$QRC_HOME/tools/bin
export QRC_ENABLE_EXTRACTION="t"

######################
# Set INCISIVE tools #
######################
export IUSDIR=/pkg/Cadence/installs/INCISIVE142
export PATH=$PATH:$IUSDIR/tools/bin/64bit:$IUSDIR/tools/bin
export CDS_BIND_TMP_DD=true

##########################################
# ENCOUNTER DIGITAL IMPLEMENTATION (EDI) #
##########################################
#export EDIHOME=/pkg/Cadence/installs/EDI142
#export PATH=$PATH:$EDIHOME/tools/bin/64bit:$EDIHOME/tools/bin
#export CDS_ENABLE_EXP_PCELL=TRUE

######################################
# INNOVUS DIGITAL PLACE AND ROUTE    #
######################################
export INNOVUS=/pkg/Cadence/installs/INNOVUS152
export PATH=$PATH:$INNOVUS/tools/bin/64bit:$INNOVUS/tools/bin
export CDS_ENABLE_EXP_PCELL=TRUE


###################
# RC RTL Compiler #
###################
export RTL_HOME=/pkg/Cadence/installs/RC142
export PATH=$PATH:$RTL_HOME/tools.lnx86/bin

#############################
# CALIBRE PHYS VERIFICATION #
#############################
#TODO: Update tool to 2014.3
export MGC_HOME=/pkg/calibre_2014/ixl_cal_2014.3_27.21
#export OA_PLUGIN_PATH=${MGC_HOME}/shared/pkgs/icv/tools/queryskl
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/$MGC_HOME/shared/pkgs/icv/tools/calibre_client/lib/64


# Set license file location for Cadence software
##export LM_LICENSE_FILE=@lic1.ict.kth.se
export LM_LICENSE_FILE=5280@lic08.ug.kth.se


#export LM_LICENSE_FILE=@lic1.ict.kth.se:1727@lic02.ug.kth.se:27020@lic02.ug.kth.se
export MGLS_LICENSE_FILE=1727@lic02.ug.kth.se

#Start Cadence tools

echo Cadence Environemnt initalization for AMS aC18/aH18 completed 
echo to create a aC18/aH18 project run script \"./start_ams.sh new\"
echo to start virtoso run script \"./start_ams.sh\"
echo Europractice MPW options are aC18A6 or aH18A6,the suboption is DMCA




