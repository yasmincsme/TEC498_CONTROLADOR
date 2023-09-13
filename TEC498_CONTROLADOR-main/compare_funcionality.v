//COMPARADOR DE FUNCIONALIDADES

module compare_funcionality(f1, f2, F1, F2, P_SIGNAL);
	
	input [2:0]F1;
	input [2:0]F2;
	input P_SIGNAL;
	output [2:0]f1;
	output [2:0]f2;
	wire not_F10, not_F11, not_F12;
	wire not_F20, not_F21, not_F22;
	wire not_P;
	wire T1, T2, T3, T4, T5, T6;
	wire G1, G2, G3, G4, G5, G6;
	wire H1, H2, H3, H4, H5, H6;
	wire J1, J2, J3, J4, J5, J6;
	wire L1, L2, L3, L4, L5, L6;
	wire D1, D2, D3, D4, D5, D6;

	not Inv0(not_F10, F1[0]);
	not Inv1(not_F11, F1[1]);
	not Inv2(not_F12, F1[2]);
	not Inv3(not_F20, F2[0]);
	not Inv4(not_F21, F2[1]);
	not Inv5(not_F22, F2[2]);
	not Inv6(not_P, P_SIGNAL);

	//For f1[0] output
	and And0(T1, F1[0], not_F20);
	and And1(T2, F1[0], not_P);
	and And2(T3, not_F11, F1[0], F2[1]);
	and And3(T4, not_F12, F1[0], F2[2]);
	and And4(T5, F1[1], F1[0], not_F21);
	and And5(T6, F1[2], F10, not_F22);
	or Or0(f1[0], T1, T2, T3, T4, T5, T6);

	//For f1[1] output
	and And6(G1, F1[1], not_F21);
	and And7(G2, F1[1], not_P);
	and And8(G3, F1[1], not_F10, F2[0]);
	and And9(G4, not_F12, F1[1], F2[2]);
	and And10(G5, F1[1], F1[0], not_F20);
	and And11(G6, F1[2], F1[1], not_F22);
	or Or1(f1[1], G1, G2, G3, G4, G5, G6);

	//For f1[2] output
	and And12(H1, F1[2], not_F22);
	and And13(H2, F1[2], not_P);
	and And14(H3, F1[2], not_F10, F2[0]);
	and And15(H4, F1[2], not_F11, F2[1]);
	and And16(H5, F1[2], F1[0], not_F20);
	and And17(H6, F1[2], F1[1], not_F21);
	or Or2(f1[2], H1, H2, H3, H4, H5, H6);

	//For f2[0] output
	and And20(J1, not_F10, F2[0]);
	and And21(J2, F2[0], P_SIGNAL);
	and And22(J3, not_F11, F2[1], F2[0]);
	and And23(J4, not_F12, F2[2], F2[0]);
	and And24(J5, F1[1], not_F21, F2[0]);
	and And25(J6, F1[2], not_F22, F2[0]);
	or Or3(f2[0], J1, J2, J3, J4, J5, J6);

	//For f2[1] output
	and And28(L1, not_F11, F2[1]);
	and And29(L2, F2[1], P_SIGNAL);
	and And30(L3, not_F10, F2[1], F2[0]);
	and And31(L4, not_F12, F2[2], F2[1]);
	and And32(L5,F1[0], F2[1], not_F20);
	and And33(L6, F1[2], not_F22, F2[1]);
	or Or4(f2[1], L1, L2, L3, L4, L5, L6);

	//For f2[2] output
	and And34(D1, not_F12, F2[2]);
	and And35(D2, F2[2], P_SIGNAL);
	and And36(D3, not_F10, F2[2], F2[0]);
	and And37(D4, not_F11, F2[2], F2[1]);
	and And38(D5, F1[0], F2[2], not_F20);
	and And39(D6, F1[1], F2[2], not_F21);
	or Or5(f2[2], D1, D2, D3, D4, D5, D6);

endmodule
