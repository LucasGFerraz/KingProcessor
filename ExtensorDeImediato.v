module ExtensorDeImediato(input [15:0] const, output reg [31:0] estendido);

always @(*)
begin
	estendido = {{16{1'b0}}, const};
end
endmodule 