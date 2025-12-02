`timescale 1ns / 1ps
module priority_encoder_8to3_behv_tb;
import prioenco_behv_pkg::*;
parameter WIDTH=8;
parameter DEPTH=3;
bit expected_q2,expected_q1,expected_q0;
prioenco_if #(WIDTH, DEPTH) fif();
priority_encoder_8to3 b1(fif.d[7:0],fif.q[2:0]);
bit n1,n2,n3,n4,n5,n6,n7,n8,n9,n10;//inputs of NOT
bit O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12;//inputs of OR
bit a1,a2,a3,a4,a5;//inputs of 4 input AND
bit A1,A2,A3;//inputs of 3 input AND
bit An1,An2;//inputs of 2 input AND
Baseand and_ptr;
Basenot not_ptr;
Baseor or_ptr;
	initial begin
	 $display("Elevator using Priority Encoder Test");
                     $display("Result | Inputs (Floor requests) |  Expected output | Output | ");
		repeat(1) begin
			rndm7();
			rndm6();
			rndm5();
			rndm4();
			rndm3();
			rndm2();
			rndm1();
			rndm0();
		end
		$finish;
	end
	
	task rndm7;
		begin
		{fif.d[7:0]}=8'b10101001;
		not_ptr=new();
                n1=not_ptr.perform(fif.d[2]);//NOT operation
                n2=not_ptr.perform(fif.d[4]);//NOT operation
                n3=not_ptr.perform(fif.d[6]);//NOT operation
                n4=not_ptr.perform(fif.d[5]);//NOT operation
                and_ptr=new();
                a1=and_ptr.perform(fif.d[1],n1,n2,n3);//4-input AND operation
                A1=and_ptr.perform(fif.d[3],n2,n3);//3-input AND operation
                An1=and_ptr.perform(fif.d[5],n3);//2-input AND operation
                or_ptr=new();
                O1=or_ptr.perform(a1,A1,An1,fif.d[7]);//4-input OR operation
                expected_q0=O1;
                A2=and_ptr.perform(fif.d[2],n2,n4);//3-input AND operation
                A3=and_ptr.perform(fif.d[3],n2,n4);//3-input AND operation
                O2=or_ptr.perform(A2,A3,fif.d[6],fif.d[7]);//4-input OR operation
                expected_q1=O2;
                O3=or_ptr.perform(fif.d[4],fif.d[5],fif.d[6],fif.d[7]);//4-input OR operation
                expected_q2=O3;
                #10;
		if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                $display("mismatch       %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
        end
        else begin
                $display("match          %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
        end
	end
endtask
task rndm6;
		begin
		{fif.d[7:0]}=8'b01101001;
		        not_ptr=new();
                n1=not_ptr.perform(fif.d[2]);//NOT operation
                n2=not_ptr.perform(fif.d[4]);//NOT operation
                n3=not_ptr.perform(fif.d[6]);//NOT operation
                n4=not_ptr.perform(fif.d[5]);//NOT operation
                and_ptr=new();
                a1=and_ptr.perform(fif.d[1],n1,n2,n3);//4-input AND operation
                A1=and_ptr.perform(fif.d[3],n2,n3);//3-input AND operation
                An1=and_ptr.perform(fif.d[5],n3);//2-input AND operation
                or_ptr=new();
                O1=or_ptr.perform(a1,A1,An1,fif.d[7]);//4-input OR operation
                expected_q0=O1;
                A2=and_ptr.perform(fif.d[2],n2,n4);//3-input AND operation
                A3=and_ptr.perform(fif.d[3],n2,n4);//3-input AND operation
                O2=or_ptr.perform(A2,A3,fif.d[6],fif.d[7]);//4-input OR operation
                expected_q1=O2;
                O3=or_ptr.perform(fif.d[4],fif.d[5],fif.d[6],fif.d[7]);//4-input OR operation
                expected_q2=O3;
                #10;
                if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                       $display("mismatch       %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
                else begin
                        $display("match          %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
	end
endtask
task rndm5;
		begin
		{fif.d[7:0]}=8'b00101001;
		       not_ptr=new();
                n1=not_ptr.perform(fif.d[2]);//NOT operation
                n2=not_ptr.perform(fif.d[4]);//NOT operation
                n3=not_ptr.perform(fif.d[6]);//NOT operation
                n4=not_ptr.perform(fif.d[5]);//NOT operation
                and_ptr=new();
                a1=and_ptr.perform(fif.d[1],n1,n2,n3);//4-input AND operation
                A1=and_ptr.perform(fif.d[3],n2,n3);//3-input AND operation
                An1=and_ptr.perform(fif.d[5],n3);//2-input AND operation
                or_ptr=new();
                O1=or_ptr.perform(a1,A1,An1,fif.d[7]);//4-input OR operation
                expected_q0=O1;
                A2=and_ptr.perform(fif.d[2],n2,n4);//3-input AND operation
                A3=and_ptr.perform(fif.d[3],n2,n4);//3-input AND operation
                O2=or_ptr.perform(A2,A3,fif.d[6],fif.d[7]);//4-input OR operation
                expected_q1=O2;
                O3=or_ptr.perform(fif.d[4],fif.d[5],fif.d[6],fif.d[7]);//4-input OR operation
                expected_q2=O3;
                #10;
                if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                       $display("mismatch       %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
                else begin
                       $display("match          %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
	end
endtask
task rndm4;
		begin
		{fif.d[7:0]}=8'b00011001;
		        not_ptr=new();
                n1=not_ptr.perform(fif.d[2]);//NOT operation
                n2=not_ptr.perform(fif.d[4]);//NOT operation
                n3=not_ptr.perform(fif.d[6]);//NOT operation
                n4=not_ptr.perform(fif.d[5]);//NOT operation
                and_ptr=new();
                a1=and_ptr.perform(fif.d[1],n1,n2,n3);//4-input AND operation
                A1=and_ptr.perform(fif.d[3],n2,n3);//3-input AND operation
                An1=and_ptr.perform(fif.d[5],n3);//2-input AND operation
                or_ptr=new();
                O1=or_ptr.perform(a1,A1,An1,fif.d[7]);//4-input OR operation
                expected_q0=O1;
                A2=and_ptr.perform(fif.d[2],n2,n4);//3-input AND operation
                A3=and_ptr.perform(fif.d[3],n2,n4);//3-input AND operation
                O2=or_ptr.perform(A2,A3,fif.d[6],fif.d[7]);//4-input OR operation
                expected_q1=O2;
                O3=or_ptr.perform(fif.d[4],fif.d[5],fif.d[6],fif.d[7]);//4-input OR operation
                expected_q2=O3;
                #10;
                if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                       $display("mismatch       %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
                else begin
                       $display("match          %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
	end
endtask
task rndm3;
		begin
		{fif.d[7:0]}=8'b00001011;
		        not_ptr=new();
                n1=not_ptr.perform(fif.d[2]);//NOT operation
                n2=not_ptr.perform(fif.d[4]);//NOT operation
                n3=not_ptr.perform(fif.d[6]);//NOT operation
                n4=not_ptr.perform(fif.d[5]);//NOT operation
                and_ptr=new();
                a1=and_ptr.perform(fif.d[1],n1,n2,n3);//4-input AND operation
                A1=and_ptr.perform(fif.d[3],n2,n3);//3-input AND operation
                An1=and_ptr.perform(fif.d[5],n3);//2-input AND operation
                or_ptr=new();
                O1=or_ptr.perform(a1,A1,An1,fif.d[7]);//4-input OR operation
                expected_q0=O1;
                A2=and_ptr.perform(fif.d[2],n2,n4);//3-input AND operation
                A3=and_ptr.perform(fif.d[3],n2,n4);//3-input AND operation
                O2=or_ptr.perform(A2,A3,fif.d[6],fif.d[7]);//4-input OR operation
                expected_q1=O2;
                O3=or_ptr.perform(fif.d[4],fif.d[5],fif.d[6],fif.d[7]);//4-input OR operation
                expected_q2=O3;
                #10;
                if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                     $display("mismatch       %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
                else begin
                     $display("match          %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
	end
endtask
task rndm2;
		begin
		{fif.d[7:0]}=8'b00000111;
		        not_ptr=new();
                n1=not_ptr.perform(fif.d[2]);//NOT operation
                n2=not_ptr.perform(fif.d[4]);//NOT operation
                n3=not_ptr.perform(fif.d[6]);//NOT operation
                n4=not_ptr.perform(fif.d[5]);//NOT operation
                and_ptr=new();
                a1=and_ptr.perform(fif.d[1],n1,n2,n3);//4-input AND operation
                A1=and_ptr.perform(fif.d[3],n2,n3);//3-input AND operation
                An1=and_ptr.perform(fif.d[5],n3);//2-input AND operation
                or_ptr=new();
                O1=or_ptr.perform(a1,A1,An1,fif.d[7]);//4-input OR operation
                expected_q0=O1;
                A2=and_ptr.perform(fif.d[2],n2,n4);//3-input AND operation
                A3=and_ptr.perform(fif.d[3],n2,n4);//3-input AND operation
                O2=or_ptr.perform(A2,A3,fif.d[6],fif.d[7]);//4-input OR operation
                expected_q1=O2;
                O3=or_ptr.perform(fif.d[4],fif.d[5],fif.d[6],fif.d[7]);//4-input OR operation
                expected_q2=O3;
                #10;
                if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                        $display("mismatch       %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
                else begin
                        $display("match          %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
	end
endtask
task rndm1;
		begin
		{fif.d[7:0]}=8'b00000011;
		        not_ptr=new();
                n1=not_ptr.perform(fif.d[2]);//NOT operation
                n2=not_ptr.perform(fif.d[4]);//NOT operation
                n3=not_ptr.perform(fif.d[6]);//NOT operation
                n4=not_ptr.perform(fif.d[5]);//NOT operation
                and_ptr=new();
                a1=and_ptr.perform(fif.d[1],n1,n2,n3);//4-input AND operation
                A1=and_ptr.perform(fif.d[3],n2,n3);//3-input AND operation
                An1=and_ptr.perform(fif.d[5],n3);//2-input AND operation
                or_ptr=new();
                O1=or_ptr.perform(a1,A1,An1,fif.d[7]);//4-input OR operation
                expected_q0=O1;
                A2=and_ptr.perform(fif.d[2],n2,n4);//3-input AND operation
                A3=and_ptr.perform(fif.d[3],n2,n4);//3-input AND operation
                O2=or_ptr.perform(A2,A3,fif.d[6],fif.d[7]);//4-input OR operation
                expected_q1=O2;
                O3=or_ptr.perform(fif.d[4],fif.d[5],fif.d[6],fif.d[7]);//4-input OR operation
                expected_q2=O3;
                #10;
                if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                       $display("mismatch       %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
                else begin
                       $display("match          %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
	end
endtask
task rndm0;
		begin
		    {fif.d[7:0]}=8'b00000001;
                    not_ptr=new();
                    n1=not_ptr.perform(fif.d[2]);//NOT operation
                    n2=not_ptr.perform(fif.d[4]);//NOT operation
                    n3=not_ptr.perform(fif.d[6]);//NOT operation
                    n4=not_ptr.perform(fif.d[5]);//NOT operation
                    and_ptr=new();
                    a1=and_ptr.perform(fif.d[1],n1,n2,n3);//4-input AND operation
                    A1=and_ptr.perform(fif.d[3],n2,n3);//3-input AND operation
                    An1=and_ptr.perform(fif.d[5],n3);//2-input AND operation
                    or_ptr=new();
                    O1=or_ptr.perform(a1,A1,An1,fif.d[7]);//4-input OR operation
                    expected_q0=O1;
                    A2=and_ptr.perform(fif.d[2],n2,n4);//3-input AND operation
                    A3=and_ptr.perform(fif.d[3],n2,n4);//3-input AND operation
                    O2=or_ptr.perform(A2,A3,fif.d[6],fif.d[7]);//4-input OR operation
                    expected_q1=O2;
                    O3=or_ptr.perform(fif.d[4],fif.d[5],fif.d[6],fif.d[7]);//4-input OR operation
                    expected_q2=O3;
                    #10;
                if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                     $display("mismatch       %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
                else begin
                     $display("match          %b                 %b            %b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                end
	end
endtask
endmodule
