module Endereco (input sys_clock, input reset, input Desvio, input [15:0] end_atual, output reg [15:0] end_prox, input [15:0] end_desvio, input True);

always @(posedge sys_clock or posedge reset)
begin
	if (reset)
	begin
		end_prox = 0;
	end
	else begin
		if (Desvio && True)
		begin
			end_prox = end_desvio;
		end
		else
		begin
			end_prox = end_atual+1;
		end
		
	end
end

endmodule