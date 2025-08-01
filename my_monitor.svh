class my_monitor extends uvm_monitor;
  `uvm_component_utils(my_monitor)
  
  virtual alu_if _lif;
  uvm_analysis_port #(alu_transaction) aport;

  function new(string name, uvm_component parent);
    super.new(name, parent); 
    aport = new("aport", this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual alu_if)::get(this, "", "_dif", _lif)) begin
      `uvm_fatal("NOINTERFACE", "Interface not found")
    end
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      alu_transaction tr = alu_transaction::type_id::create("tr");
      #5;
      tr.a = _lif.a;
      tr.b = _lif.b;
      tr.sel = _lif.sel;
      tr.result = _lif.result;
      aport.write(tr);
      //`uvm_info("MONITOR", $sformatf("Captured sel = %b", tr.sel), UVM_LOW)
    end
  endtask

endclass : my_monitor

