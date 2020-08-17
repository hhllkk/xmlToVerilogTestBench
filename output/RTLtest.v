`timescale 1ns/1ps
module PE_tb();
  parameter CYCLE=10;
  reg clk;
  reg rst;


  integer i;
  integer filez;
//pe1输出端口定义
  reg  [35:0]    PE1_Inport1;
  reg  [32:0]    PE1_Configure_Inport;
  wire [35:0]    PE1_Outport0;
  wire Pre_PE1_Bp0;
  wire Pre_PE1_Bp1;
  wire Pre_PE1_Bp2;
//end pe1 端口定义

//pe2输出端口定义
  reg  [32:0]    PE2_Configure_Inport;
  wire [35:0]    PE2_Outport0;
  wire Pre_PE2_Bp0;
  wire Pre_PE2_Bp1;
  wire Pre_PE2_Bp2;
//end pe2 端口定义

//pe1例化
PE_top  pe1_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(36'b0),
    .PE_Inport1(PE1_Inport1),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(Pre_PE2_Bp0),
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
//end pe1 例化
    
//pe2例化
PE_top  pe2_top(
    .clk(clk),
    .reset(rst),
    .PE_Inport0(PE1_Outport0),
    .PE_Inport1(36'b0),
    .PE_Inport2(36'b0),
    .PE_Bus_Port0(4'b0),
    .Post_PE_Bp0(1'b1),
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
//end pe2 例化
    
  initial begin
    rst <=1'b1;
    clk <=1'b0;
    PE1_Configure_Inport <={1'b1,7'b000_0000,3'b101,1'b1,5'd5,3'b101,4'b0100,2'b01,1'd0,4'd2,2'd0};
    PE2_Configure_Inport <={1'b1,7'b000_0000,3'b010,1'b1,5'd3,3'b010,4'b1000,2'b00,1'd0,4'd0,2'd0};
    #2 rst <= ~rst;
    #1 rst <= ~rst;
    #10 PE1_Configure_Inport <={1'b1,32'd0};
        PE2_Configure_Inport <={1'b1,32'd1};
    #10 PE1_Configure_Inport <={1'b1,32'd100};
        PE2_Configure_Inport <=33'd0;
    #10 PE1_Configure_Inport <=33'd0;
    #10 PE1_Inport1 <= {4'b1100,32'd0};
    #10 PE1_Inport1 <= {4'b0000,32'd0};
  end
  initial begin
      filez=$fopen("./data_flow_rtl","w");
        for(i=0;i<100;i=i+1) begin
            @(posedge clk);
            #1
            if(PE1_Outport0[35:33]!=3'b000&&PE1_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE1.vbl = %b,value = %d@clk %d\n",PE1_Outport0[35:33],PE1_Outport0[31:0],i);
            end
            if(PE2_Outport0[35:33]!=3'b000&&PE2_Outport0[32]!=1'b1) begin
                $fwrite(filez,"PE2.vbl = %b,value = %d@clk %d\n",PE2_Outport0[35:33],PE2_Outport0[31:0],i);
            end
        end
        #1 $fclose(filez);
        $finish;
    end


  always #(CYCLE/2) clk=~clk;
endmodule
