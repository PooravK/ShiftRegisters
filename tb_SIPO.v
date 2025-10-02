`timescale 1ns/1ps

module tb_SIPO();
    reg s_in;
    reg clk;
    reg clear;
    wire [3:0]p_out;

    SIPO uut (
        .s_in(s_in),
        .p_out(p_out),
        .clear(clear),
        .clk(clk)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("SIPOwaveform.vcd"); //Example input: 1011
        $dumpvars(0, tb_SIPO);

        clear = 1; #10;

        clear = 0;
        s_in = 1; #10;

        s_in = 1; #10;

        s_in = 0; #10;

        s_in = 1; #10;

        clear = 1; #10;
        $finish;
    end
endmodule