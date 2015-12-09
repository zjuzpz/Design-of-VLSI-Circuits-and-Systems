module delay(
  input reset,
  input clk,
  input enable,
  output reg del
);

reg [2:0] counter;

always@(posedge clk) begin
  if(reset == 1) begin
    counter <= 0;
	del <= 0;
  end
  else if(enable == 1) begin
    counter <= 1;
	del <= 0;
  end
  else if(counter > 0 && counter < 7)begin
    counter <= counter + 1;
    del <= 0;	
  end
  else if(counter == 7) begin
    counter <= counter + 1;
	del <= 1;
  end
  else begin
    counter <= 0;
    del <= 0;
  end
end
endmodule
