`timescale 1ns/1ps

module tb_PISO();
    reg clk;
    reg en;
    reg clear;
    reg [3:0]p_in;
    wire s_out;

    PISO uut (
        .clear(clear),
        .clk(clk),
        .en(en),
        .p_in(p_in),
        .s_out(s_out)
    );

    initial clk = 1'b0;

    always #5 clk = ~clk;

    initial begin
        $dumpfile("PISOwaveform.vcd");
        $dumpvars(0, tb_PISO);

        clear = 1;
        en = 1;
        #10;

        clear = 0;
        p_in = 4'b1011;
        #10;

        en = 0;
        #10;

        #10;

        #10;

        #10;

        #10;
        
        clear = 1;
        #10;
        $finish;
    end
endmodule