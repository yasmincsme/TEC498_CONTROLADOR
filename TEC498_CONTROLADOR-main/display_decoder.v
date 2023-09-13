//DECODIFICADOR DO MOSTRADOR DE 7 SEGMENTOS

module display_decoder(SEG, DIG, DP, U1, U2, F_SIGNAL);

	input [1:0]U1;
	input [1:0]U2;
	input [1:0]F_SIGNAL;
	output [6:0]SEG;
	output [3:0]DIG;
	output DP;
	wire T1, T2, T3, T4, T5, T6;
	wire G1, G2, G3, G4;
	wire J1, J2, J3, J4, J5, J6, J7, J8;
	wire P1, P2, P3, P4, P5, P6, P7, P8, P9;
	wire D1, D2, D3, D4, D5, D6;
	wire H1, H2, H3, H4, H5, H6;
	wire A1, A2, A3, A4, A5, A6, A7, A8;
	

	not Inv0(not_U10, U1[0]);
	not Inv1(not_U11, U1[1]);
	not Inv2(not_U20, U2[0]);
	not Inv3(not_U21, U2[1]);
	not Inv4(not_F0, F_SIGNAL[0]);
	not Inv5(not_F1, F_SIGNAL[1]);

	//For DP output
	and And0(DP, 1'b1, 1'b1);

	//For DIG[0]
	and And1(DIG[0], 1'b1, 1'b0);

	//For DIG[1]
	and And2(DIG[1], 1'b1, 1'b1);

	//For DIG[2]
	and And3(DIG[2], 1'b1, 1'b1);

	//For DIG[0]
	and And4(DIG[3], 1'b1, 1'b1);

	//For SEG[0] (g) output
	and And5(T1, not_U11, not_U10);
	and And6(T2, not_U11, not_F1);
	and And7(T3, not_U21, not_U20);
	and And8(T4, not_U21, not_F0);
	and And9(T5, not_F1, not_F0);
	and And10(T6, F_SIGNAL[1], F_SIGNAL[0]);
	or Or0(SEG[0], T1, T2, T3, T4, T5, T6);

	//For SEG[1] (f) output
	and And11(G1, not_U10, not_F0);
	and And12(G2, not_U20, not_F1);
	and And13(G3, not_F1, not_F0);
	and And14(G4, F_SIGNAL[1], F_SIGNAL[0]);
	or Or1(SEG[1], not_U11, G1, not_U21, G2, G3, G4);

	//For SEG[2] (e) output
	and And15(J1, not_U11, not_U21);
	and And16(J2, not_U10, not_U20);
	and And17(J3, not_U10, not_F0);
	and And18(J4, not_U21, not_U20);
	and And19(J5, not_U21, not_F0);
	and And20(J6, F_SIGNAL[1], F_SIGNAL[0]);
	and And21(J7, U2[1], not_F1);
	and And22(J8, U1[1], not_F0);
	or Or2(SEG[2], J1, J2, J3, J4, J5, J6, J7, J8);

	//For SEG[3] (d) output
	and And23(P1, not_U11, not_U10);
	and And24(P2, not_U11, not_F1);
	and And25(P3, not_U21, not_U20);
	and And26(P4, not_U21, not_F0);
	and And27(P5, not_F1, not_F0);
	and And28(P6, F_SIGNAL[1], F_SIGNAL[0]);
	and And29(P7, U2[1], U2[0], not_F1);
	and And30(P8, U1[1], U1[0], not_F0);
	or Or3(SEG[3], P1, P2, P3, P4, P5, P6, P7, P8);

	//For SEG[4] (c) output
	and And31(D1, not_U11, not_F1);
	and And32(D2, not_U21, not_F0);
	and And33(D3, not_F1, not_F0);
	and And34(D4, F_SIGNAL[1], F_SIGNAL[0]);
	and And35(D5, not_U21, U2[0]);
	and And36(D6, not_U11, U1[0]);
	or Or4(SEG[4], D1, D2, D3, D4, D5, D6);

	//For SEG[5] (b) output
	and And37(H1, not_U11, not_F1);
	and And38(H2, not_U21, not_F0);
	and And39(H3, not_F1, not_F0);
	and And40(H4, F_SIGNAL[1], F_SIGNAL[0]);
	or Or5(SEG[5], H1, H2, H3, H4);

	//For SEG[6] (a) output
	and And46(A1, not_U11, not_U10);
	and And47(A2, not_U11, not_F1);
	and And48(A3, not_U21, not_U20);
	and And49(A4, not_U21, not_F0);
	and And50(A5, not_F1, not_F0);
	and And51(A6, F_SIGNAL[1], F_SIGNAL[0]);
	and And52(A7, U2[1], U2[0], not_F1);
	and And53(A8, U1[1], U1[0], not_F0);
	or Or6(SEG[6], A1, A2, A3, A4, A5, A6, A7, A8);

endmodule
