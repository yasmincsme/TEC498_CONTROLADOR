//BLOCO VERIFICA FUNCIONALIDADE 2

module verify_funcionality2(S, A, B);

	input [2:0]A;
	input [2:0]B;
	output [1:0]S;
	wire not_A0, not_A1, not_A2; 
	wire not_B0, not_B1, not_B2;
	wire T1;
	wire G1;

	not Inv0(not_A0, A[0]);
	not Inv1(not_A1, A[1]);
	not Inv2(not_A2, A[2]);
	not Inv3(not_B0, B[0]);
	not Inv4(not_B1, B[1]);
	not Inv5(not_B2, B[2]);

	//For S[0] output
	or Or0(T1, B[2], not_B1, B[0]); 
	and And0(S[0], A[1], T1, not_A0, not_A2);

	//For S[1] output
	or Or1(G1, A[2], not_A1, A[0]);
	and And1(S[1], B[1], not_B0, not_B2, G1); 

endmodule
