
`timescale 1ns / 1ps
interface prioenco_if #(parameter WIDTH=4, parameter DEPTH=2)();
logic [WIDTH-1:0] d;
logic [DEPTH-1:0]q;
endinterface
package prioenco_df_pkg;
class NandgateBase;
    // Virtual function for NAND operation (to be overridden)
   virtual function bit perform(input logic a, input logic b = 1, input logic c = 1, input logic d = 1);
       return ~(a & b & c & d); // Default: 4-input NAND
   endfunction
endclass
class Nand2Input extends NandgateBase;
    // Override for 2-input NAND
    virtual function bit perform(input logic a, input logic b = 1, input logic c = 1, input logic d = 1);
        return ~(a & b); // Ignores c & d
    endfunction
endclass

class Nand3Input extends NandgateBase;
    // Override for 3-input NAND
    virtual function bit perform(input logic a, input logic b = 1, input logic c = 1, input logic d = 1);
        return ~(a & b & c); // Ignores d
    endfunction
endclass

class Nand4Input extends NandgateBase;
    // Default 4-input NAND (already defined in base)
endclass

endpackage