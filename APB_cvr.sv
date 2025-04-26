package APB_cvr_pkg;

import APB_seq_item_pkg::*;

class APB_cvr;

APB_seq_item seq_item = new();

covergroup cg;

addr :coverpoint seq_item.PADDR {
    bins vals[] = {16'h0000 ,16'h0040 ,16'h0080 ,16'h00c0 ,16'h0100 ,16'h0140 ,16'h0180 ,16'h01c0 ,16'h0200 ,16'h0240 ,16'h0280 
                           ,16'h02c0 ,16'h0300 ,16'h0340 ,16'h0380 ,16'h03c0};
}

en: coverpoint seq_item.PENABLE {
    option.weight=0;
}

ready: coverpoint seq_item.PREADY {
    option.weight=0;
}

sel: coverpoint seq_item.PSELx {
    bins one = {1};
    option.weight=0;
}

wr: coverpoint seq_item.PWRITE {
    option.weight=0;
}

c_addr_sel_wr: cross addr, sel ,wr;


endgroup


function sample_data (APB_seq_item item);
    seq_item = item;
    cg.sample();
endfunction

function new ();
	cg=new();
endfunction
    
endclass
endpackage