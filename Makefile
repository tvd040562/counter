a.out: *.v
	iverilog counter.v tb.v RAM/sky130_sram_1kbyte_1rw1r_32x256_8.v

tb.vcd: a.out
	./a.out

debug: tb.vcd
	gtkwave tb.vcd

clean: 
	rm -f *.out *.vcd
