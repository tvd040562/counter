`timescale 1ns/1ps
`define PERIOD 10
module tb;
    reg clk, reset, preload, up_dn;
    reg [3:0] delta;
    reg [7:0] pl_data;
    wire [7:0] qout;
    wire [19:0] freq_out;
    reg csb0, web0;
    reg [3:0] wmask0;
    reg [7:0] addr0;
    reg [31:0] din0;
    reg [31:0] mem[0:255];

    counter dut (
        .clk(clk),
        .reset(reset),
        .preload(preload),
        .up_dn(up_dn),
        .delta(delta),
        .pl_data(pl_data),
        .qout(qout),
        .freq_out(freq_out),
	.csb0(csb0),
	.web0(web0),
	.wmask0(wmask0),
	.addr0(addr0),
	.din0(din0)
    );

    task waitforclk (input integer n);
    begin
        repeat (n)
         @ (posedge clk);
    end
    endtask

    task init_mem ();
	integer i;
    begin
	for (i = 0; i < 256; i = i+1) begin
	    addr0 = i;
	    din0 = mem[i];
	    waitforclk(1);
	end
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

    //initial $readmemh("mem.hex", dut.sin_table);
    initial $readmemh("mem.hex", mem);

    initial 
    begin
        reset = 1;
        preload = 0;
        up_dn = 1;
        delta = 1;
        pl_data = 0;
        waitforclk(3);
        reset = 0;
	csb0 = 0;
	web0 = 0;
	wmask0 = 4'hF;
	init_mem();
        waitforclk(1000);
        delta = 2;
        waitforclk(1000);
        delta = 3;
        waitforclk(1000);
        delta = 4;
        waitforclk(1000);
        delta = 5;
        waitforclk(1000);
        $finish();
    end
endmodule
