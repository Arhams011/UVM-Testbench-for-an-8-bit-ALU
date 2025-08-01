class my_agent extends uvm_agent;
  `uvm_component_utils(my_agent)

  my_driver my_driver_h;
  my_monitor my_monitor_h;
  uvm_sequencer #(alu_transaction) seqr;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    my_driver_h = my_driver::type_id::create("my_driver_h", this);
    my_monitor_h = my_monitor::type_id::create("my_monitor_h", this);
    seqr = uvm_sequencer#(alu_transaction)::type_id::create("seqr", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    my_driver_h.seq_item_port.connect(seqr.seq_item_export);
  endfunction

endclass : my_agent
