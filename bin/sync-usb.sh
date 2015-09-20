# Helper script for rsyncing for creating the USB
USBPATH=${-:/Volumes/STL15MESOS}
CURDIR=$(dirname $0)
ROOTDIR=$(realpath ${CURDIR}/../)
#rsync -rltDvz  ${ROOTDIR} ${USBPATH}
rsync -a ${ROOTDIR} ${USBPATH}
