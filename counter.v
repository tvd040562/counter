module counter (
    input clk,
    input reset,
    input preload,
    input up_dn,
    input [3:0] delta,
    input [7:0] pl_data,
    output reg[7:0] qout,
    output [19:0] freq_out,
    input csb0,
    input web0,
    input [3:0] wmask0,
    input [7:0] addr0,
    input [31:0] din0
);

	//reg [19:0] sin_table[0:255];
	//`include "sin_table.vh"
	//assign freq_out = sin_table[qout];
    wire [31:0] temp_freq_out;
    reg [19:0] freq_out_reg;
    wire vccd1, vssd1;

    assign freq_out = freq_out_reg[19:0];

    always @(posedge clk)
    begin
	freq_out_reg = temp_freq_out[19:0];
    end

    sky130_sram_1kbyte_1rw1r_32x256_8 u_mem (
	    .clk0(clk),
	    .csb0(csb0),
	    .web0(web0),
	    .wmask0(wmask0),
	    .addr0(addr0),
	    .din0(din0),
	    .clk1(clk),
	    .csb1(1'b0),
	    .addr1(qout),
	    .dout1(temp_freq_out)
    );

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            qout = 8'h0;
        else if (preload)
            qout = pl_data;
        else if (up_dn)
            qout = qout + delta;
        else qout = qout - delta;
    end
endmodule
