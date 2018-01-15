// Created by ihdl
module sar5(
clk,
comp,
resetn,
out);

input clk;
input comp;
input resetn;
output [4:0] out;

reg [2:0] counter; 
reg [4:0] dac_test;
reg [4:0] dac_out;

wire ready;

always @(posedge clk or negedge resetn) 
begin
	if (!resetn) begin
		dac_out <= 0;
		counter <= 5;		
	end else begin
		if (counter == 0) begin
			dac_out <= 0;
			counter <= 5;			
		end else begin 
			counter <= counter - 1;
			if (comp) begin
				dac_out[counter -1] <= 1;
			end else begin
				dac_out[counter -1] <= 0;			
			end
		end
	end
end

//assign ready = ~|counter;
assign ready = (counter == 3'b101);

//dac_test 
always @(counter)
begin
	case(counter)
		3'b101:  dac_test = 5'b10000;
		3'b100:  dac_test = 5'b01000;
		3'b011:  dac_test = 5'b00100;
		3'b010:  dac_test = 5'b00010;
		3'b001:  dac_test = 5'b00001;	
		default: dac_test = 5'b00000;	
	endcase
end

assign out = dac_test | dac_out;



endmodule
