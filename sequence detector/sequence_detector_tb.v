`timescale 1ns/1ps

module sequence_detector_tb;

    reg clk;
    reg reset;
    reg data_in;
    wire detected;

    // Instantiate the sequence detector
    sequence_detector uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .detected(detected)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Task to apply input
    task send_bit;
        input bit_value;
        begin
            data_in = bit_value;
            #10;
        end
    endtask

    initial begin

        // Initialize signals
        clk = 0;
        reset = 1;
        data_in = 0;

        // Reset
        #10;
        reset = 0;

        // Input sequence: 101101011
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);  // 1011 detected

        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);  // 1011 detected

        #10;

        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0t | Reset = %b | Data = %b | Detected = %b",
                 $time, reset, data_in, detected);
    end

endmodule