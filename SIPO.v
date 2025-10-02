module SIPO(
    input clk, clear, s_in,
    output [3:0]p_out
    );

    reg [3:0]internal_data;

    always @(posedge clk)begin
        if (clear)begin
            internal_data <= 4'b0;
        end else begin
            internal_data = {s_in, internal_data[3:1]};
        end
    end

    assign p_out = internal_data;
endmodule