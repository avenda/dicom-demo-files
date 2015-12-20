#
# DCM4CHEE - Open source picture archive and communications server (PACS)
#
FROM ubuntu:14.04
MAINTAINER avenda <avenda@gmail.com>

# Load the stage folder, which contains the setup scripts.
ENV DCM_TLK_VERSION=3.3.7
ENV DCM_TLK_HOME=/var/local/dcm4che

ADD stage stage

RUN mkdir -p ${DCM_TLK_HOME}

WORKDIR /stage

RUN apt-get update && apt-get install -yq --no-install-recommends \
curl zip unzip openjdk-6-jdk python g++ make checkinstall git

# Download the binary package for DCM4CHEE
RUN curl -G http://tcpdiag.dl.sourceforge.net/project/dcm4che/dcm4che3/${DCM_TLK_VERSION}/dcm4che-${DCM_TLK_VERSION}-bin.zip > /stage/dcm4che-${DCM_TLK_VERSION}-bin.zip
RUN unzip -q /stage/dcm4che-${DCM_TLK_VERSION}-bin.zip
ENV DCM_DIR=${DCM_TLK_HOME}/dcm4che-${DCM_TLK_VERSION}

# Clone dicom-files-demo
RUN git clone https://github.com/avenda/dicom-demo-files.git
# Copy files from the Audit Record Repository (ARR) to dcm4chee
RUN ${DCM_DIR}/bin/storescu -c DCM4CHEE@${STORESCU_HOST}:${STORESCU_PORT} /stage/dicom-demo-files

#CMD ["/stage/start.bash"]
