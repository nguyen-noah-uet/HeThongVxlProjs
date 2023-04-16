module DFlipFlop4_tb;
    // Declare inputs and outputs
    logic [3:0] D;
    logic [3:0] Q;
    logic [0:0] CLK;
    logic [0:0] ENABLE;
    logic [0:0] RESET;
    // Instantiate the Unit Under Test (UUT)
    DFlipFlop4 uut (
        .D(D),
        .CLK(CLK),
        .ENABLE(ENABLE),
        .RESET(RESET),
        .Q(Q)
    );
    initial begin
        D = 4'b0000;
        CLK = 1'b0;
        ENABLE = 1'b1;
        RESET = 1'b0;
        // Test ENABLE = 1
        for (int i = 4'b0000; i <= 4'b1111; i++) begin
            D = i;
            ENABLE = 1'b1;
            RESET = 1'b0;
            CLK = 1'b0;
            #5; 
            CLK = 1'b1;
				#1;
				CLK = 1'b0;
            $display("D = %b, Q = %b", D, Q);
            if (Q != D) begin
                $display("ERROR: Q != D");
            end
        end
        // Test RESET = 1
        for (int i = 4'b0000; i <= 4'b1111; i++) begin
            D = i;
            ENABLE = 1'b0;
            RESET = 1'b1;
            CLK = 1'b1;
            #5; 
            CLK = 1'b0;
            $display("D = %b, Q = %b", D, Q);
            if (Q != 4'b0000) begin
                $display("ERROR: Q != 4'b0000");
            end
        end
    end    

endmodule