module values(input CLOCK_50,output [1:0]LEDG);
   
   reg [32:0] cont;
   reg lightON=0;
   
   assign LEDG[0] = lightON;
   assign LEDG[1] = ~lightON;
	
   always @(posedge CLOCK_50) begin		
      if(cont == 50000000) begin
		 lightON = ~lightON;
		 cont = 0;
      end else begin
		 cont <= cont+1;
		end
   end
   
endmodule
   
module test;

   reg CLK;
   wire [1:0]conectlight;
   
   values add(CLK,conectlight);
   
   always #1 CLK = ~CLK;
   
   initial begin
      $dumpvars(0,add);
      #0;
		CLK <= 0;
      #500000000;
      $finish;   
   end
endmodule