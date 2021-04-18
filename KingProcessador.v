module KingProcessador (input reset,input clock,
								output [6:0] display0, output [6:0] display1, 
								output [6:0] display2, output [6:0] display3, 
								output [6:0] display4, output [6:0] display5, 
								output [6:0] display6, output [6:0] display7,
								output [31:0] observacional
								);
								
//-------------------------------------------------------------------------------
wire sys_clock, trava, Desvio, RegWrite, True, IO, MemWrite, Load, Imm;
wire [15:0] end_prox;
wire [15:0] end_atual;
wire [15:0] end_desvio;
wire [15:0] const;
wire [31:0] instrucao, estendido, Lido1, Lido2, Lido3, Dado, Resultado, carregado;
wire [4:0] ALU_op;
reg [15:0] aux;
assign observacional = Dado;
//Modulo de controle lista: RegWrite, Imm, Desvio, trava, ALU_op, IO, MemWrite, Load
			
//-------------------------------------------------------------------------------	
	
	BancoDeRegistradoresDeDados BancoDeRegistradoresDeDados(.LerReg1(instrucao[20:16]), 
																			  .LerReg2(instrucao[15:11]), 
																			  .EscReg(instrucao[25:21]), 
																			  .Dado(Dado[31:0]), 
																			  .Lido1(Lido1[31:0]), 
																			  .Lido2(Lido2[31:0]),
																			  .Lido3(Lido3[31:0]), 
																			  .sys_clock(clock), 
																			  .RegWrite(RegWrite),
																			  .reset(reset));
	
	ExtensorDeImediato ExtensorDeImediato(.const(instrucao[15:0]), .estendido(estendido[31:0]));
	
	
	
	ProgramCounter ProgramCounter(.reset(reset), .sys_clock(clock),.end_prox(end_prox[15:0]), 
										  .end_atual(end_atual[15:0]), .trava(trava));
										  
										  
	
	memROM memROM(.end_atual(end_atual), .sys_clock(clock), .instrucao(instrucao[31:0]));
	
	memRAM memRAM(.data(Lido1[31:0]) , .const(const[15:0]), 
	.MemWrite(MemWrite), .clock(clock), .sys_clock(clock), .carregado(carregado[31:0]));
	
	
	
	Endereco Endereco(.sys_clock(clock), .Desvio(Desvio), 
	.end_prox(end_prox[15:0]), .end_atual(end_atual[15:0]), .end_desvio(instrucao[15:0]),
	.True(True));
	
	MUXWrite MUXWrite(.sys_clock(clock), .Load(Load), .carregado(carregado[31:0]), 
.Resultado(Resultado[31:0]), .Dado(Dado[31:0]));
	
	
	ULA ULA(.reset(reset), .ALU_op(ALU_op[4:0]), .Imm(Imm), .Lido1(Lido1[31:0]), .Lido2(Lido2[31:0]), .estendido(estendido[31:0]), .True(True), .Resultado(Resultado[31:0]));
	
	
	ManipulaClock ManipulaClock (.clock(clock), .reset(reset), .sys_clock(sys_clock));
	
	
	InOut InOut (.sys_clock(clock), .IO(IO), .reset(reset), .saida(Dado[31:0]),
				 .display0(display0[6:0]), .display1(display1[6:0]), .display2(display2[6:0]), 
				 .display3(display3[6:0]), .display4(display4[6:0]),
				 .display5(display5[6:0]), .display6(display6[6:0]), .display7(display7[6:0]));
				 
	UnidadeDeControle UnidadeDeControle (.instrucao(instrucao[31:26]), .RegWrite(RegWrite), 
.Imm(Imm), .Desvio(Desvio), .trava(trava), 
.ALU_op(ALU_op[4:0]), .IO(IO), .MemWrite(MemWrite), .Load(Load));
//-------------------------------------------------------------------------------


	
endmodule