//--------------------------------------------------------------------
//		Timescale
//		Means that if you do #1 in the initial block of your
//		testbench, time is advanced by 1ns instead of 1ps
//--------------------------------------------------------------------
`timescale 1ns / 1ps

//--------------------------------------------------------------------
//		The Lab1Adder Testbench.
//--------------------------------------------------------------------
module Lab1AdderTestbench();

	//----------------------------------------------------------------
	//		Parameters
	//----------------------------------------------------------------
	parameter ResetValue	= 2'b01;
	parameter HalfCycle		= 1;			//Half of the Clock Period is 5 ns
	localparam Cycle		= 2*HalfCycle;	//The length of the entire Clock Period
	
	
	//----------------------------------------------------------------
	//		Signal Declarations
	//----------------------------------------------------------------
	reg				Clock;
	reg	[7:0]		A, B;
	wire  [7:0]		Sum;
  	reg	[7:0]		testcaseA;     
	reg   [7:0]	   testcaseB;
	
	reg  [7:0]  right;
	//----------------------------------------------------------------
	//		Adder Model
	//----------------------------------------------------------------
	Lab1Adder	DUT(.A(A), .B(B), .Sum(Sum));
	
	
	//---------------------------------------------------------------
	//		Clock Source
	//---------------------------------------------------------------
	initial Clock =			1'b0;
	always #(HalfCycle) Clock =	~Clock;
	
	
	//----------------------------------------------------------------
	//		Test Stimulus
	//----------------------------------------------------------------
	initial begin
		// Initial Conditions
		A =				1'b0;
		B =				1'b0;
		right =   1'b0;
		testcaseA =		7'd0;
		testcaseB =     7'd0;
		#(Cycle);
		
		// Test Code
		repeat (255) begin
			testcaseB = 7'd0;
			right = testcaseA;
			repeat (255) begin
				A = testcaseA;
				B = testcaseB;
				#(Cycle);
				if (right != Sum) begin
				$display  ("right = %d:", right);
				$display ("    A   = %d:", A);
				$display ("    B   = %d:", B);
				$display ("    Sum = %d:", Sum);
				end
				right = right + 1;
				testcaseB =	testcaseB + 1;
			end
			testcaseA = testcaseA + 1;
		end
		$stop;
	end
endmodule
