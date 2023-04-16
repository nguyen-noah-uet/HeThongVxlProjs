module DLatch4_tb;
    logic [3:0] Data;
    logic Enable;
    logic Reset;
    logic Clock;
    logic [3:0] Q;
    // Instantiate the DUT
    DLatch4 dut (
        .Data(Data),
        .Enable(Enable),
        .Reset(Reset),
        .Clock(Clock),
        .Q(Q)
    );
    initial begin
        // Initialize Inputs
        Data = 4'b 0000;
        Enable = 1'b 0;
        Reset = 1'b 0;
        Clock = 1'b 0;

        for (int i = 4'b 0000; i <= 4'b 1111; i++) begin
            Data = i;
            Enable = 1'b 1;
            Reset = 1'b 0;
            Clock = 1'b 1;
            #5;
            Clock = 1'b 0;
            if (Enable == 1'b 1 && Reset == 1'b 0) begin
                $display("Data = %b, Q = %b", Data, Q);
                if (Data != Q) begin
                    $display("Error: Data != Q");
                end
            end
        end
        // Test Enable = 0
        for (int i = 4'b 0000; i <= 4'b 1111; i++) begin
            Data = i;
            Enable = 1'b 0;
            Reset = 1'b x;
            Clock = 1'b 1;
            #5;
            Clock = 1'b 0;
            if (Q != 4'b 0000) begin
                $display("Error: Q != 4'b 0000");
            end
        end
        // Test Reset
        for (int i = 4'b 0000; i <= 4'b 1111; i++) begin
            Data = i;
            Enable = 1'b 1;
            Reset = 1'b 1;
            Clock = 1'b 1;
            #5;
            Clock = 1'b 0;
            if (Q != 4'b 0000) begin
                $display("Error: Q != 4'b 0000");
            end
        end
    end
endmodule
