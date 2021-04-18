module MUXWrite (input sys_clock, input Load, input [31:0] carregado, 
input [31:0] Resultado, output reg [31:0] Dado);

always @(posedge sys_clock)
begin
	if (Load)
		Dado = carregado;
	else 
		Dado = Resultado;
end

endmodule
		