vlib work
#
vlog -coveropt 3 +cover +acc  APB_if.sv APB_Wrapper.sv APB_seq_item.sv APB_cvr.sv APB_monitor.sv APB_sva.sv APB_top.sv APB_tb.sv 
#
vsim -coverage -vopt work.APB_top -c -do "add wave *; coverage save -onexit -du APB_Wrapper -directive -codeAll cover.ucdb; run -all"
#                                                          
quit -sim
#
vcover report cover.ucdb -details -all -annotate -output APB_cvr2.txt