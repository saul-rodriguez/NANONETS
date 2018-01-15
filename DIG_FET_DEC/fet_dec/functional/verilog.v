// Created by ihdl
module fet_dec(in,out);

input [4:0]in;
output [31:0]out;

reg [31:0]out;

always @(in)
begin	
		out = (1 << in);
end
endmodule
