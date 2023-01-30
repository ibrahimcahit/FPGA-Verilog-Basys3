`timescale 1ns / 1ps

module TopModule (
  input  clk,
  input  [1:0] case_selector,
  output reg SERVO_OUTPUT
);

parameter PWM_STOP      = 2'b00,
          PWM_STEP_1    = 2'b01,
          PWM_STEP_2    = 2'b10,
          PWM_STEP_3    = 2'b11;

reg       pwm_reset;
reg [7:0] duty_cycle;
wire      output_pulse;

pwm_generator get_pwm(
    .clk(clk), 
    .rst(pwm_reset), 
    .duty_cycle(duty_cycle), 
    .pwm_out(output_pulse)
);

always @* begin
  case (case_selector)
  
    PWM_STOP: begin
      // State Default
      pwm_reset <= 0;
      duty_cycle <= 0;
      
      SERVO_OUTPUT <= output_pulse;    
    end
    
    PWM_STEP_1: begin
      // State Default
      pwm_reset <= 0;
      duty_cycle <= 85;
      
      SERVO_OUTPUT <= output_pulse;    
    end
    
    PWM_STEP_2: begin
      // State 1
      pwm_reset <= 0;
      duty_cycle <= 170;
      
      SERVO_OUTPUT <= output_pulse;     
    end
    
    PWM_STEP_3: begin
      // State 2
      pwm_reset <= 0;
      duty_cycle <= 255;
      
      SERVO_OUTPUT <= output_pulse;
    end
    
  endcase
end

endmodule
