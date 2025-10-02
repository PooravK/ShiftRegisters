`timescale 1ns/1ps

module tb_SISO();
    reg clk;
    reg clear;
    reg s_in;
    wire s_out;

    SISO uut (
        .s_in(s_in),
        .s_out(s_out),
        .clear(clear),
        .clk(clk)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("SISOwaveform.vcd"); //Example input: 1011
        $dumpvars(0, tb_SISO);

        clear = 1; #10;
        $display("CLEAR = %b | OUTPUT = %b", clear, s_out);

        $display("CLEAR = %b | INPUT = %b | OUTPUT = %b", clear, s_in, s_out);
        clear = 0; #10;
        s_in = 1; #10;

        $display("CLEAR = %b | INPUT = %b | OUTPUT = %b", clear, s_in, s_out);
        s_in = 1; #10;

        $display("CLEAR = %b | INPUT = %b | OUTPUT = %b", clear, s_in, s_out);
        s_in = 0; #10;

        $display("CLEAR = %b | INPUT = %b | OUTPUT = %b", clear, s_in, s_out);
        s_in = 1; #10;

        #10; $display("CLEAR = %b | INPUT = %b | OUTPUT = %b", clear, s_in, s_out);

        #10; $display("CLEAR = %b | INPUT = %b | OUTPUT = %b", clear, s_in, s_out);

        #10; $display("CLEAR = %b | INPUT = %b | OUTPUT = %b", clear, s_in, s_out);

        #10; $display("CLEAR = %b | INPUT = %b | OUTPUT = %b", clear, s_in, s_out);

        clear = 1; #10;
        $display("CLEAR = %b | OUTPUT = %b", clear, s_out);
        $finish;
    end
endmodule