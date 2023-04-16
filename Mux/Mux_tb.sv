module Mux_tb;
    // Declare the signals
    logic[3:0] in;
    logic[1:0] select;
    logic out;
    // Instantiate the unit under test (UUT)
    Mux dut(.in(in), .select(select), .out(out));
    // Define the test sequence
    initial begin
        for (int i = 4'b 0000; i <= 4'b 1111; i++) begin
            in = i;
            for (int j = 2'b 00; j <= 2'b 11; j++) begin
                select = j;
                #10;
                $display("in = %b, select = %b, out = %b", in, select, out);
                if (out != in[select]) begin
                    $display("ERROR: out != in[select]");
                end
            end
        end
        
    end
endmodule
