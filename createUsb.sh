sudo fdisk -l

if [ $# -eq 0 ]; then
    printf "\n"
    printf "\n"
    read -p "Enter full path to .iso image: " isoPath
    read -p "Enter full path to USB: " usbPath
else 
    isoPath=$1
    usbPath=$2
fi

LEN1=${#isoPath}
LEN2=${#usbPath}

if [ $LEN1 -lt 1 ] || [ $LEN2 -lt 1 ]; then
    if [ $LEN1 -lt 1 ]; then
        printf "\nMissing path to ISO file."
    fi
    if [ $LEN2 -lt 1 ]; then
        printf "\nMissing path to USB."
    fi
    printf "\n"
else
    printf "\n"
    printf "\n"
    sudo dd bs=4M if=$isoPath of=$usbPath status=progress oflag=sync
fi

