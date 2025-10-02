module PIPO(
    input [3:0]p_in,
    input clear, clk, load,
    output reg [3:0]p_out
    );

    always @(posedge clk)begin
        if (clear)begin
            p_out <= 4'b0;
        end else if (load)begin
            p_out <= p_in;
        end else begin
            p_out <= p_out;
        end
    end
endmodule