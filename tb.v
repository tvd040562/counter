`timescale 1ns/1ps
`define PERIOD 10
module tb;
    reg clk, reset, preload, up_dn;
    reg [3:0] delta;
    reg [7:0] pl_data;
    wire [7:0] qout;
    wire [39:0] freq_out;

    counter dut (
        .clk(clk),
        .reset(reset),
        .preload(preload),
        .up_dn(up_dn),
        .delta(delta),
        .pl_data(pl_data),
        .qout(qout),
        .freq_out(freq_out)
    );

    task waitforclk (input integer n);
    begin
        repeat (n)
         @ (posedge clk);
    end
    endtask

    initial
    begin
        clk = 0;
        forever begin
            #(`PERIOD/2) clk = ~clk;
        end
    end

    initial
    begin
        $dumpfile("tb.vcd");
        $dumpvars();
    end

    initial 
    begin
        reset = 1;
        preload = 0;
        up_dn = 1;
        delta = 6;
        pl_data = 0;
        waitforclk(3);
        reset = 0;
        waitforclk(3000);
        $finish();
    end
endmodule
