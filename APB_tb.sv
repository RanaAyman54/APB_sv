import APB_seq_item_pkg::*;
import APB_monitor_pkg::*;

module APB_tb(APB_if.TEST If);

APB_mon mon = new();
APB_seq_item item = new();

initial begin
    If.PADDR =0;
    If.PENABLE =0;
    If.PRESETn =0;
    If.PSELx =0;
    If.PWDATA =0;
    If.PWRITE =0;
    error_count =0;
    correct_count =0;

    repeat(100) begin
        @(negedge If.PCLK);
        assert(item.randomize())
        If.PADDR = item.PADDR;
        If.PENABLE = item.PENABLE;
        If.PRESETn = item.PRESETn;
        If.PSELx = item.PSELx;
        If.PWDATA = item.PWDATA;
        If.PWRITE = 1;
        item.PREADY = If.PREADY;
        item.PRDATA = If.PRDATA;
        mon.monitor(item);
        check_slave(item);
        
    end
    
    repeat(100) begin
        @(negedge If.PCLK);
        assert(item.randomize())
        If.PADDR = item.PADDR;
        If.PENABLE = item.PENABLE;
        If.PRESETn = item.PRESETn;
        If.PSELx = item.PSELx;
        If.PWDATA = item.PWDATA;
        If.PWRITE = item.PWRITE;
        item.PREADY = If.PREADY;
        item.PRDATA = If.PRDATA;
        mon.monitor(item); 
        check_slave(item);  
    end

    repeat(100) begin
        @(negedge If.PCLK);
        assert(item.randomize())
        If.PADDR = item.PADDR;
        If.PENABLE = item.PENABLE;
        If.PRESETn = item.PRESETn;
        If.PSELx = item.PSELx;
        If.PWDATA = item.PWDATA;
        If.PWRITE = 0;
        item.PREADY = If.PREADY;
        item.PRDATA = If.PRDATA;
        mon.monitor(item); 
        check_slave(item);   
    end

    item.addr.constraint_mode(0);
    repeat(100) begin
        @(negedge If.PCLK);
        assert(item.randomize())
        If.PADDR = item.PADDR;
        If.PENABLE = item.PENABLE;
        If.PRESETn = item.PRESETn;
        If.PSELx = item.PSELx;
        If.PWDATA = item.PWDATA;
        If.PWRITE = item.PWRITE;
        item.PREADY = If.PREADY;
        item.PRDATA = If.PRDATA;
        mon.monitor(item);  
        check_slave(item);  
    end

    @(negedge If.PCLK);
    $display("at the end of simulation error count = %d and correct count = %d",error_count,correct_count);
    $stop;

end


   
endmodule


