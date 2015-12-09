//Buffer 32 inputs, then output them for 32 channels

module buffer_inputs (
  input clk,
  input reset,
  input srdyi_1,
  input srdyi_2,
  input [20:0] fp_input_0,
  input [20:0] fp_input_1,
  input [20:0] fp_input_2,
  input [20:0] fp_input_3,
  input [20:0] fp_input_4,
  input [20:0] fp_input_5,
  input [20:0] fp_input_6,
  input [20:0] fp_input_7,
  input [20:0] fp_input_8,
  input [20:0] fp_input_9,
  input [20:0] fp_input_10,
  input [20:0] fp_input_11,
  input [20:0] fp_input_12,
  input [20:0] fp_input_13,
  input [20:0] fp_input_14,
  input [20:0] fp_input_15,
  input [20:0] fp_input_16,
  input [20:0] fp_input_17,
  input [20:0] fp_input_18,
  input [20:0] fp_input_19,
  input [20:0] fp_input_20,
  input [20:0] fp_input_21,
  input [20:0] fp_input_22,
  input [20:0] fp_input_23,
  input [20:0] fp_input_24,
  input [20:0] fp_input_25,
  input [20:0] fp_input_26,
  input [20:0] fp_input_27,
  input [20:0] fp_input_28,
  input [20:0] fp_input_29,
  input [20:0] fp_input_30,
  input [20:0] fp_input_31,
  input[19:0] ch0_section_limit,
  input[19:0] ch1_section_limit,
  input[19:0] ch2_section_limit,
  input[19:0] ch3_section_limit,
  input[19:0] ch4_section_limit,
  input[19:0] ch5_section_limit,
  input[19:0] ch6_section_limit,
  input[19:0] ch7_section_limit,
  input[19:0] ch8_section_limit,
  input[19:0] ch9_section_limit,
  input[19:0] ch10_section_limit,
  input[19:0] ch11_section_limit,
  input[19:0] ch12_section_limit,
  input[19:0] ch13_section_limit,
  input[19:0] ch14_section_limit,
  input[19:0] ch15_section_limit,
  input[19:0] ch16_section_limit,
  input[19:0] ch17_section_limit,
  input[19:0] ch18_section_limit,
  input[19:0] ch19_section_limit,
  input[19:0] ch20_section_limit,
  input[19:0] ch21_section_limit,
  input[19:0] ch22_section_limit,
  input[19:0] ch23_section_limit,
  input[19:0] ch24_section_limit,
  input[19:0] ch25_section_limit,
  input[19:0] ch26_section_limit,
  input[19:0] ch27_section_limit,
  input[19:0] ch28_section_limit,
  input[19:0] ch29_section_limit,
  input[19:0] ch30_section_limit,
  input[19:0] ch31_section_limit,  

  output reg [15:0] section_select,
//  input [19:0] section_limit, // ufix20
  output reg [20:0] out,
  output reg srdyo
);

//Totally 32 number, and output 8 one time;
reg [3:0] counter_1;
reg [1:0] counter_2;
//Store 32 channels input
reg [20:0] r[0:31];
reg [15:0] section_select_1;
reg [15:0] section_select_2;
reg [15:0] section_select_3;
reg [15:0] section_select_4;

//srdyi_1 == 1: Get the 32 channels input;

always@(posedge clk) begin
  if(reset == 1) begin
    r[0] <= 0;
    r[1] <= 0;
    r[2] <= 0;
    r[3] <= 0;
    r[4] <= 0;
    r[5] <= 0;
    r[6] <= 0;
    r[7] <= 0;
    r[8] <= 0;
    r[9] <= 0;
    r[10] <= 0;
    r[11] <= 0;
    r[12] <= 0;
    r[13] <= 0;
    r[14] <= 0;
    r[15] <= 0;
    r[16] <= 0;
    r[17] <= 0;
    r[18] <= 0;
    r[19] <= 0;
    r[20] <= 0;
    r[21] <= 0;
    r[22] <= 0;
    r[23] <= 0;
    r[24] <= 0;
    r[25] <= 0;
    r[26] <= 0;
    r[27] <= 0;
    r[28] <= 0;
    r[29] <= 0;
    r[30] <= 0;
    r[31] <= 0;
	counter_1 <= 0;
	counter_2 <= 0;
	section_select <= 0;
	srdyo <= 0;
	out <= 0;
  end
  else if(srdyi_1 == 1) begin
    counter_1 <= 1;
	counter_2 <= 0;
    r[0] <= fp_input_0;
    r[1] <= fp_input_1;
    r[2] <= fp_input_2;
    r[3] <= fp_input_3;
    r[4] <= fp_input_4;
    r[5] <= fp_input_5;
    r[6] <= fp_input_6;
    r[7] <= fp_input_7;
    r[8] <= fp_input_8;
    r[9] <= fp_input_9;
    r[10] <= fp_input_10;
    r[11] <= fp_input_11;
    r[12] <= fp_input_12;
    r[13] <= fp_input_13;
    r[14] <= fp_input_14;
    r[15] <= fp_input_15;
    r[16] <= fp_input_16;
    r[17] <= fp_input_17;
    r[18] <= fp_input_18;
    r[19] <= fp_input_19;
    r[20] <= fp_input_20;
    r[21] <= fp_input_21;
    r[22] <= fp_input_22;
    r[23] <= fp_input_23;
    r[24] <= fp_input_24;
    r[25] <= fp_input_25;
    r[26] <= fp_input_26;
    r[27] <= fp_input_27;
    r[28] <= fp_input_28;
    r[29] <= fp_input_29;
    r[30] <= fp_input_30;
    r[31] <= fp_input_31;   


// section_select - 0-7
if (fp_input_0[20] ==1 && fp_input_0 < -ch0_section_limit) 
    begin  section_select_1[15:14] <= 2'b00;
	end
else if(fp_input_0[20] ==1)
     begin section_select_1[15:14] <= 2'b01;
	 end
else if(fp_input_0 < ch0_section_limit)
     begin section_select_1[15:14] <= 2'b10;
	 end	 
else begin section_select_1[15:14] <= 2'b11;
     end 
	 	 
if (fp_input_1[20] ==1 && fp_input_1 < -ch1_section_limit) 
    begin  section_select_1[13:12] <= 2'b00;
	end
else if(fp_input_1[20] ==1)
     begin section_select_1[13:12] <= 2'b01;
	 end
else if(fp_input_1 < ch1_section_limit)
     begin section_select_1[13:12] <= 2'b10;
	 end	 
else begin section_select_1[13:12] <= 2'b11;
     end 
	 
	 
if (fp_input_2[20] ==1 && fp_input_2 < -ch2_section_limit) 
    begin  section_select_1[11:10] <= 2'b00;
	end
else if(fp_input_2[20] ==1)
     begin section_select_1[11:10] <= 2'b01;
	 end
else if(fp_input_2 < ch2_section_limit)
     begin section_select_1[11:10] <= 2'b10;
	 end	 
else begin section_select_1[11:10] <= 2'b11;
     end 
	 
	 	 	 
if (fp_input_3[20] ==1 && fp_input_3 < -ch3_section_limit) 
    begin  section_select_1[9:8] <= 2'b00;
	end
else if(fp_input_3[20] ==1)
     begin section_select_1[9:8] <= 2'b01;
	 end
else if(fp_input_3 < ch3_section_limit)
     begin section_select_1[9:8] <= 2'b10;
	 end	 
else begin section_select_1[9:8] <= 2'b11;
     end 
	 
	 
if (fp_input_4[20] ==1 && fp_input_4 < -ch4_section_limit) 
    begin  section_select_1[7:6] <= 2'b00;
	end
else if(fp_input_4[20] ==1)
     begin section_select_1[7:6] <= 2'b01;
	 end
else if(fp_input_4 < ch4_section_limit)
     begin section_select_1[7:6] <= 2'b10;
	 end	 
else begin section_select_1[7:6] <= 2'b11;
     end 	 
	 
if (fp_input_5[20] ==1 && fp_input_5 < -ch5_section_limit) 
    begin  section_select_1[5:4] <= 2'b00;
	end
else if(fp_input_5[20] ==1)
     begin section_select_1[5:4] <= 2'b01;
	 end
else if(fp_input_5 < ch5_section_limit)
     begin section_select_1[5:4] <= 2'b10;
	 end	 
else begin section_select_1[5:4] <= 2'b11;
     end 		 
	

	 
if (fp_input_6[20] ==1 && fp_input_6 < -ch6_section_limit) 
    begin  section_select_1[3:2] <= 2'b00;
	end
else if(fp_input_6[20] ==1)
     begin section_select_1[3:2] <= 2'b01;
	 end
else if(fp_input_6 < ch6_section_limit)
     begin section_select_1[3:2] <= 2'b10;
	 end	 
else begin section_select_1[3:2] <= 2'b11;
     end

	 


if (fp_input_7[20] ==1 && fp_input_7 < -ch7_section_limit) 
    begin  section_select_1[1:0] <= 2'b00;
	end
else if(fp_input_7[20] ==1)
     begin section_select_1[1:0] <= 2'b01;
	 end
else if(fp_input_7 < ch7_section_limit)
     begin section_select_1[1:0] <= 2'b10;
	 end	 
else begin section_select_1[1:0] <= 2'b11;
     end


// section_select - 8-15
if (fp_input_8[20] ==1 && fp_input_8 < -ch8_section_limit) 
    begin  section_select_2[15:14] <= 2'b00;
	end
else if(fp_input_8[20] ==1)
     begin section_select_2[15:14] <= 2'b01;
	 end
else if(fp_input_8 < ch8_section_limit)
     begin section_select_2[15:14] <= 2'b10;
	 end	 
else begin section_select_2[15:14] <= 2'b11;
     end

if (fp_input_9[20] ==1 && fp_input_9 < -ch9_section_limit) 
    begin  section_select_2[13:12] <= 2'b00;
	end
else if(fp_input_9[20] ==1)
     begin section_select_2[13:12] <= 2'b01;
	 end
else if(fp_input_9 < ch9_section_limit)
     begin section_select_2[13:12] <= 2'b10;
	 end	 
else begin section_select_2[13:12] <= 2'b11;
     end


if (fp_input_10[20] ==1 && fp_input_10 < -ch10_section_limit) 
    begin  section_select_2[11:10] <= 2'b00;
	end
else if(fp_input_10[20] ==1)
     begin section_select_2[11:10] <= 2'b01;
	 end
else if(fp_input_10 < ch10_section_limit)
     begin section_select_2[11:10] <= 2'b10;
	 end	 
else begin section_select_2[11:10] <= 2'b11;
     end

if (fp_input_11[20] ==1 && fp_input_11 < -ch11_section_limit) 
    begin  section_select_2[9:8] <= 2'b00;
	end
else if(fp_input_11[20] ==1)
     begin section_select_2[9:8] <= 2'b01;
	 end
else if(fp_input_11 < ch11_section_limit)
     begin section_select_2[9:8] <= 2'b10;
	 end	 
else begin section_select_2[9:8] <= 2'b11;
     end

if (fp_input_12[20] ==1 && fp_input_12 < -ch12_section_limit) 
    begin  section_select_2[7:6] <= 2'b00;
	end
else if(fp_input_12[20] ==1)
     begin section_select_2[7:6] <= 2'b01;
	 end
else if(fp_input_12 < ch12_section_limit)
     begin section_select_2[7:6] <= 2'b10;
	 end	 
else begin section_select_2[7:6] <= 2'b11;
     end

if (fp_input_13[20] ==1 && fp_input_13 < -ch13_section_limit) 
    begin  section_select_2[5:4] <= 2'b00;
	end
else if(fp_input_13[20] ==1)
     begin section_select_2[5:4] <= 2'b01;
	 end
else if(fp_input_13 < ch13_section_limit)
     begin section_select_2[5:4] <= 2'b10;
	 end	 
else begin section_select_2[5:4] <= 2'b11;
     end

if (fp_input_14[20] ==1 && fp_input_14 < -ch14_section_limit) 
    begin  section_select_2[3:2] <= 2'b00;
	end
else if(fp_input_14[20] ==1)
     begin section_select_2[3:2] <= 2'b01;
	 end
else if(fp_input_14 < ch14_section_limit)
     begin section_select_2[3:2] <= 2'b10;
	 end	 
else begin section_select_2[3:2] <= 2'b11;
     end

if (fp_input_15[20] ==1 && fp_input_15 < -ch15_section_limit) 
    begin  section_select_2[1:0] <= 2'b00;
	end
else if(fp_input_15[20] ==1)
     begin section_select_2[1:0] <= 2'b01;
	 end
else if(fp_input_15 < ch15_section_limit)
     begin section_select_2[1:0] <= 2'b10;
	 end	 
else begin section_select_2[1:0] <= 2'b11;
     end

	 
	 
// section_select - 16-23	 
if (fp_input_16[20] ==1 && fp_input_16 < -ch16_section_limit) 
    begin  section_select_3[15:14] <= 2'b00;
	end
else if(fp_input_16[20] ==1)
     begin section_select_3[15:14] <= 2'b01;
	 end
else if(fp_input_16 < ch16_section_limit)
     begin section_select_3[15:14] <= 2'b10;
	 end	 
else begin section_select_3[15:14] <= 2'b11;
     end

if (fp_input_17[20] ==1 && fp_input_17 < -ch17_section_limit) 
    begin  section_select_3[13:12] <= 2'b00;
	end
else if(fp_input_17[20] ==1)
     begin section_select_3[13:12] <= 2'b01;
	 end
else if(fp_input_17 < ch17_section_limit)
     begin section_select_3[13:12] <= 2'b10;
	 end	 
else begin section_select_3[13:12] <= 2'b11;
     end

if (fp_input_18[20] ==1 && fp_input_18 < -ch18_section_limit) 
    begin  section_select_3[11:10] <= 2'b00;
	end
else if(fp_input_18[20] ==1)
     begin section_select_3[11:10] <= 2'b01;
	 end
else if(fp_input_18 < ch18_section_limit)
     begin section_select_3[11:10] <= 2'b10;
	 end	 
else begin section_select_3[11:10] <= 2'b11;
     end

if (fp_input_19[20] ==1 && fp_input_19 < -ch19_section_limit) 
    begin  section_select_3[9:8] <= 2'b00;
	end
else if(fp_input_19[20] ==1)
     begin section_select_3[9:8] <= 2'b01;
	 end
else if(fp_input_19 < ch19_section_limit)
     begin section_select_3[9:8] <= 2'b10;
	 end	 
else begin section_select_3[9:8] <= 2'b11;
     end


if (fp_input_20[20] ==1 && fp_input_20 < -ch20_section_limit) 
    begin  section_select_3[7:6] <= 2'b00;
	end
else if(fp_input_20[20] ==1)
     begin section_select_3[7:6] <= 2'b01;
	 end
else if(fp_input_20 < ch20_section_limit)
     begin section_select_3[7:6] <= 2'b10;
	 end	 
else begin section_select_3[7:6] <= 2'b11;
     end

	 
if (fp_input_21[20] ==1 && fp_input_21 < -ch21_section_limit) 
    begin  section_select_3[5:4] <= 2'b00;
	end
else if(fp_input_21[20] ==1)
     begin section_select_3[5:4] <= 2'b01;
	 end
else if(fp_input_21 < ch21_section_limit)
     begin section_select_3[5:4] <= 2'b10;
	 end	 
else begin section_select_3[5:4] <= 2'b11;
     end
	 
	 
if (fp_input_22[20] ==1 && fp_input_22 < -ch22_section_limit) 
    begin  section_select_3[3:2] <= 2'b00;
	end
else if(fp_input_22[20] ==1)
     begin section_select_3[3:2] <= 2'b01;
	 end
else if(fp_input_22 < ch22_section_limit)
     begin section_select_3[3:2] <= 2'b10;
	 end	 
else begin section_select_3[3:2] <= 2'b11;
     end

if (fp_input_23[20] ==1 && fp_input_23 < -ch23_section_limit) 
    begin  section_select_3[1:0] <= 2'b00;
	end
else if(fp_input_23[20] ==1)
     begin section_select_3[1:0] <= 2'b01;
	 end
else if(fp_input_23 < ch23_section_limit)
     begin section_select_3[1:0] <= 2'b10;
	 end	 
else begin section_select_3[1:0] <= 2'b11;
     end


// section_select - 24-31	 	 
if (fp_input_24[20] ==1 && fp_input_24 < -ch24_section_limit) 
    begin  section_select_4[15:14] <= 2'b00;
	end
else if(fp_input_24[20] ==1)
     begin section_select_4[15:14] <= 2'b01;
	 end
else if(fp_input_24 < ch24_section_limit)
     begin section_select_4[15:14] <= 2'b10;
	 end	 
else begin section_select_4[15:14] <= 2'b11;
     end	 

if (fp_input_25[20] ==1 && fp_input_25 < -ch25_section_limit) 
    begin  section_select_4[13:12] <= 2'b00;
	end
else if(fp_input_25[20] ==1)
     begin section_select_4[13:12] <= 2'b01;
	 end
else if(fp_input_25 < ch25_section_limit)
     begin section_select_4[13:12] <= 2'b10;
	 end	 
else begin section_select_4[13:12] <= 2'b11;
     end
	 
	 
if (fp_input_26[20] ==1 && fp_input_26 < -ch26_section_limit) 
    begin  section_select_4[11:10] <= 2'b00;
	end
else if(fp_input_26[20] ==1)
     begin section_select_4[11:10] <= 2'b01;
	 end
else if(fp_input_26 < ch26_section_limit)
     begin section_select_4[11:10] <= 2'b10;
	 end	 
else begin section_select_4[11:10] <= 2'b11;
     end	 
	 
if (fp_input_27[20] ==1 && fp_input_27 < -ch27_section_limit) 
    begin  section_select_4[9:8] <= 2'b00;
	end
else if(fp_input_27[20] ==1)
     begin section_select_4[9:8] <= 2'b01;
	 end
else if(fp_input_27 < ch27_section_limit)
     begin section_select_4[9:8] <= 2'b10;
	 end	 
else begin section_select_4[9:8] <= 2'b11;
     end

if (fp_input_28[20] ==1 && fp_input_28 < -ch28_section_limit) 
    begin  section_select_4[7:6] <= 2'b00;
	end
else if(fp_input_28[20] ==1)
     begin section_select_4[7:6] <= 2'b01;
	 end
else if(fp_input_28 < ch28_section_limit)
     begin section_select_4[7:6] <= 2'b10;
	 end	 
else begin section_select_4[7:6] <= 2'b11;
     end

if (fp_input_29[20] ==1 && fp_input_29 < -ch29_section_limit) 
    begin  section_select_4[5:4] <= 2'b00;
	end
else if(fp_input_29[20] ==1)
     begin section_select_4[5:4] <= 2'b01;
	 end
else if(fp_input_29 < ch29_section_limit)
     begin section_select_4[5:4] <= 2'b10;
	 end	 
else begin section_select_4[5:4] <= 2'b11;
     end	 
	 
	 
if (fp_input_30[20] ==1 && fp_input_30 < -ch30_section_limit) 
    begin  section_select_4[3:2] <= 2'b00;
	end
else if(fp_input_30[20] ==1)
     begin section_select_4[3:2] <= 2'b01;
	 end
else if(fp_input_30 < ch30_section_limit)
     begin section_select_4[3:2] <= 2'b10;
	 end	 
else begin section_select_4[3:2] <= 2'b11;
     end	 
	 
if (fp_input_31[20] ==1 && fp_input_31 < -ch31_section_limit) 
    begin  section_select_4[1:0] <= 2'b00;
	end
else if(fp_input_31[20] ==1)
     begin section_select_4[1:0] <= 2'b01;
	 end
else if(fp_input_31 < ch31_section_limit)
     begin section_select_4[1:0] <= 2'b10;
	 end	 
else begin section_select_4[1:0] <= 2'b11;
     end	 
	
  end 
  
  else if(counter_1 != 0) begin
	if(counter_2 == 2'b00) begin
	  section_select <= section_select_1;	
      case(counter_1)
        1: begin
		     out <= r[0];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        2: begin
		     out <= r[1];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        3: begin
		     out <= r[2];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        4: begin
		     out <= r[3];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        5: begin
		     out <= r[4];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        6: begin
		     out <= r[5];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        7: begin
		     out <= r[6];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        8: begin
		     out <= r[7];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
		default: begin
		           counter_1 <= 0;
				   srdyo <= 0;
				   counter_2 <= counter_2 + 1;
				 end
	  endcase	  
	end
	if(counter_2 == 2'b01) begin
	  section_select <= section_select_2;
      case(counter_1)
        1: begin
		     out <= r[8];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        2: begin
		     out <= r[9];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        3: begin
		     out <= r[10];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        4: begin
		     out <= r[11];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        5: begin
		     out <= r[12];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        6: begin
		     out <= r[13];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        7: begin
		     out <= r[14];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        8: begin
		     out <= r[15];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
		default: begin
		           counter_1 <= 0;
				   srdyo <= 0;
				   counter_2 <= counter_2 + 1;
				 end
	  endcase	  
	end
	if(counter_2 == 2'b10) begin
	  section_select <= section_select_3;	
      case(counter_1)
        1: begin
		     out <= r[16];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        2: begin
		     out <= r[17];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        3: begin
		     out <= r[18];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        4: begin
		     out <= r[19];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        5: begin
		     out <= r[20];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        6: begin
		     out <= r[21];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        7: begin
		     out <= r[22];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        8: begin
		     out <= r[23];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
		default: begin
		           counter_1 <= 0;
				   srdyo <= 0;
				   counter_2 <= counter_2 + 1;
				 end
	  endcase	  
	end
	else begin
	  section_select <= section_select_4;	
      case(counter_1)
        1: begin
		     out <= r[24];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        2: begin
		     out <= r[25];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        3: begin
		     out <= r[26];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        4: begin
		     out <= r[27];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        5: begin
		     out <= r[28];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        6: begin
		     out <= r[29];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        7: begin
		     out <= r[30];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
        8: begin
		     out <= r[31];
			 counter_1 <= counter_1 + 1;
			 srdyo <= 1;
		   end
		default: begin
		           counter_1 <= 0;
				   srdyo <= 0;
				   counter_2 <= counter_2 + 1;
				 end
	
	  endcase	  
	end
	
  end

  else if(srdyi_2 == 1 && counter_2 != 2'b00) begin
    counter_1 <= 1;
  end  
  
  else begin
    srdyo <= 0;
	counter_1 <= 0;
  end
end


endmodule
