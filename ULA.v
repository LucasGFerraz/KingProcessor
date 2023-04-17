module ULA(input reset, input [4:0] ALU_op, input Imm, input [31:0] Lido1, input [31:0] Lido2, input [31:0] estendido, output reg True, output reg [31:0] Resultado);



always @(Lido1 or Lido2 or estendido or ALU_op or reset)
begin
	if (reset)
	begin
	
		Resultado = 0;
		True = 0;
	
	end
	else
	begin
	
		True = 0;
	
		case(ALU_op)
	
			0: //ADD
			begin
				if (Imm)
				begin
					Resultado = Lido1 + estendido;
				end
				else Resultado = Lido1 + Lido2;
			end
	
			1: //SUB
			begin
				if (Imm)
				begin
					Resultado = Lido1 - estendido;
				end
				else Resultado = Lido1 - Lido2;
			end
	
			2: //MULT
			begin
				Resultado = Lido1 * Lido2;
			end
	
			3: //DIV
			begin
				Resultado = Lido1 / Lido2;
			end
	
	
			4: //AND
			begin
				if (Imm)
				begin
					Resultado = Lido1 & estendido;
				end
				else Resultado = Lido1 & Lido2;
			end
	
			5: //OR
			begin
				if (Imm)
				begin
					Resultado = Lido1 | estendido;
				end
				else Resultado = Lido1 | Lido2;
			end
	
	
			6: //NOT
			begin
				Resultado = ~Lido1;
			end
	
	
			7: //Equal Than
			begin
				if (Lido1 == Lido2) begin
					Resultado = 1;
					True = 1;
				end
	
				else begin
					Resultado = 0;
					True = 0;
				end
			end
	
			8: //Less Than
			begin
				if (Imm)
				begin
					if(Lido1 < estendido) 
					begin
						Resultado = 1;
						True = 1;
					end
					else 
					begin
						Resultado = 0;
						True = 0;
					end
				end
				else if (Lido1 < Lido2) begin
					Resultado = 1;
					True = 1;
				end
	
				else begin
					Resultado = 0;
					True = 0;
				end
			end
			
			9: //Not Equal Than
			begin
				if (Lido1 != Lido2) begin
					Resultado = 1;
					True = 1;
				end
	
				else begin
					Resultado = 0;
					True = 0;
				end
			end
			
			10:
			begin
				True = 1;
			end
			
			11:
			begin
				Resultado = Lido1 << Lido2;
			end
			
			12:
			begin
				Resultado = Lido1 >> Lido2;
			end
			
			13:
			begin
			end
	
		endcase
	end
end

endmodule