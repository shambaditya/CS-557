module KthSmallestTracker(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [31:0] io_in_bits_distance,
  input  [7:0]  io_in_bits_addr,
  input         io_finish,
  input         io_kthOut_ready,
  output        io_kthOut_valid,
  output [31:0] io_kthOut_bits,
  output [7:0]  io_addrOut_0,
  output [7:0]  io_addrOut_1,
  output [7:0]  io_addrOut_2,
  output        io_addrValid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] heap_0_distance; // @[KthSmallestTracker.scala 28:22]
  reg [7:0] heap_0_addr; // @[KthSmallestTracker.scala 28:22]
  reg [31:0] heap_1_distance; // @[KthSmallestTracker.scala 28:22]
  reg [7:0] heap_1_addr; // @[KthSmallestTracker.scala 28:22]
  reg [31:0] heap_2_distance; // @[KthSmallestTracker.scala 28:22]
  reg [7:0] heap_2_addr; // @[KthSmallestTracker.scala 28:22]
  reg [1:0] count; // @[KthSmallestTracker.scala 29:22]
  wire  _T = heap_1_distance > heap_0_distance; // @[KthSmallestTracker.scala 38:30]
  wire [31:0] _T_1_distance = heap_1_distance > heap_0_distance ? heap_1_distance : heap_0_distance; // @[KthSmallestTracker.scala 38:13]
  wire  _T_4 = heap_2_distance > _T_1_distance; // @[KthSmallestTracker.scala 38:30]
  wire [31:0] maxEntry_distance = heap_2_distance > _T_1_distance ? heap_2_distance : _T_1_distance; // @[KthSmallestTracker.scala 38:13]
  wire [1:0] maxIdx = _T_4 ? 2'h2 : {{1'd0}, _T}; // @[KthSmallestTracker.scala 39:13]
  wire [31:0] validEntries_0_distance = 2'h0 < count ? heap_0_distance : 32'h80000000; // @[KthSmallestTracker.scala 51:29]
  wire [31:0] validEntries_1_distance = 2'h1 < count ? heap_1_distance : 32'h80000000; // @[KthSmallestTracker.scala 51:29]
  wire [31:0] validEntries_2_distance = 2'h2 < count ? heap_2_distance : 32'h80000000; // @[KthSmallestTracker.scala 51:29]
  wire [31:0] _currentMax_T_1_distance = validEntries_0_distance > validEntries_1_distance ? validEntries_0_distance :
    validEntries_1_distance; // @[KthSmallestTracker.scala 53:52]
  wire [31:0] _currentMax_T_3_distance = _currentMax_T_1_distance > validEntries_2_distance ? _currentMax_T_1_distance
     : validEntries_2_distance; // @[KthSmallestTracker.scala 53:52]
  wire [31:0] currentMax_distance = count == 2'h0 ? 32'h80000000 : _currentMax_T_3_distance; // @[KthSmallestTracker.scala 46:23 47:16 53:16]
  wire [31:0] kthEntry_distance = count == 2'h3 ? maxEntry_distance : currentMax_distance; // @[KthSmallestTracker.scala 57:21]
  wire [1:0] _count_T_1 = count + 2'h1; // @[KthSmallestTracker.scala 63:22]
  wire [31:0] _GEN_8 = 2'h0 == maxIdx ? io_in_bits_distance : heap_0_distance; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [31:0] _GEN_9 = 2'h1 == maxIdx ? io_in_bits_distance : heap_1_distance; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [31:0] _GEN_10 = 2'h2 == maxIdx ? io_in_bits_distance : heap_2_distance; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [7:0] _GEN_11 = 2'h0 == maxIdx ? io_in_bits_addr : heap_0_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [7:0] _GEN_12 = 2'h1 == maxIdx ? io_in_bits_addr : heap_1_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [7:0] _GEN_13 = 2'h2 == maxIdx ? io_in_bits_addr : heap_2_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  assign io_in_ready = 1'h1; // @[KthSmallestTracker.scala 75:15]
  assign io_kthOut_valid = io_finish; // @[KthSmallestTracker.scala 71:19]
  assign io_kthOut_bits = count == 2'h3 ? maxEntry_distance : currentMax_distance; // @[KthSmallestTracker.scala 57:21]
  assign io_addrOut_0 = heap_0_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_1 = heap_1_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_2 = heap_2_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrValid = io_finish; // @[KthSmallestTracker.scala 72:19]
  always @(posedge clock) begin
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_0_distance <= 32'h80000000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 2'h3) begin // @[KthSmallestTracker.scala 61:23]
        if (2'h0 == count) begin // @[KthSmallestTracker.scala 62:19]
          heap_0_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if (io_in_bits_distance < kthEntry_distance) begin // @[KthSmallestTracker.scala 64:58]
        heap_0_distance <= _GEN_8;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_0_addr <= 8'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 2'h3) begin // @[KthSmallestTracker.scala 61:23]
        if (2'h0 == count) begin // @[KthSmallestTracker.scala 62:19]
          heap_0_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if (io_in_bits_distance < kthEntry_distance) begin // @[KthSmallestTracker.scala 64:58]
        heap_0_addr <= _GEN_11;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_1_distance <= 32'h80000000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 2'h3) begin // @[KthSmallestTracker.scala 61:23]
        if (2'h1 == count) begin // @[KthSmallestTracker.scala 62:19]
          heap_1_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if (io_in_bits_distance < kthEntry_distance) begin // @[KthSmallestTracker.scala 64:58]
        heap_1_distance <= _GEN_9;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_1_addr <= 8'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 2'h3) begin // @[KthSmallestTracker.scala 61:23]
        if (2'h1 == count) begin // @[KthSmallestTracker.scala 62:19]
          heap_1_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if (io_in_bits_distance < kthEntry_distance) begin // @[KthSmallestTracker.scala 64:58]
        heap_1_addr <= _GEN_12;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_2_distance <= 32'h80000000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 2'h3) begin // @[KthSmallestTracker.scala 61:23]
        if (2'h2 == count) begin // @[KthSmallestTracker.scala 62:19]
          heap_2_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if (io_in_bits_distance < kthEntry_distance) begin // @[KthSmallestTracker.scala 64:58]
        heap_2_distance <= _GEN_10;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_2_addr <= 8'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 2'h3) begin // @[KthSmallestTracker.scala 61:23]
        if (2'h2 == count) begin // @[KthSmallestTracker.scala 62:19]
          heap_2_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if (io_in_bits_distance < kthEntry_distance) begin // @[KthSmallestTracker.scala 64:58]
        heap_2_addr <= _GEN_13;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 29:22]
      count <= 2'h0; // @[KthSmallestTracker.scala 29:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 2'h3) begin // @[KthSmallestTracker.scala 61:23]
        count <= _count_T_1; // @[KthSmallestTracker.scala 63:13]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  heap_0_distance = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  heap_0_addr = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  heap_1_distance = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  heap_1_addr = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  heap_2_distance = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  heap_2_addr = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  count = _RAND_6[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
