module PISO(
    input clk, clear,
    input [3:0]p_in,
    input en,
    output reg s_out
    );

    reg [3:0]internal_data;

    always @(posedge clk)begin
        if (clear)begin
            internal_data <= 4'b0;
        end else if (en)begin
            internal_data <= p_in;
        end else begin
            internal_data <= {1'b0, internal_data[3:1]};
        end

        s_out <= internal_data[0];
    end
endmodule