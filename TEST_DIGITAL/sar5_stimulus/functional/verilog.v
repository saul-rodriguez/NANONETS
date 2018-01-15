`timescale 1ns / 1ps

// Created by ihdl
module sar5_stimulus(clk,comp,resetn);
output clk;
output comp;
output resetn;

//nets to drive
reg clk;
reg comp;
reg resetn;

//output wires
//wire [4:0] out;

initial begin
    //$dumpfile("sar5.vcd");
    //$dumpvars(0,my_sar5);
    
    clk = 0;
    resetn = 0;
    comp = 0;
    #2 resetn = 1;
    #30 comp = 1;
    #80 comp = 0;
    #120 comp = 1;
    #400 $finish;
        
end


always begin
    #10 clk = ~ clk;
end

//sar5 my_sar5(clk,comp,resetn,out);

endmodule
