a.out: *.v
	iverilog -Wtimescale RAM/sky130_sram_2kbyte_1rw1r_32x512_8.v counter.v tb.v

tb.vcd: a.out
	./a.out

debug: tb.vcd
	gtkwave tb.vcd

clean: 
	rm -f *.out *.vcd
