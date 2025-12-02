
//priority encoder structural code
module prioenco_nor_struct(input d0,d1,d2,d3,d4,d5,d6,d7,output q0,q1,q2);
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;
nor(w1,d5);//inverting d5
nor(w2,d3);//inverting d3
nor(w3,d1);//inverting d1
nor(w4,d2);//inverting d2
nor(w5,d6,w1);
nor(w6,d6,d4,w2);
nor(w7,d6,d4,d2,w3);
nor(w8,w5,w6,w7,d7);
nor(q0,w8,w8);
nor(w9,d5,d4,w2);
nor(w10,d5,d4,w4);
nor(w11,d7,d6,w9,w10);
nor(q1,w11,w11);
nor(w12,d7,d6,d5,d4);
nor(q2,w12,w12);
endmodule
