package APB_seq_item_pkg;

import shared_pkg::*;

class APB_seq_item;

rand logic   PRESETn  ,PWRITE ,PENABLE ,PSELx ;
rand logic [ADDR_WIDTH-1 : 0] PADDR;
rand logic [DATA_WIDTH-1 : 0] PWDATA ;
logic [DATA_WIDTH-1 : 0]  PRDATA;
logic PREADY ; 
//bit [15:0] vals [$] = '{16'h0000 ,16'h0040 ,16'h0080 ,16'h00c0 ,16'h0100 ,16'h0140 ,16'h0180 ,16'h01c0 ,16'h0200 ,16'h0240 ,16'h0280 ,16'h02c0 ,16'h0300 ,16'h0340 ,16'h0380 ,16'h03c0};


constraint rst {
    PRESETn dist {0:=10 , 1:=90};
}

constraint enable {
    PENABLE dist {0:=30 ,1:=70};
}

constraint sel {
    PSELx dist {0:=10 ,1:=90};
}

constraint w_r {
    PWRITE dist {0:=50 , 1:=50};
}

constraint addr {
    PADDR inside {16'h0000 ,16'h0040 ,16'h0080 ,16'h00c0 ,16'h0100 ,16'h0140 ,16'h0180 ,16'h01c0 ,16'h0200 ,16'h0240 ,16'h0280 ,16'h02c0 ,16'h0300 ,16'h0340 ,16'h0380 ,16'h03c0};
}

endclass
endpackage