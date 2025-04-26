module APB_sva( APB_if.DUT If);



property read;
    @(posedge If.PCLK) disable iff (~If.PRESETn || If.PWRITE) $rose(If.PREADY) |-> If.PRDATA === $past(DUT.reg_file.read_data)
endproperty
a_read :assert property (read);
c_read :cover property (read);



property write;
    @(posedge If.PCLK) disable iff (~If.PRESETn || ~If.PWRITE) $rose(If.PREADY) |-> DUT.reg_file.write_data === $past(If.PWDATA,3)
endproperty
a_write :assert property (write);
c_write :cover property (write);



always_comb begin 
 if(!If.PRESETn)
 assert_rst: assert final(If.PRDATA==0 && If.PREADY==0);
 end
    
endmodule