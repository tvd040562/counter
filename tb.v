`timescale 1ns/1ps
`define PERIOD 10
module tb;
    reg clk, reset, preload;
    reg [7:0] pl_data;
    wire [7:0] qout;

    counter dut (
        .clk(clk),
        .reset(reset),
        .preload(preload),
        .pl_data(pl_data),
        .qout(qout)
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
        pl_data = 0;
        waitforclk(3);
        reset = 0;
        waitforclk(30);
        pl_data = 50; preload = 1;
        waitforclk(1);
        preload = 0;
        waitforclk(30);
        $finish();
    end
endmodule
