module pwm_generator(
    input       clk, 
    input       rst, 
    input [7:0] duty_cycle, 
    output reg  pwm_out
);

reg [31:0] counter = 0;

parameter max_duty_us = 1000;
parameter wait_time_us = 20000;
 
initial begin
    pwm_out = 0;
end

always @(posedge clk) begin

    if (counter < wait_time_us + 1) begin
        if (counter <  ( 1000 + (duty_cycle * max_duty_us) / 255 ) ) begin
            pwm_out <= 1;          
        end
        else begin
            pwm_out <= 0; 
        end
        
        counter <= counter + 1;
    end
    else begin
        counter <= 0;
    end 
    
end

endmodule
