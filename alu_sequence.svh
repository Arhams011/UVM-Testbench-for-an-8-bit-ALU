class alu_sequence extends uvm_sequence #(alu_transaction);
  `uvm_object_utils(alu_sequence)

  function new(string name = "alu_sequence");
    super.new(name);
  endfunction

  task body();
    alu_transaction tr;
    repeat (20) begin
      `uvm_info("SEQUENCE", "Starting new transaction", UVM_LOW)
      tr = alu_transaction::type_id::create("tr");
      start_item(tr);
      if (!tr.randomize()) begin
        `uvm_error("SEQUENCE", "Randomization failed")
      end
      finish_item(tr);
    end
  endtask: body
endclass
