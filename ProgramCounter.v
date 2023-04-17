module ProgramCounter(input reset, input sys_clock, input [15:0] end_prox, output reg [15:0] end_atual, input trava);

always @(posedge sys_clock or posedge reset) 
begin
	if(reset)
	begin
		end_atual=0;
	end
	else if (!trava)
	begin
		end_atual=end_prox;
	end
end	

endmodule