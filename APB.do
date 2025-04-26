vlib work
vlog   APB_if.sv APB_Wrapper.sv APB_seq_item.sv APB_cvr.sv APB_sb.sv APB_monitor.sv APB_sva.sv APB_top.sv APB_tb.sv +cover
vsim -voptargs=+acc work.APB_top -cover
add wave *
add wave /APB_top/DUT/If/*
add wave /APB_top/DUT/SVA/a_ready
add wave /APB_top/DUT/SVA/a_read 
add wave /APB_top/DUT/SVA/a_write
add wave /APB_top/DUT/reg_file/*
add wave /APB_top/DUT/SVA/c_ready /APB_top/DUT/SVA/c_read /APB_top/DUT/SVA/c_write
coverage save APB_test.ucdb -onexit
run -all
#quit -sim
vcover report APB_test.ucdb -details -all -annotate -output APB_cvr.txt

