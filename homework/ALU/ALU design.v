////////////////////////////////////////////////////////////////
//
// Module: HW2_alu.v
// Author: Peizhe Zhang
//         ee216a@gmail.com
//
// Description:
//      ALU for HW2
//
//
////////////////////////////////////////////////////////////////

module HW2_alu ( 
    clk_p_i,
    reset_n_i,
    data_a_i,
    data_b_i,
    inst_i,
    data_o
    );

////////////////////////////////////////////////////////////////
//  Inputs & Outputs
input           clk_p_i;
input           reset_n_i;
input   [7:0]   data_a_i;
input   [7:0]   data_b_i;
input   [2:0]   inst_i;

output  [15:0]  data_o;
	
////////////////////////////////////////////////////////////////
//  reg & wire declarations
reg     [15:0]   ALU_out_inst;  //16bits for output reg

wire    [15:0]   ALU_d2_w;    //16bits for output wire

reg     [15:0]   ALU_d2_r;    //16bits for output reg
reg	[7:0]	Data_A_o_r;   //Reg for input B
reg	[7:0]   Data_B_o_r;   //Reg for input A
reg	[2:0]   Inst_o_r;     //Reg for instruction out
////////////////////////////////////////////////////////////////
//  Combinational Logic
assign ALU_d2_w = ALU_out_inst;
assign data_o = ALU_d2_r;

// The output MUX
always @(*) begin
    case(Inst_o_r)
        3'b000:	    ALU_out_inst = Data_A_o_r + Data_B_o_r; //unsigned Addition 
        3'b001:	    ALU_out_inst = Data_B_o_r - Data_A_o_r; //Unsigned subsraction
        3'b010:	    ALU_out_inst = Data_A_o_r * Data_B_o_r; //Unsigned Multiplication
        3'b011:	    ALU_out_inst = Data_A_o_r & Data_B_o_r; //Bitwise AND
        3'b100:	    ALU_out_inst = Data_A_o_r ^ Data_B_o_r; //Bitwise XOR
        3'b101:	    ALU_out_inst = Data_A_o_r[7] == 0 ? {8'b0, Data_A_o_r} : {8'b0,~Data_A_o_r} + 1; //Absolute value of input a
        3'b110:	    ALU_out_inst = (Data_B_o_r - Data_A_o_r) * 4;  //Subtraction & Multiply by 4
        3'b111:	    ALU_out_inst = 0; //Unused
        default:    ALU_out_inst = 0; //Unused
    endcase
end

////////////////////////////////////////////////////////////////
//  Registers
always @(posedge clk_p_i or negedge reset_n_i) begin
    if (reset_n_i == 1'b0) begin
        ALU_d2_r    <= {(16){1'b0}}; // <= 0
        Data_A_o_r  <= {(8){1'b0}};  // <= 0
        Data_B_o_r  <= {(8){1'b0}};  // <= 0
        Inst_o_r    <= 3'b111;
    end
    else begin
        ALU_d2_r    <= ALU_d2_w;
        Data_A_o_r  <= data_a_i;
        Data_B_o_r  <= data_b_i;
        Inst_o_r    <= inst_i; 
    end
end

endmodule
