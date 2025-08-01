class my_test extends uvm_test;
  `uvm_component_utils(my_test)

  my_env my_env_h;
  alu_sequence alu_sequence_h;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    my_env_h = my_env::type_id::create("my_env_h", this);
  endfunction

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);

    alu_sequence_h = alu_sequence::type_id::create("alu_sequence_h");
    alu_sequence_h.start(my_env_h.my_agent_h.seqr);

    phase.drop_objection(this);
  endtask

endclass : my_test
