// Quartus Prime Verilog Template
// Single Port ROM

module memROM
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=16)
(
	input [(ADDR_WIDTH-1):0] end_atual,
	input sys_clock, 
	output reg [(DATA_WIDTH-1):0] instrucao
);

	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];

	// Initialize the ROM with $readmemb.  Put the memory contents
	// in the file single_port_rom_init.txt.  Without this file,
	// this design will not compile.

	// See Verilog LRM 1364-2001 Section 17.2.8 for details on the
	// format of this file, or see the "Using $readmemb and $readmemh"
	// template later in this section.

	initial
	begin
		$readmemb("single_port_rom_init.txt", rom);
	end

	always @ (posedge sys_clock)
	begin
		instrucao <= rom[end_atual];
	end

endmodule
