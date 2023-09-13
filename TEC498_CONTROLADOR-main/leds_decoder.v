//DECODIFICADOR DOR LEDS

module leds_decoder(L, F1, F2);
	
	input [2:0]F1;
	input [2:0]F2;
	output [3:0]L;
	wire not_F10, not_F11, not_F12;
	wire not_F20, not_F21, not_F22;
	wire T1, T2, G1, G2;
	wire H1, H2, U1, U2, U3;

	not Inv0(not_F10, F1[0]);
	not Inv1(not_F11, F1[1]);
	not Inv2(not_F12, F1[2]);
	not Inv3(not_F20, F2[0]);
	not Inv4(not_F21, F2[1]);
	not Inv5(not_F22, F2[2]);
	
	//For L[0] output
	and And0(T1, not_F22, not_F21, F2[0]);
	and And1(T2, not_F12, not_F11, F1[0]);
	or Or0(L[0], T1, T2);

	//For L[1] output
	and And2(G1, not_F22, F2[1], F2[0]);
	and And3(G2, not_F12, F1[1], F1[0]);
	or Or1(L[1], G1, G2);

	//For L[2] output
	and And4(H1, F2[2], not_F21, not_F20);
	and And5(H2, F1[2], not_F11, not_F10);
	or Or2(L[2], H1, H2);

	//For L[3] output
	and And6(U1, F2[2], F2[1], not_F20);
	and And7(U2, F1[2], F1[1], not_F10, not_F22);
	and And8(U3, F1[2], F1[1], not_F10, not_F21);
	or Or(L[3], U1, U2, U3);
	
endmodule
