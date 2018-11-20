#!/bin/bash

if [ "$1" == "tid" ]
then
	echo "is $1"
	cp -f tcu/tid/board.c board/ti/am335x/
	cp -f tcu/tid/mux.c board/ti/am335x/
elif [ "$1" == "tia" ] || [ "$1" == "ti7" ]
then
	echo "is $1"
	cp -f tcu/tia/board.c board/ti/am335x/
	cp -f tcu/tia/mux.c board/ti/am335x/
elif [ "$1" == "c2000a" ] || [ "$1" == "c3000" ]
then
	echo "is $1"
	cp -f tcu/c2000a/board.c board/ti/am335x/
	cp -f tcu/c2000a/mux.c board/ti/am335x/
else
	echo "no tcu module $1, exit build.sh"
fi
sync

make CROSS_COMPILE=arm-none-linux-gnueabi- distclean
rm -rf ./am335x_evm
make CROSS_COMPILE=arm-none-linux-gnueabi- O=am335x_evm am335x_evm_config all
rm -f ../images/MLO ../images/u-boot.img
cp am335x_evm/MLO am335x_evm/u-boot.img ../images/
