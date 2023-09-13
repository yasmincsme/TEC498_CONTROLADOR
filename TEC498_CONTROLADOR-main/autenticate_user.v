//BLOCO DE AUTENTICAÇÃO (PERFIS)

module autenticate_user(CK_U, V, U);
	
	input [2:0]U;
	output [2:0]CK_U;
	output V;
	wire not_A0, not_A1, not_A2;
	wire T1, T2, G1, G2, H1, H2, L1, L2, L3;

	not Inv0(not_U0, U[0]);
	not Inv1(not_U1, U[1]);
	not Inv2(not_U2, U[2]);

	//For CK_U[0] output
	and And0(T1, not_U2, U[0]);
	and And1(T2, not_U1, U[0]);
	or Or0(CK_U[0], T1, T2);

	//For CK_U[1] output
	or Or1(G1, U[2], U[0]);
	or Or2(G2, not_U2, not_U0);
	and And2(CK_U[1], G1, U[1], G2);

	//For CK_U[2] output
	and And4(H1, U[2], not_U1, U[0]);
	and And5(H2, U[2], U[1], not_U0);
	or Or3(CK_U[2], H1, H2);

	//For V output
	and And6(L1, not_U2, not_U0);
	and And7(L2, not_U1, not_U0);
	and And8(L3, U[2], U[1], U[0]);
	or Or4(V, L1, L2, L3);

endmodule
