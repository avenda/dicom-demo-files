#!/bin/bash
DCM_VERSION=3.3.7
AET=$1
HOST=$2
PORT=$3
DICOM_DIR=$4
#if binaries arent downloaded
if [ ! -d dcm4che-$DCM_VERSION ]; then
    wget http://tcpdiag.dl.sourceforge.net/project/dcm4che/dcm4che3/$DCM_VERSION/dcm4che-$DCM_VERSION-bin.zip
    unzip dcm4che-$DCM_VERSION-bin.zip
fi
dcm4che-$DCM_VERSION/bin/storescu -c $1@$2:$3 $4

