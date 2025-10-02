module SISO(
    input clk, s_in, clear,
    output reg s_out
    );

    reg [3:0]internal_data;

    always @(posedge clk)begin
        if (clear)begin
            internal_data <= 4'b0;
            s_out <= 1'b0;
        end else begin
            internal_data <= {s_in, internal_data[3:1]};
            s_out <= internal_data[0];
        end
    end
endmodule