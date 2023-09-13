//BLOCO VERIFICA PILOTO AUTOMÁTICO

module verify_auto(OUT, V);
	
	input [1:0]V;
	output [2:0]OUT;
	wire not_V0, not_V1;

	not Inv0(not_V0, V[0]);
	not Inv1(not_V1, V[1]);

	//For RED output
	and And0(OUT[0], V[1], V[0]);

	//For GREEN output
	or Or0(OUT[1], not_V1, not_V0);

	//For BLUE output
	and And1(OUT[2], 1'b0, 1'b0);

endmodule
