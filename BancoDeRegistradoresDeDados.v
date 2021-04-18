module BancoDeRegistradoresDeDados(LerReg1, LerReg2,
											  EscReg, Dado, Lido1, 
											  Lido2, Lido3, reset, sys_clock, RegWrite);
											  
											  
input sys_clock, RegWrite;//clock e sinal de escrita da Unidade de Controle
input reset;
input [4:0] LerReg1; //registrador que vai ser lido
input [4:0] LerReg2; //registrador que vai ser lido
input [4:0] EscReg; //registrador que receberá o resultado
input [31:0] Dado; //resultado que vai ser escrito no EscReg
output [31:0] Lido1;//conteúdo do LerReg1
output [31:0] Lido2;//conteúdo do LerReg2
output [31:0] Lido3;//conteúdo do EscReg


reg[31:0] RegDado[31:0];

assign Lido1 = RegDado[LerReg1];
assign Lido2 = RegDado[LerReg2];
assign Lido3 = RegDado[EscReg];

always @(negedge sys_clock) 
begin
	if (reset)
	begin
		RegDado[0] <= 32'b00000000_00000000_00000000_00000000;
	end
	else if (RegWrite && (EscReg!=0))//O registrador 0 é reservado para o valor 0
	begin
		RegDado[EscReg]<=Dado;
	end
end

endmodule