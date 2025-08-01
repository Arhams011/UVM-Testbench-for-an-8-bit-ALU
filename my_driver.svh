class my_driver extends uvm_driver #(alu_transaction);
  `uvm_component_utils(my_driver)

  virtual alu_if _if;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual alu_if)::get(this, "", "_dif", _if)) begin
      `uvm_fatal("NOINTERFACE", "Interface not found")
    end
  endfunction

  task run_phase(uvm_phase phase);
    alu_transaction tr;
    forever begin
        //alu_transaction tr;
      seq_item_port.get_next_item(tr);
      _if.a = tr.a;
      _if.b = tr.b;
      _if.sel = tr.sel;
      #5;
      tr.result = _if.result;
      seq_item_port.item_done();
    end
  endtask

endclass : my_driver
