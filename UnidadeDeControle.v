module UnidadeDeControle (input [5:0] instrucao, output reg RegWrite, 
output reg Imm, output reg Desvio, output reg trava, 
output reg [4:0]ALU_op, output reg IO, output reg MemWrite, output reg Load);


always @(instrucao)
begin
	case (instrucao)
		0: 
		begin
			RegWrite = 1;
			Imm = 0;
			Desvio = 0;
			trava = 0;
			ALU_op = 0;
			IO = 1;
			MemWrite = 0;
			Load = 0;
		end
		
		1:
		begin
			RegWrite = 1;
			Imm = 1;
			Desvio = 0;
			trava = 0;
			ALU_op = 0;
			IO = 1;
			MemWrite = 0;
			Load = 0;
		end
		
		2:
		begin
			RegWrite = 1;
			Imm = 0;
			Desvio = 0;
			trava = 0;
			ALU_op = 1;
			IO = 1;
			MemWrite = 0;
			Load = 0;
		end
		
		3:
		begin
			RegWrite = 1;
			Imm = 1;
			Desvio = 0;
			trava = 0;
			ALU_op = 1;
			IO = 1;
			MemWrite = 0;
			Load = 0;
		end
		
		4:
		begin
			RegWrite = 1;
			Imm = 0;
			Desvio = 0;
			trava = 0;
			ALU_op = 2;
			IO = 1;
			MemWrite = 0;
			Load = 0;
		end
		
		5:
		begin
			RegWrite = 1;
			Imm = 0;
			Desvio = 0;
			trava = 0;
			ALU_op = 3;
			IO = 1;
			MemWrite = 0;
			Load = 0;
		end
		
		6:
		begin
			RegWrite = 1;
			Imm = 0;
			Desvio = 0;
			trava = 0;
			ALU_op = 4;
			IO = 1;
			MemWrite = 0;
			Load = 0;
		end
		
		7:
		begin
			RegWrite = 1;
			Imm = 0;
			Desvio = 0;
			trava = 0;
			ALU_op = 5;
			IO = 1;
			MemWrite = 0;
			Load = 0;
		end
		
		8:
		begin
			RegWrite = 1;
			Imm = 0;
			Desvio = 0;
			trava = 0;
			ALU_op = 6;
			IO = 1;
			MemWrite = 0;
			Load = 0;
		end
		
		9:
		begin
			RegWrite = 1;
			Imm = 0;
			Desvio = 0;
			trava = 0;
			ALU_op = 8;
			IO = 1;
			MemWrite = 0;
			Load = 0;
		end
		
		10:
		begin
			RegWrite = 1;
			Imm = 1;
			Desvio = 0;
			trava = 0;
			ALU_op = 8;
			IO = 1;
			MemWrite = 0;
			Load = 0;
		end
		
		11:
		begin
			RegWrite = 1;
			Imm = 0;
			Desvio = 0;
			trava = 0;
			ALU_op = 0;
			IO = 1;
			MemWrite = 0;
			Load = 1;
		end
		
		12:
		begin
			RegWrite = 0;
			Imm = 0;
			Desvio = 0;
			trava = 0;
			ALU_op = 0;
			IO = 1;
			MemWrite = 1;
			Load = 0;
		end
		
		13:
		begin
			RegWrite = 0;
			Imm = 0;
			Desvio = 1;
			trava = 0;
			ALU_op = 7;
			IO = 0;
			MemWrite = 0;
			Load = 0;
		end
		
		14:
		begin
			RegWrite = 0;
			Imm = 0;
			Desvio = 1;
			trava = 0;
			ALU_op = 9;
			IO = 0;
			MemWrite = 0;
			Load = 0;
		end
		
		15:
		begin
			RegWrite = 0;
			Imm = 0;
			Desvio = 1;
			trava = 0;
			ALU_op = 10;
			IO = 1;
			MemWrite = 0;
			Load = 0;
		end
	endcase
end
endmodule