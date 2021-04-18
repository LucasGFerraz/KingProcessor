module ManipulaClock (input clock, input reset, output reg sys_clock);
integer contador = 0;
always @(posedge clock or posedge reset)
begin
	if (reset)
	begin
		contador <= 0;
		sys_clock = 0;
	end
	else
	begin
		
		if (contador<5)
		begin
			contador = contador + 1;
		end
		else
		begin
			sys_clock = ~sys_clock;
			contador = 1;
		end
	end
end
endmodule
