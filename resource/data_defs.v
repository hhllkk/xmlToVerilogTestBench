`define     CLK_PERIOD		10

`define     REGISTER_WIDTH      32  
`define     INSTR_WIDTH         32
`define     IMMEDIATE_WIDTH     16

`define     MEM_READ            3'b101
`define     MEM_WRITE           3'b100
`define     ARITH_LOGIC     	3'b001
`define     SHIFT_REG		3'b000




`define ALU_NULL             5'd0
`define SADD          		 5'd1
`define MUL      			 5'd2
`define ADD		         	 5'd3
`define SUB		         	 5'd4
`define LESS_THAN            5'd5
`define LESS_THAN_EQUAL      5'd6
`define EQUAL	          	 5'd7
`define MAC	                 5'd8
`define BIT_AND		     	 5'd9
`define BIT_OR		      	 5'd10
`define BIT_NOT			     5'd11
`define BIT_XOR              5'd12
`define MUX		           	 5'd13
`define LEFT_SHIFT           5'd14
`define RIGHT_SHIFT          5'd15
`define LOGIC_AND            5'd16
`define LOGIC_OR		     5'd17
`define LOGIC_NOT	      	 5'd18
`define GREAT_THAN		 	 5'd19
`define GREAT_THAN_EQUAL     5'd20
`define NOT_EQUAL            5'd21


 `define BRK_GEN_LAST         3'b001
 `define BRK_GEN_INVALID      3'b011
 `define BREAK                3'b010
 `define LAST_GEN             3'b111
 `define GLOBAL_LAST          3'b001
 `define LOCAL_LAST           3'b111

 // configuration of loop control
 `define LOOP_NULL            4'd0
 `define INNER_LOOP           4'd1
 `define OUTERMOST_LOOP       4'd2
 `define LAST_MATCH0          4'd3
 `define LAST_MATCH1          4'd4
 `define BREAK_GEN            4'd5
 `define BREAK_PRE            4'd6
 `define BREAK_POST           4'd7
 `define SYSTOLIC             4'd8
 `define INNER_LOOP_SYNC      4'd9
 `define INNER_LOOP_INI       4'd10
 `define INNER_LOOP_INI_SYNC  4'd11
 `define TRANS                4'd12

 // configuration of branch control
 `define BRANCH_NULL            2'd0
 `define CB          		  2'd1
 `define CINVB      		  2'd2
 `define MERGE        	  2'd3

 // configuration of buffer0 from
 `define BUFFER0_FROM_NULL     1'd0 
 `define IN0                  1'd1 
 // configuration of buffer1 from
 `define BUFFER1_FROM_NULL     2'd0 
 `define IN1                  2'd1 
 `define ALUIN1               2'd2 
 `define IN0IN1               2'd3
 // configuration of buffer2 from
 `define BUFFER2_FROM_NULL     1'd0 
 `define IN2                  1'd1 
 // configuration of output_mode
 `define BUS    	        1'd0 
 `define PEA                  1'd1
 // configuration of input_buffer_bypass
 `define INBUFFER_PAD         1'd0 
 `define INBUFFER_BYPASS      1'd1
 // configuration of output_buffer_bypass
 `define OUTBUFFER_PAD        1'd0 
 `define OUTBUFFER_BYPASS     1'd1
 // configuration of buffer0 mode
 `define BUFFER    	          1'd0 
 `define KEEP                 1'd1 
 // configuration of buffer1 mode
 //`define BUFFER    	        1'd0 
 //`define Keep                 1'd1 
 // configuration of buffer2 mode
 //`define BUFFER    	        1'd0 
 //`define Keep                 1'd1 
 // configuration of inport0_valid
 `define INPORT0_BUS    	        1'd0 
 `define INPORT0_PEA                  1'd1

