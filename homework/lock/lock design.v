`timescale 1ns / 1ps

module hw3_lock (
	i_clk,
	i_rst_n,
	i_lock_en,
	i_passcode_valid,
	i_passcode,
	o_locked,
	o_fake
);

parameter state_l1 = 4'b0000;  // initial/reset state
parameter state_l2 = 4'b0001, state_l3 = 4'b0010, state_l4 = 4'b0011; 
parameter state_l5 = 4'b0100, state_unlock = 4'b0101;                        // state for unlock
parameter state_f1 = 4'b1001, state_f2 = 4'b1010, state_f3 = 4'b1011;    // state for suspicious
parameter state_f4 = 4'b1100, state_fa = 4'b1101;

input i_clk, i_rst_n, i_lock_en, i_passcode_valid;
input[7:0] i_passcode;
output o_fake, o_locked;

reg[3:0] state, next_state;
reg o_fake, o_locked;

// memory element
always@(posedge i_clk) begin
	state <= next_state;
end

// output logic
always@(*) begin
	if(i_rst_n == 0) begin
		o_fake = 0;
		o_locked = 1;
	end
	else begin
		case(state)
			state_unlock: begin
				o_fake = 0;
				o_locked = 0;
			end
			state_fa: begin
				o_fake = 1;
				o_locked = 1;
			end
			default: begin
				o_fake = 0;
				o_locked = 1;
			end
		endcase
	end
end

always@(*) begin
	if(i_rst_n == 0) next_state = state_l1;
	else if(i_passcode_valid == 0) next_state = state;
	else begin
		case(state)
			state_l1: 
				if(i_passcode == 244) next_state = state_l2;
				else if(i_passcode == 88) next_state = state_f1;
				else next_state = state_l1;
			state_l2:
				if(i_passcode == 35) next_state = state_l3;
				else if(i_passcode == 244) next_state = state_l2;
				else if(i_passcode == 88) next_state = state_f1;
				else next_state = state_l1;
			state_l3:
				if(i_passcode == 244) next_state = state_l4;
				else if(i_passcode == 88) next_state = state_f1;
				else next_state = state_l1;
			state_l4:
				if(i_passcode == 6) next_state = state_l5;
				else if(i_passcode == 244) next_state = state_l2;
				else if(i_passcode == 88) next_state = state_f1;
				else next_state = state_l1;
			state_l5:
				if(i_passcode == 157 && i_lock_en == 0) next_state = state_unlock;
				else if(i_passcode == 244) next_state = state_l2;
				else if(i_passcode == 88) next_state = state_f1;
				else next_state = state_l1;
			state_unlock:
				if(i_lock_en == 1) next_state = state_l1;
				else next_state = state_unlock;
			state_f1:
				if(i_passcode == 13) next_state = state_f2;
				else if(i_passcode == 244) next_state = state_l2;
				else if(i_passcode == 88) next_state = state_f1;
				else next_state = state_l1;
			state_f2:
				if(i_passcode == 244) next_state = state_f3;
				else if(i_passcode == 88) next_state = state_f1;
				else next_state = state_l1;
			state_f3:
				if(i_passcode == 35) next_state = state_f4;
				else if(i_passcode == 244) next_state = state_l2;
				else if(i_passcode == 88) next_state = state_f1;
				else next_state = state_l1;
			state_f4:
				if(i_passcode == 90) next_state = state_fa;
				else if(i_passcode == 244) next_state = state_l4;
				else if(i_passcode == 88) next_state = state_f1;
				else next_state = state_l1;
			state_fa:
				next_state = state_fa;
			default: next_state = state_l1;
		endcase
	end
end

endmodule
