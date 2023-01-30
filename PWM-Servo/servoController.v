`timescale 1ns / 1ps

module servoController(
input button1, 
input button2,
input clk,  
output reg [7:0] DUTY
);

always @ (posedge clk) begin
  if (button1) begin
    if (DUTY < 255) DUTY <= DUTY + 15;
  end
  
  if (button2) begin
    if (DUTY > 0) DUTY <= DUTY - 15;
  end
end

endmodule
