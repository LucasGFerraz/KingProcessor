// Quartus Prime Verilog Template
// Simple Dual Port RAM with separate read/write addresses and
// single read/write clock

module memRAM
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=16)
(	input [31:0] data,
	input [15:0] const,
	input MemWrite, clock, sys_clock,
	output reg [31:0] carregado,
	input [4:0] instrucao);
	
	integer addr;

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	always @ (posedge sys_clock)
	begin
		addr = instrucao + const;
		// Write
		if (MemWrite)
			ram[addr] = data;
		
		
	end
	always @ (posedge clock)
	begin
		addr = instrucao + const;
		// Read 
		carregado = ram[addr];
	end

endmodule
