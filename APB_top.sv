module APB_top;

bit PCLK;

 always #1 PCLK = ~PCLK;

 APB_if If (PCLK);
 APB_tb TEST (If);
 APB_Wrapper DUT (If);
 bind APB_Wrapper APB_sva SVA (If);

endmodule