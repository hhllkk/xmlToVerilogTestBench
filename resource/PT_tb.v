`timescale 1ns/1ps
module PE_tb();
	parameter CYCLE=10; 
	reg clk;
	reg rst;
//pe0

//	reg [3:0]     PE0_Bus_Port0;
	reg [32:0]    PE0_Configure_Inport;
	wire [35:0] PE0_Outport0;
	wire Pre_PE0_Bp0;
	wire Pre_PE0_Bp1;
	wire Pre_PE0_Bp2;

//pe1

//	reg [3:0]     PE0_Bus_Port0;
	reg [32:0]    PE1_Configure_Inport;
	wire [35:0] PE1_Outport0;
	wire Pre_PE1_Bp0;
	wire Pre_PE1_Bp1;
	wire Pre_PE1_Bp2;

//pe2

//	reg [3:0]     PE0_Bus_Port0;
	reg [32:0]    PE2_Configure_Inport;
	wire [35:0] PE2_Outport0;
	wire Pre_PE2_Bp0;
	wire Pre_PE2_Bp1;
	wire Pre_PE2_Bp2;

	PE_top pe0_top(
		.clk(clk),
		.reset(rst),
		.PE_Inport0(PE1_Outport0),
		.PE_Inport1(PE2_Outport0),
		.PE_Inport2(36'b0),
//此次常0还是常1？？？？
		.PE_Bus_Port0(4'b0),
		.Post_PE_Bp0(Pre_PE1_Bp0),
		.Post_PE_Bp1(Pre_PE2_Bp1),
		.Post_PE_Bp2(1'b1),
		.Post_PE_Bp3(1'b1),
		.Post_PE_Bp4(1'b1),
		.Post_PE_Bp5(1'b1),
		.Post_PE_Bp6(1'b1),
		.Post_PE_Bp7(1'b1),
		.PE_Configure_Inport(PE0_Configure_Inport),
		.PE_Outport0(PE0_Outport0),
		.Pre_PE_Bp0(Pre_PE0_Bp0),
		.Pre_PE_Bp1(Pre_PE0_Bp1),
		.Pre_PE_Bp2(Pre_PE0_Bp1)
	);
	PE_top pe1_top(
		.clk(clk),
		.reset(rst),
		.PE_Inport0(PE0_Outport0),
		.PE_Inport1(36'b0),
		.PE_Inport2(36'b0),
		.PE_Bus_Port0(4'b0),
		.Post_PE_Bp0(Pre_PE0_Bp0),
		.Post_PE_Bp1(1'b1),
		.Post_PE_Bp2(1'b1),
		.Post_PE_Bp3(1'b1),
		.Post_PE_Bp4(1'b1),
		.Post_PE_Bp5(1'b1),
		.Post_PE_Bp6(1'b1),
		.Post_PE_Bp7(1'b1),
		.PE_Configure_Inport(PE1_Configure_Inport),
		.PE_Outport0(PE1_Outport0),
		.Pre_PE_Bp0(Pre_PE1_Bp0),
		.Pre_PE_Bp1(Pre_PE1_Bp1),
		.Pre_PE_Bp2(Pre_PE1_Bp2)
	);

	PE_top pe2_top(
		.clk(clk),
		.reset(rst),
		.PE_Inport0(36'b0),
		.PE_Inport1(PE0_Outport0),
		.PE_Inport2(36'b0),
		.PE_Bus_Port0(4'b0),
		.Post_PE_Bp0(Pre_PE0_Bp1),
		.Post_PE_Bp1(1'b1),
		.Post_PE_Bp2(1'b1),
		.Post_PE_Bp3(1'b1),
		.Post_PE_Bp4(1'b1),
		.Post_PE_Bp5(1'b1),
		.Post_PE_Bp6(1'b1),
		.Post_PE_Bp7(1'b1),
		.PE_Configure_Inport(PE2_Configure_Inport),
		.PE_Outport0(PE2_Outport0),
		.Pre_PE_Bp0(Pre_PE2_Bp0),
		.Pre_PE_Bp1(Pre_PE2_Bp1),
		.Pre_PE_Bp2(Pre_PE2_Bp2)
	);

//TODO: buffer_mode 中{1'bx,7'bxxx_xxxx,3'bxxx,1'bx,5'dx,3'b001,4'b0100,2'b01,1'b0,4'bxxxx,2'bxx};
//		3'b001是指buf0为keep   1和2 为buffer？  buffer_from同理为4'bbuf2_buf1_buf0的来源？bypass是指inout还是outin呢？
//		outmode现在默认为pe

	/* initial begin
	// 	rst=1'b1;
	// 	clk=1'b0;
	// 	// PE_Inport0={4'b1100,32'd5};
	// 	// PE_Inport1={4'b1110,32'd5};
	// 	// PE_Inport2={4'b0000,32'd0};
	// 	PE_Bus_Port0=4'b0000;
	// 	Post_PE_Bp0=1'b1;
	// 	//inport0_valid,alu,buf_mode,buf_from,bypass,outmode,control
	// 	PE_Configure={1'b0,5'd3,3'd0,4'b1010,2'b00,1'b0,4'b0000,2'b00};
	// 	#2 rst=~rst;

	// 	#1 rst=~rst;
	// 	PE_Inport0 = {4'b1100,32'd7};
	// 	PE_Inport1 = {4'b1100,32'd4};
	// 	PE_Inport2 = {4'b0000,32'd0};
	// 	#7 PE_Inport0 = {4'b1100,32'd9};
	// 	PE_Inport1 = {4'b1100,32'd5};
	// 	PE_Inport2 = {4'b0000,32'd0};
	// end


	// initial begin
	// 	rst <=1'b1;
	// 	clk <=1'b0;
	// 	PE_Bus_Port0 <= 4'b0000;
	// 	Post_PE_Bp0 <= 1'b1;
	// 	//inport0_valid,alu,buf_mode,buf_from,bypass,outmode,control
	// 	PE_Configure <= {1'b0,5'd5,3'b101,4'b1101,2'b00,1'b0,4'b0010,2'b00};
	// 	#2 rst <= ~rst;
	// 	#1 rst <= ~rst;
	// 	PE_Inport0 = {4'b1100,32'd0};
	// 	PE_Inport1 = {4'b1100,32'd1};
	// 	PE_Inport2 = {4'b0000,32'd10};
	// 	//#7 PE_Inport0 = {4'b1100,32'd9};
	// 	//PE_Inport1 = {4'b1100,32'd1};
	// 	//PE_Inport2 = {4'b0000,32'd1};
	// end

	// initial begin
	// 	rst <=1'b1;
	// 	clk <=1'b0;
	// 	PE_Bus_Port0 <= 4'b0000;
	// 	Post_PE_Bp0 <= 1'b1;
	// 	Post_PE_Bp1 <= 1'b1;
	// 	Post_PE_Bp2 <= 1'b1;
	// 	Post_PE_Bp3 <= 1'b1;
	// 	Post_PE_Bp4 <= 1'b1;
	// 	Post_PE_Bp5 <= 1'b1;
	// 	Post_PE_Bp6 <= 1'b1;
	// 	Post_PE_Bp7 <= 1'b1;

	// 	//inport0_valid,alu,buf_mode,buf_from,bypass,outmode,control
	// 	PE_Configure_Inport <= {1'b1,7'b000_0000,3'b001,1'b0,5'd3,3'b000,4'b1011,2'b00,1'b0,4'b0000,2'b11};
	// 	#2 rst <=~rst;
	// 	#1 rst <=~rst;
	// 	//PE_Configure_Inport<=
	// 	#10 PE_Configure_Inport <= {1'b1,32'd15};
	// 	#10 PE_Configure_Inport <= {1'b0,32'd0};
	// 	PE_Inport0={4'b1100,32'd5};
	// 	PE_Inport1={4'b1110,32'd5};
	// 	PE_Inport2={4'b0000,32'd0};
	// end*/

	initial begin
	 	rst <=1'b1;
	 	clk <=1'b0;

	 	//valid,null,buffer_config,inport0_valid,alu,buf_mode,buf_from,bypass,outmode,control,branch_control
	 	//配置pe0 1 2 内容不用核对啦
	 	PE0_Configure_Inport <= {1'b1,7'b000_0000,3'b100,1'b0,5'd5,3'b101,4'b0100,2'b01,1'b0,4'b0010,2'b00};
	 	PE1_Configure_Inport <= {1'b1,7'b000_0000,3'b101,1'b0,5'd5,3'b101,4'b0100,2'b01,1'b0,4'b0010,2'b00};
	 	PE2_Configure_Inport <= {1'b1,7'b000_0000,3'b101,1'b0,5'd5,3'b101,4'b0100,2'b01,1'b0,4'b0010,2'b00};
	 	#2 rst <= ~rst;
	 	#1 rst <= ~rst;

	 	//写入reg数据，此时pe0需要写入1次，只有buf2。写入8,应该给什么数值呀
	 	#10 PE0_Configure_Inport<={1'b1,32'd8};
	 	//写入reg数据，此时pe1需要写入2次，buf1及buf2。写入1，12,应该给什么数值呀
	 	#10 PE0_Configure_Inport<={1'b1,32'd10};
	 	#10 PE1_Configure_Inport<={1'b1,32'd10};

	 	//写入reg数据，此时pe2需要写入2次，buf0及buf2。写入1，5,应该给什么数值呀
	 	#10 PE1_Configure_Inport<={1'b1,32'd10};
	 	#10 PE1_Configure_Inport<={1'b1,32'd10};
	 	//PE_Inport0 = {4'b1100,32'd0};
	 	//PE_Inport1 = {4'b1100,32'd0};
	 	//PE_Inport2 = {4'b1100,32'd10};
	 	//#7 PE_Inport0 = {4'b1100,32'd9};
	 	//PE_Inport1 = {4'b1100,32'd1};
	 	//PE_Inport2 = {4'b0000,32'd1};
	 end

	always #(CYCLE/2) clk=~clk;
endmodule
