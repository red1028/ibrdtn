#!/bin/bash
#

VERSION=1.0.1
REPOSITORY=http://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases
MODULES="ibrcommon ibrdtn ibrdtnd ibrdtn-tools"

# build ibrcommon with openssl support
#CONFOPTS="--with-openssl "

# build with support for HTTP convergence layer (need curl library)
#CONFOPTS+="--with-curl "

# build with support for IEEE 802.15.4 LoWPAN
#CONFOPTS+="--with-lowpan "

# build with support for sqlite bundle storage
#CONFOPTS+="--with-sqlite "

# build with support for bundle security protocol
#CONFOPTS+="--with-dtnsec "

# build with bundle compression support
#CONFOPTS+="--with-compression "

# build with tcpcl tls support
#CONFOPTS+="--with-tls "

# build with dtndht support
#CONFOPTS+="--with-dht "

# build with libtffs support
#CONFOPTS+="--with-tffs=/usr "

# download, extract and compile all archives
for MOD in ${MODULES}; do
        if [ ! -e "${MOD}-${VERSION}.tar.gz" ]; then
                wget ${REPOSITORY}/${MOD}-${VERSION}.tar.gz
        fi

        if [ ! -d "${MOD}-${VERSION}" ]; then
                tar xvzf ${MOD}-${VERSION}.tar.gz
        fi

#        cd ${MOD}-${VERSION}
#        ./configure ${CONFOPTS} $@
#
#        if [ $? -gt 0 ]; then
#                echo "error while configure ${MOD}"
#                exit 1
#        fi
#
#        make
#
#        if [ $? -gt 0 ]; then
#                echo "error while compiling ${MOD}"
#                exit 1
#        fi
#
#        cd ..
#
#	if [ "${MOD}" == "ibrcommon" ]; then
#		CONFOPTS+="--with-ibrcommon=$(pwd)/ibrcommon-${VERSION} "
#	fi
#
#	if [ "${MOD}" == "ibrdtn" ]; then
#		CONFOPTS+="--with-ibrdtn=$(pwd)/ibrdtn-${VERSION} "
#	fi
done
