module Mux (
    input wire[3:0] in, 
    input wire[1:0] select,
    output reg[0:0] out
);
    always @(in or select) begin
        if(select == 2'b 00) begin
            out = in[0];
        end 
		  else if (select == 2'b 01) begin
            out = in[1];
        end
		  else if (select == 2'b 10) begin
            out = in[2];
        end
		  else if (select == 2'b 11) begin
            out = in[3];
        end
    end
endmodule
