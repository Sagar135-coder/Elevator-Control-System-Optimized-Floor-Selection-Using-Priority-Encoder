`timescale 1ns / 1ps
interface fifo_if #(parameter WIDTH=8, parameter DEPTH=3)();
logic [WIDTH-1:0]d;
logic [DEPTH-1:0]q;
endinterface
package prioenco_behv_pkg;
class Baseand;
    // Virtual function for AND operation (to be overridden)
   virtual function bit perform(input logic a, input logic b = 1, input logic c = 1, input logic d = 1);
       return (a & b & c & d); // Default: 4-input AND
   endfunction
endclass
class Basenot;
    virtual function bit perform(input logic a, input logic b = 1, input logic c = 1, input logic d = 1);
       return ~(a); // Default: 4-input NOT
   endfunction
endclass
class Baseor;
    virtual function bit perform(input logic a, input logic b = 1, input logic c = 1, input logic d = 1);
       return (a|b|c|d); // Default: 4-input OR
   endfunction
endclass
class Andgate4 extends Baseand;
   // Virtual function for AND operation (to be overridden)
virtual function bit perform(input logic a, input logic b = 1, input logic c = 1, input logic d = 1);
    return (a & b & c & d); // 4-input AND
endfunction
endclass
   class Andgate3 extends Baseand;
    // Override for 3-input AND
      virtual function bit perform(input logic a, input logic b = 1, input logic c = 1, input logic d = 1);
          return (a & b & c); // Ignores d
      endfunction
  endclass
        class Andgate2 extends Baseand;
     // Override for 2-input AND
            virtual function bit perform(input logic a, input logic b = 1, input logic c = 1, input logic d = 1);
                return (a & b); // Ignores c & d
            endfunction
        endclass
   class Notgate extends Basenot;
  // Override for 2-input NOT
               virtual function bit perform(input logic a, input logic b = 1, input logic c = 1, input logic d = 1);
                   return ~(a); // Ignores b & c & d
               endfunction
           endclass
    class Orgate extends Baseor;
     // Override for 2-input OR
                virtual function bit perform(input logic a, input logic b = 1, input logic c = 1, input logic d = 1);
                    return (a+b); // Ignores c & d
                endfunction
            endclass
endpackage
