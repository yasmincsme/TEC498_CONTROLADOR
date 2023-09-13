//BLOCO DE COMPARAÇÃO DOS PERFIS

module compare_users(P_SIGNAL, U1, U2);

	input [1:0]U1;
	input [1:0]U2;
	output P_SIGNAL;
	wire not_U10, not_U11;
	wire not_U20, not_U21;
	wire T1, T2, T3;

	not Inv0(not_U10, U1[0]);
	not Inv1(not_U11, U1[1]);
	not Inv2(not_U20, U2[0]);
	not Inv3(not_U21, U2[1]);

	//For P_SIGNAL output
	and And0(T1, not_U11, not_U10, U2[0]);
	and And1(T2, not_U11, U2[1]);
	and And2(T3, not_U10, U2[1], U2[0]);
	or Or0(P_SIGNAL, T1, T2, T3);

endmodule

