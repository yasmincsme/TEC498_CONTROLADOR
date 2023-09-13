//CONTROLADOR DE SAÍDAS 

module output_controller(MTX_OUT, LEDS_OUT, CONV_U, CK_PERM);

	input [1:0]CONV_U;
	input [2:0]CK_PERM;
	output [2:0]MTX_OUT;
	output [2:0]LEDS_OUT;
	wire not_CONV0, not_CONV1;
	wire not_CKP0, not_CKP1, not_CKP2;
	wire T1, G1, H1, J1;
	wire W1, W2, W3;
	wire U1, U2, U3, U4, U5;

	not Inv0(not_CONV0, CONV_U[0]);
	not Inv1(not_CONV1, CONV_U[1]);
	not Inv3(not_CKP0, CK_PERM[0]);
	not Inv4(not_CKP1, CK_PERM[1]);
	not Inv5(not_CKP2, CK_PERM[2]);

	//For MTX_OUT[0] output
	or Or0(T1, CONV_U[0], not_CKP2);
	and And0(MTX_OUT[0], CONV_U[1], CK_PERM[0], T1);
	
	//For MTX_OUT[1] output
	or Or1(G1, CONV_U[0], not_CKP2, not_CKP0);
	and And1(MTX_OUT[1], CONV_U[1], CK_PERM[1], G1);

	//For MTX_OUT[2] output
	or Or2(H1, CONV_U[0], not_CKP0);
	and And2(MTX_OUT[2], CONV_U[1], CK_PERM[2], H1);

	//For LEDS_OUT[0] output
	or Or3(J1, CONV_U[0], not_CKP1);
	and And3(LEDS_OUT[0], CK_PERM[0], not_CKP2, not_CONV1, J1);

	//For LEDS_OUT[1] output
	or Or4(W1, CONV_U[0], CK_PERM[2]);
	or Or5(W2, CK_PERM[2], CK_PERM[0]);
	or Or6(W3, not_CKP2, not_CKP0);
	and And4(LEDS_OUT[1], W1, W2, CK_PERM[1], W3, not_CONV1);

	//For LEDS_OUT[2] output
	or Or7(U1, CONV_U[0], CK_PERM[1]);
	and And5(LEDS_OUT[2], U1, CK_PERM[2], not_CKP0, not_CONV1);

endmodule
