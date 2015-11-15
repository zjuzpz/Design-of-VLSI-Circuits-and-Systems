`timescale 1ns / 1ps

module hw3_lock_tb;

	// Inputs
	reg i_clk;
	reg i_rst_n;
	reg i_lock_en;
	reg i_passcode_valid;
	reg [7:0] i_passcode;

	// Outputs
	wire o_locked;
	wire o_fake;

	// Instantiate the Unit Under Test (UUT)
	hw3_lock uut (
		.i_clk(i_clk), 
		.i_rst_n(i_rst_n), 
		.i_lock_en(i_lock_en), 
		.i_passcode_valid(i_passcode_valid), 
		.i_passcode(i_passcode), 
		.o_locked(o_locked), 
		.o_fake(o_fake)
	);

	initial begin
		// Initialize Inputs
		i_clk = 0;
		i_rst_n = 0;
		i_lock_en = 0;
		i_passcode_valid = 0;
		i_passcode = 0;
		// wait 10ns, disable reset and enable input
		#10 i_rst_n = 1;
		i_passcode_valid = 1; 
		// Wait 20 ns for global reset to finish
		#20;
		
		// Test unlock 
		#10 i_passcode = 244;
		#10 i_passcode = 35;
		#10 i_passcode = 244;
		#10 i_passcode = 6;     //Test1:
		#10 i_passcode = 157;  //80ns:o_lock = 0, o_fake = 0;
		
		// Test fake
		#10 i_lock_en = 1;
		#10 i_lock_en = 0;
		#10 i_passcode = 88;
		#10 i_passcode = 13;
		#10 i_passcode = 244;
		#10 i_passcode = 35;      //Test2:
		#10 i_passcode = 90;     //150ns:o_lock = 1, o_fake = 1;
		
		// Test fake is waiting for reset and asynchronous reset
		#10 i_passcode = 244;
		#10 i_passcode = 35;
		#10 i_passcode = 244;
		#10 i_passcode = 6;      //Test3:
		#10 i_passcode = 157;   //200ns:o_lock = 1, o_fake = 1;
		#10 i_rst_n = 0;        //210ns:o_lock = 1, o_fake = 0;
		
		// Test state f4 to l4 transition
		#10 i_rst_n = 1;
		#10 i_passcode = 88;
		#10 i_passcode = 13;
		#10 i_passcode = 244;
		#10 i_passcode = 35;
		#10 i_passcode = 244;
		#10 i_passcode = 6;      //Test4:
		#10 i_passcode = 157;   //290ns:o_lock = 0, o_fake = 0;
		
		// Test lock enable
		#10 i_lock_en = 1;
		#10 i_lock_en = 0;
		#10 i_passcode = 244;
		#10 i_passcode = 35;
		#10 i_passcode = 244;
		#10 i_passcode = 6;                      //Test5:
		#10 i_passcode = 157; i_lock_en = 1;    //360ns: o_lock = 1, o_fake = 0;
		#10 i_passcode = 157; i_lock_en = 0;    //370ns: o_lock = 1, o_fake = 0;
		
		// Test state_f3 to state_f1
		#10 i_lock_en = 1;
		#10 i_lock_en = 0;
		#10 i_passcode = 88;
		#10 i_passcode = 13;
		#10 i_passcode = 244;
		#10 i_passcode = 88;
		#10 i_passcode = 13;
		#10 i_passcode = 244;
		#10 i_passcode = 35;                    //Test6:
		#10 i_passcode = 90;                   //470ns: o_lock = 1, o_fake = 1;
		#10 i_rst_n = 0;
		#10 i_rst_n = 1;
		
		// Test passcode_enable
		#10 i_lock_en = 1;
		#10 i_lock_en = 0;
		#10 i_passcode = 244;
		#10 i_passcode = 35;
		#10 i_passcode = 244;
		#10 i_passcode = 6;
		#10 i_passcode_valid = 0;              //Test7:
		#10 i_passcode = 157;                 //570ns: o_lock = 1, o_fake = 0; 
		#10 i_passcode = 123;
		#10 i_passcode = 124;
		#10 i_passcode = 125;
		#10 i_passcode = 157;               //Test8:
		#10 i_passcode_valid = 1;          //620ns: o_lock = 0, o_fake = 0;   

      // Test sequence [244, 35, 35, 35, 35, 244, 6, 157]
		#10 i_lock_en = 1;
		#10 i_lock_en = 0;
		#10 i_passcode = 244;
		#10 i_passcode = 35;
		#30;
		#10 i_passcode = 244;
		#10 i_passcode = 6;                   //Test9:
		#10 i_passcode = 157; 		//720ns: o_lock = 0, o_fake = 0;
		
		#40 $stop;
	end
	
	always #5 i_clk = ~i_clk;
      
endmodule

