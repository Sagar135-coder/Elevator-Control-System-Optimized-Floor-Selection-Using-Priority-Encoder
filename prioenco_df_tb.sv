module prioenco_df_tb;
    import prioenco_df_pkg::*;
        parameter WIDTH=8;
        parameter DEPTH=3;
        prioenco_if #(WIDTH, DEPTH) fif();
        prioenco_df d1(.d(fif.d),.q(fif.q));
        bit expected_q2,expected_q1,expected_q0;
    NandgateBase nand_ptr; // Base class handle
    bit n1,n2,n3,n4,n5,n6;
    bit na1,na2,na3;
    bit N1,N2,N3,N4;

    initial begin
             fif.d[7]=1;fif.d[6]=$random; fif.d[5]=$random;fif.d[4]=$random; fif.d[3]=$random; fif.d[2]=$random; fif.d[1]=$random; fif.d[0]=$random;
                    // Test 2-input NAND
                    nand_ptr = new();
                    n1=nand_ptr.perform(fif.d[7],fif.d[7]); 
                    n2=nand_ptr.perform(fif.d[6],fif.d[6]);
                    n3=nand_ptr.perform(fif.d[5],fif.d[5]);
                    n4=nand_ptr.perform(fif.d[4],fif.d[4]);
                    n6=nand_ptr.perform(fif.d[2],fif.d[2]);
                      // Test 4-input NAND
                          nand_ptr = new();
                          N1=nand_ptr.perform(n1,n2,n3,n4);
                          expected_q2=N1;
                    // Test 3-input NAND
                    nand_ptr = new();
                     na1=nand_ptr.perform(n3,n4,fif.d[3]); 
                     na2=nand_ptr.perform(n3,n4,fif.d[2]); 
                     // Test 4-input NAND
                     nand_ptr = new();
                     N2=nand_ptr.perform(n1,n2,na1,na2);
                     expected_q1=N2;
                     // Test 3-input NAND
                     nand_ptr = new();
                     n5=nand_ptr.perform(n2,fif.d[5]);
                     na3=nand_ptr.perform(n2,n4,fif.d[3]);
                      // Test 4-input NAND
                    nand_ptr = new();                              
                    N3=nand_ptr.perform(n2,n4,n6,fif.d[1]);
                    N4=nand_ptr.perform(n1,n5,na3,N3);
                    expected_q0=N4;
                    #10;
                                 if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                                              $display("mismatch inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                        end
                                  else begin
                                            $display("match inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                     end
                fif.d[7]=0; fif.d[6]=1; fif.d[5]=$random;fif.d[4]=$random; fif.d[3]=$random; fif.d[2]=$random; fif.d[1]=$random; fif.d[0]=$random;
                                     // Test 2-input NAND
                                     nand_ptr = new();
                                     n1=nand_ptr.perform(fif.d[7],fif.d[7]); 
                                     n2=nand_ptr.perform(fif.d[6],fif.d[6]);
                                     n3=nand_ptr.perform(fif.d[5],fif.d[5]);
                                     n4=nand_ptr.perform(fif.d[4],fif.d[4]);
                                     n6=nand_ptr.perform(fif.d[2],fif.d[2]);
                                       // Test 4-input NAND
                                           nand_ptr = new();
                                           N1=nand_ptr.perform(n1,n2,n3,n4);
                                           expected_q2=N1;
                                     // Test 3-input NAND
                                     nand_ptr = new();
                                      na1=nand_ptr.perform(n3,n4,fif.d[3]); 
                                      na2=nand_ptr.perform(n3,n4,fif.d[2]); 
                                      // Test 4-input NAND
                                      nand_ptr = new();
                                      N2=nand_ptr.perform(n1,n2,na1,na2);
                                      expected_q1=N2;
                                      // Test 3-input NAND
                                      nand_ptr = new();
                                      n5=nand_ptr.perform(n2,fif.d[5]);
                                      na3=nand_ptr.perform(n2,n4,fif.d[3]);
                                       // Test 4-input NAND
                                     nand_ptr = new();                              
                                     N3=nand_ptr.perform(n2,n4,n6,fif.d[1]);
                                     N4=nand_ptr.perform(n1,n5,na3,N3);
                                     expected_q0=N4;
                                       #10;
                                                      if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                                                                   $display("mismatch inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                                             end
                                                       else begin
                                                                 $display("match inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                                          end
                    fif.d[7]=0; fif.d[6]=0; fif.d[5]=1; fif.d[4]=$random; fif.d[3]=$random; fif.d[2]=$random; fif.d[1]=$random; fif.d[0]=$random;
                                       // Test 2-input NAND
                                        nand_ptr = new();
                                        n1=nand_ptr.perform(fif.d[7],fif.d[7]); 
                                        n2=nand_ptr.perform(fif.d[6],fif.d[6]);
                                        n3=nand_ptr.perform(fif.d[5],fif.d[5]);
                                        n4=nand_ptr.perform(fif.d[4],fif.d[4]);
                                        n6=nand_ptr.perform(fif.d[2],fif.d[2]);
                                         // Test 4-input NAND
                                        nand_ptr = new();
                                        N1=nand_ptr.perform(n1,n2,n3,n4);
                                        expected_q2=N1;
                                         // Test 3-input NAND
                                        nand_ptr = new();
                                        na1=nand_ptr.perform(n3,n4,fif.d[3]); 
                                        na2=nand_ptr.perform(n3,n4,fif.d[2]); 
                                        // Test 4-input NAND
                                         nand_ptr = new();
                                        N2=nand_ptr.perform(n1,n2,na1,na2);
                                        expected_q1=N2;
                                         // Test 3-input NAND
                                        nand_ptr = new();
                                        n5=nand_ptr.perform(n2,fif.d[5]);
                                        na3=nand_ptr.perform(n2,n4,fif.d[3]);
                                        // Test 4-input NAND
                                       nand_ptr = new();                              
                                       N3=nand_ptr.perform(n2,n4,n6,fif.d[1]);
                                       N4=nand_ptr.perform(n1,n5,na3,N3);
                                       expected_q0=N4;
                                       #10;
                                       if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                                              $display("mismatch inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                          end
                                       else begin
                                              $display("match inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                           end
                 fif.d[7]=0; fif.d[6]=0; fif.d[5]=0; fif.d[4]=1; fif.d[3]=$random; fif.d[2]=$random; fif.d[1]=$random; fif.d[0]=$random;
                                          // Test 2-input NAND
                                                         nand_ptr = new();
                                                         n1=nand_ptr.perform(fif.d[7],fif.d[7]); 
                                                         n2=nand_ptr.perform(fif.d[6],fif.d[6]);
                                                         n3=nand_ptr.perform(fif.d[5],fif.d[5]);
                                                         n4=nand_ptr.perform(fif.d[4],fif.d[4]);
                                                         n6=nand_ptr.perform(fif.d[2],fif.d[2]);
                                                          // Test 4-input NAND
                                                         nand_ptr = new();
                                                         N1=nand_ptr.perform(n1,n2,n3,n4);
                                                         expected_q2=N1;
                                                          // Test 3-input NAND
                                                         nand_ptr = new();
                                                         na1=nand_ptr.perform(n3,n4,fif.d[3]); 
                                                         na2=nand_ptr.perform(n3,n4,fif.d[2]); 
                                                         // Test 4-input NAND
                                                          nand_ptr = new();
                                                         N2=nand_ptr.perform(n1,n2,na1,na2);
                                                         expected_q1=N2;
                                                          // Test 3-input NAND
                                                         nand_ptr = new();
                                                         n5=nand_ptr.perform(n2,fif.d[5]);
                                                         na3=nand_ptr.perform(n2,n4,fif.d[3]);
                                                         // Test 4-input NAND
                                                        nand_ptr = new();                              
                                                        N3=nand_ptr.perform(n2,n4,n6,fif.d[1]);
                                                        N4=nand_ptr.perform(n1,n5,na3,N3);
                                                        expected_q0=N4;
                                                        #10;
                                                        if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                                                               $display("mismatch inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                                           end
                                                        else begin
                                                               $display("match inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                                            end
                     fif.d[7]=0; fif.d[6]=0; fif.d[5]=0; fif.d[4]=0; fif.d[3]=1; fif.d[2]=$random; fif.d[1]=1; fif.d[0]=$random;
                                                             // Test 2-input NAND
                                                             nand_ptr = new();
                                                             n1=nand_ptr.perform(fif.d[7],fif.d[7]); 
                                                             n2=nand_ptr.perform(fif.d[6],fif.d[6]);
                                                             n3=nand_ptr.perform(fif.d[5],fif.d[5]);
                                                             n4=nand_ptr.perform(fif.d[4],fif.d[4]);
                                                             n6=nand_ptr.perform(fif.d[2],fif.d[2]);
                                                              // Test 4-input NAND
                                                             nand_ptr = new();
                                                             N1=nand_ptr.perform(n1,n2,n3,n4);
                                                             expected_q2=N1;
                                                              // Test 3-input NAND
                                                             nand_ptr = new();
                                                             na1=nand_ptr.perform(n3,n4,fif.d[3]); 
                                                             na2=nand_ptr.perform(n3,n4,fif.d[2]); 
                                                             // Test 4-input NAND
                                                              nand_ptr = new();
                                                             N2=nand_ptr.perform(n1,n2,na1,na2);
                                                             expected_q1=N2;
                                                              // Test 3-input NAND
                                                             nand_ptr = new();
                                                             n5=nand_ptr.perform(n2,fif.d[5]);
                                                             na3=nand_ptr.perform(n2,n4,fif.d[3]);
                                                             // Test 4-input NAND
                                                            nand_ptr = new();                              
                                                            N3=nand_ptr.perform(n2,n4,n6,fif.d[1]);
                                                            N4=nand_ptr.perform(n1,n5,na3,N3);
                                                            expected_q0=N4;
                                                            #10;
                                                            if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                                                                   $display("mismatch inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                                               end
                                                            else begin
                                                                   $display("match inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                                                end
                           fif.d[7]=0; fif.d[6]=0; fif.d[5]=0; fif.d[4]=0; fif.d[3]=0; fif.d[2]=1; fif.d[1]=$random; fif.d[0]=$random;
                             // Test 2-input NAND
                                                                   nand_ptr = new();
                                                                   n1=nand_ptr.perform(fif.d[7],fif.d[7]); 
                                                                   n2=nand_ptr.perform(fif.d[6],fif.d[6]);
                                                                   n3=nand_ptr.perform(fif.d[5],fif.d[5]);
                                                                   n4=nand_ptr.perform(fif.d[4],fif.d[4]);
                                                                   n6=nand_ptr.perform(fif.d[2],fif.d[2]);
                                                                    // Test 4-input NAND
                                                                   nand_ptr = new();
                                                                   N1=nand_ptr.perform(n1,n2,n3,n4);
                                                                   expected_q2=N1;
                                                                    // Test 3-input NAND
                                                                   nand_ptr = new();
                                                                   na1=nand_ptr.perform(n3,n4,fif.d[3]); 
                                                                   na2=nand_ptr.perform(n3,n4,fif.d[2]); 
                                                                   // Test 4-input NAND
                                                                    nand_ptr = new();
                                                                   N2=nand_ptr.perform(n1,n2,na1,na2);
                                                                   expected_q1=N2;
                                                                    // Test 3-input NAND
                                                                   nand_ptr = new();
                                                                   n5=nand_ptr.perform(n2,fif.d[5]);
                                                                   na3=nand_ptr.perform(n2,n4,fif.d[3]);
                                                                   // Test 4-input NAND
                                                                  nand_ptr = new();                              
                                                                  N3=nand_ptr.perform(n2,n4,n6,fif.d[1]);
                                                                  N4=nand_ptr.perform(n1,n5,na3,N3);
                                                                  expected_q0=N4;
                                                                  #10;
                                                                  if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                                                                         $display("mismatch inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                                                     end
                                                                  else begin
                                                                         $display("match inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                                                      end
                         fif.d[7]=0; fif.d[6]=0; fif.d[5]=0; fif.d[4]=0; fif.d[3]=0; fif.d[2]=0; fif.d[1]=1; fif.d[0]=1;
                                                 // Test 2-input NAND
                                                                 nand_ptr = new();
                                                                 n1=nand_ptr.perform(fif.d[7],fif.d[7]); 
                                                                 n2=nand_ptr.perform(fif.d[6],fif.d[6]);
                                                                 n3=nand_ptr.perform(fif.d[5],fif.d[5]);
                                                                 n4=nand_ptr.perform(fif.d[4],fif.d[4]);
                                                                 n6=nand_ptr.perform(fif.d[2],fif.d[2]);
                                                                  // Test 4-input NAND
                                                                 nand_ptr = new();
                                                                 N1=nand_ptr.perform(n1,n2,n3,n4);
                                                                 expected_q2=N1;
                                                                  // Test 3-input NAND
                                                                 nand_ptr = new();
                                                                 na1=nand_ptr.perform(n3,n4,fif.d[3]); 
                                                                 na2=nand_ptr.perform(n3,n4,fif.d[2]); 
                                                                 // Test 4-input NAND
                                                                  nand_ptr = new();
                                                                 N2=nand_ptr.perform(n1,n2,na1,na2);
                                                                 expected_q1=N2;
                                                                  // Test 3-input NAND
                                                                 nand_ptr = new();
                                                                 n5=nand_ptr.perform(n2,fif.d[5]);
                                                                 na3=nand_ptr.perform(n2,n4,fif.d[3]);
                                                                 // Test 4-input NAND
                                                                nand_ptr = new();                              
                                                                N3=nand_ptr.perform(n2,n4,n6,fif.d[1]);
                                                                N4=nand_ptr.perform(n1,n5,na3,N3);
                                                                expected_q0=N4;
                                                                #10;
                                                                if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                                                                       $display("mismatch inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                                                   end
                                                                else begin
                                                                       $display("match inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                                                    end
                         fif.d[7]=0; fif.d[6]=0; fif.d[5]=0; fif.d[4]=0; fif.d[3]=0; fif.d[2]=0; fif.d[1]=0; fif.d[0]=1;
                             // Test 2-input NAND
                                                                 nand_ptr = new();
                                                                 n1=nand_ptr.perform(fif.d[7],fif.d[7]); 
                                                                 n2=nand_ptr.perform(fif.d[6],fif.d[6]);
                                                                 n3=nand_ptr.perform(fif.d[5],fif.d[5]);
                                                                 n4=nand_ptr.perform(fif.d[4],fif.d[4]);
                                                                 n6=nand_ptr.perform(fif.d[2],fif.d[2]);
                                                                  // Test 4-input NAND
                                                                 nand_ptr = new();
                                                                 N1=nand_ptr.perform(n1,n2,n3,n4);
                                                                 expected_q2=N1;
                                                                  // Test 3-input NAND
                                                                 nand_ptr = new();
                                                                 na1=nand_ptr.perform(n3,n4,fif.d[3]); 
                                                                 na2=nand_ptr.perform(n3,n4,fif.d[2]); 
                                                                 // Test 4-input NAND
                                                                  nand_ptr = new();
                                                                 N2=nand_ptr.perform(n1,n2,na1,na2);
                                                                 expected_q1=N2;
                                                                  // Test 3-input NAND
                                                                 nand_ptr = new();
                                                                 n5=nand_ptr.perform(n2,fif.d[5]);
                                                                 na3=nand_ptr.perform(n2,n4,fif.d[3]);
                                                                 // Test 4-input NAND
                                                                nand_ptr = new();                              
                                                                N3=nand_ptr.perform(n2,n4,n6,fif.d[1]);
                                                                N4=nand_ptr.perform(n1,n5,na3,N3);
                                                                expected_q0=N4;
                                                                #10;
                                                                if(fif.q[2]!=expected_q2&&fif.q[1]!=expected_q1&&fif.q[0]!=expected_q0)begin
                                                                       $display("mismatch inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                                                   end
                                                                else begin
                                                                       $display("match inputs:%b,expectedq=%b,q=%b",{fif.d[7:0]},{expected_q2,expected_q1,expected_q0},{fif.q[2],fif.q[1],fif.q[0]});
                                                                    end
                      
                            
     $finish; 
    end
endmodule