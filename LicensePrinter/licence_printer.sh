#!/bin/bash
#by nya
#especially design for Termux

#links of diffent licenses
APACHELIC_LINK="https://apache.org/licenses/LICENSE-2.0.txt"
MITLIC_LINK="https://raw.githubusercontent.com/nya-main/Small-Tools/main/LicensePrinter/mitlic.txt"
GPLLIC_LINK="https://www.gnu.org/licenses/gpl-3.0.txt"
MPLLIC_LINK="https://www.mozilla.org/media/MPL/2.0/index.txt" #mozilla license
LGPLLIC_LINK="https://www.gnu.org/licenses/lgpl-3.0.txt"
ALL_LICENCE=([1]Apache2.0 [2]MIT [3]GPL [4]MPL [5]LGPL)

#printer function
function print_licence(){
    case $1 in
        1) curl -s ${APACHELIC_LINK};;
        2) curl -s ${MITLIC_LINK};;
        3) curl -s ${GPLLIC_LINK};;
        4) curl -s ${MPLLIC_LINK};;
        5) curl -s ${LGPLLIC_LINK};;
    esac
    exit 1
}

#print help
function print_usage(){
    echo "-h, Print usage.Input the number in the list of supported licenses."
    echo "-l, Print a list of supported licenses."
    echo "-p {NUM}, Print a license."
    echo -e "this script get all of these license from web(GitHub,original website).\nAll of the licenses are plain text from official website."
    exit 0
}

#print supported licenses list
function licence_list(){
    for i in ${ALL_LICENCE[*]};do
        echo "${i}"
    done
    exit 0
}

#solve args
while getopts :hlp: ARGS;do
    case ${ARGS} in
        h) print_usage;;
        l) licence_list;;
        p) print_licence ${OPTARG};;
        :) echo "-${OPTARG}需要一个选项" && exit 1;;
        *) echo "Use the -h option to get the usage." && exit 1;;
    esac
done
