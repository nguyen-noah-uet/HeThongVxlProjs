module Inverter(input logic[3:0] a, output reg[3:0] y);
// tai sao phai de output reg y ma khong duoc output logic y
	assign y = ~a;
endmodule
