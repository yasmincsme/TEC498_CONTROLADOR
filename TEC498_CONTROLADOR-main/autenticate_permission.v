//AUTENTICAÇÃO DAS PERMISSÕES

module autenticate_permission(f, U, F);

	input [2:0]U; 
	input [2:0]F; 
	output [2:0]f;
	wire not_U0, not_U1, not_U2;
	wire not_F0, not_F1, not_F2;
	

	not Inv0(not_U0, U[0]);
	not Inv1(not_U1, U[1]);
	not Inv2(not_U2, U[2]);
	not Inv3(not_F0, F[0]);
	not Inv4(not_F1, F[1]);
	not Inv5(not_F2, F[2]);

	//For f[0] output
	and And0(T1, not_U2, U[0], not_F2, not_F0);
	and And1(T2, U[2], not_U1, U[0], not_F0);
	and And2(T3, U[2], U[1], not_U0, not_F2, F[1], not_F0);
	or Or0(f[0], T1, T2, T3);
	
	//For f[1] output
	and And3(G1, not_U2, U[0], not_F2, not_F1, not_F0);
	and And4(G2, not_U2, U[0], F[2], not_F1, F[0]);
	and And5(G3, not_U2, U[1], U[0], not_F1, F[0]);
	and And6(G4, U[2], not_U1, U[0], not_F1);
	and And7(G5, U[2], U[1], not_U0, F[2], not_F1, F[0]);
	or Or1(f[1], G1, G2, G3, G4, G5);
	
	//For f[2] output
	and And8(W1, not_U2, U[0], F[2], F[0]);
	and And9(W2, U[2], not_U1, U[0], F[2]);
	and And10(W3, U[2], U[1], not_U0, F[2], not_F1, F[0]);
	or Or2 (f[2], W1, W2, W3);

endmodule



