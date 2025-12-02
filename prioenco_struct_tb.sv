//priority encoder testbench 
`timescale 1ns / 1ps
module norgate_test;
    import prioenco_struct_pkg::*;// Import package of virtual function classes
    parameter WIDTH=8;
    parameter DEPTH=3;
     prioenco_if #(WIDTH, DEPTH) fif();//instantiate the interface
    Basenor nor_ptr;//declaration of object nor_ptr of class Basenor
    bit expected_q2,expected_q1,expected_q0;
    bit nor1,nor2,nor3,nor4,nor5,nor6,nor7,nor8;//two input NOR
    bit NOR1,NOR2,NOR3,NOR4;//3 input NOR 
    bit Nor1,Nor2,Nor3,Nor4;//4 input NOR 
    prioenco_nor_struct n1(fif.d[0],fif.d[1],fif.d[2],fif.d[3],fif.d[4],fif.d[5],fif.d[6],fif.d[7],fif.q[0],fif.q[1],fif.q[2]);//instantiate the input and output bit of structural code
    initial begin
	
                                   $display("Elevator using Priority Encoder Test");
                  $display("Result | Inputs (Floor requests) |  Expected output | Output | ");
        for(int i=0;i<10;i++)begin
            {fif.d[7:0]}=$random;
            nor_ptr=new();
            nor1=nor_ptr.perform(fif.d[5],fif.d[5]);//2-input NOR operation
            nor2=nor_ptr.perform(fif.d[6],nor1);//2-input NOR operation
            nor3=nor_ptr.perform(fif.d[3],fif.d[3]);//2-input NOR operation
            NOR1=nor_ptr.perform(fif.d[6],fif.d[4],nor3);//3-input NOR operation
            nor4=nor_ptr.perform(fif.d[1],fif.d[1]);//2-input NOR operation
            Nor1=nor_ptr.perform(fif.d[6],fif.d[4],fif.d[2],nor4);//4-input NOR operation
            NOR2=nor_ptr.perform(fif.d[6],fif.d[4],nor3);//3-input NOR operation
            nor5=nor_ptr.perform(fif.d[2],fif.d[2]);//2-input NOR operation
			NOR3=nor_ptr.perform(fif.d[5],fif.d[4],nor3);//3-input NOR operation
            NOR4=nor_ptr.perform(fif.d[5],fif.d[4],nor5);//3-input NOR operation
            Nor2=nor_ptr.perform(fif.d[7],nor2,NOR1,Nor1);//4-input NOR operation
            nor6=nor_ptr.perform(Nor2,Nor2);//2-input NOR operation
            expected_q0=nor6;//computed output for q0
            Nor3=nor_ptr.perform(fif.d[7],fif.d[6],NOR3,NOR4);//4-input NOR operation
            nor7=nor_ptr.perform(Nor3,Nor3);//2-input NOR operation
            expected_q1=nor7;//computed output for q1
            Nor4=nor_ptr.perform(fif.d[7],fif.d[6],fif.d[5],fif.d[4]);//4-input NOR operation
            nor8=nor_ptr.perform(Nor4,Nor4);//2-input NOR operation
            expected_q2=nor8;//computed output for q2
            #10;
            if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                $display("mismatch       %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
            end
            else begin
                $display("match          %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
            end
         end
        $finish;
        end
       endmodule

           
