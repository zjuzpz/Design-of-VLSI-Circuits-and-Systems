module NLC_1ch (
  input clk,
  input reset,
  input [31:0] recip_stdev_4, // ufix32
  input [31:0] recip_stdev_3, // ufix32
  input [31:0] recip_stdev_2, // ufix32
  input [31:0] recip_stdev_1, // ufix32
  input [31:0] neg_mean_4, // ufix32
  input [31:0] neg_mean_3, // ufix32
  input [31:0] neg_mean_2, // ufix32
  input [31:0] neg_mean_1, // ufix32
  input [31:0] coeff_4_9, // ufix32
  input [31:0] coeff_4_8, // ufix32
  input [31:0] coeff_4_7, // ufix32
  input [31:0] coeff_4_6, // ufix32
  input [31:0] coeff_4_5, // ufix32
  input [31:0] coeff_4_4, // ufix32
  input [31:0] coeff_4_3, // ufix32
  input [31:0] coeff_4_2, // ufix32
  input [31:0] coeff_4_10, // ufix32
  input [31:0] coeff_4_1, // ufix32
  input [31:0] coeff_4_0, // ufix32
  input [31:0] coeff_3_9, // ufix32
  input [31:0] coeff_3_8, // ufix32
  input [31:0] coeff_3_7, // ufix32
  input [31:0] coeff_3_6, // ufix32
  input [31:0] coeff_3_5, // ufix32
  input [31:0] coeff_3_4, // ufix32
  input [31:0] coeff_3_3, // ufix32
  input [31:0] coeff_3_2, // ufix32
  input [31:0] coeff_3_10, // ufix32
  input [31:0] coeff_3_1, // ufix32
  input [31:0] coeff_3_0, // ufix32
  input [31:0] coeff_2_9, // ufix32
  input [31:0] coeff_2_8, // ufix32
  input [31:0] coeff_2_7, // ufix32
  input [31:0] coeff_2_6, // ufix32
  input [31:0] coeff_2_5, // ufix32
  input [31:0] coeff_2_4, // ufix32
  input [31:0] coeff_2_3, // ufix32
  input [31:0] coeff_2_2, // ufix32
  input [31:0] coeff_2_10, // ufix32
  input [31:0] coeff_2_1, // ufix32
  input [31:0] coeff_2_0, // ufix32
  input [31:0] coeff_1_9, // ufix32
  input [31:0] coeff_1_8, // ufix32
  input [31:0] coeff_1_7, // ufix32
  input [31:0] coeff_1_6, // ufix32
  input [31:0] coeff_1_5, // ufix32
  input [31:0] coeff_1_4, // ufix32
  input [31:0] coeff_1_3, // ufix32
  input [31:0] coeff_1_2, // ufix32
  input [31:0] coeff_1_10, // ufix32
  input [31:0] coeff_1_1, // ufix32
  input [31:0] coeff_1_0, // ufix32
  output [20:0] x_lin, 
  input [20:0] x_adc, // sfix21
  output reg srdyo, // ufix1
  input srdyi,
  input [15:0] section_select

);
   
   
 //X original
  reg [31:0] X_1, X_2, X_3, X_4, X_5, X_6, X_7, X_8; 
 //8 coeff for 8 input
  reg [31:0] coeff_1[0:10], coeff_2[0:10], coeff_3[0:10], coeff_4[0:10];
  reg [31:0] coeff_5[0:10], coeff_6[0:10], coeff_7[0:10], coeff_8[0:10];

  //reset for mul and adder
  reg local_reset;

//calculate coefficient add_a is mean, add_b is Xoriginal mul_a is 1/std
  reg [31:0] add_a, add_b, mul_a, mul_b;
  wire [31:0] add_res, mul_res;
//X_new = (X_original - Mean) / std
  reg [31:0] X_new_1, X_new_2, X_new_3, X_new_4, X_new_5, X_new_6, X_new_7, X_new_8;
  reg [31:0] res_smc;
  reg [15:0] section;
  
  reg [7:0] counter;
  
//Srydi is the enable signal
  always@(posedge clk) begin
    if(reset == 1) begin
	  counter <= 0;
	end
    else if (srdyi == 1) begin
      counter <= counter + 1;
	end
    else if(counter != 0 && counter != 235) begin
      counter <= counter + 1;
    end	
	else begin
	  counter <= 0;
	end
  end

  
 //output of fp to smc
  wire[31:0] x_adc_smc;  
  wire srdyo_smc_fp, srdyo_add, srdyo_mult, srdyo_fp_smc;
  
  reg [20:0] X_tem;
  //2 clk latency
  fp_to_smc_float convert_x(clk, reset, x_adc_smc, X_tem, srdyo_fp_smc, srdyi);
   
 
  smc_float_adder adder(clk, local_reset, add_a, add_b, add_res, srdyo_add, srdyo_mult);
  smc_float_multiplier mul(clk, local_reset, mul_a, mul_b, mul_res, srdyo_mult, srdyo_fp_smc);  
  
  always@(posedge clk) begin
    if(reset == 1) begin
      add_a <= 0;
	  add_b <= 0;
	  mul_a <= 0;
	  mul_b <= 0;
	  local_reset <= 1;
	  srdyo <= 0;
	end
	else begin
      case(counter)
	  //0 for local reset
	    0: begin
           local_reset <= 0;
           srdyo <= 0;			
	     end

	    1: begin
	       X_tem <= x_adc;
		 end
	    2: begin
	       X_tem <= x_adc;
		 end
		3: begin
		   X_tem <= x_adc;
		 end
	    4: begin
	       X_tem <= x_adc;
		   X_1 <= x_adc_smc;
		   section <= section_select;
		 end
	    5: begin
	       X_tem <= x_adc;
           X_2 <= x_adc_smc;
           if(section[15:14] == 2'b11) begin
			  add_a <= X_1;
			  add_b <= neg_mean_4;
		    end
		    else if(section[15:14] == 2'b10) begin
			  add_a <= X_1;
			  add_b <= neg_mean_3;
		    end
		    else if(section[15:14] == 2'b01) begin
			  add_a <= X_1;
			  add_b <= neg_mean_2;
		    end
		    else begin
			  add_a <= X_1;
			  add_b <= neg_mean_1;
		    end		   
	     end
	    6: begin
	       X_tem <= x_adc;
           X_3 <= x_adc_smc;
           if(section[13:12] == 2'b11) begin
			  add_a <= X_2;
			  add_b <= neg_mean_4;
		    end
		    else if(section[13:12] == 2'b10) begin
			  add_a <= X_2;
			  add_b <= neg_mean_3;
		    end
		    else if(section[13:12] == 2'b01) begin
			  add_a <= X_2;
			  add_b <= neg_mean_2;
		    end
		    else begin
			  add_a <= X_2;
			  add_b <= neg_mean_1;
		    end		   
	     end
	    7: begin
	       X_tem <= x_adc;
           X_4 <= x_adc_smc;
           if(section[11:10] == 2'b11) begin
			  add_a <= X_3;
			  add_b <= neg_mean_4;
		    end
		    else if(section[11:10] == 2'b10) begin
			  add_a <= X_3;
			  add_b <= neg_mean_3;
		    end
		    else if(section[11:10] == 2'b01) begin
			  add_a <= X_3;
			  add_b <= neg_mean_2;
		    end
		    else begin
			  add_a <= X_3;
			  add_b <= neg_mean_1;
		    end		   
	     end
	    8: begin
	       X_tem <= x_adc;
           X_5 <= x_adc_smc;
           if(section[9:8] == 2'b11) begin
			  add_a <= X_4;
			  add_b <= neg_mean_4;
		    end
		    else if(section[9:8] == 2'b10) begin
			  add_a <= X_4;
			  add_b <= neg_mean_3;
		    end
		    else if(section[9:8] == 2'b01) begin
			  add_a <= X_4;
			  add_b <= neg_mean_2;
		    end
		    else begin
			  add_a <= X_4;
			  add_b <= neg_mean_1;
		    end		   
	     end
	  //after 8, all input X has been feed into fp to smc;
	    9: begin
           X_6 <= x_adc_smc;
           if(section[7:6] == 2'b11) begin
			  add_a <= X_5;
			  add_b <= neg_mean_4;
		    end
		    else if(section[7:6] == 2'b10) begin
			  add_a <= X_5;
			  add_b <= neg_mean_3;
		    end
		    else if(section[7:6] == 2'b01) begin
			  add_a <= X_5;
			  add_b <= neg_mean_2;
		    end
		    else begin
			  add_a <= X_5;
			  add_b <= neg_mean_1;
		    end		   
	     end
	   10: begin
           X_7 <= x_adc_smc;
           if(section[5:4] == 2'b11) begin
			  add_a <= X_6;
			  add_b <= neg_mean_4;
		    end
		    else if(section[5:4] == 2'b10) begin
			  add_a <= X_6;
			  add_b <= neg_mean_3;
		    end
		    else if(section[5:4] == 2'b01) begin
			  add_a <= X_6;
			  add_b <= neg_mean_2;
		    end
		    else begin
			  add_a <= X_6;
			  add_b <= neg_mean_1;
		    end		   
	     end
	   11: begin
           X_8 <= x_adc_smc;
           if(section[3:2] == 2'b11) begin
			  add_a <= X_7;
			  add_b <= neg_mean_4;
		    end
		    else if(section[3:2] == 2'b10) begin
			  add_a <= X_7;
			  add_b <= neg_mean_3;
		    end
		    else if(section[3:2] == 2'b01) begin
			  add_a <= X_7;
			  add_b <= neg_mean_2;
		    end
		    else begin
			  add_a <= X_7;
			  add_b <= neg_mean_1;
		    end		   
	     end
	   12: begin
           if(section[1:0] == 2'b11) begin
			  add_a <= X_8;
			  add_b <= neg_mean_4;
		    end
		    else if(section[1:0] == 2'b10) begin
			  add_a <= X_8;
			  add_b <= neg_mean_3;
		    end
		    else if(section[1:0] == 2'b01) begin
			  add_a <= X_8;
			  add_b <= neg_mean_2;
		    end
		    else begin
			  add_a <= X_8;
			  add_b <= neg_mean_1;
		    end		   
	     end
     //The first X_original + (-Mean) come into Multiplier at 16.
       15: begin
	        if(section[15:14] == 2'b11) begin
			  mul_a <= recip_stdev_4;
			  mul_b <= add_res;
		    end
		    else if(section[15:14] == 2'b10) begin
			  mul_a <= recip_stdev_3;
			  mul_b <= add_res;
		    end
		    else if(section[15:14] == 2'b01) begin
			  mul_a <= recip_stdev_2;
			  mul_b <= add_res;
		    end
		    else begin
			  mul_a <= recip_stdev_1;
			  mul_b <= add_res;
		    end	        
          end
       16: begin
	        if(section[13:12] == 2'b11) begin
			  mul_a <= recip_stdev_4;
			  mul_b <= add_res;
		    end
		    else if(section[13:12] == 2'b10) begin
			  mul_a <= recip_stdev_3;
			  mul_b <= add_res;
		    end
		    else if(section[13:12] == 2'b01) begin
			  mul_a <= recip_stdev_2;
			  mul_b <= add_res;
		    end
		    else begin
			  mul_a <= recip_stdev_1;
			  mul_b <= add_res;
		    end	        
          end
       17: begin
	        if(section[11:10] == 2'b11) begin
			  mul_a <= recip_stdev_4;
			  mul_b <= add_res;
		    end
		    else if(section[11:10] == 2'b10) begin
			  mul_a <= recip_stdev_3;
			  mul_b <= add_res;
		    end
		    else if(section[11:10] == 2'b01) begin
			  mul_a <= recip_stdev_2;
			  mul_b <= add_res;
		    end
		    else begin
			  mul_a <= recip_stdev_1;
			  mul_b <= add_res;
		    end	        
          end
       18: begin
	        if(section[9:8] == 2'b11) begin
			  mul_a <= recip_stdev_4;
			  mul_b <= add_res;
		    end
		    else if(section[9:8] == 2'b10) begin
			  mul_a <= recip_stdev_3;
			  mul_b <= add_res;
		    end
		    else if(section[9:8] == 2'b01) begin
			  mul_a <= recip_stdev_2;
			  mul_b <= add_res;
		    end
		    else begin
			  mul_a <= recip_stdev_1;
			  mul_b <= add_res;
		    end	        
          end
       19: begin
	        if(section[7:6] == 2'b11) begin
			  mul_a <= recip_stdev_4;
			  mul_b <= add_res;
		    end
		    else if(section[7:6] == 2'b10) begin
			  mul_a <= recip_stdev_3;
			  mul_b <= add_res;
		    end
		    else if(section[7:6] == 2'b01) begin
			  mul_a <= recip_stdev_2;
			  mul_b <= add_res;
		    end
		    else begin
			  mul_a <= recip_stdev_1;
			  mul_b <= add_res;
		    end	        
          end
       20: begin
	        if(section[5:4] == 2'b11) begin
			  mul_a <= recip_stdev_4;
			  mul_b <= add_res;
		    end
		    else if(section[5:4] == 2'b10) begin
			  mul_a <= recip_stdev_3;
			  mul_b <= add_res;
		    end
		    else if(section[5:4] == 2'b01) begin
			  mul_a <= recip_stdev_2;
			  mul_b <= add_res;
		    end
		    else begin
			  mul_a <= recip_stdev_1;
			  mul_b <= add_res;
		    end	        
           end
	//At 22, the multiplier output the first result (Xoriginal - Mean) * 1/std
       22: begin
	//Get the coeff of first input
	        if(section[15:14] == 2'b11) begin
	  	      X_new_1 <= mul_res;
	          coeff_1[0] <= coeff_4_0;
		      coeff_1[1] <= coeff_4_1;
		      coeff_1[2] <= coeff_4_2;
		      coeff_1[3] <= coeff_4_3;
		      coeff_1[4] <= coeff_4_4;
		      coeff_1[5] <= coeff_4_5;
		      coeff_1[6] <= coeff_4_6;
		      coeff_1[7] <= coeff_4_7;
		      coeff_1[8] <= coeff_4_8;
		      coeff_1[9] <= coeff_4_9;
		      coeff_1[10] <= coeff_4_10;
	        end
	        else if(section[15:14] == 2'b10) begin
	  	      X_new_1 <= mul_res;
	          coeff_1[0] <= coeff_3_0;
		      coeff_1[1] <= coeff_3_1;
		      coeff_1[2] <= coeff_3_2;
		      coeff_1[3] <= coeff_3_3;
		      coeff_1[4] <= coeff_3_4;
		      coeff_1[5] <= coeff_3_5;
		      coeff_1[6] <= coeff_3_6;
		      coeff_1[7] <= coeff_3_7;
		      coeff_1[8] <= coeff_3_8;
		      coeff_1[9] <= coeff_3_9;
		      coeff_1[10] <= coeff_3_10;
	        end
	        else if(section[15:14] == 2'b01) begin
	  	      X_new_1 <= mul_res;
	          coeff_1[0] <= coeff_2_0;
		      coeff_1[1] <= coeff_2_1;
		      coeff_1[2] <= coeff_2_2;
		      coeff_1[3] <= coeff_2_3;
		      coeff_1[4] <= coeff_2_4;
		      coeff_1[5] <= coeff_2_5;
		      coeff_1[6] <= coeff_2_6;
		      coeff_1[7] <= coeff_2_7;
		      coeff_1[8] <= coeff_2_8;
		      coeff_1[9] <= coeff_2_9;
		      coeff_1[10] <= coeff_2_10;
	        end
	        else begin
	  	      X_new_1 <= mul_res;
	          coeff_1[0] <= coeff_1_0;
		      coeff_1[1] <= coeff_1_1;
		      coeff_1[2] <= coeff_1_2;
		      coeff_1[3] <= coeff_1_3;
		      coeff_1[4] <= coeff_1_4;
		      coeff_1[5] <= coeff_1_5;
		      coeff_1[6] <= coeff_1_6;
		      coeff_1[7] <= coeff_1_7;
		      coeff_1[8] <= coeff_1_8;
		      coeff_1[9] <= coeff_1_9;
		      coeff_1[10] <= coeff_1_10;
	        end
	        if(section[3:2] == 2'b11) begin
			  mul_a <= recip_stdev_4;
			  mul_b <= add_res;
		    end
		    else if(section[3:2] == 2'b10) begin
			  mul_a <= recip_stdev_3;
			  mul_b <= add_res;
		    end
		    else if(section[3:2] == 2'b01) begin
			  mul_a <= recip_stdev_2;
			  mul_b <= add_res;
		    end
		    else begin
			  mul_a <= recip_stdev_1;
			  mul_b <= add_res;
		    end	        
          end
		//At 23 all (Xorignal - Mean) and 1/std has feeded into multiplier
       23: begin
	        if(section[13:12] == 2'b11) begin
	  	      X_new_2 <= mul_res;
	          coeff_2[0] <= coeff_4_0;
		      coeff_2[1] <= coeff_4_1;
		      coeff_2[2] <= coeff_4_2;
		      coeff_2[3] <= coeff_4_3;
		      coeff_2[4] <= coeff_4_4;
		      coeff_2[5] <= coeff_4_5;
		      coeff_2[6] <= coeff_4_6;
		      coeff_2[7] <= coeff_4_7;
		      coeff_2[8] <= coeff_4_8;
		      coeff_2[9] <= coeff_4_9;
		      coeff_2[10] <= coeff_4_10;
	        end
	        else if(section[13:12] == 2'b10) begin
	  	      X_new_2 <= mul_res;
	          coeff_2[0] <= coeff_3_0;
		      coeff_2[1] <= coeff_3_1;
		      coeff_2[2] <= coeff_3_2;
		      coeff_2[3] <= coeff_3_3;
		      coeff_2[4] <= coeff_3_4;
		      coeff_2[5] <= coeff_3_5;
		      coeff_2[6] <= coeff_3_6;
		      coeff_2[7] <= coeff_3_7;
		      coeff_2[8] <= coeff_3_8;
		      coeff_2[9] <= coeff_3_9;
		      coeff_2[10] <= coeff_3_10;
	        end
	        else if(section[13:12] == 2'b01) begin
	  	      X_new_2 <= mul_res;
	          coeff_2[0] <= coeff_2_0;
		      coeff_2[1] <= coeff_2_1;
		      coeff_2[2] <= coeff_2_2;
		      coeff_2[3] <= coeff_2_3;
		      coeff_2[4] <= coeff_2_4;
		      coeff_2[5] <= coeff_2_5;
		      coeff_2[6] <= coeff_2_6;
		      coeff_2[7] <= coeff_2_7;
		      coeff_2[8] <= coeff_2_8;
		      coeff_2[9] <= coeff_2_9;
		      coeff_2[10] <= coeff_2_10;
	        end
			else begin
	  	      X_new_2 <= mul_res;
	          coeff_2[0] <= coeff_1_0;
		      coeff_2[1] <= coeff_1_1;
		      coeff_2[2] <= coeff_1_2;
		      coeff_2[3] <= coeff_1_3;
		      coeff_2[4] <= coeff_1_4;
		      coeff_2[5] <= coeff_1_5;
		      coeff_2[6] <= coeff_1_6;
		      coeff_2[7] <= coeff_1_7;
		      coeff_2[8] <= coeff_1_8;
		      coeff_2[9] <= coeff_1_9;
		      coeff_2[10] <= coeff_1_10;
	        end
	        if(section[1:0] == 2'b11) begin
			  mul_a <= recip_stdev_4;
			  mul_b <= add_res;
		    end
		    else if(section[1:0] == 2'b10) begin
			  mul_a <= recip_stdev_3;
			  mul_b <= add_res;
		    end
		    else if(section[1:0] == 2'b01) begin
			  mul_a <= recip_stdev_2;
			  mul_b <= add_res;
		    end
		    else begin
			  mul_a <= recip_stdev_1;
			  mul_b <= add_res;
		    end	        
          end
       24: begin
	        if(section[11:10] == 2'b11) begin
	  	      X_new_3 <= mul_res;
	          coeff_3[0] <= coeff_4_0;
		      coeff_3[1] <= coeff_4_1;
		      coeff_3[2] <= coeff_4_2;
		      coeff_3[3] <= coeff_4_3;
		      coeff_3[4] <= coeff_4_4;
		      coeff_3[5] <= coeff_4_5;
		      coeff_3[6] <= coeff_4_6;
		      coeff_3[7] <= coeff_4_7;
		      coeff_3[8] <= coeff_4_8;
		      coeff_3[9] <= coeff_4_9;
		      coeff_3[10] <= coeff_4_10;
	        end
	        else if(section[11:10] == 2'b10) begin
	  	      X_new_3 <= mul_res;
	          coeff_3[0] <= coeff_3_0;
		      coeff_3[1] <= coeff_3_1;
		      coeff_3[2] <= coeff_3_2;
		      coeff_3[3] <= coeff_3_3;
		      coeff_3[4] <= coeff_3_4;
		      coeff_3[5] <= coeff_3_5;
		      coeff_3[6] <= coeff_3_6;
		      coeff_3[7] <= coeff_3_7;
		      coeff_3[8] <= coeff_3_8;
		      coeff_3[9] <= coeff_3_9;
		      coeff_3[10] <= coeff_3_10;
	        end
	        else if(section[11:10] == 2'b01) begin
	  	      X_new_3 <= mul_res;
	          coeff_3[0] <= coeff_2_0;
		      coeff_3[1] <= coeff_2_1;
		      coeff_3[2] <= coeff_2_2;
		      coeff_3[3] <= coeff_2_3;
		      coeff_3[4] <= coeff_2_4;
		      coeff_3[5] <= coeff_2_5;
		      coeff_3[6] <= coeff_2_6;
		      coeff_3[7] <= coeff_2_7;
		      coeff_3[8] <= coeff_2_8;
		      coeff_3[9] <= coeff_2_9;
		      coeff_3[10] <= coeff_2_10;
	        end
			else begin
	  	      X_new_3 <= mul_res;
	          coeff_3[0] <= coeff_1_0;
		      coeff_3[1] <= coeff_1_1;
		      coeff_3[2] <= coeff_1_2;
		      coeff_3[3] <= coeff_1_3;
		      coeff_3[4] <= coeff_1_4;
		      coeff_3[5] <= coeff_1_5;
		      coeff_3[6] <= coeff_1_6;
		      coeff_3[7] <= coeff_1_7;
		      coeff_3[8] <= coeff_1_8;
		      coeff_3[9] <= coeff_1_9;
		      coeff_3[10] <= coeff_1_10;
	        end        
          end		  
       25: begin
	        if(section[9:8] == 2'b11) begin
	  	      X_new_4 <= mul_res;
	          coeff_4[0] <= coeff_4_0;
		      coeff_4[1] <= coeff_4_1;
		      coeff_4[2] <= coeff_4_2;
		      coeff_4[3] <= coeff_4_3;
		      coeff_4[4] <= coeff_4_4;
		      coeff_4[5] <= coeff_4_5;
		      coeff_4[6] <= coeff_4_6;
		      coeff_4[7] <= coeff_4_7;
		      coeff_4[8] <= coeff_4_8;
		      coeff_4[9] <= coeff_4_9;
		      coeff_4[10] <= coeff_4_10;
	        end
	        else if(section[9:8] == 2'b10) begin
	  	      X_new_4 <= mul_res;
	          coeff_4[0] <= coeff_3_0;
		      coeff_4[1] <= coeff_3_1;
		      coeff_4[2] <= coeff_3_2;
		      coeff_4[3] <= coeff_3_3;
		      coeff_4[4] <= coeff_3_4;
		      coeff_4[5] <= coeff_3_5;
		      coeff_4[6] <= coeff_3_6;
		      coeff_4[7] <= coeff_3_7;
		      coeff_4[8] <= coeff_3_8;
		      coeff_4[9] <= coeff_3_9;
		      coeff_4[10] <= coeff_3_10;
	        end
	        else if(section[9:8] == 2'b01) begin
	  	      X_new_4 <= mul_res;
	          coeff_4[0] <= coeff_2_0;
		      coeff_4[1] <= coeff_2_1;
		      coeff_4[2] <= coeff_2_2;
		      coeff_4[3] <= coeff_2_3;
		      coeff_4[4] <= coeff_2_4;
		      coeff_4[5] <= coeff_2_5;
		      coeff_4[6] <= coeff_2_6;
		      coeff_4[7] <= coeff_2_7;
		      coeff_4[8] <= coeff_2_8;
		      coeff_4[9] <= coeff_2_9;
		      coeff_4[10] <= coeff_2_10;
	        end
			else begin
	  	      X_new_4 <= mul_res;
	          coeff_4[0] <= coeff_1_0;
		      coeff_4[1] <= coeff_1_1;
		      coeff_4[2] <= coeff_1_2;
		      coeff_4[3] <= coeff_1_3;
		      coeff_4[4] <= coeff_1_4;
		      coeff_4[5] <= coeff_1_5;
		      coeff_4[6] <= coeff_1_6;
		      coeff_4[7] <= coeff_1_7;
		      coeff_4[8] <= coeff_1_8;
		      coeff_4[9] <= coeff_1_9;
		      coeff_4[10] <= coeff_1_10;
	        end        
          end
		  	  
       26: begin
	        if(section[7:6] == 2'b11) begin
	  	      X_new_5 <= mul_res;
	          coeff_5[0] <= coeff_4_0;
		      coeff_5[1] <= coeff_4_1;
		      coeff_5[2] <= coeff_4_2;
		      coeff_5[3] <= coeff_4_3;
		      coeff_5[4] <= coeff_4_4;
		      coeff_5[5] <= coeff_4_5;
		      coeff_5[6] <= coeff_4_6;
		      coeff_5[7] <= coeff_4_7;
		      coeff_5[8] <= coeff_4_8;
		      coeff_5[9] <= coeff_4_9;
		      coeff_5[10] <= coeff_4_10;
	        end
	        else if(section[7:6] == 2'b10) begin
	  	      X_new_5 <= mul_res;
	          coeff_5[0] <= coeff_3_0;
		      coeff_5[1] <= coeff_3_1;
		      coeff_5[2] <= coeff_3_2;
		      coeff_5[3] <= coeff_3_3;
		      coeff_5[4] <= coeff_3_4;
		      coeff_5[5] <= coeff_3_5;
		      coeff_5[6] <= coeff_3_6;
		      coeff_5[7] <= coeff_3_7;
		      coeff_5[8] <= coeff_3_8;
		      coeff_5[9] <= coeff_3_9;
		      coeff_5[10] <= coeff_3_10;
	        end
	        else if(section[7:6] == 2'b01) begin
	  	      X_new_5 <= mul_res;
	          coeff_5[0] <= coeff_2_0;
		      coeff_5[1] <= coeff_2_1;
		      coeff_5[2] <= coeff_2_2;
		      coeff_5[3] <= coeff_2_3;
		      coeff_5[4] <= coeff_2_4;
		      coeff_5[5] <= coeff_2_5;
		      coeff_5[6] <= coeff_2_6;
		      coeff_5[7] <= coeff_2_7;
		      coeff_5[8] <= coeff_2_8;
		      coeff_5[9] <= coeff_2_9;
		      coeff_5[10] <= coeff_2_10;
	        end
			else begin
	  	      X_new_5 <= mul_res;
	          coeff_5[0] <= coeff_1_0;
		      coeff_5[1] <= coeff_1_1;
		      coeff_5[2] <= coeff_1_2;
		      coeff_5[3] <= coeff_1_3;
		      coeff_5[4] <= coeff_1_4;
		      coeff_5[5] <= coeff_1_5;
		      coeff_5[6] <= coeff_1_6;
		      coeff_5[7] <= coeff_1_7;
		      coeff_5[8] <= coeff_1_8;
		      coeff_5[9] <= coeff_1_9;
		      coeff_5[10] <= coeff_1_10;
	        end        
          end		  

       27: begin
	        if(section[5:4] == 2'b11) begin
	  	      X_new_6 <= mul_res;
	          coeff_6[0] <= coeff_4_0;
		      coeff_6[1] <= coeff_4_1;
		      coeff_6[2] <= coeff_4_2;
		      coeff_6[3] <= coeff_4_3;
		      coeff_6[4] <= coeff_4_4;
		      coeff_6[5] <= coeff_4_5;
		      coeff_6[6] <= coeff_4_6;
		      coeff_6[7] <= coeff_4_7;
		      coeff_6[8] <= coeff_4_8;
		      coeff_6[9] <= coeff_4_9;
		      coeff_6[10] <= coeff_4_10;
	        end
	        else if(section[5:4] == 2'b10) begin
	  	      X_new_6 <= mul_res;
	          coeff_6[0] <= coeff_3_0;
		      coeff_6[1] <= coeff_3_1;
		      coeff_6[2] <= coeff_3_2;
		      coeff_6[3] <= coeff_3_3;
		      coeff_6[4] <= coeff_3_4;
		      coeff_6[5] <= coeff_3_5;
		      coeff_6[6] <= coeff_3_6;
		      coeff_6[7] <= coeff_3_7;
		      coeff_6[8] <= coeff_3_8;
		      coeff_6[9] <= coeff_3_9;
		      coeff_6[10] <= coeff_3_10;
	        end
	        else if(section[5:4] == 2'b01) begin
	  	      X_new_6 <= mul_res;
	          coeff_6[0] <= coeff_2_0;
		      coeff_6[1] <= coeff_2_1;
		      coeff_6[2] <= coeff_2_2;
		      coeff_6[3] <= coeff_2_3;
		      coeff_6[4] <= coeff_2_4;
		      coeff_6[5] <= coeff_2_5;
		      coeff_6[6] <= coeff_2_6;
		      coeff_6[7] <= coeff_2_7;
		      coeff_6[8] <= coeff_2_8;
		      coeff_6[9] <= coeff_2_9;
		      coeff_6[10] <= coeff_2_10;
	        end
			else begin
	  	      X_new_6 <= mul_res;
	          coeff_6[0] <= coeff_1_0;
		      coeff_6[1] <= coeff_1_1;
		      coeff_6[2] <= coeff_1_2;
		      coeff_6[3] <= coeff_1_3;
		      coeff_6[4] <= coeff_1_4;
		      coeff_6[5] <= coeff_1_5;
		      coeff_6[6] <= coeff_1_6;
		      coeff_6[7] <= coeff_1_7;
		      coeff_6[8] <= coeff_1_8;
		      coeff_6[9] <= coeff_1_9;
		      coeff_6[10] <= coeff_1_10;
	        end        
          end

       28: begin
	        if(section[3:2] == 2'b11) begin
	  	      X_new_7 <= mul_res;
	          coeff_7[0] <= coeff_4_0;
		      coeff_7[1] <= coeff_4_1;
		      coeff_7[2] <= coeff_4_2;
		      coeff_7[3] <= coeff_4_3;
		      coeff_7[4] <= coeff_4_4;
		      coeff_7[5] <= coeff_4_5;
		      coeff_7[6] <= coeff_4_6;
		      coeff_7[7] <= coeff_4_7;
		      coeff_7[8] <= coeff_4_8;
		      coeff_7[9] <= coeff_4_9;
		      coeff_7[10] <= coeff_4_10;
	        end
	        else if(section[3:2] == 2'b10) begin
	  	      X_new_7 <= mul_res;
	          coeff_7[0] <= coeff_3_0;
		      coeff_7[1] <= coeff_3_1;
		      coeff_7[2] <= coeff_3_2;
		      coeff_7[3] <= coeff_3_3;
		      coeff_7[4] <= coeff_3_4;
		      coeff_7[5] <= coeff_3_5;
		      coeff_7[6] <= coeff_3_6;
		      coeff_7[7] <= coeff_3_7;
		      coeff_7[8] <= coeff_3_8;
		      coeff_7[9] <= coeff_3_9;
		      coeff_7[10] <= coeff_3_10;
	        end
	        else if(section[3:2] == 2'b01) begin
	  	      X_new_7 <= mul_res;
	          coeff_7[0] <= coeff_2_0;
		      coeff_7[1] <= coeff_2_1;
		      coeff_7[2] <= coeff_2_2;
		      coeff_7[3] <= coeff_2_3;
		      coeff_7[4] <= coeff_2_4;
		      coeff_7[5] <= coeff_2_5;
		      coeff_7[6] <= coeff_2_6;
		      coeff_7[7] <= coeff_2_7;
		      coeff_7[8] <= coeff_2_8;
		      coeff_7[9] <= coeff_2_9;
		      coeff_7[10] <= coeff_2_10;
	        end
			else begin
	  	      X_new_7 <= mul_res;
	          coeff_7[0] <= coeff_1_0;
		      coeff_7[1] <= coeff_1_1;
		      coeff_7[2] <= coeff_1_2;
		      coeff_7[3] <= coeff_1_3;
		      coeff_7[4] <= coeff_1_4;
		      coeff_7[5] <= coeff_1_5;
		      coeff_7[6] <= coeff_1_6;
		      coeff_7[7] <= coeff_1_7;
		      coeff_7[8] <= coeff_1_8;
		      coeff_7[9] <= coeff_1_9;
		      coeff_7[10] <= coeff_1_10;
	        end        
          end
		  
       29: begin
	        if(section[1:0] == 2'b11) begin
	  	      X_new_8 <= mul_res;
	          coeff_8[0] <= coeff_4_0;
		      coeff_8[1] <= coeff_4_1;
		      coeff_8[2] <= coeff_4_2;
		      coeff_8[3] <= coeff_4_3;
		      coeff_8[4] <= coeff_4_4;
		      coeff_8[5] <= coeff_4_5;
		      coeff_8[6] <= coeff_4_6;
		      coeff_8[7] <= coeff_4_7;
		      coeff_8[8] <= coeff_4_8;
		      coeff_8[9] <= coeff_4_9;
		      coeff_8[10] <= coeff_4_10;
	        end
	        else if(section[1:0]  == 2'b10) begin
	  	      X_new_8 <= mul_res;
	          coeff_8[0] <= coeff_3_0;
		      coeff_8[1] <= coeff_3_1;
		      coeff_8[2] <= coeff_3_2;
		      coeff_8[3] <= coeff_3_3;
		      coeff_8[4] <= coeff_3_4;
		      coeff_8[5] <= coeff_3_5;
		      coeff_8[6] <= coeff_3_6;
		      coeff_8[7] <= coeff_3_7;
		      coeff_8[8] <= coeff_3_8;
		      coeff_8[9] <= coeff_3_9;
		      coeff_8[10] <= coeff_3_10;
	        end
	        else if(section[1:0]  == 2'b01) begin
	  	      X_new_8 <= mul_res;
	          coeff_8[0] <= coeff_2_0;
		      coeff_8[1] <= coeff_2_1;
		      coeff_8[2] <= coeff_2_2;
		      coeff_8[3] <= coeff_2_3;
		      coeff_8[4] <= coeff_2_4;
		      coeff_8[5] <= coeff_2_5;
		      coeff_8[6] <= coeff_2_6;
		      coeff_8[7] <= coeff_2_7;
		      coeff_8[8] <= coeff_2_8;
		      coeff_8[9] <= coeff_2_9;
		      coeff_8[10] <= coeff_2_10;
	        end
			else begin
	  	      X_new_8 <= mul_res;
	          coeff_8[0] <= coeff_1_0;
		      coeff_8[1] <= coeff_1_1;
		      coeff_8[2] <= coeff_1_2;
		      coeff_8[3] <= coeff_1_3;
		      coeff_8[4] <= coeff_1_4;
		      coeff_8[5] <= coeff_1_5;
		      coeff_8[6] <= coeff_1_6;
		      coeff_8[7] <= coeff_1_7;
		      coeff_8[8] <= coeff_1_8;
		      coeff_8[9] <= coeff_1_9;
		      coeff_8[10] <= coeff_1_10;
	        end        
          end		  
		  
	//	After 30, all 8 inputs X_new was gotten.
    //At 31 reset adder and multiplier
       31: begin
	         add_a <= 0;
			 add_b <= 0;
			 mul_a <= 0;
			 mul_b <= 0;
			 X_tem <= 0;
			 local_reset <= 1;
	       end
	 
	 //At 40, calculate Xnew to output  
	   40: begin
	         local_reset <= 0;
		   end
	//At 41, do a10 + 0 for first input;
	   41: begin
	         add_a <= coeff_1[10];
			 add_b <= 0;
	       end
	   42: begin
	         add_a <= coeff_2[10];
			 add_b <= 0;
	       end
	   43: begin
	         add_a <= coeff_3[10];
			 add_b <= 0;
	       end
	   44: begin
	         add_a <= coeff_4[10];
			 add_b <= 0;
	       end
	   45: begin
	         add_a <= coeff_5[10];
			 add_b <= 0;
	       end
	   46: begin
	         add_a <= coeff_6[10];
			 add_b <= 0;
	       end
	   47: begin
	         add_a <= coeff_7[10];
			 add_b <= 0;
	       end
	   48: begin
	         add_a <= coeff_8[10];
			 add_b <= 0;
	       end	
    //At 51 the a10 + 0 of first input outputs
        51: begin
              mul_a <= add_res;
			  mul_b <= X_new_1;
            end		
        52: begin
              mul_a <= add_res;
			  mul_b <= X_new_2;
            end	
        53: begin
              mul_a <= add_res;
			  mul_b <= X_new_3;
            end	
        54: begin
              mul_a <= add_res;
			  mul_b <= X_new_4;
            end	
        55: begin
              mul_a <= add_res;
			  mul_b <= X_new_5;
            end	
        56: begin
              mul_a <= add_res;
			  mul_b <= X_new_6;
            end
        57: begin 
              mul_a <= add_res;
			  mul_b <= X_new_7;              
            end			
	//At 58, the multiplier will output X_new_1 * a10
        58: begin
              mul_a <= add_res;
			  mul_b <= X_new_8;
			  add_a <= coeff_1[9];
			  add_b <= mul_res;
            end	
        59: begin
			  add_a <= coeff_2[9];
			  add_b <= mul_res;
            end	
        60: begin
			  add_a <= coeff_3[9];
			  add_b <= mul_res;
            end	
        61: begin
			  add_a <= coeff_4[9];
			  add_b <= mul_res;
            end	
        62: begin
			  add_a <= coeff_5[9];
			  add_b <= mul_res;
            end	
        63: begin
			  add_a <= coeff_6[9];
			  add_b <= mul_res;
            end	
        64: begin
			  add_a <= coeff_7[9];
			  add_b <= mul_res;
            end	
        65: begin
			  add_a <= coeff_8[9];
			  add_b <= mul_res;
            end	
	//At 68 a9 + x(a10) output
	    68: begin
		      mul_a <= add_res;
			  mul_b <= X_new_1;
			end
	    69: begin
		      mul_a <= add_res;
			  mul_b <= X_new_2;
			end			
	    70: begin
		      mul_a <= add_res;
			  mul_b <= X_new_3;
			end
	    71: begin
		      mul_a <= add_res;
			  mul_b <= X_new_4;
			end
	    72: begin
		      mul_a <= add_res;
			  mul_b <= X_new_5;
			end
	    73: begin
		      mul_a <= add_res;
			  mul_b <= X_new_6;
			end
	    74: begin
		      mul_a <= add_res;
			  mul_b <= X_new_7;
			end		
	//At 75, x(a9 + x(a10)) output
	    75: begin
		      mul_a <= add_res;
			  mul_b <= X_new_8;
			  add_a <= coeff_1[8];
			  add_b <= mul_res;
			end
	    76: begin
			  add_a <= coeff_2[8];
			  add_b <= mul_res;
			end	
	    77: begin
			  add_a <= coeff_3[8];
			  add_b <= mul_res;
			end	
	    78: begin
			  add_a <= coeff_4[8];
			  add_b <= mul_res;
			end	
	    79: begin
			  add_a <= coeff_5[8];
			  add_b <= mul_res;
			end	
	    80: begin
			  add_a <= coeff_6[8];
			  add_b <= mul_res;
			end	
	    81: begin
			  add_a <= coeff_7[8];
			  add_b <= mul_res;
			end	
	    82: begin
			  add_a <= coeff_8[8];
			  add_b <= mul_res;
			end	

			
	    85: begin
		      mul_a <= add_res;
			  mul_b <= X_new_1;
			end
	    86: begin
		      mul_a <= add_res;
			  mul_b <= X_new_2;
			end			
	    87: begin
		      mul_a <= add_res;
			  mul_b <= X_new_3;
			end
	    88: begin
		      mul_a <= add_res;
			  mul_b <= X_new_4;
			end
	    89: begin
		      mul_a <= add_res;
			  mul_b <= X_new_5;
			end
	    90: begin
		      mul_a <= add_res;
			  mul_b <= X_new_6;
			end
	    91: begin
		      mul_a <= add_res;
			  mul_b <= X_new_7;
			end		

	    92: begin
		      mul_a <= add_res;
			  mul_b <= X_new_8;
			  add_a <= coeff_1[7];
			  add_b <= mul_res;
			end
	    93: begin
			  add_a <= coeff_2[7];
			  add_b <= mul_res;
			end	
	    94: begin
			  add_a <= coeff_3[7];
			  add_b <= mul_res;
			end	
	    95: begin
			  add_a <= coeff_4[7];
			  add_b <= mul_res;
			end	
	    96: begin
			  add_a <= coeff_5[7];
			  add_b <= mul_res;
			end	
	    97: begin
			  add_a <= coeff_6[7];
			  add_b <= mul_res;
			end	
	    98: begin
			  add_a <= coeff_7[7];
			  add_b <= mul_res;
			end	
	    99: begin
			  add_a <= coeff_8[7];
			  add_b <= mul_res;
			end	

	   102: begin
		      mul_a <= add_res;
			  mul_b <= X_new_1;
			end
	   103: begin
		      mul_a <= add_res;
			  mul_b <= X_new_2;
			end			
	   104: begin
		      mul_a <= add_res;
			  mul_b <= X_new_3;
			end
	   105: begin
		      mul_a <= add_res;
			  mul_b <= X_new_4;
			end
	   106: begin
		      mul_a <= add_res;
			  mul_b <= X_new_5;
			end
	   107: begin
		      mul_a <= add_res;
			  mul_b <= X_new_6;
			end
	   108: begin
		      mul_a <= add_res;
			  mul_b <= X_new_7;
			end		

	   109: begin
		      mul_a <= add_res;
			  mul_b <= X_new_8;
			  add_a <= coeff_1[6];
			  add_b <= mul_res;
			end
	   110: begin
			  add_a <= coeff_2[6];
			  add_b <= mul_res;
			end	
	   111: begin
			  add_a <= coeff_3[6];
			  add_b <= mul_res;
			end	
	   112: begin
			  add_a <= coeff_4[6];
			  add_b <= mul_res;
			end	
	   113: begin
			  add_a <= coeff_5[6];
			  add_b <= mul_res;
			end	
	   114: begin
			  add_a <= coeff_6[6];
			  add_b <= mul_res;
			end	
	   115: begin
			  add_a <= coeff_7[6];
			  add_b <= mul_res;
			end	
	   116: begin
			  add_a <= coeff_8[6];
			  add_b <= mul_res;
			end	
	
	
	   119: begin
		      mul_a <= add_res;
			  mul_b <= X_new_1;
			end
	   120: begin
		      mul_a <= add_res;
			  mul_b <= X_new_2;
			end			
	   121: begin
		      mul_a <= add_res;
			  mul_b <= X_new_3;
			end
	   122: begin
		      mul_a <= add_res;
			  mul_b <= X_new_4;
			end
	   123: begin
		      mul_a <= add_res;
			  mul_b <= X_new_5;
			end
	   124: begin
		      mul_a <= add_res;
			  mul_b <= X_new_6;
			end
	   125: begin
		      mul_a <= add_res;
			  mul_b <= X_new_7;
			end		

	   126: begin
		      mul_a <= add_res;
			  mul_b <= X_new_8;
			  add_a <= coeff_1[5];
			  add_b <= mul_res;
			end
	   127: begin
			  add_a <= coeff_2[5];
			  add_b <= mul_res;
			end	
	   128: begin
			  add_a <= coeff_3[5];
			  add_b <= mul_res;
			end	
	   129: begin
			  add_a <= coeff_4[5];
			  add_b <= mul_res;
			end	
	   130: begin
			  add_a <= coeff_5[5];
			  add_b <= mul_res;
			end	
	   131: begin
			  add_a <= coeff_6[5];
			  add_b <= mul_res;
			end	
	   132: begin
			  add_a <= coeff_7[5];
			  add_b <= mul_res;
			end	
	   133: begin
			  add_a <= coeff_8[5];
			  add_b <= mul_res;
			end	
			
	   136: begin
		      mul_a <= add_res;
			  mul_b <= X_new_1;
			end
	   137: begin
		      mul_a <= add_res;
			  mul_b <= X_new_2;
			end			
	   138: begin
		      mul_a <= add_res;
			  mul_b <= X_new_3;
			end
	   139: begin
		      mul_a <= add_res;
			  mul_b <= X_new_4;
			end
	   140: begin
		      mul_a <= add_res;
			  mul_b <= X_new_5;
			end
	   141: begin
		      mul_a <= add_res;
			  mul_b <= X_new_6;
			end
	   142: begin
		      mul_a <= add_res;
			  mul_b <= X_new_7;
			end		

	   143: begin
		      mul_a <= add_res;
			  mul_b <= X_new_8;
			  add_a <= coeff_1[4];
			  add_b <= mul_res;
			end
	   144: begin
			  add_a <= coeff_2[4];
			  add_b <= mul_res;
			end	
	   145: begin
			  add_a <= coeff_3[4];
			  add_b <= mul_res;
			end	
	   146: begin
			  add_a <= coeff_4[4];
			  add_b <= mul_res;
			end	
	   147: begin
			  add_a <= coeff_5[4];
			  add_b <= mul_res;
			end	
	   148: begin
			  add_a <= coeff_6[4];
			  add_b <= mul_res;
			end	
	   149: begin
			  add_a <= coeff_7[4];
			  add_b <= mul_res;
			end	
	   150: begin
			  add_a <= coeff_8[4];
			  add_b <= mul_res;
			end	
			
	   153: begin
		      mul_a <= add_res;
			  mul_b <= X_new_1;
			end
	   154: begin
		      mul_a <= add_res;
			  mul_b <= X_new_2;
			end			
	   155: begin
		      mul_a <= add_res;
			  mul_b <= X_new_3;
			end
	   156: begin
		      mul_a <= add_res;
			  mul_b <= X_new_4;
			end
	   157: begin
		      mul_a <= add_res;
			  mul_b <= X_new_5;
			end
	   158: begin
		      mul_a <= add_res;
			  mul_b <= X_new_6;
			end
	   159: begin
		      mul_a <= add_res;
			  mul_b <= X_new_7;
			end		

	   160: begin
		      mul_a <= add_res;
			  mul_b <= X_new_8;
			  add_a <= coeff_1[3];
			  add_b <= mul_res;
			end
	   161: begin
			  add_a <= coeff_2[3];
			  add_b <= mul_res;
			end	
	   162: begin
			  add_a <= coeff_3[3];
			  add_b <= mul_res;
			end	
	   163: begin
			  add_a <= coeff_4[3];
			  add_b <= mul_res;
			end	
	   164: begin
			  add_a <= coeff_5[3];
			  add_b <= mul_res;
			end	
	   165: begin
			  add_a <= coeff_6[3];
			  add_b <= mul_res;
			end	
	   166: begin
			  add_a <= coeff_7[3];
			  add_b <= mul_res;
			end	
	   167: begin
			  add_a <= coeff_8[3];
			  add_b <= mul_res;
			end	

	   170: begin
		      mul_a <= add_res;
			  mul_b <= X_new_1;
			end
	   171: begin
		      mul_a <= add_res;
			  mul_b <= X_new_2;
			end			
	   172: begin
		      mul_a <= add_res;
			  mul_b <= X_new_3;
			end
	   173: begin
		      mul_a <= add_res;
			  mul_b <= X_new_4;
			end
	   174: begin
		      mul_a <= add_res;
			  mul_b <= X_new_5;
			end
	   175: begin
		      mul_a <= add_res;
			  mul_b <= X_new_6;
			end
	   176: begin
		      mul_a <= add_res;
			  mul_b <= X_new_7;
			end		

	   177: begin
		      mul_a <= add_res;
			  mul_b <= X_new_8;
			  add_a <= coeff_1[2];
			  add_b <= mul_res;
			end
	   178: begin
			  add_a <= coeff_2[2];
			  add_b <= mul_res;
			end	
	   179: begin
			  add_a <= coeff_3[2];
			  add_b <= mul_res;
			end	
	   180: begin
			  add_a <= coeff_4[2];
			  add_b <= mul_res;
			end	
	   181: begin
			  add_a <= coeff_5[2];
			  add_b <= mul_res;
			end	
	   182: begin
			  add_a <= coeff_6[2];
			  add_b <= mul_res;
			end	
	   183: begin
			  add_a <= coeff_7[2];
			  add_b <= mul_res;
			end	
	   184: begin
			  add_a <= coeff_8[2];
			  add_b <= mul_res;
			end	

	   187: begin
		      mul_a <= add_res;
			  mul_b <= X_new_1;
			end
	   188: begin
		      mul_a <= add_res;
			  mul_b <= X_new_2;
			end			
	   189: begin
		      mul_a <= add_res;
			  mul_b <= X_new_3;
			end
	   190: begin
		      mul_a <= add_res;
			  mul_b <= X_new_4;
			end
	   191: begin
		      mul_a <= add_res;
			  mul_b <= X_new_5;
			end
	   192: begin
		      mul_a <= add_res;
			  mul_b <= X_new_6;
			end
	   193: begin
		      mul_a <= add_res;
			  mul_b <= X_new_7;
			end		

	   194: begin
		      mul_a <= add_res;
			  mul_b <= X_new_8;
			  add_a <= coeff_1[1];
			  add_b <= mul_res;
			end
	   195: begin
			  add_a <= coeff_2[1];
			  add_b <= mul_res;
			end	
	   196: begin
			  add_a <= coeff_3[1];
			  add_b <= mul_res;
			end	
	   197: begin
			  add_a <= coeff_4[1];
			  add_b <= mul_res;
			end	
	   198: begin
			  add_a <= coeff_5[1];
			  add_b <= mul_res;
			end	
	   199: begin
			  add_a <= coeff_6[1];
			  add_b <= mul_res;
			end	
	   200: begin
			  add_a <= coeff_7[1];
			  add_b <= mul_res;
			end	
	   201: begin
			  add_a <= coeff_8[1];
			  add_b <= mul_res;
			end	

	   204: begin
		      mul_a <= add_res;
			  mul_b <= X_new_1;
			end
	   205: begin
		      mul_a <= add_res;
			  mul_b <= X_new_2;
			end			
	   206: begin
		      mul_a <= add_res;
			  mul_b <= X_new_3;
			end
	   207: begin
		      mul_a <= add_res;
			  mul_b <= X_new_4;
			end
	   208: begin
		      mul_a <= add_res;
			  mul_b <= X_new_5;
			end
	   209: begin
		      mul_a <= add_res;
			  mul_b <= X_new_6;
			end
	   210: begin
		      mul_a <= add_res;
			  mul_b <= X_new_7;
			end		

	   211: begin
		      mul_a <= add_res;
			  mul_b <= X_new_8;
			  add_a <= coeff_1[0];
			  add_b <= mul_res;
			end
	   212: begin
			  add_a <= coeff_2[0];
			  add_b <= mul_res;
			end	
	   213: begin
			  add_a <= coeff_3[0];
			  add_b <= mul_res;
			end	
	   214: begin
			  add_a <= coeff_4[0];
			  add_b <= mul_res;
			end	
	   215: begin
			  add_a <= coeff_5[0];
			  add_b <= mul_res;
			end	
	   216: begin
			  add_a <= coeff_6[0];
			  add_b <= mul_res;
			end	
	   217: begin
			  add_a <= coeff_7[0];
			  add_b <= mul_res;
			end	
	   218: begin
			  add_a <= coeff_8[0];
			  add_b <= mul_res;
			end	

   // At 221 adder output first input-smc
       221: begin
              res_smc <= add_res;
            end
       222: begin
              res_smc <= add_res;
            end
       223: begin
              res_smc <= add_res;
            end
   //At 224, first fp_res outputs
       224: begin
              res_smc <= add_res;
			  srdyo <= 1;
            end
       225: begin
              res_smc <= add_res;
			  srdyo <= 1;
            end
       226: begin
              res_smc <= add_res;
			  srdyo <= 1;
            end
       227: begin
              res_smc <= add_res;
			  srdyo <= 1;
            end			
       228: begin
              res_smc <= add_res;
			  srdyo <= 1;
            end
       229: begin
			  srdyo <= 1;
            end
       230: begin
			  srdyo <= 1;
            end
       231: begin
			  srdyo <= 1;
            end
   default: begin
              srdyo <= 0;   
            end
	   
	  endcase
	end 
  
  end
  
//3 latency
  smc_float_to_fp convert_y(clk, reset, res_smc, x_lin, srdyo_smc_fp, srdyo_add);
  

endmodule





