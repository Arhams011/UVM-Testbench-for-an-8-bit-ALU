class my_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(my_scoreboard)

  uvm_analysis_imp #(alu_transaction, my_scoreboard) sb_ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    sb_ap = new("sb_ap", this);
  endfunction

  function void write(alu_transaction tr);
  bit signed [15:0] expected; 

  //if (!tr.enable)
    //expected = 0;
  //else begin
    case (tr.sel)
      2'b00: expected = tr.a + tr.b;
      2'b01: expected = tr.a - tr.b;
      2'b10: expected = tr.a * tr.b;
      2'b11: expected = (tr.a < tr.b) ? 8'd1 : 8'd0;
      default: expected = 0;
    endcase
  //end

  `uvm_info("SCOREBOARD", $sformatf("TRIGGERED: a=%0d b=%0d sel=%b result=%0d expected=%0d", tr.a, tr.b, tr.sel, tr.result, expected), UVM_LOW)

  if (tr.result !== expected)
    `uvm_error("SCOREBOARD", $sformatf("Mismatch! Got: %0d, Expected: %0d", tr.result, expected))
  else
    `uvm_info("SCOREBOARD", "Correct result", UVM_LOW)
endfunction: write

endclass : my_scoreboard
