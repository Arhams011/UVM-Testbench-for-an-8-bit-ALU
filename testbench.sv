`include "uvm_macros.svh"
`include "my_alu_testbench_pkg.svh"

module top;

  import uvm_pkg::*;
  import my_alu_testbench_pkg::*;

  alu_if _dif();
  alu dut(._if(_dif));

  initial begin
    uvm_config_db#(virtual alu_if)::set(null, "*", "_dif", _dif);
    run_test("my_test");
  end

endmodule
