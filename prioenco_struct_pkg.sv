`timescale 1ns / 1ps
interface  prioenco_if #(parameter WIDTH=8, parameter DEPTH=3)();//interface definition for priority encoder
logic [WIDTH-1:0]d;
logic [DEPTH-1:0]q;
endinterface
package prioenco_struct_pkg;//package for virtual function classes
class Basenor;
    // Virtual function for NOR operation (to be overridden)
   virtual function bit perform(input logic a, input logic b = 0, input logic c = 0, input logic d = 0);
       return ~(a|b|c|d); // Default: 4-input NOR
   endfunction
   endclass
class Norgate2 extends Basenor;//Derived classes
    // Override for 2-input NOR operation
    virtual function bit perform(input logic a, input logic b = 0, input logic c = 0, input logic d = 0);
        return ~(a|b); // Ignores c & d
    endfunction
    endclass
class Norgate3 extends Basenor;//Derived classes
    // Override for 3-input NOR operation
    virtual function bit perform(input logic a, input logic b = 0, input logic c = 0, input logic d = 0);
        return ~(a|b|c);  // Ignores d
    endfunction
    endclass
class Norgate4 extends Basenor;//Derived classes
// Default 4-input NOR (already defined in base)
    endclass
endpackage