**************************************************************
* Instructions to create a working directory for hitkit 4.14 *
* Author: Saul Rodriguez                                     *
* Date: 2017-07-04                                           *
**************************************************************

- Create a new directory and enter to it

$ mkdir workdir
$ cd workdir

- copy the init.sh and start_ams.sh files to the workdir
$ cp /pkg/AMS414/WORKDIR_INSTALL/*.* .

- initialize the environment variables:
$ source init.sh

- To configure a new hitkit 4.14 working directory, and start virtuoso:
$ ./start_ams.sh new

- To start virtuoso in an already created working directory 
$ ./start_ams.sh

- To update an already created working directory after a new hit-kit has been installed
$ ./start_ams.sh update

Note: changing the project to a different technology needs to call ams_cds manually. for instance to 
change the technology to ac18a5:

$ ams_cds -newtch ac18a5

  




