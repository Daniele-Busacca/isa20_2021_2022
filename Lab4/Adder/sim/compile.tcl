source /software/scripts/init_questa10.7c

rm -r work
rm transcript
rm tr_db.log


vlib work
vlog -sv ../tb/top.sv
vsim top

