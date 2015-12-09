
`timescale 1ns/1ns
module clock_gen(clk, rst); 
  parameter cperiod = 20;
  parameter rperiod = 100;
  parameter cperiodDiv = cperiod;
  output reg clk;
  output reg rst;

  wire [63 : 0] clockDivCounter;
  assign clockDivCounter = cperiod * cperiodDiv / 2;
  initial begin
    clk = 0;
    rst = 1;
    # (cperiod/2);  
    clk= 1;
    # (cperiod/2);  
    clk= 0;
    # (cperiod/2);  
    clk= 1;
    #(rperiod-(3*cperiod/2));  
    rst = 0;
    forever begin
    # clockDivCounter; clk = ~clk;
    end
  end
endmodule
//------------------------------------------
module clocks(clk,rst);
  parameter cperiod = 20;
  parameter rperiod = 100;
  output clk;
  output rst;
wire clk_loc, rst_loc;
  assign rst = rst_loc;
  clock_gen #(.cperiod(cperiod), .rperiod(rperiod), .cperiodDiv(1))
  cgen (.clk(clk), .rst(rst_loc)); 
endmodule
//------------------------------------------------------
module test_NLC_4sec_10th_order_1ch_v0;
integer logFile;
 integer select_section_coefficients_stdev_4_portyFile; 
 integer select_section_coefficients_stdev_3_portyFile; 
 integer select_section_coefficients_stdev_2_portyFile; 
 integer select_section_coefficients_stdev_1_portyFile; 
 integer select_section_coefficients_mean_4_portyFile; 
 integer select_section_coefficients_mean_3_portyFile; 
 integer select_section_coefficients_mean_2_portyFile; 
 integer select_section_coefficients_mean_1_portyFile; 
 integer select_section_coefficients_coeff_4_9_portyFile; 
 integer select_section_coefficients_coeff_4_8_portyFile; 
 integer select_section_coefficients_coeff_4_7_portyFile; 
 integer select_section_coefficients_coeff_4_6_portyFile; 
 integer select_section_coefficients_coeff_4_5_portyFile; 
 integer select_section_coefficients_coeff_4_4_portyFile; 
 integer select_section_coefficients_coeff_4_3_portyFile; 
 integer select_section_coefficients_coeff_4_2_portyFile; 
 integer select_section_coefficients_coeff_4_10_portyFile; 
 integer select_section_coefficients_coeff_4_1_portyFile; 
 integer select_section_coefficients_coeff_4_0_portyFile; 
 integer select_section_coefficients_coeff_3_9_portyFile; 
 integer select_section_coefficients_coeff_3_8_portyFile; 
 integer select_section_coefficients_coeff_3_7_portyFile; 
 integer select_section_coefficients_coeff_3_6_portyFile; 
 integer select_section_coefficients_coeff_3_5_portyFile; 
 integer select_section_coefficients_coeff_3_4_portyFile; 
 integer select_section_coefficients_coeff_3_3_portyFile; 
 integer select_section_coefficients_coeff_3_2_portyFile; 
 integer select_section_coefficients_coeff_3_10_portyFile; 
 integer select_section_coefficients_coeff_3_1_portyFile; 
 integer select_section_coefficients_coeff_3_0_portyFile; 
 integer select_section_coefficients_coeff_2_9_portyFile; 
 integer select_section_coefficients_coeff_2_8_portyFile; 
 integer select_section_coefficients_coeff_2_7_portyFile; 
 integer select_section_coefficients_coeff_2_6_portyFile; 
 integer select_section_coefficients_coeff_2_5_portyFile; 
 integer select_section_coefficients_coeff_2_4_portyFile; 
 integer select_section_coefficients_coeff_2_3_portyFile; 
 integer select_section_coefficients_coeff_2_2_portyFile; 
 integer select_section_coefficients_coeff_2_10_portyFile; 
 integer select_section_coefficients_coeff_2_1_portyFile; 
 integer select_section_coefficients_coeff_2_0_portyFile; 
 integer select_section_coefficients_coeff_1_9_portyFile; 
 integer select_section_coefficients_coeff_1_8_portyFile; 
 integer select_section_coefficients_coeff_1_7_portyFile; 
 integer select_section_coefficients_coeff_1_6_portyFile; 
 integer select_section_coefficients_coeff_1_5_portyFile; 
 integer select_section_coefficients_coeff_1_4_portyFile; 
 integer select_section_coefficients_coeff_1_3_portyFile; 
 integer select_section_coefficients_coeff_1_2_portyFile; 
 integer select_section_coefficients_coeff_1_10_portyFile; 
 integer select_section_coefficients_coeff_1_1_portyFile; 
 integer select_section_coefficients_coeff_1_0_portyFile; 
 integer x_linRefFile;
 integer x_linOutFile; 
 integer x_adcFile; 
 integer srdyoRefFile;
 integer srdyoOutFile; 
 integer srdyiFile; 
 integer section_limitFile; 

 initial begin
  logFile = $fopen("simlog.txt","wb");
  if (logFile ==0)
  begin
      $display("Error at creating log file");
      $finish;
    end
  select_section_coefficients_stdev_4_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_stdev_4_porty.dat","rb");
  if (select_section_coefficients_stdev_4_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_stdev_4_porty.dat");
      $finish;
    end
  select_section_coefficients_stdev_3_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_stdev_3_porty.dat","rb");
  if (select_section_coefficients_stdev_3_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_stdev_3_porty.dat");
      $finish;
    end
  select_section_coefficients_stdev_2_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_stdev_2_porty.dat","rb");
  if (select_section_coefficients_stdev_2_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_stdev_2_porty.dat");
      $finish;
    end
  select_section_coefficients_stdev_1_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_stdev_1_porty.dat","rb");
  if (select_section_coefficients_stdev_1_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_stdev_1_porty.dat");
      $finish;
    end
  select_section_coefficients_mean_4_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_mean_4_porty.dat","rb");
  if (select_section_coefficients_mean_4_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_mean_4_porty.dat");
      $finish;
    end
  select_section_coefficients_mean_3_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_mean_3_porty.dat","rb");
  if (select_section_coefficients_mean_3_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_mean_3_porty.dat");
      $finish;
    end
  select_section_coefficients_mean_2_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_mean_2_porty.dat","rb");
  if (select_section_coefficients_mean_2_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_mean_2_porty.dat");
      $finish;
    end
  select_section_coefficients_mean_1_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_mean_1_porty.dat","rb");
  if (select_section_coefficients_mean_1_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_mean_1_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_4_9_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_9_porty.dat","rb");
  if (select_section_coefficients_coeff_4_9_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_9_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_4_8_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_8_porty.dat","rb");
  if (select_section_coefficients_coeff_4_8_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_8_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_4_7_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_7_porty.dat","rb");
  if (select_section_coefficients_coeff_4_7_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_7_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_4_6_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_6_porty.dat","rb");
  if (select_section_coefficients_coeff_4_6_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_6_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_4_5_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_5_porty.dat","rb");
  if (select_section_coefficients_coeff_4_5_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_5_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_4_4_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_4_porty.dat","rb");
  if (select_section_coefficients_coeff_4_4_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_4_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_4_3_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_3_porty.dat","rb");
  if (select_section_coefficients_coeff_4_3_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_3_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_4_2_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_2_porty.dat","rb");
  if (select_section_coefficients_coeff_4_2_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_2_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_4_10_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_10_porty.dat","rb");
  if (select_section_coefficients_coeff_4_10_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_10_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_4_1_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_1_porty.dat","rb");
  if (select_section_coefficients_coeff_4_1_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_1_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_4_0_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_0_porty.dat","rb");
  if (select_section_coefficients_coeff_4_0_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_4_0_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_3_9_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_9_porty.dat","rb");
  if (select_section_coefficients_coeff_3_9_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_9_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_3_8_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_8_porty.dat","rb");
  if (select_section_coefficients_coeff_3_8_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_8_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_3_7_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_7_porty.dat","rb");
  if (select_section_coefficients_coeff_3_7_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_7_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_3_6_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_6_porty.dat","rb");
  if (select_section_coefficients_coeff_3_6_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_6_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_3_5_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_5_porty.dat","rb");
  if (select_section_coefficients_coeff_3_5_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_5_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_3_4_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_4_porty.dat","rb");
  if (select_section_coefficients_coeff_3_4_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_4_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_3_3_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_3_porty.dat","rb");
  if (select_section_coefficients_coeff_3_3_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_3_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_3_2_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_2_porty.dat","rb");
  if (select_section_coefficients_coeff_3_2_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_2_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_3_10_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_10_porty.dat","rb");
  if (select_section_coefficients_coeff_3_10_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_10_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_3_1_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_1_porty.dat","rb");
  if (select_section_coefficients_coeff_3_1_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_1_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_3_0_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_0_porty.dat","rb");
  if (select_section_coefficients_coeff_3_0_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_3_0_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_2_9_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_9_porty.dat","rb");
  if (select_section_coefficients_coeff_2_9_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_9_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_2_8_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_8_porty.dat","rb");
  if (select_section_coefficients_coeff_2_8_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_8_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_2_7_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_7_porty.dat","rb");
  if (select_section_coefficients_coeff_2_7_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_7_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_2_6_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_6_porty.dat","rb");
  if (select_section_coefficients_coeff_2_6_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_6_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_2_5_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_5_porty.dat","rb");
  if (select_section_coefficients_coeff_2_5_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_5_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_2_4_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_4_porty.dat","rb");
  if (select_section_coefficients_coeff_2_4_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_4_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_2_3_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_3_porty.dat","rb");
  if (select_section_coefficients_coeff_2_3_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_3_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_2_2_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_2_porty.dat","rb");
  if (select_section_coefficients_coeff_2_2_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_2_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_2_10_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_10_porty.dat","rb");
  if (select_section_coefficients_coeff_2_10_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_10_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_2_1_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_1_porty.dat","rb");
  if (select_section_coefficients_coeff_2_1_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_1_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_2_0_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_0_porty.dat","rb");
  if (select_section_coefficients_coeff_2_0_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_2_0_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_1_9_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_9_porty.dat","rb");
  if (select_section_coefficients_coeff_1_9_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_9_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_1_8_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_8_porty.dat","rb");
  if (select_section_coefficients_coeff_1_8_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_8_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_1_7_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_7_porty.dat","rb");
  if (select_section_coefficients_coeff_1_7_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_7_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_1_6_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_6_porty.dat","rb");
  if (select_section_coefficients_coeff_1_6_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_6_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_1_5_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_5_porty.dat","rb");
  if (select_section_coefficients_coeff_1_5_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_5_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_1_4_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_4_porty.dat","rb");
  if (select_section_coefficients_coeff_1_4_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_4_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_1_3_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_3_porty.dat","rb");
  if (select_section_coefficients_coeff_1_3_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_3_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_1_2_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_2_porty.dat","rb");
  if (select_section_coefficients_coeff_1_2_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_2_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_1_10_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_10_porty.dat","rb");
  if (select_section_coefficients_coeff_1_10_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_10_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_1_1_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_1_porty.dat","rb");
  if (select_section_coefficients_coeff_1_1_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_1_porty.dat");
      $finish;
    end
  select_section_coefficients_coeff_1_0_portyFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_0_porty.dat","rb");
  if (select_section_coefficients_coeff_1_0_portyFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_select_section_coefficients_coeff_1_0_porty.dat");
      $finish;
    end
  x_linRefFile = $fopen("Outport_NLC_4sec_10th_order_1ch_v0_x_lin.dat","rb");
  if (x_linRefFile ==0)
    begin
      $display("Error at opening file: Outport_NLC_4sec_10th_order_1ch_v0_x_lin.dat");
      $finish;
    end
  x_linOutFile = $fopen("Simout_NLC_4sec_10th_order_1ch_v0_x_lin.dat","wb"); 
  if (x_linOutFile ==0)
    begin
      $display("Error at opening file: Simout_NLC_4sec_10th_order_1ch_v0_x_lin.dat");
      $finish;
    end
  x_adcFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_x_adc.dat","rb");
  if (x_adcFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_x_adc.dat");
      $finish;
    end
  srdyoRefFile = $fopen("Outport_NLC_4sec_10th_order_1ch_v0_srdyo.dat","rb");
  if (srdyoRefFile ==0)
    begin
      $display("Error at opening file: Outport_NLC_4sec_10th_order_1ch_v0_srdyo.dat");
      $finish;
    end
  srdyoOutFile = $fopen("Simout_NLC_4sec_10th_order_1ch_v0_srdyo.dat","wb"); 
  if (srdyoOutFile ==0)
    begin
      $display("Error at opening file: Simout_NLC_4sec_10th_order_1ch_v0_srdyo.dat");
      $finish;
    end
  srdyiFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_srdyi.dat","rb");
  if (srdyiFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_srdyi.dat");
      $finish;
    end
  section_limitFile = $fopen("Inport_NLC_4sec_10th_order_1ch_v0_section_limit.dat","rb");
  if (section_limitFile ==0)
    begin
      $display("Error at opening file: Inport_NLC_4sec_10th_order_1ch_v0_section_limit.dat");
      $finish;
    end
  end
reg isNotFirstRise1 = 0;

wire isSimulationEnd;
reg isSimulationEnd1;

wire [31:0] mismatch;
integer mismatch1=0;
integer loop_cnt1=0;

wire clk_int;
wire GlobalReset_int;
wire GlobalResetDsgn;
wire [0:0] GlobalEnable1_int;
reg [31:0] select_section_coefficients_stdev_4_porty_int;
reg [31:0] select_section_coefficients_stdev_3_porty_int;
reg [31:0] select_section_coefficients_stdev_2_porty_int;
reg [31:0] select_section_coefficients_stdev_1_porty_int;
reg [31:0] select_section_coefficients_mean_4_porty_int;
reg [31:0] select_section_coefficients_mean_3_porty_int;
reg [31:0] select_section_coefficients_mean_2_porty_int;
reg [31:0] select_section_coefficients_mean_1_porty_int;
reg [31:0] select_section_coefficients_coeff_4_9_porty_int;
reg [31:0] select_section_coefficients_coeff_4_8_porty_int;
reg [31:0] select_section_coefficients_coeff_4_7_porty_int;
reg [31:0] select_section_coefficients_coeff_4_6_porty_int;
reg [31:0] select_section_coefficients_coeff_4_5_porty_int;
reg [31:0] select_section_coefficients_coeff_4_4_porty_int;
reg [31:0] select_section_coefficients_coeff_4_3_porty_int;
reg [31:0] select_section_coefficients_coeff_4_2_porty_int;
reg [31:0] select_section_coefficients_coeff_4_10_porty_int;
reg [31:0] select_section_coefficients_coeff_4_1_porty_int;
reg [31:0] select_section_coefficients_coeff_4_0_porty_int;
reg [31:0] select_section_coefficients_coeff_3_9_porty_int;
reg [31:0] select_section_coefficients_coeff_3_8_porty_int;
reg [31:0] select_section_coefficients_coeff_3_7_porty_int;
reg [31:0] select_section_coefficients_coeff_3_6_porty_int;
reg [31:0] select_section_coefficients_coeff_3_5_porty_int;
reg [31:0] select_section_coefficients_coeff_3_4_porty_int;
reg [31:0] select_section_coefficients_coeff_3_3_porty_int;
reg [31:0] select_section_coefficients_coeff_3_2_porty_int;
reg [31:0] select_section_coefficients_coeff_3_10_porty_int;
reg [31:0] select_section_coefficients_coeff_3_1_porty_int;
reg [31:0] select_section_coefficients_coeff_3_0_porty_int;
reg [31:0] select_section_coefficients_coeff_2_9_porty_int;
reg [31:0] select_section_coefficients_coeff_2_8_porty_int;
reg [31:0] select_section_coefficients_coeff_2_7_porty_int;
reg [31:0] select_section_coefficients_coeff_2_6_porty_int;
reg [31:0] select_section_coefficients_coeff_2_5_porty_int;
reg [31:0] select_section_coefficients_coeff_2_4_porty_int;
reg [31:0] select_section_coefficients_coeff_2_3_porty_int;
reg [31:0] select_section_coefficients_coeff_2_2_porty_int;
reg [31:0] select_section_coefficients_coeff_2_10_porty_int;
reg [31:0] select_section_coefficients_coeff_2_1_porty_int;
reg [31:0] select_section_coefficients_coeff_2_0_porty_int;
reg [31:0] select_section_coefficients_coeff_1_9_porty_int;
reg [31:0] select_section_coefficients_coeff_1_8_porty_int;
reg [31:0] select_section_coefficients_coeff_1_7_porty_int;
reg [31:0] select_section_coefficients_coeff_1_6_porty_int;
reg [31:0] select_section_coefficients_coeff_1_5_porty_int;
reg [31:0] select_section_coefficients_coeff_1_4_porty_int;
reg [31:0] select_section_coefficients_coeff_1_3_porty_int;
reg [31:0] select_section_coefficients_coeff_1_2_porty_int;
reg [31:0] select_section_coefficients_coeff_1_10_porty_int;
reg [31:0] select_section_coefficients_coeff_1_1_porty_int;
reg [31:0] select_section_coefficients_coeff_1_0_porty_int;
wire [20:0] x_lin_int;
reg [20:0] x_adc_int;
wire [0:0] srdyo_int;
reg [0:0] srdyi_int;
reg [19:0] section_limit_int;
//--Instantiate design under test
`ifdef USE_CMODEL_WITH_SYSTEMC
  `define designName NLC_4sec_10th_order_1ch_v0_wrapper
`else
  `define designName NLC_4sec_10th_order_1ch_v0
`endif
`designName i_NLC_4sec_10th_order_1ch_v0 (
    .clk(clk_int),
    .GlobalReset(GlobalResetDsgn),
    .select_section_coefficients_stdev_4_porty(select_section_coefficients_stdev_4_porty_int),
    .select_section_coefficients_stdev_3_porty(select_section_coefficients_stdev_3_porty_int),
    .select_section_coefficients_stdev_2_porty(select_section_coefficients_stdev_2_porty_int),
    .select_section_coefficients_stdev_1_porty(select_section_coefficients_stdev_1_porty_int),
    .select_section_coefficients_mean_4_porty(select_section_coefficients_mean_4_porty_int),
    .select_section_coefficients_mean_3_porty(select_section_coefficients_mean_3_porty_int),
    .select_section_coefficients_mean_2_porty(select_section_coefficients_mean_2_porty_int),
    .select_section_coefficients_mean_1_porty(select_section_coefficients_mean_1_porty_int),
    .select_section_coefficients_coeff_4_9_porty(select_section_coefficients_coeff_4_9_porty_int),
    .select_section_coefficients_coeff_4_8_porty(select_section_coefficients_coeff_4_8_porty_int),
    .select_section_coefficients_coeff_4_7_porty(select_section_coefficients_coeff_4_7_porty_int),
    .select_section_coefficients_coeff_4_6_porty(select_section_coefficients_coeff_4_6_porty_int),
    .select_section_coefficients_coeff_4_5_porty(select_section_coefficients_coeff_4_5_porty_int),
    .select_section_coefficients_coeff_4_4_porty(select_section_coefficients_coeff_4_4_porty_int),
    .select_section_coefficients_coeff_4_3_porty(select_section_coefficients_coeff_4_3_porty_int),
    .select_section_coefficients_coeff_4_2_porty(select_section_coefficients_coeff_4_2_porty_int),
    .select_section_coefficients_coeff_4_10_porty(select_section_coefficients_coeff_4_10_porty_int),
    .select_section_coefficients_coeff_4_1_porty(select_section_coefficients_coeff_4_1_porty_int),
    .select_section_coefficients_coeff_4_0_porty(select_section_coefficients_coeff_4_0_porty_int),
    .select_section_coefficients_coeff_3_9_porty(select_section_coefficients_coeff_3_9_porty_int),
    .select_section_coefficients_coeff_3_8_porty(select_section_coefficients_coeff_3_8_porty_int),
    .select_section_coefficients_coeff_3_7_porty(select_section_coefficients_coeff_3_7_porty_int),
    .select_section_coefficients_coeff_3_6_porty(select_section_coefficients_coeff_3_6_porty_int),
    .select_section_coefficients_coeff_3_5_porty(select_section_coefficients_coeff_3_5_porty_int),
    .select_section_coefficients_coeff_3_4_porty(select_section_coefficients_coeff_3_4_porty_int),
    .select_section_coefficients_coeff_3_3_porty(select_section_coefficients_coeff_3_3_porty_int),
    .select_section_coefficients_coeff_3_2_porty(select_section_coefficients_coeff_3_2_porty_int),
    .select_section_coefficients_coeff_3_10_porty(select_section_coefficients_coeff_3_10_porty_int),
    .select_section_coefficients_coeff_3_1_porty(select_section_coefficients_coeff_3_1_porty_int),
    .select_section_coefficients_coeff_3_0_porty(select_section_coefficients_coeff_3_0_porty_int),
    .select_section_coefficients_coeff_2_9_porty(select_section_coefficients_coeff_2_9_porty_int),
    .select_section_coefficients_coeff_2_8_porty(select_section_coefficients_coeff_2_8_porty_int),
    .select_section_coefficients_coeff_2_7_porty(select_section_coefficients_coeff_2_7_porty_int),
    .select_section_coefficients_coeff_2_6_porty(select_section_coefficients_coeff_2_6_porty_int),
    .select_section_coefficients_coeff_2_5_porty(select_section_coefficients_coeff_2_5_porty_int),
    .select_section_coefficients_coeff_2_4_porty(select_section_coefficients_coeff_2_4_porty_int),
    .select_section_coefficients_coeff_2_3_porty(select_section_coefficients_coeff_2_3_porty_int),
    .select_section_coefficients_coeff_2_2_porty(select_section_coefficients_coeff_2_2_porty_int),
    .select_section_coefficients_coeff_2_10_porty(select_section_coefficients_coeff_2_10_porty_int),
    .select_section_coefficients_coeff_2_1_porty(select_section_coefficients_coeff_2_1_porty_int),
    .select_section_coefficients_coeff_2_0_porty(select_section_coefficients_coeff_2_0_porty_int),
    .select_section_coefficients_coeff_1_9_porty(select_section_coefficients_coeff_1_9_porty_int),
    .select_section_coefficients_coeff_1_8_porty(select_section_coefficients_coeff_1_8_porty_int),
    .select_section_coefficients_coeff_1_7_porty(select_section_coefficients_coeff_1_7_porty_int),
    .select_section_coefficients_coeff_1_6_porty(select_section_coefficients_coeff_1_6_porty_int),
    .select_section_coefficients_coeff_1_5_porty(select_section_coefficients_coeff_1_5_porty_int),
    .select_section_coefficients_coeff_1_4_porty(select_section_coefficients_coeff_1_4_porty_int),
    .select_section_coefficients_coeff_1_3_porty(select_section_coefficients_coeff_1_3_porty_int),
    .select_section_coefficients_coeff_1_2_porty(select_section_coefficients_coeff_1_2_porty_int),
    .select_section_coefficients_coeff_1_10_porty(select_section_coefficients_coeff_1_10_porty_int),
    .select_section_coefficients_coeff_1_1_porty(select_section_coefficients_coeff_1_1_porty_int),
    .select_section_coefficients_coeff_1_0_porty(select_section_coefficients_coeff_1_0_porty_int),
    .x_lin(x_lin_int),
    .x_adc(x_adc_int),
    .srdyo(srdyo_int),
    .srdyi(srdyi_int),
    .section_limit(section_limit_int)
  );
clocks #(.cperiod(166666), .rperiod(1666660)) CL(
  .clk(clk_int),
  .rst(GlobalReset_int)
  );

  assign GlobalEnable1_int = ~GlobalReset_int;
  assign GlobalResetDsgn = GlobalReset_int;
  assign isSimulationEnd = isSimulationEnd1;

  assign mismatch = mismatch1;
  always @(posedge clk_int) begin
    isNotFirstRise1 <= 1;
  end
  //------------------------------------------------------------
  //-- Process for Rate Domain of clk 
  //-- Inputs are applied on rising edge of clock, 
  //-- Outputs are tested on falling edges.
  //------------------------------------------------------------
    reg misFlg1;
      reg [31:0] tmp_select_section_coefficients_stdev_4_porty;
      reg [31:0] tmp_select_section_coefficients_stdev_3_porty;
      reg [31:0] tmp_select_section_coefficients_stdev_2_porty;
      reg [31:0] tmp_select_section_coefficients_stdev_1_porty;
      reg [31:0] tmp_select_section_coefficients_mean_4_porty;
      reg [31:0] tmp_select_section_coefficients_mean_3_porty;
      reg [31:0] tmp_select_section_coefficients_mean_2_porty;
      reg [31:0] tmp_select_section_coefficients_mean_1_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_4_9_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_4_8_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_4_7_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_4_6_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_4_5_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_4_4_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_4_3_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_4_2_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_4_10_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_4_1_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_4_0_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_3_9_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_3_8_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_3_7_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_3_6_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_3_5_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_3_4_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_3_3_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_3_2_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_3_10_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_3_1_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_3_0_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_2_9_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_2_8_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_2_7_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_2_6_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_2_5_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_2_4_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_2_3_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_2_2_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_2_10_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_2_1_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_2_0_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_1_9_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_1_8_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_1_7_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_1_6_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_1_5_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_1_4_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_1_3_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_1_2_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_1_10_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_1_1_porty;
      reg [31:0] tmp_select_section_coefficients_coeff_1_0_porty;
      reg [20:0] tmp_x_lin = 0;
      reg [20:0] ref_x_lin = 0;
      reg [20:0] tmp_x_adc;
      reg [0:0] tmp_srdyo = 0;
      reg [0:0] ref_srdyo = 0;
      reg [0:0] tmp_srdyi;
      reg [19:0] tmp_section_limit;
//-- Apply Input Vectors -----
always @(posedge clk_int) 
  begin 
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_stdev_4_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_stdev_4_portyFile, "%b\n", tmp_select_section_coefficients_stdev_4_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_stdev_4_porty_int <= tmp_select_section_coefficients_stdev_4_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_stdev_3_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_stdev_3_portyFile, "%b\n", tmp_select_section_coefficients_stdev_3_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_stdev_3_porty_int <= tmp_select_section_coefficients_stdev_3_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_stdev_2_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_stdev_2_portyFile, "%b\n", tmp_select_section_coefficients_stdev_2_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_stdev_2_porty_int <= tmp_select_section_coefficients_stdev_2_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_stdev_1_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_stdev_1_portyFile, "%b\n", tmp_select_section_coefficients_stdev_1_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_stdev_1_porty_int <= tmp_select_section_coefficients_stdev_1_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_mean_4_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_mean_4_portyFile, "%b\n", tmp_select_section_coefficients_mean_4_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_mean_4_porty_int <= tmp_select_section_coefficients_mean_4_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_mean_3_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_mean_3_portyFile, "%b\n", tmp_select_section_coefficients_mean_3_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_mean_3_porty_int <= tmp_select_section_coefficients_mean_3_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_mean_2_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_mean_2_portyFile, "%b\n", tmp_select_section_coefficients_mean_2_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_mean_2_porty_int <= tmp_select_section_coefficients_mean_2_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_mean_1_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_mean_1_portyFile, "%b\n", tmp_select_section_coefficients_mean_1_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_mean_1_porty_int <= tmp_select_section_coefficients_mean_1_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_4_9_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_4_9_portyFile, "%b\n", tmp_select_section_coefficients_coeff_4_9_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_4_9_porty_int <= tmp_select_section_coefficients_coeff_4_9_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_4_8_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_4_8_portyFile, "%b\n", tmp_select_section_coefficients_coeff_4_8_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_4_8_porty_int <= tmp_select_section_coefficients_coeff_4_8_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_4_7_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_4_7_portyFile, "%b\n", tmp_select_section_coefficients_coeff_4_7_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_4_7_porty_int <= tmp_select_section_coefficients_coeff_4_7_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_4_6_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_4_6_portyFile, "%b\n", tmp_select_section_coefficients_coeff_4_6_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_4_6_porty_int <= tmp_select_section_coefficients_coeff_4_6_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_4_5_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_4_5_portyFile, "%b\n", tmp_select_section_coefficients_coeff_4_5_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_4_5_porty_int <= tmp_select_section_coefficients_coeff_4_5_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_4_4_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_4_4_portyFile, "%b\n", tmp_select_section_coefficients_coeff_4_4_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_4_4_porty_int <= tmp_select_section_coefficients_coeff_4_4_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_4_3_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_4_3_portyFile, "%b\n", tmp_select_section_coefficients_coeff_4_3_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_4_3_porty_int <= tmp_select_section_coefficients_coeff_4_3_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_4_2_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_4_2_portyFile, "%b\n", tmp_select_section_coefficients_coeff_4_2_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_4_2_porty_int <= tmp_select_section_coefficients_coeff_4_2_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_4_10_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_4_10_portyFile, "%b\n", tmp_select_section_coefficients_coeff_4_10_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_4_10_porty_int <= tmp_select_section_coefficients_coeff_4_10_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_4_1_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_4_1_portyFile, "%b\n", tmp_select_section_coefficients_coeff_4_1_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_4_1_porty_int <= tmp_select_section_coefficients_coeff_4_1_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_4_0_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_4_0_portyFile, "%b\n", tmp_select_section_coefficients_coeff_4_0_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_4_0_porty_int <= tmp_select_section_coefficients_coeff_4_0_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_3_9_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_3_9_portyFile, "%b\n", tmp_select_section_coefficients_coeff_3_9_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_3_9_porty_int <= tmp_select_section_coefficients_coeff_3_9_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_3_8_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_3_8_portyFile, "%b\n", tmp_select_section_coefficients_coeff_3_8_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_3_8_porty_int <= tmp_select_section_coefficients_coeff_3_8_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_3_7_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_3_7_portyFile, "%b\n", tmp_select_section_coefficients_coeff_3_7_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_3_7_porty_int <= tmp_select_section_coefficients_coeff_3_7_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_3_6_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_3_6_portyFile, "%b\n", tmp_select_section_coefficients_coeff_3_6_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_3_6_porty_int <= tmp_select_section_coefficients_coeff_3_6_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_3_5_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_3_5_portyFile, "%b\n", tmp_select_section_coefficients_coeff_3_5_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_3_5_porty_int <= tmp_select_section_coefficients_coeff_3_5_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_3_4_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_3_4_portyFile, "%b\n", tmp_select_section_coefficients_coeff_3_4_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_3_4_porty_int <= tmp_select_section_coefficients_coeff_3_4_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_3_3_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_3_3_portyFile, "%b\n", tmp_select_section_coefficients_coeff_3_3_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_3_3_porty_int <= tmp_select_section_coefficients_coeff_3_3_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_3_2_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_3_2_portyFile, "%b\n", tmp_select_section_coefficients_coeff_3_2_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_3_2_porty_int <= tmp_select_section_coefficients_coeff_3_2_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_3_10_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_3_10_portyFile, "%b\n", tmp_select_section_coefficients_coeff_3_10_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_3_10_porty_int <= tmp_select_section_coefficients_coeff_3_10_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_3_1_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_3_1_portyFile, "%b\n", tmp_select_section_coefficients_coeff_3_1_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_3_1_porty_int <= tmp_select_section_coefficients_coeff_3_1_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_3_0_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_3_0_portyFile, "%b\n", tmp_select_section_coefficients_coeff_3_0_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_3_0_porty_int <= tmp_select_section_coefficients_coeff_3_0_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_2_9_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_2_9_portyFile, "%b\n", tmp_select_section_coefficients_coeff_2_9_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_2_9_porty_int <= tmp_select_section_coefficients_coeff_2_9_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_2_8_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_2_8_portyFile, "%b\n", tmp_select_section_coefficients_coeff_2_8_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_2_8_porty_int <= tmp_select_section_coefficients_coeff_2_8_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_2_7_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_2_7_portyFile, "%b\n", tmp_select_section_coefficients_coeff_2_7_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_2_7_porty_int <= tmp_select_section_coefficients_coeff_2_7_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_2_6_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_2_6_portyFile, "%b\n", tmp_select_section_coefficients_coeff_2_6_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_2_6_porty_int <= tmp_select_section_coefficients_coeff_2_6_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_2_5_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_2_5_portyFile, "%b\n", tmp_select_section_coefficients_coeff_2_5_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_2_5_porty_int <= tmp_select_section_coefficients_coeff_2_5_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_2_4_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_2_4_portyFile, "%b\n", tmp_select_section_coefficients_coeff_2_4_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_2_4_porty_int <= tmp_select_section_coefficients_coeff_2_4_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_2_3_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_2_3_portyFile, "%b\n", tmp_select_section_coefficients_coeff_2_3_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_2_3_porty_int <= tmp_select_section_coefficients_coeff_2_3_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_2_2_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_2_2_portyFile, "%b\n", tmp_select_section_coefficients_coeff_2_2_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_2_2_porty_int <= tmp_select_section_coefficients_coeff_2_2_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_2_10_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_2_10_portyFile, "%b\n", tmp_select_section_coefficients_coeff_2_10_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_2_10_porty_int <= tmp_select_section_coefficients_coeff_2_10_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_2_1_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_2_1_portyFile, "%b\n", tmp_select_section_coefficients_coeff_2_1_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_2_1_porty_int <= tmp_select_section_coefficients_coeff_2_1_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_2_0_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_2_0_portyFile, "%b\n", tmp_select_section_coefficients_coeff_2_0_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_2_0_porty_int <= tmp_select_section_coefficients_coeff_2_0_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_1_9_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_1_9_portyFile, "%b\n", tmp_select_section_coefficients_coeff_1_9_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_1_9_porty_int <= tmp_select_section_coefficients_coeff_1_9_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_1_8_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_1_8_portyFile, "%b\n", tmp_select_section_coefficients_coeff_1_8_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_1_8_porty_int <= tmp_select_section_coefficients_coeff_1_8_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_1_7_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_1_7_portyFile, "%b\n", tmp_select_section_coefficients_coeff_1_7_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_1_7_porty_int <= tmp_select_section_coefficients_coeff_1_7_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_1_6_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_1_6_portyFile, "%b\n", tmp_select_section_coefficients_coeff_1_6_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_1_6_porty_int <= tmp_select_section_coefficients_coeff_1_6_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_1_5_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_1_5_portyFile, "%b\n", tmp_select_section_coefficients_coeff_1_5_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_1_5_porty_int <= tmp_select_section_coefficients_coeff_1_5_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_1_4_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_1_4_portyFile, "%b\n", tmp_select_section_coefficients_coeff_1_4_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_1_4_porty_int <= tmp_select_section_coefficients_coeff_1_4_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_1_3_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_1_3_portyFile, "%b\n", tmp_select_section_coefficients_coeff_1_3_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_1_3_porty_int <= tmp_select_section_coefficients_coeff_1_3_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_1_2_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_1_2_portyFile, "%b\n", tmp_select_section_coefficients_coeff_1_2_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_1_2_porty_int <= tmp_select_section_coefficients_coeff_1_2_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_1_10_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_1_10_portyFile, "%b\n", tmp_select_section_coefficients_coeff_1_10_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_1_10_porty_int <= tmp_select_section_coefficients_coeff_1_10_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_1_1_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_1_1_portyFile, "%b\n", tmp_select_section_coefficients_coeff_1_1_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_1_1_porty_int <= tmp_select_section_coefficients_coeff_1_1_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(select_section_coefficients_coeff_1_0_portyFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(select_section_coefficients_coeff_1_0_portyFile, "%b\n", tmp_select_section_coefficients_coeff_1_0_porty) < 1)
        isSimulationEnd1 = 1;  
      else
        select_section_coefficients_coeff_1_0_porty_int <= tmp_select_section_coefficients_coeff_1_0_porty;
    end
    if(isNotFirstRise1) begin
      if ($feof(x_adcFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(x_adcFile, "%b\n", tmp_x_adc) < 1)
        isSimulationEnd1 = 1;  
      else
        x_adc_int <= tmp_x_adc;
    end
    if(isNotFirstRise1) begin
      if ($feof(srdyiFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(srdyiFile, "%b\n", tmp_srdyi) < 1)
        isSimulationEnd1 = 1;  
      else
        srdyi_int <= tmp_srdyi;
    end
    if(isNotFirstRise1) begin
      if ($feof(section_limitFile) != 0)
        isSimulationEnd1 = 1;  
      else
      if ($fscanf(section_limitFile, "%b\n", tmp_section_limit) < 1)
        isSimulationEnd1 = 1;  
      else
        section_limit_int <= tmp_section_limit;
    end
  end
//-- Test Outputs-----
  always@(posedge clk_int)
    begin 
    misFlg1  = 0;
  if (GlobalReset_int==0)
    begin 
    if(loop_cnt1 >= 0) 
    begin
      if ($feof(x_linRefFile) != 0)
        isSimulationEnd1 = 1;  
      else 
      if ($fscanf(x_linRefFile, "%b\n", ref_x_lin) < 1 )
        isSimulationEnd1 = 1;  
      else 
        begin
          tmp_x_lin = x_lin_int;

          $fdisplay(x_linOutFile, "%b",tmp_x_lin);

          if(tmp_x_lin !== ref_x_lin) 
          begin
            misFlg1  = 1;
            $fdisplay(logFile, "Vector failed for port: x_lin");
            $fdisplay(logFile, "Expecting: %b",ref_x_lin);
            $fdisplay(logFile, "Actual:    %b",tmp_x_lin);
          end
        end

      if ($feof(srdyoRefFile) != 0)
        isSimulationEnd1 = 1;  
      else 
      if ($fscanf(srdyoRefFile, "%b\n", ref_srdyo) < 1 )
        isSimulationEnd1 = 1;  
      else 
        begin
          tmp_srdyo = srdyo_int;

          $fdisplay(srdyoOutFile, "%b",tmp_srdyo);

          if(tmp_srdyo !== ref_srdyo) 
          begin
            misFlg1  = 1;
            $fdisplay(logFile, "Vector failed for port: srdyo");
            $fdisplay(logFile, "Expecting: %b",ref_srdyo);
            $fdisplay(logFile, "Actual:    %b",tmp_srdyo);
          end
        end

      if(misFlg1==1)
      begin
        mismatch1 = mismatch1 + 1;
        $fdisplay(logFile, "Mismatch at clk cycle no: %d",loop_cnt1);
        $fdisplay(logFile, "--------------------------------------");
      end
    end

    loop_cnt1 <= loop_cnt1 + 1;
  end
end //always

//------------------------------------------------------------
//-- Print Final Simulation Summary --
//------------------------------------------------------------
  always@(isSimulationEnd)
  begin
    if (isSimulationEnd) 
    begin
      $display("End Simulation");
      if(mismatch == 0)
      begin
        $display("*******  Verilog Verification Successful! *******");
        $fdisplay(logFile, "*******  Verilog Verification Successful! *******");
        $display("No extra latency ");
        $fdisplay(logFile, "No extra latency ");
      end
      else
      begin
        $display("*******  Verilog Verification Failed! *******");
        $display("Failed with %d mismatches", mismatch);
        $fdisplay(logFile,"Failed with %d mismatches", mismatch);
      end 
    $finish;
    end 
  end //always
endmodule
