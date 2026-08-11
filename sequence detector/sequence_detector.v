module sequence_detector (
    input  wire clk,
    input  wire reset,
    input  wire data_in,
    output reg  detected
);

    // State encoding
    parameter S0   = 3'b000;
    parameter S1   = 3'b001;
    parameter S10  = 3'b010;
    parameter S101 = 3'b011;

    reg [2:0] state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        case (state)

            S0: begin
                if (data_in)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (data_in)
                    next_state = S1;
                else
                    next_state = S10;
            end

            S10: begin
                if (data_in)
                    next_state = S101;
                else
                    next_state = S0;
            end

            S101: begin
                if (data_in) begin
                    next_state = S1;
                end
                else begin
                    next_state = S0;
                end
            end

            default:
                next_state = S0;

        endcase
    end

    // Output logic
    always @(*) begin
        if ((state == S101) && (data_in == 1'b1))
            detected = 1'b1;
        else
            detected = 1'b0;
    end

endmodule