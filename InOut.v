module InOut (input sys_clock, input [1:0] IO, input reset,
				  input [31:0] saida, output reg [6:0] display0,
				  output reg [6:0] display1, output reg [6:0] display2, 
				  output reg [6:0] display3, output reg [6:0] display4,
				  output reg [6:0] display5, output reg [6:0] display6,
				  output reg [6:0] display7, output reg [15:0] entrada);
				  
//apesar do processador ser elaborado para suportar dados de 32 bits,
//o kit FPGA trablhado apresenta uma limitação de 7 displays de 7 segmentos.
//Desta forma, só é possível representar nos displays os números
//de até 23bits, e alguns com 24 (até 9999999 em decimal para ser exato).
				  
	task SetDisplay;


		input [3:0] bin;
		output [6:0] display;
		case (bin)
			0: display = 7'b100_0000;
			1: display = 7'b111_1001;
			2: display = 7'b010_0100;
			3: display = 7'b011_0000;
			4: display = 7'b001_1001;
			5: display = 7'b001_0010;
			6: display = 7'b000_0010;
			7: display = 7'b111_1000;
			8: display = 7'b000_0000;
			9: display = 7'b001_0000;
		default: display = 7'b111_1111;
		endcase
		
	endtask

always @ (negedge sys_clock or posedge reset)
begin
	if (reset)
	begin
		display0 <= 7'b100_0000;
		display1 <= 7'b100_0000;
		display2 <= 7'b100_0000;
		display3 <= 7'b100_0000;
		display4 <= 7'b100_0000;
		display5 <= 7'b100_0000;
		display6 <= 7'b100_0000;
		display7 <= 7'b100_0000;
	end
	else if (IO==2)
	begin
		SetDisplay((saida[31:0]/10000000)%10, display7);
		SetDisplay((saida[31:0]/1000000)%10, display6);
		SetDisplay((saida[31:0]/100000)%10, display5);
		SetDisplay((saida[31:0]/10000)%10, display4);
		SetDisplay((saida[31:0]/1000)%10, display3);
		SetDisplay((saida[31:0]/100)%10, display2);
		SetDisplay((saida[31:0]/10)%10, display1);
		SetDisplay((saida[31:0])%10, display0);
	end
	else if (IO==1)
	begin
		
	end
end
endmodule
