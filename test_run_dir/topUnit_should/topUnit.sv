module KthSmallestTracker(
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [15:0] io_in_bits_distance,
  input  [15:0] io_in_bits_addr,
  input         io_finish,
  output        io_kthOut_valid,
  output [15:0] io_kthOut_bits,
  output [15:0] io_addrOut_0,
  output [15:0] io_addrOut_1,
  output [15:0] io_addrOut_2,
  output [15:0] io_addrOut_3,
  output [15:0] io_addrOut_4,
  output [15:0] io_addrOut_5,
  output [15:0] io_addrOut_6,
  output [15:0] io_addrOut_7,
  output [15:0] io_addrOut_8,
  output [15:0] io_addrOut_9,
  output [15:0] io_addrOut_10,
  output [15:0] io_addrOut_11,
  output [15:0] io_addrOut_12,
  output [15:0] io_addrOut_13,
  output [15:0] io_addrOut_14,
  output [15:0] io_addrOut_15,
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
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] heap_0_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_0_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_1_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_1_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_2_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_2_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_3_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_3_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_4_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_4_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_5_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_5_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_6_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_6_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_7_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_7_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_8_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_8_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_9_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_9_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_10_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_10_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_11_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_11_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_12_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_12_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_13_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_13_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_14_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_14_addr; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_15_distance; // @[KthSmallestTracker.scala 28:22]
  reg [15:0] heap_15_addr; // @[KthSmallestTracker.scala 28:22]
  reg [4:0] count; // @[KthSmallestTracker.scala 29:22]
  wire  _T = $signed(heap_1_distance) > $signed(heap_0_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_1_distance = $signed(heap_1_distance) > $signed(heap_0_distance) ? $signed(heap_1_distance) : $signed(
    heap_0_distance); // @[KthSmallestTracker.scala 38:13]
  wire  _T_4 = $signed(heap_2_distance) > $signed(_T_1_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_5_distance = $signed(heap_2_distance) > $signed(_T_1_distance) ? $signed(heap_2_distance) : $signed(
    _T_1_distance); // @[KthSmallestTracker.scala 38:13]
  wire [1:0] _T_7 = _T_4 ? 2'h2 : {{1'd0}, _T}; // @[KthSmallestTracker.scala 39:13]
  wire  _T_8 = $signed(heap_3_distance) > $signed(_T_5_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_9_distance = $signed(heap_3_distance) > $signed(_T_5_distance) ? $signed(heap_3_distance) : $signed(
    _T_5_distance); // @[KthSmallestTracker.scala 38:13]
  wire [1:0] _T_11 = _T_8 ? 2'h3 : _T_7; // @[KthSmallestTracker.scala 39:13]
  wire  _T_12 = $signed(heap_4_distance) > $signed(_T_9_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_13_distance = $signed(heap_4_distance) > $signed(_T_9_distance) ? $signed(heap_4_distance) : $signed(
    _T_9_distance); // @[KthSmallestTracker.scala 38:13]
  wire [2:0] _T_15 = _T_12 ? 3'h4 : {{1'd0}, _T_11}; // @[KthSmallestTracker.scala 39:13]
  wire  _T_16 = $signed(heap_5_distance) > $signed(_T_13_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_17_distance = $signed(heap_5_distance) > $signed(_T_13_distance) ? $signed(heap_5_distance) : $signed(
    _T_13_distance); // @[KthSmallestTracker.scala 38:13]
  wire [2:0] _T_19 = _T_16 ? 3'h5 : _T_15; // @[KthSmallestTracker.scala 39:13]
  wire  _T_20 = $signed(heap_6_distance) > $signed(_T_17_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_21_distance = $signed(heap_6_distance) > $signed(_T_17_distance) ? $signed(heap_6_distance) : $signed(
    _T_17_distance); // @[KthSmallestTracker.scala 38:13]
  wire [2:0] _T_23 = _T_20 ? 3'h6 : _T_19; // @[KthSmallestTracker.scala 39:13]
  wire  _T_24 = $signed(heap_7_distance) > $signed(_T_21_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_25_distance = $signed(heap_7_distance) > $signed(_T_21_distance) ? $signed(heap_7_distance) : $signed(
    _T_21_distance); // @[KthSmallestTracker.scala 38:13]
  wire [2:0] _T_27 = _T_24 ? 3'h7 : _T_23; // @[KthSmallestTracker.scala 39:13]
  wire  _T_28 = $signed(heap_8_distance) > $signed(_T_25_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_29_distance = $signed(heap_8_distance) > $signed(_T_25_distance) ? $signed(heap_8_distance) : $signed(
    _T_25_distance); // @[KthSmallestTracker.scala 38:13]
  wire [3:0] _T_31 = _T_28 ? 4'h8 : {{1'd0}, _T_27}; // @[KthSmallestTracker.scala 39:13]
  wire  _T_32 = $signed(heap_9_distance) > $signed(_T_29_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_33_distance = $signed(heap_9_distance) > $signed(_T_29_distance) ? $signed(heap_9_distance) : $signed(
    _T_29_distance); // @[KthSmallestTracker.scala 38:13]
  wire [3:0] _T_35 = _T_32 ? 4'h9 : _T_31; // @[KthSmallestTracker.scala 39:13]
  wire  _T_36 = $signed(heap_10_distance) > $signed(_T_33_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_37_distance = $signed(heap_10_distance) > $signed(_T_33_distance) ? $signed(heap_10_distance) :
    $signed(_T_33_distance); // @[KthSmallestTracker.scala 38:13]
  wire [3:0] _T_39 = _T_36 ? 4'ha : _T_35; // @[KthSmallestTracker.scala 39:13]
  wire  _T_40 = $signed(heap_11_distance) > $signed(_T_37_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_41_distance = $signed(heap_11_distance) > $signed(_T_37_distance) ? $signed(heap_11_distance) :
    $signed(_T_37_distance); // @[KthSmallestTracker.scala 38:13]
  wire [3:0] _T_43 = _T_40 ? 4'hb : _T_39; // @[KthSmallestTracker.scala 39:13]
  wire  _T_44 = $signed(heap_12_distance) > $signed(_T_41_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_45_distance = $signed(heap_12_distance) > $signed(_T_41_distance) ? $signed(heap_12_distance) :
    $signed(_T_41_distance); // @[KthSmallestTracker.scala 38:13]
  wire [3:0] _T_47 = _T_44 ? 4'hc : _T_43; // @[KthSmallestTracker.scala 39:13]
  wire  _T_48 = $signed(heap_13_distance) > $signed(_T_45_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_49_distance = $signed(heap_13_distance) > $signed(_T_45_distance) ? $signed(heap_13_distance) :
    $signed(_T_45_distance); // @[KthSmallestTracker.scala 38:13]
  wire [3:0] _T_51 = _T_48 ? 4'hd : _T_47; // @[KthSmallestTracker.scala 39:13]
  wire  _T_52 = $signed(heap_14_distance) > $signed(_T_49_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] _T_53_distance = $signed(heap_14_distance) > $signed(_T_49_distance) ? $signed(heap_14_distance) :
    $signed(_T_49_distance); // @[KthSmallestTracker.scala 38:13]
  wire [3:0] _T_55 = _T_52 ? 4'he : _T_51; // @[KthSmallestTracker.scala 39:13]
  wire  _T_56 = $signed(heap_15_distance) > $signed(_T_53_distance); // @[KthSmallestTracker.scala 38:30]
  wire [15:0] maxEntry_distance = $signed(heap_15_distance) > $signed(_T_53_distance) ? $signed(heap_15_distance) :
    $signed(_T_53_distance); // @[KthSmallestTracker.scala 38:13]
  wire [3:0] maxIdx = _T_56 ? 4'hf : _T_55; // @[KthSmallestTracker.scala 39:13]
  wire [15:0] validEntries_0_distance = 5'h0 < count ? $signed(heap_0_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_1_distance = 5'h1 < count ? $signed(heap_1_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_2_distance = 5'h2 < count ? $signed(heap_2_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_3_distance = 5'h3 < count ? $signed(heap_3_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_4_distance = 5'h4 < count ? $signed(heap_4_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_5_distance = 5'h5 < count ? $signed(heap_5_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_6_distance = 5'h6 < count ? $signed(heap_6_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_7_distance = 5'h7 < count ? $signed(heap_7_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_8_distance = 5'h8 < count ? $signed(heap_8_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_9_distance = 5'h9 < count ? $signed(heap_9_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_10_distance = 5'ha < count ? $signed(heap_10_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_11_distance = 5'hb < count ? $signed(heap_11_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_12_distance = 5'hc < count ? $signed(heap_12_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_13_distance = 5'hd < count ? $signed(heap_13_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_14_distance = 5'he < count ? $signed(heap_14_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] validEntries_15_distance = 5'hf < count ? $signed(heap_15_distance) : $signed(16'sh8000); // @[KthSmallestTracker.scala 51:29]
  wire [15:0] _currentMax_T_1_distance = $signed(validEntries_0_distance) > $signed(validEntries_1_distance) ? $signed(
    validEntries_0_distance) : $signed(validEntries_1_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_3_distance = $signed(_currentMax_T_1_distance) > $signed(validEntries_2_distance) ? $signed(
    _currentMax_T_1_distance) : $signed(validEntries_2_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_5_distance = $signed(_currentMax_T_3_distance) > $signed(validEntries_3_distance) ? $signed(
    _currentMax_T_3_distance) : $signed(validEntries_3_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_7_distance = $signed(_currentMax_T_5_distance) > $signed(validEntries_4_distance) ? $signed(
    _currentMax_T_5_distance) : $signed(validEntries_4_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_9_distance = $signed(_currentMax_T_7_distance) > $signed(validEntries_5_distance) ? $signed(
    _currentMax_T_7_distance) : $signed(validEntries_5_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_11_distance = $signed(_currentMax_T_9_distance) > $signed(validEntries_6_distance) ?
    $signed(_currentMax_T_9_distance) : $signed(validEntries_6_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_13_distance = $signed(_currentMax_T_11_distance) > $signed(validEntries_7_distance) ?
    $signed(_currentMax_T_11_distance) : $signed(validEntries_7_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_15_distance = $signed(_currentMax_T_13_distance) > $signed(validEntries_8_distance) ?
    $signed(_currentMax_T_13_distance) : $signed(validEntries_8_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_17_distance = $signed(_currentMax_T_15_distance) > $signed(validEntries_9_distance) ?
    $signed(_currentMax_T_15_distance) : $signed(validEntries_9_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_19_distance = $signed(_currentMax_T_17_distance) > $signed(validEntries_10_distance) ?
    $signed(_currentMax_T_17_distance) : $signed(validEntries_10_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_21_distance = $signed(_currentMax_T_19_distance) > $signed(validEntries_11_distance) ?
    $signed(_currentMax_T_19_distance) : $signed(validEntries_11_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_23_distance = $signed(_currentMax_T_21_distance) > $signed(validEntries_12_distance) ?
    $signed(_currentMax_T_21_distance) : $signed(validEntries_12_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_25_distance = $signed(_currentMax_T_23_distance) > $signed(validEntries_13_distance) ?
    $signed(_currentMax_T_23_distance) : $signed(validEntries_13_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_27_distance = $signed(_currentMax_T_25_distance) > $signed(validEntries_14_distance) ?
    $signed(_currentMax_T_25_distance) : $signed(validEntries_14_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] _currentMax_T_29_distance = $signed(_currentMax_T_27_distance) > $signed(validEntries_15_distance) ?
    $signed(_currentMax_T_27_distance) : $signed(validEntries_15_distance); // @[KthSmallestTracker.scala 53:52]
  wire [15:0] currentMax_distance = count == 5'h0 ? $signed(16'sh8000) : $signed(_currentMax_T_29_distance); // @[KthSmallestTracker.scala 46:23 47:16 53:16]
  wire [15:0] kthEntry_distance = count == 5'h10 ? $signed(maxEntry_distance) : $signed(currentMax_distance); // @[KthSmallestTracker.scala 57:21]
  wire [4:0] _count_T_1 = count + 5'h1; // @[KthSmallestTracker.scala 63:22]
  wire [15:0] _GEN_34 = 4'h0 == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_0_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_35 = 4'h1 == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_1_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_36 = 4'h2 == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_2_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_37 = 4'h3 == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_3_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_38 = 4'h4 == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_4_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_39 = 4'h5 == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_5_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_40 = 4'h6 == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_6_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_41 = 4'h7 == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_7_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_42 = 4'h8 == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_8_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_43 = 4'h9 == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_9_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_44 = 4'ha == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_10_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_45 = 4'hb == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_11_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_46 = 4'hc == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_12_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_47 = 4'hd == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_13_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_48 = 4'he == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_14_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_49 = 4'hf == maxIdx ? $signed(io_in_bits_distance) : $signed(heap_15_distance); // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_50 = 4'h0 == maxIdx ? io_in_bits_addr : heap_0_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_51 = 4'h1 == maxIdx ? io_in_bits_addr : heap_1_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_52 = 4'h2 == maxIdx ? io_in_bits_addr : heap_2_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_53 = 4'h3 == maxIdx ? io_in_bits_addr : heap_3_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_54 = 4'h4 == maxIdx ? io_in_bits_addr : heap_4_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_55 = 4'h5 == maxIdx ? io_in_bits_addr : heap_5_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_56 = 4'h6 == maxIdx ? io_in_bits_addr : heap_6_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_57 = 4'h7 == maxIdx ? io_in_bits_addr : heap_7_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_58 = 4'h8 == maxIdx ? io_in_bits_addr : heap_8_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_59 = 4'h9 == maxIdx ? io_in_bits_addr : heap_9_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_60 = 4'ha == maxIdx ? io_in_bits_addr : heap_10_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_61 = 4'hb == maxIdx ? io_in_bits_addr : heap_11_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_62 = 4'hc == maxIdx ? io_in_bits_addr : heap_12_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_63 = 4'hd == maxIdx ? io_in_bits_addr : heap_13_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_64 = 4'he == maxIdx ? io_in_bits_addr : heap_14_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  wire [15:0] _GEN_65 = 4'hf == maxIdx ? io_in_bits_addr : heap_15_addr; // @[KthSmallestTracker.scala 65:{20,20} 28:22]
  assign io_kthOut_valid = io_finish; // @[KthSmallestTracker.scala 71:19]
  assign io_kthOut_bits = count == 5'h10 ? $signed(maxEntry_distance) : $signed(currentMax_distance); // @[KthSmallestTracker.scala 57:21]
  assign io_addrOut_0 = heap_0_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_1 = heap_1_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_2 = heap_2_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_3 = heap_3_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_4 = heap_4_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_5 = heap_5_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_6 = heap_6_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_7 = heap_7_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_8 = heap_8_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_9 = heap_9_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_10 = heap_10_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_11 = heap_11_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_12 = heap_12_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_13 = heap_13_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_14 = heap_14_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrOut_15 = heap_15_addr; // @[KthSmallestTracker.scala 79:19]
  assign io_addrValid = io_finish; // @[KthSmallestTracker.scala 72:19]
  always @(posedge clock) begin
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_0_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h0 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_0_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_0_distance <= _GEN_34;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_0_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h0 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_0_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_0_addr <= _GEN_50;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_1_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h1 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_1_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_1_distance <= _GEN_35;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_1_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h1 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_1_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_1_addr <= _GEN_51;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_2_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h2 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_2_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_2_distance <= _GEN_36;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_2_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h2 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_2_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_2_addr <= _GEN_52;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_3_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h3 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_3_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_3_distance <= _GEN_37;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_3_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h3 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_3_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_3_addr <= _GEN_53;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_4_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h4 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_4_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_4_distance <= _GEN_38;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_4_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h4 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_4_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_4_addr <= _GEN_54;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_5_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h5 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_5_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_5_distance <= _GEN_39;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_5_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h5 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_5_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_5_addr <= _GEN_55;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_6_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h6 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_6_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_6_distance <= _GEN_40;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_6_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h6 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_6_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_6_addr <= _GEN_56;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_7_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h7 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_7_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_7_distance <= _GEN_41;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_7_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h7 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_7_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_7_addr <= _GEN_57;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_8_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h8 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_8_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_8_distance <= _GEN_42;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_8_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h8 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_8_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_8_addr <= _GEN_58;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_9_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h9 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_9_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_9_distance <= _GEN_43;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_9_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'h9 == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_9_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_9_addr <= _GEN_59;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_10_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'ha == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_10_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_10_distance <= _GEN_44;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_10_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'ha == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_10_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_10_addr <= _GEN_60;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_11_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'hb == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_11_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_11_distance <= _GEN_45;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_11_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'hb == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_11_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_11_addr <= _GEN_61;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_12_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'hc == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_12_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_12_distance <= _GEN_46;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_12_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'hc == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_12_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_12_addr <= _GEN_62;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_13_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'hd == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_13_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_13_distance <= _GEN_47;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_13_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'hd == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_13_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_13_addr <= _GEN_63;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_14_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'he == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_14_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_14_distance <= _GEN_48;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_14_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'he == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_14_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_14_addr <= _GEN_64;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_15_distance <= 16'sh8000; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'hf == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_15_distance <= io_in_bits_distance; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_15_distance <= _GEN_49;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 28:22]
      heap_15_addr <= 16'h0; // @[KthSmallestTracker.scala 28:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
        if (4'hf == count[3:0]) begin // @[KthSmallestTracker.scala 62:19]
          heap_15_addr <= io_in_bits_addr; // @[KthSmallestTracker.scala 62:19]
        end
      end else if ($signed(io_in_bits_distance) < $signed(kthEntry_distance)) begin // @[KthSmallestTracker.scala 64:58]
        heap_15_addr <= _GEN_65;
      end
    end
    if (reset) begin // @[KthSmallestTracker.scala 29:22]
      count <= 5'h0; // @[KthSmallestTracker.scala 29:22]
    end else if (io_in_valid) begin // @[KthSmallestTracker.scala 60:21]
      if (count < 5'h10) begin // @[KthSmallestTracker.scala 61:23]
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
  heap_0_distance = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  heap_0_addr = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  heap_1_distance = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  heap_1_addr = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  heap_2_distance = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  heap_2_addr = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  heap_3_distance = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  heap_3_addr = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  heap_4_distance = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  heap_4_addr = _RAND_9[15:0];
  _RAND_10 = {1{`RANDOM}};
  heap_5_distance = _RAND_10[15:0];
  _RAND_11 = {1{`RANDOM}};
  heap_5_addr = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  heap_6_distance = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  heap_6_addr = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  heap_7_distance = _RAND_14[15:0];
  _RAND_15 = {1{`RANDOM}};
  heap_7_addr = _RAND_15[15:0];
  _RAND_16 = {1{`RANDOM}};
  heap_8_distance = _RAND_16[15:0];
  _RAND_17 = {1{`RANDOM}};
  heap_8_addr = _RAND_17[15:0];
  _RAND_18 = {1{`RANDOM}};
  heap_9_distance = _RAND_18[15:0];
  _RAND_19 = {1{`RANDOM}};
  heap_9_addr = _RAND_19[15:0];
  _RAND_20 = {1{`RANDOM}};
  heap_10_distance = _RAND_20[15:0];
  _RAND_21 = {1{`RANDOM}};
  heap_10_addr = _RAND_21[15:0];
  _RAND_22 = {1{`RANDOM}};
  heap_11_distance = _RAND_22[15:0];
  _RAND_23 = {1{`RANDOM}};
  heap_11_addr = _RAND_23[15:0];
  _RAND_24 = {1{`RANDOM}};
  heap_12_distance = _RAND_24[15:0];
  _RAND_25 = {1{`RANDOM}};
  heap_12_addr = _RAND_25[15:0];
  _RAND_26 = {1{`RANDOM}};
  heap_13_distance = _RAND_26[15:0];
  _RAND_27 = {1{`RANDOM}};
  heap_13_addr = _RAND_27[15:0];
  _RAND_28 = {1{`RANDOM}};
  heap_14_distance = _RAND_28[15:0];
  _RAND_29 = {1{`RANDOM}};
  heap_14_addr = _RAND_29[15:0];
  _RAND_30 = {1{`RANDOM}};
  heap_15_distance = _RAND_30[15:0];
  _RAND_31 = {1{`RANDOM}};
  heap_15_addr = _RAND_31[15:0];
  _RAND_32 = {1{`RANDOM}};
  count = _RAND_32[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [15:0] io_enq_bits,
  output        io_deq_valid,
  output [15:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] ram [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [15:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [15:0] ram_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_MPORT_en; // @[Decoupled.scala 273:95]
  reg [1:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [1:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _value_T_1 = enq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  wire [1:0] _value_T_3 = deq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (io_deq_valid) begin // @[Decoupled.scala 290:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != io_deq_valid) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram[initvar] = _RAND_0[15:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_1(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [15:0] io_enq_bits,
  output        io_deq_valid,
  output [15:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] ram [0:3]; // @[Decoupled.scala 273:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [1:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [15:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [15:0] ram_MPORT_data; // @[Decoupled.scala 273:95]
  wire [1:0] ram_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_MPORT_en; // @[Decoupled.scala 273:95]
  reg [1:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [1:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire [1:0] _value_T_1 = enq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  wire [1:0] _value_T_3 = deq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (io_deq_valid) begin // @[Decoupled.scala 290:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != io_deq_valid) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram[initvar] = _RAND_0[15:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_Module(
  input         clock,
  input         reset,
  input         io_query_valid,
  input  [15:0] io_query_bits_0,
  input         io_refs_valid,
  input  [15:0] io_refs_bits_0,
  input         io_dist_k_valid,
  input  [15:0] io_dist_k_bits,
  input  [15:0] io_address_i,
  input         io_address_north_valid,
  input  [15:0] io_address_north_bits,
  output        io_address_south_valid,
  output [15:0] io_address_south_bits,
  input         io_dist_north_valid,
  input  [15:0] io_dist_north_bits,
  output        io_dist_south_valid,
  output [15:0] io_dist_south_bits,
  output        io_skip_to_next
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  wire  fifo_dist_clock; // @[PE.scala 23:27]
  wire  fifo_dist_reset; // @[PE.scala 23:27]
  wire  fifo_dist_io_enq_ready; // @[PE.scala 23:27]
  wire  fifo_dist_io_enq_valid; // @[PE.scala 23:27]
  wire [15:0] fifo_dist_io_enq_bits; // @[PE.scala 23:27]
  wire  fifo_dist_io_deq_valid; // @[PE.scala 23:27]
  wire [15:0] fifo_dist_io_deq_bits; // @[PE.scala 23:27]
  wire  fifo_addr_clock; // @[PE.scala 24:27]
  wire  fifo_addr_reset; // @[PE.scala 24:27]
  wire  fifo_addr_io_enq_ready; // @[PE.scala 24:27]
  wire  fifo_addr_io_enq_valid; // @[PE.scala 24:27]
  wire [15:0] fifo_addr_io_enq_bits; // @[PE.scala 24:27]
  wire  fifo_addr_io_deq_valid; // @[PE.scala 24:27]
  wire [15:0] fifo_addr_io_deq_bits; // @[PE.scala 24:27]
  reg  state; // @[PE.scala 33:24]
  reg [15:0] dist_in_topk; // @[PE.scala 34:31]
  reg [15:0] dist_north_reg; // @[PE.scala 35:33]
  reg [15:0] addr_north_reg; // @[PE.scala 36:33]
  reg  reg_ready_to_enq_north; // @[PE.scala 37:41]
  reg [15:0] addr_PE_reg; // @[PE.scala 38:30]
  reg [7:0] counter; // @[PE.scala 40:26]
  reg [15:0] acc_dist; // @[PE.scala 42:27]
  wire [15:0] substract_0 = $signed(io_query_bits_0) - $signed(io_refs_bits_0); // @[PE.scala 44:84]
  wire [31:0] _square_T = $signed(substract_0) * $signed(substract_0); // @[PE.scala 45:57]
  wire [23:0] _square_T_1 = _square_T[31:8]; // @[PE.scala 45:62]
  reg [15:0] square_REG; // @[PE.scala 45:52]
  wire [15:0] tmp = $signed(acc_dist) + $signed(square_REG); // @[PE.scala 50:16]
  reg  compute_valid; // @[PE.scala 52:32]
  wire  _T_1 = io_query_valid & io_refs_valid; // @[PE.scala 58:29]
  wire [5:0] _T_4 = 6'h20 - 6'h1; // @[PE.scala 72:56]
  wire [7:0] _GEN_41 = {{2'd0}, _T_4}; // @[PE.scala 72:40]
  wire  _T_5 = counter == _GEN_41; // @[PE.scala 72:40]
  wire  _T_6 = compute_valid & counter == _GEN_41; // @[PE.scala 72:29]
  wire [7:0] _counter_T_1 = counter + 8'h1; // @[PE.scala 85:30]
  wire  _T_11 = $signed(tmp) > $signed(dist_in_topk); // @[PE.scala 89:23]
  wire  _GEN_3 = $signed(tmp) > $signed(dist_in_topk) ? 1'h0 : state; // @[PE.scala 89:38 90:17 33:24]
  wire [15:0] _GEN_4 = $signed(tmp) > $signed(dist_in_topk) ? $signed(16'sh0) : $signed(acc_dist); // @[PE.scala 89:38 91:20 42:27]
  wire [7:0] _GEN_6 = $signed(tmp) > $signed(dist_in_topk) ? 8'h0 : counter; // @[PE.scala 89:38 93:19 40:26]
  wire [7:0] _GEN_7 = compute_valid & counter < _GEN_41 ? _counter_T_1 : _GEN_6; // @[PE.scala 83:64 85:19]
  wire [15:0] _GEN_8 = compute_valid & counter < _GEN_41 ? $signed(tmp) : $signed(_GEN_4); // @[PE.scala 83:64 86:20]
  wire  _GEN_9 = compute_valid & counter < _GEN_41 ? 1'h0 : _T_11; // @[PE.scala 83:64 87:27]
  wire  _GEN_10 = compute_valid & counter < _GEN_41 ? state : _GEN_3; // @[PE.scala 33:24 83:64]
  wire  _GEN_15 = compute_valid & counter == _GEN_41 | _GEN_9; // @[PE.scala 72:62 79:27]
  wire  _GEN_29 = ~state ? 1'h0 : state & _T_6; // @[PE.scala 56:19 25:28]
  wire  _GEN_40 = io_address_north_valid & io_dist_north_valid | reg_ready_to_enq_north; // @[PE.scala 112:56 115:30 37:41]
  Queue fifo_dist ( // @[PE.scala 23:27]
    .clock(fifo_dist_clock),
    .reset(fifo_dist_reset),
    .io_enq_ready(fifo_dist_io_enq_ready),
    .io_enq_valid(fifo_dist_io_enq_valid),
    .io_enq_bits(fifo_dist_io_enq_bits),
    .io_deq_valid(fifo_dist_io_deq_valid),
    .io_deq_bits(fifo_dist_io_deq_bits)
  );
  Queue_1 fifo_addr ( // @[PE.scala 24:27]
    .clock(fifo_addr_clock),
    .reset(fifo_addr_reset),
    .io_enq_ready(fifo_addr_io_enq_ready),
    .io_enq_valid(fifo_addr_io_enq_valid),
    .io_enq_bits(fifo_addr_io_enq_bits),
    .io_deq_valid(fifo_addr_io_deq_valid),
    .io_deq_bits(fifo_addr_io_deq_bits)
  );
  assign io_address_south_valid = fifo_addr_io_deq_valid; // @[PE.scala 123:22]
  assign io_address_south_bits = fifo_addr_io_deq_bits; // @[PE.scala 123:22]
  assign io_dist_south_valid = fifo_dist_io_deq_valid; // @[PE.scala 124:19]
  assign io_dist_south_bits = fifo_dist_io_deq_bits; // @[PE.scala 124:19]
  assign io_skip_to_next = ~state ? 1'h0 : state & _GEN_15; // @[PE.scala 56:19 54:21]
  assign fifo_dist_clock = clock;
  assign fifo_dist_reset = reset;
  assign fifo_dist_io_enq_valid = reg_ready_to_enq_north & ~(state & (_T_11 | _T_5)) | _GEN_29; // @[PE.scala 103:114 104:30]
  assign fifo_dist_io_enq_bits = reg_ready_to_enq_north & ~(state & (_T_11 | _T_5)) ? $signed(dist_north_reg) : $signed(
    tmp); // @[PE.scala 103:114 106:29]
  assign fifo_addr_clock = clock;
  assign fifo_addr_reset = reset;
  assign fifo_addr_io_enq_valid = reg_ready_to_enq_north & ~(state & (_T_11 | _T_5)) | _GEN_29; // @[PE.scala 103:114 104:30]
  assign fifo_addr_io_enq_bits = reg_ready_to_enq_north & ~(state & (_T_11 | _T_5)) ? addr_north_reg : addr_PE_reg; // @[PE.scala 103:114 107:29]
  always @(posedge clock) begin
    if (reset) begin // @[PE.scala 33:24]
      state <= 1'h0; // @[PE.scala 33:24]
    end else if (~state) begin // @[PE.scala 56:19]
      state <= _T_1;
    end else if (state) begin // @[PE.scala 56:19]
      if (compute_valid & counter == _GEN_41) begin // @[PE.scala 72:62]
        state <= 1'h0; // @[PE.scala 80:17]
      end else begin
        state <= _GEN_10;
      end
    end
    if (reset) begin // @[PE.scala 34:31]
      dist_in_topk <= 16'sh7fff; // @[PE.scala 34:31]
    end else if (io_dist_k_valid) begin // @[PE.scala 100:26]
      dist_in_topk <= io_dist_k_bits; // @[PE.scala 101:20]
    end
    if (reset) begin // @[PE.scala 35:33]
      dist_north_reg <= 16'sh0; // @[PE.scala 35:33]
    end else if (io_address_north_valid & io_dist_north_valid) begin // @[PE.scala 112:56]
      dist_north_reg <= io_dist_north_bits; // @[PE.scala 114:22]
    end
    if (reset) begin // @[PE.scala 36:33]
      addr_north_reg <= 16'h0; // @[PE.scala 36:33]
    end else if (io_address_north_valid & io_dist_north_valid) begin // @[PE.scala 112:56]
      addr_north_reg <= io_address_north_bits; // @[PE.scala 113:22]
    end
    if (reset) begin // @[PE.scala 37:41]
      reg_ready_to_enq_north <= 1'h0; // @[PE.scala 37:41]
    end else begin
      reg_ready_to_enq_north <= _GEN_40;
    end
    if (reset) begin // @[PE.scala 38:30]
      addr_PE_reg <= 16'h0; // @[PE.scala 38:30]
    end else if (~state) begin // @[PE.scala 56:19]
      if (io_query_valid & io_refs_valid) begin // @[PE.scala 58:46]
        addr_PE_reg <= io_address_i; // @[PE.scala 61:23]
      end
    end
    if (reset) begin // @[PE.scala 40:26]
      counter <= 8'h0; // @[PE.scala 40:26]
    end else if (~state) begin // @[PE.scala 56:19]
      counter <= 8'h0;
    end else if (state) begin // @[PE.scala 56:19]
      if (compute_valid & counter == _GEN_41) begin // @[PE.scala 72:62]
        counter <= 8'h0; // @[PE.scala 81:19]
      end else begin
        counter <= _GEN_7;
      end
    end
    if (reset) begin // @[PE.scala 42:27]
      acc_dist <= 16'sh0; // @[PE.scala 42:27]
    end else if (!(~state)) begin // @[PE.scala 56:19]
      if (state) begin // @[PE.scala 56:19]
        if (compute_valid & counter == _GEN_41) begin // @[PE.scala 72:62]
          acc_dist <= 16'sh0; // @[PE.scala 78:20]
        end else begin
          acc_dist <= _GEN_8;
        end
      end
    end
    square_REG <= _square_T_1[15:0]; // @[PE.scala 45:75]
    compute_valid <= io_refs_valid; // @[PE.scala 52:32]
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
  state = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  dist_in_topk = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  dist_north_reg = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  addr_north_reg = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  reg_ready_to_enq_north = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  addr_PE_reg = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  counter = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  acc_dist = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  square_REG = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  compute_valid = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module topUnit(
  input         clock,
  input         reset,
  output        io_broadcast_query_ready,
  input         io_broadcast_query_valid,
  input  [15:0] io_broadcast_query_bits_0,
  output        io_refs_0_ready,
  input         io_refs_0_valid,
  input  [15:0] io_refs_0_bits_0,
  output        io_refs_1_ready,
  input         io_refs_1_valid,
  input  [15:0] io_refs_1_bits_0,
  output        io_refs_2_ready,
  input         io_refs_2_valid,
  input  [15:0] io_refs_2_bits_0,
  output        io_refs_3_ready,
  input         io_refs_3_valid,
  input  [15:0] io_refs_3_bits_0,
  input  [15:0] io_addrs_0,
  input  [15:0] io_addrs_1,
  input  [15:0] io_addrs_2,
  input  [15:0] io_addrs_3,
  input         io_finish,
  output        io_terminates_0,
  output        io_terminates_1,
  output        io_terminates_2,
  output        io_terminates_3,
  output [15:0] io_addrOut_0,
  output [15:0] io_addrOut_1,
  output [15:0] io_addrOut_2,
  output [15:0] io_addrOut_3,
  output [15:0] io_addrOut_4,
  output [15:0] io_addrOut_5,
  output [15:0] io_addrOut_6,
  output [15:0] io_addrOut_7,
  output [15:0] io_addrOut_8,
  output [15:0] io_addrOut_9,
  output [15:0] io_addrOut_10,
  output [15:0] io_addrOut_11,
  output [15:0] io_addrOut_12,
  output [15:0] io_addrOut_13,
  output [15:0] io_addrOut_14,
  output [15:0] io_addrOut_15,
  output        io_addrValid
);
  wire  topk_unit_clock; // @[topUnit.scala 15:27]
  wire  topk_unit_reset; // @[topUnit.scala 15:27]
  wire  topk_unit_io_in_valid; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_in_bits_distance; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_in_bits_addr; // @[topUnit.scala 15:27]
  wire  topk_unit_io_finish; // @[topUnit.scala 15:27]
  wire  topk_unit_io_kthOut_valid; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_kthOut_bits; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_0; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_1; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_2; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_3; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_4; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_5; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_6; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_7; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_8; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_9; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_10; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_11; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_12; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_13; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_14; // @[topUnit.scala 15:27]
  wire [15:0] topk_unit_io_addrOut_15; // @[topUnit.scala 15:27]
  wire  topk_unit_io_addrValid; // @[topUnit.scala 15:27]
  wire  group_0_clock; // @[topUnit.scala 19:35]
  wire  group_0_reset; // @[topUnit.scala 19:35]
  wire  group_0_io_query_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_0_io_query_bits_0; // @[topUnit.scala 19:35]
  wire  group_0_io_refs_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_0_io_refs_bits_0; // @[topUnit.scala 19:35]
  wire  group_0_io_dist_k_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_0_io_dist_k_bits; // @[topUnit.scala 19:35]
  wire [15:0] group_0_io_address_i; // @[topUnit.scala 19:35]
  wire  group_0_io_address_north_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_0_io_address_north_bits; // @[topUnit.scala 19:35]
  wire  group_0_io_address_south_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_0_io_address_south_bits; // @[topUnit.scala 19:35]
  wire  group_0_io_dist_north_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_0_io_dist_north_bits; // @[topUnit.scala 19:35]
  wire  group_0_io_dist_south_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_0_io_dist_south_bits; // @[topUnit.scala 19:35]
  wire  group_0_io_skip_to_next; // @[topUnit.scala 19:35]
  wire  group_1_clock; // @[topUnit.scala 19:35]
  wire  group_1_reset; // @[topUnit.scala 19:35]
  wire  group_1_io_query_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_1_io_query_bits_0; // @[topUnit.scala 19:35]
  wire  group_1_io_refs_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_1_io_refs_bits_0; // @[topUnit.scala 19:35]
  wire  group_1_io_dist_k_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_1_io_dist_k_bits; // @[topUnit.scala 19:35]
  wire [15:0] group_1_io_address_i; // @[topUnit.scala 19:35]
  wire  group_1_io_address_north_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_1_io_address_north_bits; // @[topUnit.scala 19:35]
  wire  group_1_io_address_south_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_1_io_address_south_bits; // @[topUnit.scala 19:35]
  wire  group_1_io_dist_north_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_1_io_dist_north_bits; // @[topUnit.scala 19:35]
  wire  group_1_io_dist_south_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_1_io_dist_south_bits; // @[topUnit.scala 19:35]
  wire  group_1_io_skip_to_next; // @[topUnit.scala 19:35]
  wire  group_2_clock; // @[topUnit.scala 19:35]
  wire  group_2_reset; // @[topUnit.scala 19:35]
  wire  group_2_io_query_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_2_io_query_bits_0; // @[topUnit.scala 19:35]
  wire  group_2_io_refs_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_2_io_refs_bits_0; // @[topUnit.scala 19:35]
  wire  group_2_io_dist_k_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_2_io_dist_k_bits; // @[topUnit.scala 19:35]
  wire [15:0] group_2_io_address_i; // @[topUnit.scala 19:35]
  wire  group_2_io_address_north_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_2_io_address_north_bits; // @[topUnit.scala 19:35]
  wire  group_2_io_address_south_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_2_io_address_south_bits; // @[topUnit.scala 19:35]
  wire  group_2_io_dist_north_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_2_io_dist_north_bits; // @[topUnit.scala 19:35]
  wire  group_2_io_dist_south_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_2_io_dist_south_bits; // @[topUnit.scala 19:35]
  wire  group_2_io_skip_to_next; // @[topUnit.scala 19:35]
  wire  group_3_clock; // @[topUnit.scala 19:35]
  wire  group_3_reset; // @[topUnit.scala 19:35]
  wire  group_3_io_query_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_3_io_query_bits_0; // @[topUnit.scala 19:35]
  wire  group_3_io_refs_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_3_io_refs_bits_0; // @[topUnit.scala 19:35]
  wire  group_3_io_dist_k_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_3_io_dist_k_bits; // @[topUnit.scala 19:35]
  wire [15:0] group_3_io_address_i; // @[topUnit.scala 19:35]
  wire  group_3_io_address_north_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_3_io_address_north_bits; // @[topUnit.scala 19:35]
  wire  group_3_io_address_south_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_3_io_address_south_bits; // @[topUnit.scala 19:35]
  wire  group_3_io_dist_north_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_3_io_dist_north_bits; // @[topUnit.scala 19:35]
  wire  group_3_io_dist_south_valid; // @[topUnit.scala 19:35]
  wire [15:0] group_3_io_dist_south_bits; // @[topUnit.scala 19:35]
  wire  group_3_io_skip_to_next; // @[topUnit.scala 19:35]
  KthSmallestTracker topk_unit ( // @[topUnit.scala 15:27]
    .clock(topk_unit_clock),
    .reset(topk_unit_reset),
    .io_in_valid(topk_unit_io_in_valid),
    .io_in_bits_distance(topk_unit_io_in_bits_distance),
    .io_in_bits_addr(topk_unit_io_in_bits_addr),
    .io_finish(topk_unit_io_finish),
    .io_kthOut_valid(topk_unit_io_kthOut_valid),
    .io_kthOut_bits(topk_unit_io_kthOut_bits),
    .io_addrOut_0(topk_unit_io_addrOut_0),
    .io_addrOut_1(topk_unit_io_addrOut_1),
    .io_addrOut_2(topk_unit_io_addrOut_2),
    .io_addrOut_3(topk_unit_io_addrOut_3),
    .io_addrOut_4(topk_unit_io_addrOut_4),
    .io_addrOut_5(topk_unit_io_addrOut_5),
    .io_addrOut_6(topk_unit_io_addrOut_6),
    .io_addrOut_7(topk_unit_io_addrOut_7),
    .io_addrOut_8(topk_unit_io_addrOut_8),
    .io_addrOut_9(topk_unit_io_addrOut_9),
    .io_addrOut_10(topk_unit_io_addrOut_10),
    .io_addrOut_11(topk_unit_io_addrOut_11),
    .io_addrOut_12(topk_unit_io_addrOut_12),
    .io_addrOut_13(topk_unit_io_addrOut_13),
    .io_addrOut_14(topk_unit_io_addrOut_14),
    .io_addrOut_15(topk_unit_io_addrOut_15),
    .io_addrValid(topk_unit_io_addrValid)
  );
  PE_Module group_0 ( // @[topUnit.scala 19:35]
    .clock(group_0_clock),
    .reset(group_0_reset),
    .io_query_valid(group_0_io_query_valid),
    .io_query_bits_0(group_0_io_query_bits_0),
    .io_refs_valid(group_0_io_refs_valid),
    .io_refs_bits_0(group_0_io_refs_bits_0),
    .io_dist_k_valid(group_0_io_dist_k_valid),
    .io_dist_k_bits(group_0_io_dist_k_bits),
    .io_address_i(group_0_io_address_i),
    .io_address_north_valid(group_0_io_address_north_valid),
    .io_address_north_bits(group_0_io_address_north_bits),
    .io_address_south_valid(group_0_io_address_south_valid),
    .io_address_south_bits(group_0_io_address_south_bits),
    .io_dist_north_valid(group_0_io_dist_north_valid),
    .io_dist_north_bits(group_0_io_dist_north_bits),
    .io_dist_south_valid(group_0_io_dist_south_valid),
    .io_dist_south_bits(group_0_io_dist_south_bits),
    .io_skip_to_next(group_0_io_skip_to_next)
  );
  PE_Module group_1 ( // @[topUnit.scala 19:35]
    .clock(group_1_clock),
    .reset(group_1_reset),
    .io_query_valid(group_1_io_query_valid),
    .io_query_bits_0(group_1_io_query_bits_0),
    .io_refs_valid(group_1_io_refs_valid),
    .io_refs_bits_0(group_1_io_refs_bits_0),
    .io_dist_k_valid(group_1_io_dist_k_valid),
    .io_dist_k_bits(group_1_io_dist_k_bits),
    .io_address_i(group_1_io_address_i),
    .io_address_north_valid(group_1_io_address_north_valid),
    .io_address_north_bits(group_1_io_address_north_bits),
    .io_address_south_valid(group_1_io_address_south_valid),
    .io_address_south_bits(group_1_io_address_south_bits),
    .io_dist_north_valid(group_1_io_dist_north_valid),
    .io_dist_north_bits(group_1_io_dist_north_bits),
    .io_dist_south_valid(group_1_io_dist_south_valid),
    .io_dist_south_bits(group_1_io_dist_south_bits),
    .io_skip_to_next(group_1_io_skip_to_next)
  );
  PE_Module group_2 ( // @[topUnit.scala 19:35]
    .clock(group_2_clock),
    .reset(group_2_reset),
    .io_query_valid(group_2_io_query_valid),
    .io_query_bits_0(group_2_io_query_bits_0),
    .io_refs_valid(group_2_io_refs_valid),
    .io_refs_bits_0(group_2_io_refs_bits_0),
    .io_dist_k_valid(group_2_io_dist_k_valid),
    .io_dist_k_bits(group_2_io_dist_k_bits),
    .io_address_i(group_2_io_address_i),
    .io_address_north_valid(group_2_io_address_north_valid),
    .io_address_north_bits(group_2_io_address_north_bits),
    .io_address_south_valid(group_2_io_address_south_valid),
    .io_address_south_bits(group_2_io_address_south_bits),
    .io_dist_north_valid(group_2_io_dist_north_valid),
    .io_dist_north_bits(group_2_io_dist_north_bits),
    .io_dist_south_valid(group_2_io_dist_south_valid),
    .io_dist_south_bits(group_2_io_dist_south_bits),
    .io_skip_to_next(group_2_io_skip_to_next)
  );
  PE_Module group_3 ( // @[topUnit.scala 19:35]
    .clock(group_3_clock),
    .reset(group_3_reset),
    .io_query_valid(group_3_io_query_valid),
    .io_query_bits_0(group_3_io_query_bits_0),
    .io_refs_valid(group_3_io_refs_valid),
    .io_refs_bits_0(group_3_io_refs_bits_0),
    .io_dist_k_valid(group_3_io_dist_k_valid),
    .io_dist_k_bits(group_3_io_dist_k_bits),
    .io_address_i(group_3_io_address_i),
    .io_address_north_valid(group_3_io_address_north_valid),
    .io_address_north_bits(group_3_io_address_north_bits),
    .io_address_south_valid(group_3_io_address_south_valid),
    .io_address_south_bits(group_3_io_address_south_bits),
    .io_dist_north_valid(group_3_io_dist_north_valid),
    .io_dist_north_bits(group_3_io_dist_north_bits),
    .io_dist_south_valid(group_3_io_dist_south_valid),
    .io_dist_south_bits(group_3_io_dist_south_bits),
    .io_skip_to_next(group_3_io_skip_to_next)
  );
  assign io_broadcast_query_ready = 1'h1; // @[topUnit.scala 25:27]
  assign io_refs_0_ready = 1'h1; // @[topUnit.scala 28:26]
  assign io_refs_1_ready = 1'h1; // @[topUnit.scala 28:26]
  assign io_refs_2_ready = 1'h1; // @[topUnit.scala 28:26]
  assign io_refs_3_ready = 1'h1; // @[topUnit.scala 28:26]
  assign io_terminates_0 = group_0_io_skip_to_next; // @[topUnit.scala 29:26]
  assign io_terminates_1 = group_1_io_skip_to_next; // @[topUnit.scala 29:26]
  assign io_terminates_2 = group_2_io_skip_to_next; // @[topUnit.scala 29:26]
  assign io_terminates_3 = group_3_io_skip_to_next; // @[topUnit.scala 29:26]
  assign io_addrOut_0 = topk_unit_io_addrOut_0; // @[topUnit.scala 17:16]
  assign io_addrOut_1 = topk_unit_io_addrOut_1; // @[topUnit.scala 17:16]
  assign io_addrOut_2 = topk_unit_io_addrOut_2; // @[topUnit.scala 17:16]
  assign io_addrOut_3 = topk_unit_io_addrOut_3; // @[topUnit.scala 17:16]
  assign io_addrOut_4 = topk_unit_io_addrOut_4; // @[topUnit.scala 17:16]
  assign io_addrOut_5 = topk_unit_io_addrOut_5; // @[topUnit.scala 17:16]
  assign io_addrOut_6 = topk_unit_io_addrOut_6; // @[topUnit.scala 17:16]
  assign io_addrOut_7 = topk_unit_io_addrOut_7; // @[topUnit.scala 17:16]
  assign io_addrOut_8 = topk_unit_io_addrOut_8; // @[topUnit.scala 17:16]
  assign io_addrOut_9 = topk_unit_io_addrOut_9; // @[topUnit.scala 17:16]
  assign io_addrOut_10 = topk_unit_io_addrOut_10; // @[topUnit.scala 17:16]
  assign io_addrOut_11 = topk_unit_io_addrOut_11; // @[topUnit.scala 17:16]
  assign io_addrOut_12 = topk_unit_io_addrOut_12; // @[topUnit.scala 17:16]
  assign io_addrOut_13 = topk_unit_io_addrOut_13; // @[topUnit.scala 17:16]
  assign io_addrOut_14 = topk_unit_io_addrOut_14; // @[topUnit.scala 17:16]
  assign io_addrOut_15 = topk_unit_io_addrOut_15; // @[topUnit.scala 17:16]
  assign io_addrValid = topk_unit_io_addrValid; // @[topUnit.scala 18:18]
  assign topk_unit_clock = clock;
  assign topk_unit_reset = reset;
  assign topk_unit_io_in_valid = group_3_io_address_south_valid & group_3_io_dist_south_valid; // @[topUnit.scala 37:70]
  assign topk_unit_io_in_bits_distance = group_3_io_dist_south_bits; // @[topUnit.scala 36:44]
  assign topk_unit_io_in_bits_addr = group_3_io_address_south_bits; // @[topUnit.scala 35:39]
  assign topk_unit_io_finish = io_finish; // @[topUnit.scala 16:25]
  assign group_0_clock = clock;
  assign group_0_reset = reset;
  assign group_0_io_query_valid = io_broadcast_query_valid; // @[topUnit.scala 25:27]
  assign group_0_io_query_bits_0 = io_broadcast_query_bits_0; // @[topUnit.scala 25:27]
  assign group_0_io_refs_valid = io_refs_0_valid; // @[topUnit.scala 28:26]
  assign group_0_io_refs_bits_0 = io_refs_0_bits_0; // @[topUnit.scala 28:26]
  assign group_0_io_dist_k_valid = topk_unit_io_kthOut_valid; // @[topUnit.scala 27:28]
  assign group_0_io_dist_k_bits = topk_unit_io_kthOut_bits; // @[topUnit.scala 27:28]
  assign group_0_io_address_i = io_addrs_0; // @[topUnit.scala 26:31]
  assign group_0_io_address_north_valid = 1'h0;
  assign group_0_io_address_north_bits = 16'h0;
  assign group_0_io_dist_north_valid = 1'h0;
  assign group_0_io_dist_north_bits = 16'sh0;
  assign group_1_clock = clock;
  assign group_1_reset = reset;
  assign group_1_io_query_valid = io_broadcast_query_valid; // @[topUnit.scala 25:27]
  assign group_1_io_query_bits_0 = io_broadcast_query_bits_0; // @[topUnit.scala 25:27]
  assign group_1_io_refs_valid = io_refs_1_valid; // @[topUnit.scala 28:26]
  assign group_1_io_refs_bits_0 = io_refs_1_bits_0; // @[topUnit.scala 28:26]
  assign group_1_io_dist_k_valid = topk_unit_io_kthOut_valid; // @[topUnit.scala 27:28]
  assign group_1_io_dist_k_bits = topk_unit_io_kthOut_bits; // @[topUnit.scala 27:28]
  assign group_1_io_address_i = io_addrs_1; // @[topUnit.scala 26:31]
  assign group_1_io_address_north_valid = group_0_io_address_south_valid; // @[topUnit.scala 31:39]
  assign group_1_io_address_north_bits = group_0_io_address_south_bits; // @[topUnit.scala 31:39]
  assign group_1_io_dist_north_valid = group_0_io_dist_south_valid; // @[topUnit.scala 32:36]
  assign group_1_io_dist_north_bits = group_0_io_dist_south_bits; // @[topUnit.scala 32:36]
  assign group_2_clock = clock;
  assign group_2_reset = reset;
  assign group_2_io_query_valid = io_broadcast_query_valid; // @[topUnit.scala 25:27]
  assign group_2_io_query_bits_0 = io_broadcast_query_bits_0; // @[topUnit.scala 25:27]
  assign group_2_io_refs_valid = io_refs_2_valid; // @[topUnit.scala 28:26]
  assign group_2_io_refs_bits_0 = io_refs_2_bits_0; // @[topUnit.scala 28:26]
  assign group_2_io_dist_k_valid = topk_unit_io_kthOut_valid; // @[topUnit.scala 27:28]
  assign group_2_io_dist_k_bits = topk_unit_io_kthOut_bits; // @[topUnit.scala 27:28]
  assign group_2_io_address_i = io_addrs_2; // @[topUnit.scala 26:31]
  assign group_2_io_address_north_valid = group_1_io_address_south_valid; // @[topUnit.scala 31:39]
  assign group_2_io_address_north_bits = group_1_io_address_south_bits; // @[topUnit.scala 31:39]
  assign group_2_io_dist_north_valid = group_1_io_dist_south_valid; // @[topUnit.scala 32:36]
  assign group_2_io_dist_north_bits = group_1_io_dist_south_bits; // @[topUnit.scala 32:36]
  assign group_3_clock = clock;
  assign group_3_reset = reset;
  assign group_3_io_query_valid = io_broadcast_query_valid; // @[topUnit.scala 25:27]
  assign group_3_io_query_bits_0 = io_broadcast_query_bits_0; // @[topUnit.scala 25:27]
  assign group_3_io_refs_valid = io_refs_3_valid; // @[topUnit.scala 28:26]
  assign group_3_io_refs_bits_0 = io_refs_3_bits_0; // @[topUnit.scala 28:26]
  assign group_3_io_dist_k_valid = topk_unit_io_kthOut_valid; // @[topUnit.scala 27:28]
  assign group_3_io_dist_k_bits = topk_unit_io_kthOut_bits; // @[topUnit.scala 27:28]
  assign group_3_io_address_i = io_addrs_3; // @[topUnit.scala 26:31]
  assign group_3_io_address_north_valid = group_2_io_address_south_valid; // @[topUnit.scala 31:39]
  assign group_3_io_address_north_bits = group_2_io_address_south_bits; // @[topUnit.scala 31:39]
  assign group_3_io_dist_north_valid = group_2_io_dist_south_valid; // @[topUnit.scala 32:36]
  assign group_3_io_dist_north_bits = group_2_io_dist_south_bits; // @[topUnit.scala 32:36]
endmodule
