interface alu_if();
  logic [7:0] a, b;
  logic [1:0] sel;
  logic signed [15:0] result;
endinterface:alu_if

module alu(alu_if _if);
  always_comb begin
      case (_if.sel)
        2'b00: _if.result= _if.a + _if.b;
        2'b01: _if.result= _if.a - _if.b;
        2'b10: _if.result= _if.a * _if.b;
        2'b11: _if.result= (_if.a < _if.b) ? 8'd1 : 8'd0;
        default: _if.result = 8'b0;
      endcase
    end
endmodule
