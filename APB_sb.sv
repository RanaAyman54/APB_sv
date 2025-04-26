package APB_sb_pkg;

import APB_seq_item_pkg::*;

class APB_sb ;

APB_seq_item seq_item = new() ;

logic correctSlave;
logic [3:0] encoding;
int error_count , correct_count;

task check_slave (input APB_seq_item seqItem);
check (seqItem);
if(/*DUT.apb_slave.address_encoding === encoding &&*/ DUT.apb_slave.correct_slave === correctSlave)
correct_count++;
else begin
    error_count++;
    $display("error no.=%d at time %t PADDR=%16b PSELx=%d ",error_count,$time,seqItem.PADDR,seqItem.PSELx);
end
endtask

task check (input APB_seq_item seq);

/*case ({seq.PSELx,seq.PADDR[If.ADDR_WIDTH-1:If.ADDR_WIDTH-2]})
3'b100 : encoding = 4'b0001;
3'b101 : encoding = 4'b0010;
3'b110 : encoding = 4'b0100;
3'b111 : encoding = 4'b1000;
default: encoding = 4'b0000;
endcase*/

/*if(seq.PSELx)
case (seq.PADDR[If.ADDR_WIDTH-1:If.ADDR_WIDTH-2])
2'b00 : encoding = 4'b0001;
2'b01 : encoding = 4'b0010;
2'b10 : encoding = 4'b0100;
2'b11 : encoding = 4'b1000;
default: encoding = 4'b0000;
endcase
else
encoding =0;*/

correctSlave = If.PSELx && (DUT.apb_slave.SLAVE_ID === DUT.apb_slave.address_encoding);

endtask


endclass
endpackage