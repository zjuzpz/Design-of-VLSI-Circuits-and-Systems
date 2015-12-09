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
  output reg [20:0] x_lin, 
  input [20:0] x_adc, // sfix21
  output reg srdyo, // ufix1
  input srdyi, // ufix1
  input [19:0] section_limit // ufix20

);


  reg [3:0] state, next_state;
  reg [4:0] counter_1, counter_2;
  reg [31:0] coeff[0:10];
  wire[31:0] x_adc_smc;
  //reset for mul and adder
  reg local_reset;

  parameter state_0 = 4'b0000, state_1 = 4'b0001, state_2 = 4'b0010, state_3 = 4'b0011;
  parameter state_4 = 4'b0100, state_5 = 4'b0101, state_6 = 4'b0110, state_7 = 4'b0111;
  parameter state_8 = 4'b1000, state_9 = 4'b1001, state_10 = 4'b1010;

//calculate coefficient add_a is mean, add_b is Xoriginal mul_a is 1/std
  reg [31:0] add_a, add_b, mul_a, mul_b;
  reg calculate_x_enable;
  wire [31:0] add_res, mul_res;
  reg [31:0] X_new;
  reg srdyi_convert;
  reg flag;
  wire [20:0] res;
  wire srdyo_mult;
  

  //total time for one convert (200+ clk periods)
  reg [7:0] counter;
  
  always@(posedge clk) begin
    if (srdyi == 1) begin
      counter <= 255;
	end
    else if(counter != 1'b0) begin
      counter <= counter - 1;
    end	
	else begin
	  counter <= 0;
	end
  end
  
  always@(posedge clk) begin
    if(reset == 1) begin
	  state <= state_0;
	  calculate_x_enable <= 1;
	  counter_1 <= 0;
	  counter_2 <= 0;
	end
	else begin
	  if(counter != 0 && counter != 255) begin
	    if(calculate_x_enable == 1)begin
		  counter_1 <= counter_1 + 1;
		  //finish x_adc fp to smc when counter_1 == 2
		  if (counter_1 == 2) begin
		    if(x_adc[20] == 1 && x_adc < -section_limit) begin
			  add_a <= x_adc_smc;
			  add_b <= neg_mean_1;
		    end
		    else if(x_adc[20] == 1) begin
			  add_a <= x_adc_smc;
			  add_b <= neg_mean_2;
		    end
		    else if(x_adc < section_limit) begin
			  add_a <= x_adc_smc;
			  add_b <= neg_mean_3;
		    end
		    else begin
			  add_a <= x_adc_smc;
			  add_b <= neg_mean_4;
		    end
	      end
		  //finish Xoriginal + (-Mean) when counter_1 == 12
	      else if(counter_1 == 12) begin
	        if(x_adc[20] == 1 && x_adc < -section_limit) begin
			  mul_a <= recip_stdev_1;
			  mul_b <= add_res;
		    end
		    else if(x_adc[20] == 1) begin
			  mul_a <= recip_stdev_2;
			  mul_b <= add_res;
		    end
		    else if(x_adc < section_limit) begin
			  mul_a <= recip_stdev_3;
			  mul_b <= add_res;
		    end
		    else begin
			  mul_a <= recip_stdev_4;
			  mul_b <= add_res;
		    end
	      end
		  //finish calculate Xnew when counter_1 == 19
		  else if(counter_1 == 19) begin
            if(x_adc[20] == 1 && x_adc < -section_limit) begin
	  	      X_new <= mul_res;
	          coeff[0] <= coeff_1_0;
		      coeff[1] <= coeff_1_1;
		      coeff[2] <= coeff_1_2;
		      coeff[3] <= coeff_1_3;
		      coeff[4] <= coeff_1_4;
		      coeff[5] <= coeff_1_5;
		      coeff[6] <= coeff_1_6;
		      coeff[7] <= coeff_1_7;
		      coeff[8] <= coeff_1_8;
		      coeff[9] <= coeff_1_9;
		      coeff[10] <= coeff_1_10;
	        end
	        else if(x_adc[20] == 1) begin
	  	      X_new <= mul_res;
	          coeff[0] <= coeff_2_0;
		      coeff[1] <= coeff_2_1;
		      coeff[2] <= coeff_2_2;
		      coeff[3] <= coeff_2_3;
		      coeff[4] <= coeff_2_4;
		      coeff[5] <= coeff_2_5;
		      coeff[6] <= coeff_2_6;
		      coeff[7] <= coeff_2_7;
		      coeff[8] <= coeff_2_8;
		      coeff[9] <= coeff_2_9;
		      coeff[10] <= coeff_2_10;
	        end
	        else if(x_adc < section_limit) begin
	  	      X_new <= mul_res;
	          coeff[0] <= coeff_3_0;
		      coeff[1] <= coeff_3_1;
		      coeff[2] <= coeff_3_2;
		      coeff[3] <= coeff_3_3;
		      coeff[4] <= coeff_3_4;
		      coeff[5] <= coeff_3_5;
		      coeff[6] <= coeff_3_6;
		      coeff[7] <= coeff_3_7;
		      coeff[8] <= coeff_3_8;
		      coeff[9] <= coeff_3_9;
		      coeff[10] <= coeff_3_10;
	        end
	        else begin
	  	      X_new <= mul_res;
	          coeff[0] <= coeff_4_0;
		      coeff[1] <= coeff_4_1;
		      coeff[2] <= coeff_4_2;
		      coeff[3] <= coeff_4_3;
		      coeff[4] <= coeff_4_4;
		      coeff[5] <= coeff_4_5;
		      coeff[6] <= coeff_4_6;
		      coeff[7] <= coeff_4_7;
		      coeff[8] <= coeff_4_8;
		      coeff[9] <= coeff_4_9;
		      coeff[10] <= coeff_4_10;
	        end
	      end
		  //Reset the input of adder and multiplier
		  else if(counter_1 == 21) begin
		    local_reset <= 1;
			mul_a <= 0;
			mul_b <= 0;
			add_a <= 0;
			add_b <= 0;
		  end
		  //End calculate X_new
		  else if(counter_1 == 30) begin
		    local_reset <= 0;
		    calculate_x_enable <= 0;
		  end
		
		end 
		//calculate_x_enable == 0: calculate result
		else begin
		  add_a <= mul_res;
	      mul_a <= X_new;
	      mul_b <= add_res;
		  
		  if(srdyo == 1) local_reset <= 1;
		  else local_reset <= 0;
		  
		  state <= next_state;
		  
		  if(state == state_10) begin
	        x_lin <= res;
	        if(flag == 1) begin
	          srdyi_convert <= 1;
	          flag <= 0;
	        end 
	        else begin
	          srdyi_convert <= 0;
	        end
	      end
	      else begin
	        srdyi_convert <= 0;
	        flag <= 1;
	      end
		  
          if(counter_2 == 16) counter_2 <= 0;
	      else counter_2 <= counter_2 + 1;	


          case(state)
            state_0: begin 
			  add_b <= coeff[10];
            end
            state_1: begin 
			  add_b <= coeff[9];
            end
            state_2: begin 
			  add_b <= coeff[8];
            end
            state_3: begin 
			  add_b <= coeff[7];
            end
            state_4: begin 
			  add_b <= coeff[6];
            end
            state_5: begin 
			  add_b <= coeff[5];
            end
            state_6: begin 
			  add_b <= coeff[4];
            end
            state_7: begin 
			  add_b <= coeff[3];
            end
            state_8: begin 
			  add_b <= coeff[2];
            end
            state_9: begin 
			  add_b <= coeff[1];
            end
            state_10: begin 
			  add_b <= coeff[0];
            end
          endcase        		  
		
		end
	  end
	  
	  //counter == 0:
	  else begin
	    calculate_x_enable <= 1;
		counter_1 <= 0;
		counter_2 <= 0;
		state <= state_0;
		local_reset <= 0;
		srdyi_convert <= 0;
	  end
	
	end
  end
 

  wire srdyo_smc_fp; 
  
  smc_float_adder adder(clk, local_reset, add_a, add_b, add_res, srdyo_add, srdyi_convert);
  smc_float_multiplier mul(clk, local_reset, mul_a, mul_b, mul_res, srdyi_mult, srdyo_fp_smc);  
  fp_to_smc_float convert_x(clk, reset, x_adc_smc, x_adc, srdyo_fp_smc, srdyi);
  smc_float_to_fp convert_y(clk, reset, add_res, res, srdyo_smc_fp, srdyo_add);
  
  //1 clk delay 
  always@(posedge clk) begin
    if(srdyo_smc_fp == 1) srdyo <= 1;
	else srdyo <= 0;
  end  


 //next_state logic
 always@(posedge clk) begin
   if(reset == 1) begin
     next_state <= state_0;
   end
   else begin
     if(counter == 0) begin
       next_state <= state_0;
     end
     else begin
       if(counter_2 == 16) begin // 15?
	    case(state)
	      state_0: next_state <= state_1; 
          state_1: next_state <= state_2;
          state_2: next_state <= state_3;
          state_3: next_state <= state_4;
          state_4: next_state <= state_5;
          state_5: next_state <= state_6;
          state_6: next_state <= state_7;
          state_7: next_state <= state_8;
          state_8: next_state <= state_9;
          state_9: next_state <= state_10;
          default : next_state <= state_0;
	    endcase
       end
     end
   end 
 end


endmodule





