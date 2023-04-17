// Quartus Prime Verilog Template
// Simple Dual Port RAM with separate read/write addresses and
// single read/write clock

module memRAM
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=16)
(	input [31:0] data,
	input [15:0] const,
	input MemWrite, clock, sys_clock,
	output reg [31:0] carregado,
	input [4:0] instrucao,
	input Load,
	input Imm,
	input [31:0] estendido);
	
	integer addr;

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	always @ (posedge sys_clock)
	begin
		addr = instrucao + const;
		// Write
		if (MemWrite)
		begin
			ram[addr] = data;
		end
		
		
	end
	always @ (posedge clock)
	begin
		addr = instrucao + const;
		// Read 
		if(Load)
		begin
			if (Imm)
			begin
				carregado = estendido;
			end
			else
			begin
				carregado = ram[addr];
			end
		end
	end

endmodule
