// load and store register
// sequential NOT combinational
module register # (parameter N = 8)
   (input                clk,   // implied input wire
    input                load,
    input                clear,
    input        [N-1:0] in,
    output logic [N-1:0] out
    );
	 
  always_ff @ (posedge clk, posedge clear)    begin
// fill in guts
//  if(...) out <= ... ;          // use <= nonblocking assignment!
//  else if(...) out <= ... ;
//   clear   load    out
// 	   1       0      0	   (clear output)
//     1       1      0
//     0       0     hold  (no change in output)
//     0       1      in   (update output)
   if(clear == 1 && load == 0) out <= 0 ;      
    else (clear == 1 && load == 1) out <= 0 ;  
    else (clear == 0 && load == 0) out <= out; 
    else (clear == 0 && load == 1) out <= in; 



// Aside: What would be the impact of leaving posedge clear out of 
//  the sensitivity list? 
/*Ans: if leave ou the 'posedge clear' out, the 'clear' signal would not
have an immediate effect on the 'out' signal. The register will clear 
as soon as the 'clear' signal goes high regarless of the clk.*/
end	
		
endmodule

