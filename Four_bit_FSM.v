module Four_bit_FSM(Start,clock,reset,detector_out);

input clock, reset; 
input Start;
 
output detector_out;

reg detector_out; 

parameter  INIT=4'b0000, 
  WAIT1=4'b0001, 
  WAIT2=4'b0011, 
  WAIT3=4'b0111, 
  READY=4'b1111;
  
reg [3:0] current_state, next_state; 

always @(posedge clock, posedge reset)
begin
 if(reset==1) 
 current_state <= INIT;
 else
 current_state <= next_state; 
end 

always @(current_state,Start)
begin
 case(current_state) 
 INIT:begin
  if(Start==1)
   next_state = WAIT1;
  else
   next_state = INIT;
 end
 WAIT1:begin
  if(Start==1)
   next_state = WAIT2;
  else
   next_state = INIT;
 end
 WAIT2:begin
  if(Start==1)
   next_state = WAIT3;
  else
   next_state = INIT;
 end 
 WAIT3:begin
  if(Start==1)
   next_state = READY;
  else
   next_state = INIT;
 end
 READY:begin
  if(Start==0)
   next_state = INIT;
  else
   next_state = READY;
 end
 default:next_state = INIT;
 endcase
end

always @(current_state)
begin 
 case(current_state) 
 INIT:   detector_out = 0;
 WAIT1:   detector_out = 0;
 WAIT2:  detector_out = 0;
 WAIT3:  detector_out = 0;
 READY:  detector_out = 1;
 default:  detector_out = 0;
 endcase
end

endmodule

module tb_Four_bit_FSM;

 reg Start;
 reg clock;
 reg reset;

 wire detector_out;

 Four_bit_FSM Moore (.Start(Start), .clock(clock), .reset(reset), .detector_out(detector_out));
 
 initial begin
 clock = 0;
 forever #5 clock = ~clock;
 end 
 initial begin
  
  Start = 0; reset = 1; #20;
  
  reset = 0; #20;
  
  Start = 1; #40;
  
  Start = 0; #10;
  
  Start = 1; #20;
  
  Start = 0;  #20;
  
  Start = 1;  #50;
  
  Start = 0;  
 
 end
      
endmodule