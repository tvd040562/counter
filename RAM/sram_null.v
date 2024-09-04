// OpenRAM SRAM model
// Words: 256
// Word size: 32
// Write size: 8

module sky130_sram_1kbyte_1rw1r_32x256_8(
`ifdef USE_POWER_PINS
    vccd1,
    vssd1,
`endif
// Port 0: RW
    clk0,csb0,web0,wmask0,addr0,din0,dout0,
// Port 1: R
    clk1,csb1,addr1,dout1
  );

  parameter NUM_WMASKS = 4 ;
  parameter DATA_WIDTH = 32 ;
  parameter ADDR_WIDTH = 8 ;
  //parameter RAM_DEPTH = 1 << ADDR_WIDTH;
  // FIXME: This delay is arbitrary.
  parameter DELAY = 3 ;
  parameter VERBOSE = 1 ; //Set to 0 to only display warnings
  parameter T_HOLD = 1 ; //Delay to hold dout value after posedge. Value is arbitrary

`ifdef USE_POWER_PINS
    inout vccd1;
    inout vssd1;
`endif
  input  clk0; // clock
  input   csb0; // active low chip select
  input  web0; // active low write control
  input [7:0]  addr0;
  input [3:0]   wmask0; // write mask
  input [31:0]  din0;
  output [31:0] dout0;
  input  clk1; // clock
  input   csb1; // active low chip select
  input [7:0]  addr1;
  output [31:0] dout1;

endmodule
