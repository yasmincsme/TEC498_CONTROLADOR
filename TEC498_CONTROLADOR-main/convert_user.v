//CONVERSÃO DE USUÁRIOS

module convert_user(CONV_U, CK_U);

	input [2:0]CK_U;
	output [1:0]CONV_U;
	wire not_CK0, not_CK1, not_CK2;
	wire T1, T2;

	not Inv0(not_CK0, CK_U[0]);
	not Inv1(not_CK1, CK_U[1]);
	not Inv2(not_CK2, CK_U[2]);

	//For CONV_U[0] output
	and And0(CONV_U[0], not_CK1, CK_U[0]);

	//For CONV_U[1] output
	and And1(T1, not_CK2, CK_U[1], CK_U[0]);
	and And2(T2, CK_U[2], not_CK1, CK_U[0]);
	or Or0(CONV_U[1], T1, T2);

endmodule
