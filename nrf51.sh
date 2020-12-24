

unamestr=`uname`
if [[ "$unamestr" == 'Linux'  ]]; then
    function refactor_make() {
        #cd $(find . -type d -name "_build")/..
        echo "backing up Makefile"
        cp Makefile Makefile.bak
        sed "s/CFLAGS  = -DBOARD_PCA10028/CFLAGS  = -DBOARD_CUSTOM/" Makefile.bak > Makefile
        echo "changing RAM... should subtract 0x4000"
        if [[ -a *.bak ]]; then
            echo "yep it exists"
            exit(0)
        else
            LD_FILE=$(ls *.ld)
        fi
        echo "backing up $LD_FILE file"
        cp $LD_FILE ${LD_FILE}.bak
        sed "s/.*RAM.*LE.*/`grep "RAM.*LENGTH" $LD_FILE|sed \"s/0x6000/0x2000/\"`/" ${LD_FILE}.bak > $LD_FILE
    }
    function rebuild_nrf(){
        
        #cd $(find . -type d -name "_build")/..
        NRF51_SDK=/media/psf/Home/Google_Drive/dev/nordic/nRF51_SDK_8.1.0
        make all
        SOFTDEVICE=$NRF51_SDK/components/softdevice/s110/hex/s110_softdevice.hex
        OUTPUT=_build/output.hex
        INPUT=_build/nrf51422_xxac_s110.hex
        srec_cat $SOFTDEVICE -intel $INPUT -intel -o $OUTPUT -intel --line-length=44
        cp $OUTPUT /media/$USER/MBED
    }
    #ls *.ld|xargs -i cp {} {}.bak
    echo "yes"
else
    echo "not linux"
fi

function sdk6_0_build_and_flash(){
    nrfjprog --flash $(rm -r _build; make -f $1 |tail -n 1|awk '{print $5}')
}

alias flash_SD73="nrfjprog --flash-softdevice s110_nrf51822_7.3.0_softdevice.hex"


function flash_here() {
  nrfjprog --flash _build/*.hex
}

export S110="/Users/tanedev/Google_Drive/dev/hardware/IoT/nordic/nrf51822/soft_device/s110_nrf51822_7.3.0/s110_nrf51822_7.3.0_softdevice.hex"

function my_nrfjprog(){
nrfjprog --erase-all && nrfjprog --flash-softdevice $1 && nrfjprog --flash $1 && nrfjprog --reset
}

