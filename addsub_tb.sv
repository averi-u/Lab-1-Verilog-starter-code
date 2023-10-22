module addsub_tb;reg        clk;    // Define clk as a reg, not a bitreg        reset;reg  [7:0] dataa;reg  [7:0] datab;reg        add_sub;wire [7:0] result;// Instantiate the addsub moduleaddsub #(8) addsub1 (    .dataa(dataa),    .datab(datab),    .add_sub(add_sub),    .result(result));// Clock generationalways begin    #5 clk = ~clk;end// Test stimulusinitial begin    clk = 0;    reset = 1;    dataa = 8'b00000000;    datab = 8'b00000000;    add_sub = 1; // Perform addition    // Reset and start the simulation    #10 reset = 0;    #20 dataa = 8'b00110011; // Example input values    #20 datab = 8'b00110011; // Example input values    #20 add_sub = 0; // Perform subtraction    #100 $stop;endendmodule