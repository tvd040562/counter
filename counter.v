module counter (
    input clk,
    input reset,
    input preload,
    input up_dn,
    input [3:0] delta,
    input [8:0] pl_data,
    output reg[8:0] qout,
    output [31:0] sine_out,
    output [31:0] cosine_out,
    input csb1,
    input csb0,
    input web0,
    input [3:0] wmask0,
    input [8:0] addr0,
    input [31:0] din00,
    input [31:0] din01
);

	//reg [31:0] sin_table[0:255];
	//`include "sin_table.vh"
	//assign sine_out = sin_table[qout];
    wire [31:0] temp_sine_out, temp_cosine_out;
    reg [31:0] sine_out_reg, cosine_out_reg;

    assign sine_out = sine_out_reg[31:0];
    assign cosine_out = cosine_out_reg[31:0];

    always @(posedge clk)
    begin
	sine_out_reg = temp_sine_out[31:0];
	cosine_out_reg = temp_cosine_out[31:0];
    end

    //sky130_sram_1kbyte_1rw1r_32x256_8 u_mem0 (
    sky130_sram_2kbyte_1rw1r_32x512_8 u_mem0 (
	    .clk0(clk),
	    .csb0(csb0),
	    .web0(web0),
	    .wmask0(wmask0),
	    .addr0(addr0),
	    .din0(din00),
	    .clk1(clk),
	    .csb1(csb1),
	    .addr1(qout),
	    .dout1(temp_sine_out)
    );

    //sky130_sram_1kbyte_1rw1r_32x256_8 u_mem1 (
    sky130_sram_2kbyte_1rw1r_32x512_8 u_mem1 (
	    .clk0(clk),
	    .csb0(csb0),
	    .web0(web0),
	    .wmask0(wmask0),
	    .addr0(addr0),
	    .din0(din01),
	    .clk1(clk),
	    .csb1(csb1),
	    .addr1(qout),
	    .dout1(temp_cosine_out)
    );

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            qout = 9'h0;
        else if (preload)
            qout = pl_data;
        else if (up_dn)
            qout = qout + delta;
        else qout = qout - delta;
    end
endmodule
