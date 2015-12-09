//Buffer 32 outputs, then output them for 32 channels

module result (
  input clk,
  input reset,
  input srdyi,
  input [20:0] fp_res,
  output reg srdyo,
  output reg [20:0] res_0,
  output reg [20:0] res_1,
  output reg [20:0] res_2,
  output reg [20:0] res_3,
  output reg [20:0] res_4,
  output reg [20:0] res_5,
  output reg [20:0] res_6,
  output reg [20:0] res_7,
  output reg [20:0] res_8,
  output reg [20:0] res_9,
  output reg [20:0] res_10,
  output reg [20:0] res_11,
  output reg [20:0] res_12,
  output reg [20:0] res_13,
  output reg [20:0] res_14,
  output reg [20:0] res_15,
  output reg [20:0] res_16,
  output reg [20:0] res_17,
  output reg [20:0] res_18,
  output reg [20:0] res_19,
  output reg [20:0] res_20,
  output reg [20:0] res_21,
  output reg [20:0] res_22,
  output reg [20:0] res_23,
  output reg [20:0] res_24,
  output reg [20:0] res_25,
  output reg [20:0] res_26,
  output reg [20:0] res_27,
  output reg [20:0] res_28,
  output reg [20:0] res_29,
  output reg [20:0] res_30,
  output reg [20:0] res_31
);

reg [4:0] counter;
reg [4:0] init;

always@(posedge clk) begin
  if(reset == 1) begin
    srdyo <= 0;
	res_0 <= 0;
    res_1 <= 0;
	res_2 <= 0;
	res_3 <= 0;
	res_4 <= 0;
	res_5 <= 0;
	res_6 <= 0;
	res_7 <= 0;
	res_8 <= 0;
	res_9 <= 0;
	res_10 <= 0;
	res_11 <= 0;
	res_12 <= 0;
	res_13 <= 0;
	res_14 <= 0;
	res_15 <= 0;
	res_16 <= 0;
	res_17 <= 0;
	res_18 <= 0;
	res_19 <= 0;
	res_20 <= 0;
	res_21 <= 0;
	res_22 <= 0;
	res_23 <= 0;
	res_24 <= 0;
	res_25 <= 0;
	res_26 <= 0;
	res_27 <= 0;
	res_28 <= 0;
	res_29 <= 0;
	res_30 <= 0;
	res_31 <= 0;
	counter <= 0;
	init <= 0;
  end
  else if(srdyi == 1) begin
      counter <= counter + 1;
      case(counter)
	    0: res_0 <= fp_res;
		1: res_1 <= fp_res;
		2: res_2 <= fp_res;
		3: res_3 <= fp_res;
		4: res_4 <= fp_res;
		5: res_5 <= fp_res;
		6: res_6 <= fp_res;
		7: begin 
		     res_7 <= fp_res;
		     init <= counter + 1;
		   end
		8: res_8 <= fp_res;
		9: res_9 <= fp_res;
	   10: res_10 <= fp_res;
	   11: res_11 <= fp_res;
	   12: res_12 <= fp_res;
	   13: res_13 <= fp_res;
	   14: res_14 <= fp_res;
	   15: begin 
	         res_15 <= fp_res;
			 init <= counter + 1;
		   end
	   16: res_16 <= fp_res;
	   17: res_17 <= fp_res;
	   18: res_18 <= fp_res;
	   19: res_19 <= fp_res;
	   20: res_20 <= fp_res;
	   21: res_21 <= fp_res;
	   22: res_22 <= fp_res;
	   23: begin 
	         res_23 <= fp_res;
			 init <= counter + 1;
		   end
	   24: res_24 <= fp_res;
	   25: res_25 <= fp_res;
	   26: res_26 <= fp_res;
	   27: res_27 <= fp_res;
	   28: res_28 <= fp_res;
	   29: res_29 <= fp_res;
	   30: res_30 <= fp_res;
	   31: begin
	         res_31 <= fp_res;
			 init <= counter + 1;
			 srdyo <= 1;
		   end
	   default: begin 
				  srdyo <= 0;
	              res_0 <= 0;
                  res_1 <= 0;
				  res_2 <= 0;
				  res_3 <= 0;
			      res_4 <= 0;
				  res_5 <= 0;
				  res_6 <= 0;
				  res_7 <= 0;
				  res_8 <= 0;
				  res_9 <= 0;
				  res_10 <= 0;
				  res_11 <= 0;
				  res_12 <= 0;
				  res_13 <= 0;
				  res_14 <= 0;
				  res_15 <= 0;
				  res_16 <= 0;
				  res_17 <= 0;
				  res_18 <= 0;
				  res_19 <= 0;
				  res_20 <= 0;
				  res_21 <= 0;
				  res_22 <= 0;
				  res_23 <= 0;
				  res_24 <= 0;
				  res_25 <= 0;
				  res_26 <= 0;
				  res_27 <= 0;
				  res_28 <= 0;
				  res_29 <= 0;
				  res_30 <= 0;
				  res_31 <= 0;				  
				end
	  endcase
  end
  else begin
    srdyo <= 0;
	counter <= init;
  end

end


endmodule
