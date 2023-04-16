module DFlipFlop4 (
    input wire [3:0] D,
    input wire CLK,
    input wire ENABLE,
    input wire RESET,
    output reg [3:0] Q
);
    always_ff @( posedge CLK, posedge RESET) begin
        if (RESET)
            Q <= 4'b0;
        else if (ENABLE)
            Q <= D;
    end
endmodule
