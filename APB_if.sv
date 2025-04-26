interface APB_if (PCLK);

input bit PCLK;

    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 16;				 


// Global Sinals  
    logic 						 	PRESETn  ;  

// Slave FROM Master
    logic [ADDR_WIDTH-1 : 0]     	PADDR    ;
    logic                        	PWRITE   ;
    logic [DATA_WIDTH-1 : 0]     	PWDATA   ;
    logic                        	PENABLE  ;
    logic                           PSELx    ;

// Slave TO Master
    logic                          PREADY   ;
    logic [DATA_WIDTH-1 : 0]    	PRDATA  ;

    modport DUT (input PCLK , PRESETn , PADDR ,PWRITE ,PWDATA ,PENABLE ,PSELx , output PREADY , PRDATA );
    modport TEST (input PCLK , PREADY , PRDATA  , output PRESETn , PADDR ,PWRITE ,PWDATA ,PENABLE ,PSELx );



    
endinterface