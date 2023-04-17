module Endereco (input sys_clock, input reset, input Desvio, input [15:0] end_atual, output reg [15:0] end_prox, input [15:0] end_desvio, input True,
input [31:0] jl, input Imm);

always @(negedge sys_clock or posedge reset)
begin
	if (reset)
	begin
		end_prox = 0;
	end
	else begin
		end_prox = end_atual+1;
	end
end

endmodule