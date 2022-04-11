source /software/scripts/init_questa10.7c

rm *.wlf
rm transcript
rm -r work
vlib work

vcom -93 -work ./work ../src/FA.vhd
vcom -93 -work ./work ../src/HA.vhd
vcom -93 -work ./work ../src/Mux8to1.vhd
vcom -93 -work ./work ../src/Sel_PP.vhd
vcom -93 -work ./work ../src/Stage_Mux.vhd
vcom -93 -work ./work ../src/Stage_2.vhd
vcom -93 -work ./work ../src/Stage_1.vhd
vcom -93 -work ./work ../src/Stage_2.vhd
vcom -93 -work ./work ../src/Stage_3.vhd
vcom -93 -work ./work ../src/Stage_4.vhd
vcom -93 -work ./work ../src/Stage_5.vhd
vcom -93 -work ./work ../src/MBE_Mult.vhd

vlog -sv ../tb/top.sv
vsim top

