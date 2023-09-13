//DECODIFICADOR DA MATRIZ DE LEDS

module matrix_decoder(L, C, F1, F2);

	input [2:0]F1;
	input [2:0]F2;
	output [6:0]L;
	output C;
	wire not_F10, not_F11, not_F12;
	wire not_F20, not_F21, not_F22;

	not Inv0(not_F10, F1[0]);
	not Inv1(not_F11, F1[1]);
	not Inv2(not_F12, F1[2]);
	not Inv3(not_F20, F2[0]);
	not Inv4(not_F21, F2[1]);
	not Inv5(not_F22, F2[2]);

	//For C output
	and And0(C, 1'b1, 1'b1);

	//For L[0] output
	or Or0(T1, F2[2], F2[1], not_F20);
	or Or1(T2, F1[2], F1[1], not_F10);
	and And1(L[0], T1, T2);
	
	//For L[1] output
	or Or2(H1, F2[2], not_F21, F2[0]);
	or Or3(H2, F1[2], not_F11, F1[0]);
	and And2(L[1], H1, H2);

	//For L[2] output
	or Or4(G1, F2[2], not_F21, not_F20);
	or Or5(G2, F1[2], not_F11, not_F10);
	and And3(L[2], G1, G2);

	//For L[3] output
	or Or6(W1, not_F22, F2[1], F2[0]);
	or Or7(W2, not_F12, F1[1], F1[0]);
	and And4(L[3], W1, W2);

	//For L[4] output
	or Or8(J1, not_F22, F2[1], not_F20);
	or Or9(J2, not_F12, F1[1], not_F10);
	and And5(L[4], J1, J2);

	//For L[5] output
	or Or10(D1, not_F22, not_F21, F2[0]);
	or Or11(D2, not_F12, not_F11, F1[0]);
	and And6(L[5], D1, D2);

	//For L[6] output
	or Or12(U1, not_F22, not_F21, not_F20);
	or Or13(U2, not_F12, not_F11, not_F10);
	and And7(L[6], U1, U2);

endmodule
