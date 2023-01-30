`timescale 1ns / 1ps

module testbench();

    reg clk;
    reg [1:0] case_sel;
    wire pwm_out;

    TopModule UUT(
      .clk(clk),
      .case_selector(case_sel),
      .SERVO_OUTPUT(pwm_out)
    );
    
    initial begin
    
        clk = 0;
        case_sel = 2'b00;     
        #20000000      
        case_sel = 2'b01;      
        #20000000    
        case_sel = 2'b10;      
        #20000000       
        case_sel = 2'b11;
    
    end
    always #500 clk = ~clk;   
endmodule
