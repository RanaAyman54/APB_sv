package APB_monitor_pkg;

import APB_seq_item_pkg::*;
import APB_cvr_pkg::*;
import APB_sb_pkg::*;

class APB_mon;

APB_cvr cvr = new();
APB_sb sb = new();

task monitor (APB_seq_item seq_item);
cvr.sample_data(seq_item);
sb.check_slave(seq_item);
endtask


endclass


endpackage