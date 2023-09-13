//MAIN

module main_circuit(LEDS, MATX_LINHAS, MATX_COLUNA, LED_RGB, SEG, DIG, DP, F1, F2, U1, U2);
	
	input [2:0]F1;
	input [2:0]F2;
	input [2:0]U1;
	input [2:0]U2;
	output [3:0]LEDS;
	output [6:0]MATX_LINHAS;
	output MATX_COLUNA;
	output [2:0]LED_RGB;
	output [6:0]SEG;
	output [3:0]DIG;  
	output DP;
	wire [2:0]checked_user_wire1;
	wire [2:0]checked_user_wire2;
	wire [1:0]v_user_wire;
	wire [1:0]converted_user_wire1;
	wire [1:0]converted_user_wire2;
	wire priority_signal;
	wire [2:0]checked_access_wire1;
	wire [2:0]checked_access_wire2;
	wire [2:0]function_wire1;
	wire [2:0]function_wire2;
	wire [2:0]outputC_wire1;
	wire [2:0]outputC_wire2;
	wire [2:0]outputC_wire3;
	wire [2:0]outputC_wire4;
	wire [1:0]isFunction2_wire;

	//AUTENTICAÇÃO DO USUÁRIO
	autenticate_user(.CK_U(checked_user_wire1), .V(v_user_wire[0]), .U(U1));
	autenticate_user(.CK_U(checked_user_wire2), .V(v_user_wire[1]), .U(U2));

	//VERIFICAÇÃO DO PILOTO AUTOMÁTICO
	verify_auto(.OUT(LED_RGB), .V(v_user_wire));

	//CONVERSÃO DO USUÁRIO
	convert_user(.CONV_U(converted_user_wire1), .CK_U(checked_user_wire1));
	convert_user(.CONV_U(converted_user_wire2), .CK_U(checked_user_wire2));

	//COMPARAÇÃO DE PERFIS
	compare_users(.P_SIGNAL(priority_signal), .U1(converted_user_wire1), .U2(converted_user_wire2));

	//AUTENTICAÇÃO DAS PERMISSÕES
	autenticate_permission(.f(checked_access_wire1), .U(checked_user_wire1), .F(F1));
		autenticate_permission(.f(checked_access_wire2), .U(checked_user_wire2), .F(F2));

	//COMPARADOR DE FUNCIONALIDADE
	compare_funcionality(.f1(function_wire1), .f2(function_wire2), .F1(checked_access_wire1), .F2(checked_access_wire2), .P_SIGNAL(priority_signal));

	//DISTRIBUIÇÃO DE SAÍDAS
	output_controller(.MTX_OUT(outputC_wire1), .LEDS_OUT(outputC_wire2), .CONV_U(converted_user_wire1), .CK_PERM(function_wire1));
	output_controller(.MTX_OUT(outputC_wire3), .LEDS_OUT(outputC_wire4), .CONV_U(converted_user_wire2), .CK_PERM(function_wire2));

	//DECODIFICADOR DA MATRIZ DE LEDS
	matrix_decoder(.L(MATX_LINHAS), .C(MATX_COLUNA), .F1(outputC_wire1), .F2(outputC_wire3));
	
	//DECODIFICADOR DOS LEDS
	leds_decoder(.L(LEDS), .F1(outputC_wire2), .F2(outputC_wire4));

	//DECODIFICADOR DO DISPLAY
	verify_funcionality2(.S(isFunction2_wire), .A(function_wire1), .B(function_wire2));
	display_decoder(.SEG(SEG), .DIG(DIG), .DP(DP), .U1(converted_user_wire1), .U2(converted_user_wire2), .F_SIGNAL(isFunction2_wire));

endmodule 
