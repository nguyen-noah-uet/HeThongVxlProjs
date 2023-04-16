module Decoder_tb;
    logic [1:0] in;
    logic [3:0] out;
    Decoder dut(.in(in), .out(out));
    initial begin 
        for (int i = 2'b 00; i <= 2'b 11; i++) begin
            in = i;
            #10;
            $display("in = %b, out = %b", in, out);
            if (out != 1 << in) begin
                $display("ERROR: out = %b, expected = %b", out, 1 << in);
            end
        end
    end
endmodule
