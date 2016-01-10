#!/bin/bash

AET=$1
HOST=$2
PORT=$3
DICOM_DIR=$4

#download binaries
wget http://tcpdiag.dl.sourceforge.net/project/dcm4che/dcm4che3/3.3.7/dcm4che-3.3.7-bin.zip
unzip dcm4che-3.3.7-bin.zip
cd dcm4che-3.3.7
bin/storescu -c $1@$2:$3 $4
#run dcmstr with params (valdate it before)
