module DLatch4(
    input wire [3:0] Data,
    input wire Enable,
    input wire Reset,
    input wire Clock,
    output reg [3:0] Q
);
    always_latch begin 
        if (Enable) begin
            if (Reset) begin
                Q <= 4'b 0000;
            end 
            else if (Clock) begin
                Q <= Data;
            end
        end
        else begin
            Q <= 4'b 0000;
        end
    end
endmodule