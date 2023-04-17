module BancoDeRegistradoresDeDados(LerReg1, LerReg2,
											  EscReg, Dado, Lido1, 
											  Lido2, Lido3, reset, sys_clock,
											  RegWrite, Desvio, end_atual, Imm,
											  estendido, Move, Load, jl);
											  
											  
input sys_clock, RegWrite;//clock e sinal de escrita da Unidade de Controle
input reset, Move;
input [4:0] LerReg1; //registrador que vai ser lido
input [4:0] LerReg2; //registrador que vai ser lido
input [4:0] EscReg; //registrador que receberá o resultado
input [31:0] Dado; //resultado que vai ser escrito no EscReg
input [15:0] end_atual;
input [31:0] estendido;
input Desvio;
input Imm;
input Load;
output [31:0] Lido1;//conteúdo do LerReg1
output [31:0] Lido2;//conteúdo do LerReg2
output [31:0] Lido3;//conteúdo do EscReg
output reg [31:0] jl;



reg[31:0] RegDado[31:0];
reg[15:0] StackAddr[31:0];
reg[15:0] label = 0;

assign Lido1 = RegDado[LerReg1];
assign Lido2 = RegDado[LerReg2];
assign Lido3 = RegDado[EscReg];

always @(negedge sys_clock) 
begin
	if (reset)
	begin
		RegDado[0] <= 32'b00000000_00000000_00000000_00000000;
		label = 0;
	end
	else if (RegWrite && (EscReg!=0))//O registrador 0 é reservado para o valor 0
	begin
		if (Imm)
		begin
			RegDado[EscReg]<=estendido;
		end
		else
		begin
			RegDado[EscReg]<=Dado;
		end
	end
	else if(Move)
	begin
		RegDado[EscReg]<=RegDado[LerReg1];
		RegDado[LerReg1]<=0;
	end
	else if (RegWrite && Desvio)
	begin
		StackAddr[label] <= end_atual+1;
		label = label + 1;
	end
	else if (Load && Desvio)
	begin
		jl = StackAddr[label-1];
		label = label - 1;
	end
end

endmodule