`timescale 1ns/1ps

module tb_PIPO();
    reg clk;
    reg clear;
    reg load;
    reg [3:0]p_in;
    wire [3:0]p_out;

    PIPO uut (
        .clk(clk),
        .clear(clear),
        .load(load),
        .p_in(p_in),
        .p_out(p_out)
    );

    initial clk = 1'b0;

    always #5 clk = ~clk;

    initial begin
        $dumpfile("PIPOWaveform.vcd");
        $dumpvars(0, tb_PIPO);

        clear = 1;
        load = 0; #10;

        clear = 0;
        load = 1;
        p_in = 4'b1011;
        #10;

        load = 0;
        #10;

        clear = 1;
        #10
        $finish;
    end
endmodule