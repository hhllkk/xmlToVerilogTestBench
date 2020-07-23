`timescale 1ns/1ps
module PE_tb();
  parameter CYCLE=10;
  reg clk;
  reg rst;
//pe0输出端口定义
  reg  [32:0]    PE0_Configure_Inport;
  wire [35:0]    PE0_Outport0;
  wire Pre_PE0_Bp0;
  wire Pre_PE0_Bp1;
  wire Pre_PE0_Bp2;
//end pe0 端口定义

//pe1输出端口定义
  reg  [32:0]    PE1_Configure_Inport;
  wire [35:0]    PE1_Outport0;
  wire Pre_PE1_Bp0;
  wire Pre_PE1_Bp1;
  wire Pre_PE1_Bp2;
//end pe1 端口定义

//pe0例化
PE_top  pe0_top(
    .clk(clk),
    .reset(reset),
    .PE_Inport0(PE1_Outport0),
    .PE_Inport1(36'b0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE1_BP0),
    .Post_PE_Bp1(1'b1),
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
    .Pre_PE_Bp2(Pre_PE0_Bp2)
//end pe0 例化
    
//pe1例化
PE_top  pe1_top(
    .clk(clk),
    .reset(reset),
    .PE_Inport0(PE0_Outport0),
    .PE_Inport1(36'b0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE0_BP0),
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
//end pe1 例化
    
  initial begin
    rst <=1'b1;
    clk <=1'b0;
    PE0_Configure_Inport <={1'b1,7'b000_0000,3'b101,1'b1,5'd5,3'b101,4'b0110,2'b01,1'd0,4'd2,2'd0};
    PE1_Configure_Inport <={1'b1,7'b000_0000,3'b010,1'b1,5'd3,3'b010,4'b1001,2'b11,1'd0,4'd0,2'd0};
    #2 rst <= ~rst;
    #1 rst <= ~rst;
    #10 PE0_Configure_Inport <={1'b1,32'd0};
        PE1_Configure_Inport <={1'b1,32'd2};
    #10 PE0_Configure_Inport <={1'b1,32'd5};
  end
  always #(CYCLE/2) clk=~clk;
endmodule