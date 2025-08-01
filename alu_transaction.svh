class alu_transaction extends uvm_sequence_item;
  `uvm_object_utils(alu_transaction)
  
  rand bit [7:0] a,b;
  rand bit [1:0] sel;
  bit signed [15:0] result;
  
  /*constraint valid_ranges {
   a >= 100 && a <= 180;
    b >= 80 && b <= 240;
  }*/
  
  function new(string name="alu_transaction");
    super.new(name);
  endfunction
  
  function void do_print(uvm_printer printer);
    super.do_print(printer);
    `uvm_info("TRANSACTIONS", $sformatf("a=%0d b=%0d sel=%0b 					   result=%0d", a, b, sel, result), UVM_LOW)
  endfunction: do_print
endclass
