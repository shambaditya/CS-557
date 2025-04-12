FIRRTL version 1.1.0
circuit topUnit :
  module KthSmallestTracker :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits_distance : SInt<16>
    input io_in_bits_addr : UInt<16>
    input io_finish : UInt<1>
    input io_kthOut_ready : UInt<1>
    output io_kthOut_valid : UInt<1>
    output io_kthOut_bits : SInt<16>
    output io_addrOut_0 : UInt<16>
    output io_addrOut_1 : UInt<16>
    output io_addrOut_2 : UInt<16>
    output io_addrOut_3 : UInt<16>
    output io_addrOut_4 : UInt<16>
    output io_addrOut_5 : UInt<16>
    output io_addrOut_6 : UInt<16>
    output io_addrOut_7 : UInt<16>
    output io_addrOut_8 : UInt<16>
    output io_addrOut_9 : UInt<16>
    output io_addrOut_10 : UInt<16>
    output io_addrOut_11 : UInt<16>
    output io_addrOut_12 : UInt<16>
    output io_addrOut_13 : UInt<16>
    output io_addrOut_14 : UInt<16>
    output io_addrOut_15 : UInt<16>
    output io_addrValid : UInt<1>

    node _defaultEntry_distance_T = shl(UInt<1>("h1"), 15) @[KthSmallestTracker.scala 24:33]
    node _defaultEntry_distance_T_1 = asSInt(_defaultEntry_distance_T) @[KthSmallestTracker.scala 24:45]
    reg heap_0_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_0_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_0_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_0_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_1_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_1_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_1_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_1_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_2_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_2_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_2_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_2_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_3_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_3_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_3_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_3_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_4_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_4_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_4_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_4_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_5_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_5_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_5_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_5_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_6_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_6_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_6_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_6_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_7_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_7_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_7_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_7_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_8_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_8_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_8_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_8_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_9_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_9_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_9_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_9_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_10_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_10_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_10_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_10_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_11_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_11_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_11_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_11_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_12_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_12_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_12_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_12_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_13_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_13_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_13_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_13_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_14_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_14_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_14_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_14_addr) @[KthSmallestTracker.scala 28:22]
    reg heap_15_distance : SInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_15_distance) @[KthSmallestTracker.scala 28:22]
    reg heap_15_addr : UInt<16>, clock with :
      reset => (UInt<1>("h0"), heap_15_addr) @[KthSmallestTracker.scala 28:22]
    reg count : UInt<5>, clock with :
      reset => (UInt<1>("h0"), count) @[KthSmallestTracker.scala 29:22]
    node _T = gt(heap_1_distance, heap_0_distance) @[KthSmallestTracker.scala 38:30]
    node _T_1_distance = mux(_T, heap_1_distance, heap_0_distance) @[KthSmallestTracker.scala 38:13]
    node _T_1_addr = mux(_T, heap_1_addr, heap_0_addr) @[KthSmallestTracker.scala 38:13]
    node _T_2 = gt(heap_1_distance, heap_0_distance) @[KthSmallestTracker.scala 39:30]
    node _T_3 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[KthSmallestTracker.scala 39:13]
    node _T_4 = gt(heap_2_distance, _T_1_distance) @[KthSmallestTracker.scala 38:30]
    node _T_5_distance = mux(_T_4, heap_2_distance, _T_1_distance) @[KthSmallestTracker.scala 38:13]
    node _T_5_addr = mux(_T_4, heap_2_addr, _T_1_addr) @[KthSmallestTracker.scala 38:13]
    node _T_6 = gt(heap_2_distance, _T_1_distance) @[KthSmallestTracker.scala 39:30]
    node _T_7 = mux(_T_6, UInt<2>("h2"), _T_3) @[KthSmallestTracker.scala 39:13]
    node _T_8 = gt(heap_3_distance, _T_5_distance) @[KthSmallestTracker.scala 38:30]
    node _T_9_distance = mux(_T_8, heap_3_distance, _T_5_distance) @[KthSmallestTracker.scala 38:13]
    node _T_9_addr = mux(_T_8, heap_3_addr, _T_5_addr) @[KthSmallestTracker.scala 38:13]
    node _T_10 = gt(heap_3_distance, _T_5_distance) @[KthSmallestTracker.scala 39:30]
    node _T_11 = mux(_T_10, UInt<2>("h3"), _T_7) @[KthSmallestTracker.scala 39:13]
    node _T_12 = gt(heap_4_distance, _T_9_distance) @[KthSmallestTracker.scala 38:30]
    node _T_13_distance = mux(_T_12, heap_4_distance, _T_9_distance) @[KthSmallestTracker.scala 38:13]
    node _T_13_addr = mux(_T_12, heap_4_addr, _T_9_addr) @[KthSmallestTracker.scala 38:13]
    node _T_14 = gt(heap_4_distance, _T_9_distance) @[KthSmallestTracker.scala 39:30]
    node _T_15 = mux(_T_14, UInt<3>("h4"), _T_11) @[KthSmallestTracker.scala 39:13]
    node _T_16 = gt(heap_5_distance, _T_13_distance) @[KthSmallestTracker.scala 38:30]
    node _T_17_distance = mux(_T_16, heap_5_distance, _T_13_distance) @[KthSmallestTracker.scala 38:13]
    node _T_17_addr = mux(_T_16, heap_5_addr, _T_13_addr) @[KthSmallestTracker.scala 38:13]
    node _T_18 = gt(heap_5_distance, _T_13_distance) @[KthSmallestTracker.scala 39:30]
    node _T_19 = mux(_T_18, UInt<3>("h5"), _T_15) @[KthSmallestTracker.scala 39:13]
    node _T_20 = gt(heap_6_distance, _T_17_distance) @[KthSmallestTracker.scala 38:30]
    node _T_21_distance = mux(_T_20, heap_6_distance, _T_17_distance) @[KthSmallestTracker.scala 38:13]
    node _T_21_addr = mux(_T_20, heap_6_addr, _T_17_addr) @[KthSmallestTracker.scala 38:13]
    node _T_22 = gt(heap_6_distance, _T_17_distance) @[KthSmallestTracker.scala 39:30]
    node _T_23 = mux(_T_22, UInt<3>("h6"), _T_19) @[KthSmallestTracker.scala 39:13]
    node _T_24 = gt(heap_7_distance, _T_21_distance) @[KthSmallestTracker.scala 38:30]
    node _T_25_distance = mux(_T_24, heap_7_distance, _T_21_distance) @[KthSmallestTracker.scala 38:13]
    node _T_25_addr = mux(_T_24, heap_7_addr, _T_21_addr) @[KthSmallestTracker.scala 38:13]
    node _T_26 = gt(heap_7_distance, _T_21_distance) @[KthSmallestTracker.scala 39:30]
    node _T_27 = mux(_T_26, UInt<3>("h7"), _T_23) @[KthSmallestTracker.scala 39:13]
    node _T_28 = gt(heap_8_distance, _T_25_distance) @[KthSmallestTracker.scala 38:30]
    node _T_29_distance = mux(_T_28, heap_8_distance, _T_25_distance) @[KthSmallestTracker.scala 38:13]
    node _T_29_addr = mux(_T_28, heap_8_addr, _T_25_addr) @[KthSmallestTracker.scala 38:13]
    node _T_30 = gt(heap_8_distance, _T_25_distance) @[KthSmallestTracker.scala 39:30]
    node _T_31 = mux(_T_30, UInt<4>("h8"), _T_27) @[KthSmallestTracker.scala 39:13]
    node _T_32 = gt(heap_9_distance, _T_29_distance) @[KthSmallestTracker.scala 38:30]
    node _T_33_distance = mux(_T_32, heap_9_distance, _T_29_distance) @[KthSmallestTracker.scala 38:13]
    node _T_33_addr = mux(_T_32, heap_9_addr, _T_29_addr) @[KthSmallestTracker.scala 38:13]
    node _T_34 = gt(heap_9_distance, _T_29_distance) @[KthSmallestTracker.scala 39:30]
    node _T_35 = mux(_T_34, UInt<4>("h9"), _T_31) @[KthSmallestTracker.scala 39:13]
    node _T_36 = gt(heap_10_distance, _T_33_distance) @[KthSmallestTracker.scala 38:30]
    node _T_37_distance = mux(_T_36, heap_10_distance, _T_33_distance) @[KthSmallestTracker.scala 38:13]
    node _T_37_addr = mux(_T_36, heap_10_addr, _T_33_addr) @[KthSmallestTracker.scala 38:13]
    node _T_38 = gt(heap_10_distance, _T_33_distance) @[KthSmallestTracker.scala 39:30]
    node _T_39 = mux(_T_38, UInt<4>("ha"), _T_35) @[KthSmallestTracker.scala 39:13]
    node _T_40 = gt(heap_11_distance, _T_37_distance) @[KthSmallestTracker.scala 38:30]
    node _T_41_distance = mux(_T_40, heap_11_distance, _T_37_distance) @[KthSmallestTracker.scala 38:13]
    node _T_41_addr = mux(_T_40, heap_11_addr, _T_37_addr) @[KthSmallestTracker.scala 38:13]
    node _T_42 = gt(heap_11_distance, _T_37_distance) @[KthSmallestTracker.scala 39:30]
    node _T_43 = mux(_T_42, UInt<4>("hb"), _T_39) @[KthSmallestTracker.scala 39:13]
    node _T_44 = gt(heap_12_distance, _T_41_distance) @[KthSmallestTracker.scala 38:30]
    node _T_45_distance = mux(_T_44, heap_12_distance, _T_41_distance) @[KthSmallestTracker.scala 38:13]
    node _T_45_addr = mux(_T_44, heap_12_addr, _T_41_addr) @[KthSmallestTracker.scala 38:13]
    node _T_46 = gt(heap_12_distance, _T_41_distance) @[KthSmallestTracker.scala 39:30]
    node _T_47 = mux(_T_46, UInt<4>("hc"), _T_43) @[KthSmallestTracker.scala 39:13]
    node _T_48 = gt(heap_13_distance, _T_45_distance) @[KthSmallestTracker.scala 38:30]
    node _T_49_distance = mux(_T_48, heap_13_distance, _T_45_distance) @[KthSmallestTracker.scala 38:13]
    node _T_49_addr = mux(_T_48, heap_13_addr, _T_45_addr) @[KthSmallestTracker.scala 38:13]
    node _T_50 = gt(heap_13_distance, _T_45_distance) @[KthSmallestTracker.scala 39:30]
    node _T_51 = mux(_T_50, UInt<4>("hd"), _T_47) @[KthSmallestTracker.scala 39:13]
    node _T_52 = gt(heap_14_distance, _T_49_distance) @[KthSmallestTracker.scala 38:30]
    node _T_53_distance = mux(_T_52, heap_14_distance, _T_49_distance) @[KthSmallestTracker.scala 38:13]
    node _T_53_addr = mux(_T_52, heap_14_addr, _T_49_addr) @[KthSmallestTracker.scala 38:13]
    node _T_54 = gt(heap_14_distance, _T_49_distance) @[KthSmallestTracker.scala 39:30]
    node _T_55 = mux(_T_54, UInt<4>("he"), _T_51) @[KthSmallestTracker.scala 39:13]
    node _T_56 = gt(heap_15_distance, _T_53_distance) @[KthSmallestTracker.scala 38:30]
    node maxEntry_distance = mux(_T_56, heap_15_distance, _T_53_distance) @[KthSmallestTracker.scala 38:13]
    node maxEntry_addr = mux(_T_56, heap_15_addr, _T_53_addr) @[KthSmallestTracker.scala 38:13]
    node _T_57 = gt(heap_15_distance, _T_53_distance) @[KthSmallestTracker.scala 39:30]
    node maxIdx = mux(_T_57, UInt<4>("hf"), _T_55) @[KthSmallestTracker.scala 39:13]
    node _T_58 = eq(count, UInt<1>("h0")) @[KthSmallestTracker.scala 46:14]
    node _validEntries_0_T = lt(UInt<1>("h0"), count) @[KthSmallestTracker.scala 51:34]
    node defaultEntry_distance = _defaultEntry_distance_T_1 @[KthSmallestTracker.scala 23:26 24:25]
    node _validEntries_0_T_1_distance = mux(_validEntries_0_T, heap_0_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node defaultEntry_addr = UInt<16>("h0") @[KthSmallestTracker.scala 23:26 25:21]
    node _validEntries_0_T_1_addr = mux(_validEntries_0_T, heap_0_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_1_T = lt(UInt<1>("h1"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_1_T_1_distance = mux(_validEntries_1_T, heap_1_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_1_T_1_addr = mux(_validEntries_1_T, heap_1_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_2_T = lt(UInt<2>("h2"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_2_T_1_distance = mux(_validEntries_2_T, heap_2_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_2_T_1_addr = mux(_validEntries_2_T, heap_2_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_3_T = lt(UInt<2>("h3"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_3_T_1_distance = mux(_validEntries_3_T, heap_3_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_3_T_1_addr = mux(_validEntries_3_T, heap_3_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_4_T = lt(UInt<3>("h4"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_4_T_1_distance = mux(_validEntries_4_T, heap_4_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_4_T_1_addr = mux(_validEntries_4_T, heap_4_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_5_T = lt(UInt<3>("h5"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_5_T_1_distance = mux(_validEntries_5_T, heap_5_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_5_T_1_addr = mux(_validEntries_5_T, heap_5_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_6_T = lt(UInt<3>("h6"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_6_T_1_distance = mux(_validEntries_6_T, heap_6_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_6_T_1_addr = mux(_validEntries_6_T, heap_6_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_7_T = lt(UInt<3>("h7"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_7_T_1_distance = mux(_validEntries_7_T, heap_7_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_7_T_1_addr = mux(_validEntries_7_T, heap_7_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_8_T = lt(UInt<4>("h8"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_8_T_1_distance = mux(_validEntries_8_T, heap_8_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_8_T_1_addr = mux(_validEntries_8_T, heap_8_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_9_T = lt(UInt<4>("h9"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_9_T_1_distance = mux(_validEntries_9_T, heap_9_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_9_T_1_addr = mux(_validEntries_9_T, heap_9_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_10_T = lt(UInt<4>("ha"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_10_T_1_distance = mux(_validEntries_10_T, heap_10_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_10_T_1_addr = mux(_validEntries_10_T, heap_10_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_11_T = lt(UInt<4>("hb"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_11_T_1_distance = mux(_validEntries_11_T, heap_11_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_11_T_1_addr = mux(_validEntries_11_T, heap_11_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_12_T = lt(UInt<4>("hc"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_12_T_1_distance = mux(_validEntries_12_T, heap_12_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_12_T_1_addr = mux(_validEntries_12_T, heap_12_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_13_T = lt(UInt<4>("hd"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_13_T_1_distance = mux(_validEntries_13_T, heap_13_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_13_T_1_addr = mux(_validEntries_13_T, heap_13_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_14_T = lt(UInt<4>("he"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_14_T_1_distance = mux(_validEntries_14_T, heap_14_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_14_T_1_addr = mux(_validEntries_14_T, heap_14_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node _validEntries_15_T = lt(UInt<4>("hf"), count) @[KthSmallestTracker.scala 51:34]
    node _validEntries_15_T_1_distance = mux(_validEntries_15_T, heap_15_distance, defaultEntry_distance) @[KthSmallestTracker.scala 51:29]
    node _validEntries_15_T_1_addr = mux(_validEntries_15_T, heap_15_addr, defaultEntry_addr) @[KthSmallestTracker.scala 51:29]
    node validEntries_0_distance = _validEntries_0_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node validEntries_1_distance = _validEntries_1_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T = gt(validEntries_0_distance, validEntries_1_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_1_distance = mux(_currentMax_T, validEntries_0_distance, validEntries_1_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_0_addr = _validEntries_0_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node validEntries_1_addr = _validEntries_1_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_1_addr = mux(_currentMax_T, validEntries_0_addr, validEntries_1_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_2_distance = _validEntries_2_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_2 = gt(_currentMax_T_1_distance, validEntries_2_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_3_distance = mux(_currentMax_T_2, _currentMax_T_1_distance, validEntries_2_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_2_addr = _validEntries_2_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_3_addr = mux(_currentMax_T_2, _currentMax_T_1_addr, validEntries_2_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_3_distance = _validEntries_3_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_4 = gt(_currentMax_T_3_distance, validEntries_3_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_5_distance = mux(_currentMax_T_4, _currentMax_T_3_distance, validEntries_3_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_3_addr = _validEntries_3_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_5_addr = mux(_currentMax_T_4, _currentMax_T_3_addr, validEntries_3_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_4_distance = _validEntries_4_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_6 = gt(_currentMax_T_5_distance, validEntries_4_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_7_distance = mux(_currentMax_T_6, _currentMax_T_5_distance, validEntries_4_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_4_addr = _validEntries_4_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_7_addr = mux(_currentMax_T_6, _currentMax_T_5_addr, validEntries_4_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_5_distance = _validEntries_5_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_8 = gt(_currentMax_T_7_distance, validEntries_5_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_9_distance = mux(_currentMax_T_8, _currentMax_T_7_distance, validEntries_5_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_5_addr = _validEntries_5_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_9_addr = mux(_currentMax_T_8, _currentMax_T_7_addr, validEntries_5_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_6_distance = _validEntries_6_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_10 = gt(_currentMax_T_9_distance, validEntries_6_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_11_distance = mux(_currentMax_T_10, _currentMax_T_9_distance, validEntries_6_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_6_addr = _validEntries_6_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_11_addr = mux(_currentMax_T_10, _currentMax_T_9_addr, validEntries_6_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_7_distance = _validEntries_7_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_12 = gt(_currentMax_T_11_distance, validEntries_7_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_13_distance = mux(_currentMax_T_12, _currentMax_T_11_distance, validEntries_7_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_7_addr = _validEntries_7_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_13_addr = mux(_currentMax_T_12, _currentMax_T_11_addr, validEntries_7_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_8_distance = _validEntries_8_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_14 = gt(_currentMax_T_13_distance, validEntries_8_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_15_distance = mux(_currentMax_T_14, _currentMax_T_13_distance, validEntries_8_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_8_addr = _validEntries_8_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_15_addr = mux(_currentMax_T_14, _currentMax_T_13_addr, validEntries_8_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_9_distance = _validEntries_9_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_16 = gt(_currentMax_T_15_distance, validEntries_9_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_17_distance = mux(_currentMax_T_16, _currentMax_T_15_distance, validEntries_9_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_9_addr = _validEntries_9_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_17_addr = mux(_currentMax_T_16, _currentMax_T_15_addr, validEntries_9_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_10_distance = _validEntries_10_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_18 = gt(_currentMax_T_17_distance, validEntries_10_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_19_distance = mux(_currentMax_T_18, _currentMax_T_17_distance, validEntries_10_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_10_addr = _validEntries_10_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_19_addr = mux(_currentMax_T_18, _currentMax_T_17_addr, validEntries_10_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_11_distance = _validEntries_11_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_20 = gt(_currentMax_T_19_distance, validEntries_11_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_21_distance = mux(_currentMax_T_20, _currentMax_T_19_distance, validEntries_11_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_11_addr = _validEntries_11_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_21_addr = mux(_currentMax_T_20, _currentMax_T_19_addr, validEntries_11_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_12_distance = _validEntries_12_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_22 = gt(_currentMax_T_21_distance, validEntries_12_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_23_distance = mux(_currentMax_T_22, _currentMax_T_21_distance, validEntries_12_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_12_addr = _validEntries_12_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_23_addr = mux(_currentMax_T_22, _currentMax_T_21_addr, validEntries_12_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_13_distance = _validEntries_13_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_24 = gt(_currentMax_T_23_distance, validEntries_13_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_25_distance = mux(_currentMax_T_24, _currentMax_T_23_distance, validEntries_13_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_13_addr = _validEntries_13_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_25_addr = mux(_currentMax_T_24, _currentMax_T_23_addr, validEntries_13_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_14_distance = _validEntries_14_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_26 = gt(_currentMax_T_25_distance, validEntries_14_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_27_distance = mux(_currentMax_T_26, _currentMax_T_25_distance, validEntries_14_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_14_addr = _validEntries_14_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_27_addr = mux(_currentMax_T_26, _currentMax_T_25_addr, validEntries_14_addr) @[KthSmallestTracker.scala 53:52]
    node validEntries_15_distance = _validEntries_15_T_1_distance @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_28 = gt(_currentMax_T_27_distance, validEntries_15_distance) @[KthSmallestTracker.scala 53:64]
    node _currentMax_T_29_distance = mux(_currentMax_T_28, _currentMax_T_27_distance, validEntries_15_distance) @[KthSmallestTracker.scala 53:52]
    node validEntries_15_addr = _validEntries_15_T_1_addr @[KthSmallestTracker.scala 49:28 51:23]
    node _currentMax_T_29_addr = mux(_currentMax_T_28, _currentMax_T_27_addr, validEntries_15_addr) @[KthSmallestTracker.scala 53:52]
    node _GEN_0 = mux(_T_58, defaultEntry_distance, _currentMax_T_29_distance) @[KthSmallestTracker.scala 46:23 47:16 53:16]
    node _GEN_1 = mux(_T_58, defaultEntry_addr, _currentMax_T_29_addr) @[KthSmallestTracker.scala 46:23 47:16 53:16]
    node _kthEntry_T = eq(count, UInt<5>("h10")) @[KthSmallestTracker.scala 57:28]
    node currentMax_distance = _GEN_0 @[KthSmallestTracker.scala 45:24]
    node kthEntry_distance = mux(_kthEntry_T, maxEntry_distance, currentMax_distance) @[KthSmallestTracker.scala 57:21]
    node currentMax_addr = _GEN_1 @[KthSmallestTracker.scala 45:24]
    node kthEntry_addr = mux(_kthEntry_T, maxEntry_addr, currentMax_addr) @[KthSmallestTracker.scala 57:21]
    node _T_59 = lt(count, UInt<5>("h10")) @[KthSmallestTracker.scala 61:16]
    node _T_60 = bits(count, 3, 0)
    node _heap_T_60_distance = io_in_bits_distance @[KthSmallestTracker.scala 62:{19,19}]
    node _GEN_2 = mux(eq(UInt<1>("h0"), _T_60), _heap_T_60_distance, heap_0_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_3 = mux(eq(UInt<1>("h1"), _T_60), _heap_T_60_distance, heap_1_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_4 = mux(eq(UInt<2>("h2"), _T_60), _heap_T_60_distance, heap_2_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_5 = mux(eq(UInt<2>("h3"), _T_60), _heap_T_60_distance, heap_3_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_6 = mux(eq(UInt<3>("h4"), _T_60), _heap_T_60_distance, heap_4_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_7 = mux(eq(UInt<3>("h5"), _T_60), _heap_T_60_distance, heap_5_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_8 = mux(eq(UInt<3>("h6"), _T_60), _heap_T_60_distance, heap_6_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_9 = mux(eq(UInt<3>("h7"), _T_60), _heap_T_60_distance, heap_7_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_10 = mux(eq(UInt<4>("h8"), _T_60), _heap_T_60_distance, heap_8_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_11 = mux(eq(UInt<4>("h9"), _T_60), _heap_T_60_distance, heap_9_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_12 = mux(eq(UInt<4>("ha"), _T_60), _heap_T_60_distance, heap_10_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_13 = mux(eq(UInt<4>("hb"), _T_60), _heap_T_60_distance, heap_11_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_14 = mux(eq(UInt<4>("hc"), _T_60), _heap_T_60_distance, heap_12_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_15 = mux(eq(UInt<4>("hd"), _T_60), _heap_T_60_distance, heap_13_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_16 = mux(eq(UInt<4>("he"), _T_60), _heap_T_60_distance, heap_14_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_17 = mux(eq(UInt<4>("hf"), _T_60), _heap_T_60_distance, heap_15_distance) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _heap_T_60_addr = io_in_bits_addr @[KthSmallestTracker.scala 62:{19,19}]
    node _GEN_18 = mux(eq(UInt<1>("h0"), _T_60), _heap_T_60_addr, heap_0_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_19 = mux(eq(UInt<1>("h1"), _T_60), _heap_T_60_addr, heap_1_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_20 = mux(eq(UInt<2>("h2"), _T_60), _heap_T_60_addr, heap_2_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_21 = mux(eq(UInt<2>("h3"), _T_60), _heap_T_60_addr, heap_3_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_22 = mux(eq(UInt<3>("h4"), _T_60), _heap_T_60_addr, heap_4_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_23 = mux(eq(UInt<3>("h5"), _T_60), _heap_T_60_addr, heap_5_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_24 = mux(eq(UInt<3>("h6"), _T_60), _heap_T_60_addr, heap_6_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_25 = mux(eq(UInt<3>("h7"), _T_60), _heap_T_60_addr, heap_7_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_26 = mux(eq(UInt<4>("h8"), _T_60), _heap_T_60_addr, heap_8_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_27 = mux(eq(UInt<4>("h9"), _T_60), _heap_T_60_addr, heap_9_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_28 = mux(eq(UInt<4>("ha"), _T_60), _heap_T_60_addr, heap_10_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_29 = mux(eq(UInt<4>("hb"), _T_60), _heap_T_60_addr, heap_11_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_30 = mux(eq(UInt<4>("hc"), _T_60), _heap_T_60_addr, heap_12_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_31 = mux(eq(UInt<4>("hd"), _T_60), _heap_T_60_addr, heap_13_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_32 = mux(eq(UInt<4>("he"), _T_60), _heap_T_60_addr, heap_14_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _GEN_33 = mux(eq(UInt<4>("hf"), _T_60), _heap_T_60_addr, heap_15_addr) @[KthSmallestTracker.scala 62:{19,19} 28:22]
    node _count_T = add(count, UInt<1>("h1")) @[KthSmallestTracker.scala 63:22]
    node _count_T_1 = tail(_count_T, 1) @[KthSmallestTracker.scala 63:22]
    node _T_61 = lt(io_in_bits_distance, kthEntry_distance) @[KthSmallestTracker.scala 64:37]
    node _heap_maxIdx_distance = io_in_bits_distance @[KthSmallestTracker.scala 65:{20,20}]
    node _GEN_34 = mux(eq(UInt<1>("h0"), maxIdx), _heap_maxIdx_distance, heap_0_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_35 = mux(eq(UInt<1>("h1"), maxIdx), _heap_maxIdx_distance, heap_1_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_36 = mux(eq(UInt<2>("h2"), maxIdx), _heap_maxIdx_distance, heap_2_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_37 = mux(eq(UInt<2>("h3"), maxIdx), _heap_maxIdx_distance, heap_3_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_38 = mux(eq(UInt<3>("h4"), maxIdx), _heap_maxIdx_distance, heap_4_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_39 = mux(eq(UInt<3>("h5"), maxIdx), _heap_maxIdx_distance, heap_5_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_40 = mux(eq(UInt<3>("h6"), maxIdx), _heap_maxIdx_distance, heap_6_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_41 = mux(eq(UInt<3>("h7"), maxIdx), _heap_maxIdx_distance, heap_7_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_42 = mux(eq(UInt<4>("h8"), maxIdx), _heap_maxIdx_distance, heap_8_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_43 = mux(eq(UInt<4>("h9"), maxIdx), _heap_maxIdx_distance, heap_9_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_44 = mux(eq(UInt<4>("ha"), maxIdx), _heap_maxIdx_distance, heap_10_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_45 = mux(eq(UInt<4>("hb"), maxIdx), _heap_maxIdx_distance, heap_11_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_46 = mux(eq(UInt<4>("hc"), maxIdx), _heap_maxIdx_distance, heap_12_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_47 = mux(eq(UInt<4>("hd"), maxIdx), _heap_maxIdx_distance, heap_13_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_48 = mux(eq(UInt<4>("he"), maxIdx), _heap_maxIdx_distance, heap_14_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_49 = mux(eq(UInt<4>("hf"), maxIdx), _heap_maxIdx_distance, heap_15_distance) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _heap_maxIdx_addr = io_in_bits_addr @[KthSmallestTracker.scala 65:{20,20}]
    node _GEN_50 = mux(eq(UInt<1>("h0"), maxIdx), _heap_maxIdx_addr, heap_0_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_51 = mux(eq(UInt<1>("h1"), maxIdx), _heap_maxIdx_addr, heap_1_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_52 = mux(eq(UInt<2>("h2"), maxIdx), _heap_maxIdx_addr, heap_2_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_53 = mux(eq(UInt<2>("h3"), maxIdx), _heap_maxIdx_addr, heap_3_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_54 = mux(eq(UInt<3>("h4"), maxIdx), _heap_maxIdx_addr, heap_4_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_55 = mux(eq(UInt<3>("h5"), maxIdx), _heap_maxIdx_addr, heap_5_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_56 = mux(eq(UInt<3>("h6"), maxIdx), _heap_maxIdx_addr, heap_6_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_57 = mux(eq(UInt<3>("h7"), maxIdx), _heap_maxIdx_addr, heap_7_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_58 = mux(eq(UInt<4>("h8"), maxIdx), _heap_maxIdx_addr, heap_8_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_59 = mux(eq(UInt<4>("h9"), maxIdx), _heap_maxIdx_addr, heap_9_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_60 = mux(eq(UInt<4>("ha"), maxIdx), _heap_maxIdx_addr, heap_10_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_61 = mux(eq(UInt<4>("hb"), maxIdx), _heap_maxIdx_addr, heap_11_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_62 = mux(eq(UInt<4>("hc"), maxIdx), _heap_maxIdx_addr, heap_12_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_63 = mux(eq(UInt<4>("hd"), maxIdx), _heap_maxIdx_addr, heap_13_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_64 = mux(eq(UInt<4>("he"), maxIdx), _heap_maxIdx_addr, heap_14_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_65 = mux(eq(UInt<4>("hf"), maxIdx), _heap_maxIdx_addr, heap_15_addr) @[KthSmallestTracker.scala 65:{20,20} 28:22]
    node _GEN_66 = mux(_T_61, _GEN_34, heap_0_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_67 = mux(_T_61, _GEN_35, heap_1_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_68 = mux(_T_61, _GEN_36, heap_2_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_69 = mux(_T_61, _GEN_37, heap_3_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_70 = mux(_T_61, _GEN_38, heap_4_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_71 = mux(_T_61, _GEN_39, heap_5_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_72 = mux(_T_61, _GEN_40, heap_6_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_73 = mux(_T_61, _GEN_41, heap_7_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_74 = mux(_T_61, _GEN_42, heap_8_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_75 = mux(_T_61, _GEN_43, heap_9_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_76 = mux(_T_61, _GEN_44, heap_10_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_77 = mux(_T_61, _GEN_45, heap_11_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_78 = mux(_T_61, _GEN_46, heap_12_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_79 = mux(_T_61, _GEN_47, heap_13_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_80 = mux(_T_61, _GEN_48, heap_14_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_81 = mux(_T_61, _GEN_49, heap_15_distance) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_82 = mux(_T_61, _GEN_50, heap_0_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_83 = mux(_T_61, _GEN_51, heap_1_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_84 = mux(_T_61, _GEN_52, heap_2_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_85 = mux(_T_61, _GEN_53, heap_3_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_86 = mux(_T_61, _GEN_54, heap_4_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_87 = mux(_T_61, _GEN_55, heap_5_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_88 = mux(_T_61, _GEN_56, heap_6_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_89 = mux(_T_61, _GEN_57, heap_7_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_90 = mux(_T_61, _GEN_58, heap_8_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_91 = mux(_T_61, _GEN_59, heap_9_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_92 = mux(_T_61, _GEN_60, heap_10_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_93 = mux(_T_61, _GEN_61, heap_11_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_94 = mux(_T_61, _GEN_62, heap_12_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_95 = mux(_T_61, _GEN_63, heap_13_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_96 = mux(_T_61, _GEN_64, heap_14_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_97 = mux(_T_61, _GEN_65, heap_15_addr) @[KthSmallestTracker.scala 28:22 64:58]
    node _GEN_98 = mux(_T_59, _GEN_2, _GEN_66) @[KthSmallestTracker.scala 61:23]
    node _GEN_99 = mux(_T_59, _GEN_3, _GEN_67) @[KthSmallestTracker.scala 61:23]
    node _GEN_100 = mux(_T_59, _GEN_4, _GEN_68) @[KthSmallestTracker.scala 61:23]
    node _GEN_101 = mux(_T_59, _GEN_5, _GEN_69) @[KthSmallestTracker.scala 61:23]
    node _GEN_102 = mux(_T_59, _GEN_6, _GEN_70) @[KthSmallestTracker.scala 61:23]
    node _GEN_103 = mux(_T_59, _GEN_7, _GEN_71) @[KthSmallestTracker.scala 61:23]
    node _GEN_104 = mux(_T_59, _GEN_8, _GEN_72) @[KthSmallestTracker.scala 61:23]
    node _GEN_105 = mux(_T_59, _GEN_9, _GEN_73) @[KthSmallestTracker.scala 61:23]
    node _GEN_106 = mux(_T_59, _GEN_10, _GEN_74) @[KthSmallestTracker.scala 61:23]
    node _GEN_107 = mux(_T_59, _GEN_11, _GEN_75) @[KthSmallestTracker.scala 61:23]
    node _GEN_108 = mux(_T_59, _GEN_12, _GEN_76) @[KthSmallestTracker.scala 61:23]
    node _GEN_109 = mux(_T_59, _GEN_13, _GEN_77) @[KthSmallestTracker.scala 61:23]
    node _GEN_110 = mux(_T_59, _GEN_14, _GEN_78) @[KthSmallestTracker.scala 61:23]
    node _GEN_111 = mux(_T_59, _GEN_15, _GEN_79) @[KthSmallestTracker.scala 61:23]
    node _GEN_112 = mux(_T_59, _GEN_16, _GEN_80) @[KthSmallestTracker.scala 61:23]
    node _GEN_113 = mux(_T_59, _GEN_17, _GEN_81) @[KthSmallestTracker.scala 61:23]
    node _GEN_114 = mux(_T_59, _GEN_18, _GEN_82) @[KthSmallestTracker.scala 61:23]
    node _GEN_115 = mux(_T_59, _GEN_19, _GEN_83) @[KthSmallestTracker.scala 61:23]
    node _GEN_116 = mux(_T_59, _GEN_20, _GEN_84) @[KthSmallestTracker.scala 61:23]
    node _GEN_117 = mux(_T_59, _GEN_21, _GEN_85) @[KthSmallestTracker.scala 61:23]
    node _GEN_118 = mux(_T_59, _GEN_22, _GEN_86) @[KthSmallestTracker.scala 61:23]
    node _GEN_119 = mux(_T_59, _GEN_23, _GEN_87) @[KthSmallestTracker.scala 61:23]
    node _GEN_120 = mux(_T_59, _GEN_24, _GEN_88) @[KthSmallestTracker.scala 61:23]
    node _GEN_121 = mux(_T_59, _GEN_25, _GEN_89) @[KthSmallestTracker.scala 61:23]
    node _GEN_122 = mux(_T_59, _GEN_26, _GEN_90) @[KthSmallestTracker.scala 61:23]
    node _GEN_123 = mux(_T_59, _GEN_27, _GEN_91) @[KthSmallestTracker.scala 61:23]
    node _GEN_124 = mux(_T_59, _GEN_28, _GEN_92) @[KthSmallestTracker.scala 61:23]
    node _GEN_125 = mux(_T_59, _GEN_29, _GEN_93) @[KthSmallestTracker.scala 61:23]
    node _GEN_126 = mux(_T_59, _GEN_30, _GEN_94) @[KthSmallestTracker.scala 61:23]
    node _GEN_127 = mux(_T_59, _GEN_31, _GEN_95) @[KthSmallestTracker.scala 61:23]
    node _GEN_128 = mux(_T_59, _GEN_32, _GEN_96) @[KthSmallestTracker.scala 61:23]
    node _GEN_129 = mux(_T_59, _GEN_33, _GEN_97) @[KthSmallestTracker.scala 61:23]
    node _GEN_130 = mux(_T_59, _count_T_1, count) @[KthSmallestTracker.scala 61:23 63:13 29:22]
    node _GEN_131 = mux(io_in_valid, _GEN_98, heap_0_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_132 = mux(io_in_valid, _GEN_99, heap_1_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_133 = mux(io_in_valid, _GEN_100, heap_2_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_134 = mux(io_in_valid, _GEN_101, heap_3_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_135 = mux(io_in_valid, _GEN_102, heap_4_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_136 = mux(io_in_valid, _GEN_103, heap_5_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_137 = mux(io_in_valid, _GEN_104, heap_6_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_138 = mux(io_in_valid, _GEN_105, heap_7_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_139 = mux(io_in_valid, _GEN_106, heap_8_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_140 = mux(io_in_valid, _GEN_107, heap_9_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_141 = mux(io_in_valid, _GEN_108, heap_10_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_142 = mux(io_in_valid, _GEN_109, heap_11_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_143 = mux(io_in_valid, _GEN_110, heap_12_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_144 = mux(io_in_valid, _GEN_111, heap_13_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_145 = mux(io_in_valid, _GEN_112, heap_14_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_146 = mux(io_in_valid, _GEN_113, heap_15_distance) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_147 = mux(io_in_valid, _GEN_114, heap_0_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_148 = mux(io_in_valid, _GEN_115, heap_1_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_149 = mux(io_in_valid, _GEN_116, heap_2_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_150 = mux(io_in_valid, _GEN_117, heap_3_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_151 = mux(io_in_valid, _GEN_118, heap_4_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_152 = mux(io_in_valid, _GEN_119, heap_5_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_153 = mux(io_in_valid, _GEN_120, heap_6_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_154 = mux(io_in_valid, _GEN_121, heap_7_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_155 = mux(io_in_valid, _GEN_122, heap_8_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_156 = mux(io_in_valid, _GEN_123, heap_9_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_157 = mux(io_in_valid, _GEN_124, heap_10_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_158 = mux(io_in_valid, _GEN_125, heap_11_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_159 = mux(io_in_valid, _GEN_126, heap_12_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_160 = mux(io_in_valid, _GEN_127, heap_13_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_161 = mux(io_in_valid, _GEN_128, heap_14_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_162 = mux(io_in_valid, _GEN_129, heap_15_addr) @[KthSmallestTracker.scala 60:21 28:22]
    node _GEN_163 = mux(io_in_valid, _GEN_130, count) @[KthSmallestTracker.scala 60:21 29:22]
    node _heap_WIRE_0_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_0_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_1_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_1_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_2_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_2_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_3_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_3_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_4_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_4_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_5_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_5_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_6_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_6_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_7_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_7_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_8_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_8_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_9_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_9_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_10_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_10_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_11_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_11_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_12_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_12_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_13_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_13_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_14_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_14_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_15_distance = defaultEntry_distance @[KthSmallestTracker.scala 28:{30,30}]
    node _heap_WIRE_15_addr = defaultEntry_addr @[KthSmallestTracker.scala 28:{30,30}]
    io_in_ready <= UInt<1>("h1") @[KthSmallestTracker.scala 75:15]
    io_kthOut_valid <= io_finish @[KthSmallestTracker.scala 71:19]
    io_kthOut_bits <= kthEntry_distance @[KthSmallestTracker.scala 70:19]
    io_addrOut_0 <= heap_0_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_1 <= heap_1_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_2 <= heap_2_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_3 <= heap_3_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_4 <= heap_4_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_5 <= heap_5_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_6 <= heap_6_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_7 <= heap_7_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_8 <= heap_8_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_9 <= heap_9_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_10 <= heap_10_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_11 <= heap_11_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_12 <= heap_12_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_13 <= heap_13_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_14 <= heap_14_addr @[KthSmallestTracker.scala 79:19]
    io_addrOut_15 <= heap_15_addr @[KthSmallestTracker.scala 79:19]
    io_addrValid <= io_finish @[KthSmallestTracker.scala 72:19]
    heap_0_distance <= mux(reset, _heap_WIRE_0_distance, _GEN_131) @[KthSmallestTracker.scala 28:{22,22}]
    heap_0_addr <= mux(reset, _heap_WIRE_0_addr, _GEN_147) @[KthSmallestTracker.scala 28:{22,22}]
    heap_1_distance <= mux(reset, _heap_WIRE_1_distance, _GEN_132) @[KthSmallestTracker.scala 28:{22,22}]
    heap_1_addr <= mux(reset, _heap_WIRE_1_addr, _GEN_148) @[KthSmallestTracker.scala 28:{22,22}]
    heap_2_distance <= mux(reset, _heap_WIRE_2_distance, _GEN_133) @[KthSmallestTracker.scala 28:{22,22}]
    heap_2_addr <= mux(reset, _heap_WIRE_2_addr, _GEN_149) @[KthSmallestTracker.scala 28:{22,22}]
    heap_3_distance <= mux(reset, _heap_WIRE_3_distance, _GEN_134) @[KthSmallestTracker.scala 28:{22,22}]
    heap_3_addr <= mux(reset, _heap_WIRE_3_addr, _GEN_150) @[KthSmallestTracker.scala 28:{22,22}]
    heap_4_distance <= mux(reset, _heap_WIRE_4_distance, _GEN_135) @[KthSmallestTracker.scala 28:{22,22}]
    heap_4_addr <= mux(reset, _heap_WIRE_4_addr, _GEN_151) @[KthSmallestTracker.scala 28:{22,22}]
    heap_5_distance <= mux(reset, _heap_WIRE_5_distance, _GEN_136) @[KthSmallestTracker.scala 28:{22,22}]
    heap_5_addr <= mux(reset, _heap_WIRE_5_addr, _GEN_152) @[KthSmallestTracker.scala 28:{22,22}]
    heap_6_distance <= mux(reset, _heap_WIRE_6_distance, _GEN_137) @[KthSmallestTracker.scala 28:{22,22}]
    heap_6_addr <= mux(reset, _heap_WIRE_6_addr, _GEN_153) @[KthSmallestTracker.scala 28:{22,22}]
    heap_7_distance <= mux(reset, _heap_WIRE_7_distance, _GEN_138) @[KthSmallestTracker.scala 28:{22,22}]
    heap_7_addr <= mux(reset, _heap_WIRE_7_addr, _GEN_154) @[KthSmallestTracker.scala 28:{22,22}]
    heap_8_distance <= mux(reset, _heap_WIRE_8_distance, _GEN_139) @[KthSmallestTracker.scala 28:{22,22}]
    heap_8_addr <= mux(reset, _heap_WIRE_8_addr, _GEN_155) @[KthSmallestTracker.scala 28:{22,22}]
    heap_9_distance <= mux(reset, _heap_WIRE_9_distance, _GEN_140) @[KthSmallestTracker.scala 28:{22,22}]
    heap_9_addr <= mux(reset, _heap_WIRE_9_addr, _GEN_156) @[KthSmallestTracker.scala 28:{22,22}]
    heap_10_distance <= mux(reset, _heap_WIRE_10_distance, _GEN_141) @[KthSmallestTracker.scala 28:{22,22}]
    heap_10_addr <= mux(reset, _heap_WIRE_10_addr, _GEN_157) @[KthSmallestTracker.scala 28:{22,22}]
    heap_11_distance <= mux(reset, _heap_WIRE_11_distance, _GEN_142) @[KthSmallestTracker.scala 28:{22,22}]
    heap_11_addr <= mux(reset, _heap_WIRE_11_addr, _GEN_158) @[KthSmallestTracker.scala 28:{22,22}]
    heap_12_distance <= mux(reset, _heap_WIRE_12_distance, _GEN_143) @[KthSmallestTracker.scala 28:{22,22}]
    heap_12_addr <= mux(reset, _heap_WIRE_12_addr, _GEN_159) @[KthSmallestTracker.scala 28:{22,22}]
    heap_13_distance <= mux(reset, _heap_WIRE_13_distance, _GEN_144) @[KthSmallestTracker.scala 28:{22,22}]
    heap_13_addr <= mux(reset, _heap_WIRE_13_addr, _GEN_160) @[KthSmallestTracker.scala 28:{22,22}]
    heap_14_distance <= mux(reset, _heap_WIRE_14_distance, _GEN_145) @[KthSmallestTracker.scala 28:{22,22}]
    heap_14_addr <= mux(reset, _heap_WIRE_14_addr, _GEN_161) @[KthSmallestTracker.scala 28:{22,22}]
    heap_15_distance <= mux(reset, _heap_WIRE_15_distance, _GEN_146) @[KthSmallestTracker.scala 28:{22,22}]
    heap_15_addr <= mux(reset, _heap_WIRE_15_addr, _GEN_162) @[KthSmallestTracker.scala 28:{22,22}]
    count <= mux(reset, UInt<5>("h0"), _GEN_163) @[KthSmallestTracker.scala 29:{22,22}]

  module Queue :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits : SInt<16>
    input io_deq_ready : UInt<1>
    output io_deq_valid : UInt<1>
    output io_deq_bits : SInt<16>
    output io_count : UInt<3>

    mem ram : @[Decoupled.scala 273:95]
      data-type => SInt<16>
      depth => 4
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    reg enq_ptr_value : UInt<2>, clock with :
      reset => (UInt<1>("h0"), enq_ptr_value) @[Counter.scala 61:40]
    reg deq_ptr_value : UInt<2>, clock with :
      reset => (UInt<1>("h0"), deq_ptr_value) @[Counter.scala 61:40]
    reg maybe_full : UInt<1>, clock with :
      reset => (UInt<1>("h0"), maybe_full) @[Decoupled.scala 276:27]
    node ptr_match = eq(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 277:33]
    node _empty_T = eq(maybe_full, UInt<1>("h0")) @[Decoupled.scala 278:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 278:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 279:24]
    node _do_enq_T = and(io_enq_ready, io_enq_valid) @[Decoupled.scala 51:35]
    node _do_deq_T = and(io_deq_ready, io_deq_valid) @[Decoupled.scala 51:35]
    node wrap = eq(enq_ptr_value, UInt<2>("h3")) @[Counter.scala 73:24]
    node _value_T = add(enq_ptr_value, UInt<1>("h1")) @[Counter.scala 77:24]
    node _value_T_1 = tail(_value_T, 1) @[Counter.scala 77:24]
    node do_enq = _do_enq_T @[Decoupled.scala 280:{27,27}]
    node _GEN_0 = validif(do_enq, enq_ptr_value) @[Decoupled.scala 286:16 287:8]
    node _GEN_1 = validif(do_enq, clock) @[Decoupled.scala 286:16 287:8]
    node _GEN_2 = mux(do_enq, UInt<1>("h1"), UInt<1>("h0")) @[Decoupled.scala 286:16 287:8 273:95]
    node _GEN_3 = validif(do_enq, UInt<1>("h1")) @[Decoupled.scala 286:16 287:24]
    node _GEN_4 = validif(do_enq, io_enq_bits) @[Decoupled.scala 286:16 287:24]
    node _GEN_5 = mux(do_enq, _value_T_1, enq_ptr_value) @[Decoupled.scala 286:16 Counter.scala 77:15 61:40]
    node wrap_1 = eq(deq_ptr_value, UInt<2>("h3")) @[Counter.scala 73:24]
    node _value_T_2 = add(deq_ptr_value, UInt<1>("h1")) @[Counter.scala 77:24]
    node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 77:24]
    node do_deq = _do_deq_T @[Decoupled.scala 281:{27,27}]
    node _GEN_6 = mux(do_deq, _value_T_3, deq_ptr_value) @[Decoupled.scala 290:16 Counter.scala 77:15 61:40]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 293:15]
    node _GEN_7 = mux(_T, do_enq, maybe_full) @[Decoupled.scala 293:27 294:16 276:27]
    node _GEN_8 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_5) @[Decoupled.scala 296:15 Counter.scala 98:11]
    node _GEN_9 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_6) @[Decoupled.scala 296:15 Counter.scala 98:11]
    node _GEN_10 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_7) @[Decoupled.scala 296:15 299:16]
    node _io_deq_valid_T = eq(empty, UInt<1>("h0")) @[Decoupled.scala 302:19]
    node _io_enq_ready_T = eq(full, UInt<1>("h0")) @[Decoupled.scala 303:19]
    node _ptr_diff_T = sub(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 326:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 326:32]
    node _io_count_T = and(maybe_full, ptr_match) @[Decoupled.scala 329:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<3>("h4"), UInt<1>("h0")) @[Decoupled.scala 329:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[Decoupled.scala 329:62]
    io_enq_ready <= _io_enq_ready_T @[Decoupled.scala 303:16]
    io_deq_valid <= _io_deq_valid_T @[Decoupled.scala 302:16]
    io_deq_bits <= ram.io_deq_bits_MPORT.data @[Decoupled.scala 310:17]
    io_count <= _io_count_T_2 @[Decoupled.scala 329:14]
    ram.io_deq_bits_MPORT.addr <= deq_ptr_value @[Decoupled.scala 310:23]
    ram.io_deq_bits_MPORT.en <= UInt<1>("h1") @[Decoupled.scala 310:23]
    ram.io_deq_bits_MPORT.clk <= clock @[Decoupled.scala 310:23]
    ram.MPORT.addr <= _GEN_0
    ram.MPORT.en <= _GEN_2
    ram.MPORT.clk <= _GEN_1
    ram.MPORT.data <= _GEN_4
    ram.MPORT.mask <= _GEN_3
    enq_ptr_value <= mux(reset, UInt<2>("h0"), _GEN_8) @[Counter.scala 61:{40,40}]
    deq_ptr_value <= mux(reset, UInt<2>("h0"), _GEN_9) @[Counter.scala 61:{40,40}]
    maybe_full <= mux(reset, UInt<1>("h0"), _GEN_10) @[Decoupled.scala 276:{27,27}]

  module Queue_1 :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits : UInt<16>
    input io_deq_ready : UInt<1>
    output io_deq_valid : UInt<1>
    output io_deq_bits : UInt<16>
    output io_count : UInt<3>

    mem ram : @[Decoupled.scala 273:95]
      data-type => UInt<16>
      depth => 4
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    reg enq_ptr_value : UInt<2>, clock with :
      reset => (UInt<1>("h0"), enq_ptr_value) @[Counter.scala 61:40]
    reg deq_ptr_value : UInt<2>, clock with :
      reset => (UInt<1>("h0"), deq_ptr_value) @[Counter.scala 61:40]
    reg maybe_full : UInt<1>, clock with :
      reset => (UInt<1>("h0"), maybe_full) @[Decoupled.scala 276:27]
    node ptr_match = eq(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 277:33]
    node _empty_T = eq(maybe_full, UInt<1>("h0")) @[Decoupled.scala 278:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 278:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 279:24]
    node _do_enq_T = and(io_enq_ready, io_enq_valid) @[Decoupled.scala 51:35]
    node _do_deq_T = and(io_deq_ready, io_deq_valid) @[Decoupled.scala 51:35]
    node wrap = eq(enq_ptr_value, UInt<2>("h3")) @[Counter.scala 73:24]
    node _value_T = add(enq_ptr_value, UInt<1>("h1")) @[Counter.scala 77:24]
    node _value_T_1 = tail(_value_T, 1) @[Counter.scala 77:24]
    node do_enq = _do_enq_T @[Decoupled.scala 280:{27,27}]
    node _GEN_0 = validif(do_enq, enq_ptr_value) @[Decoupled.scala 286:16 287:8]
    node _GEN_1 = validif(do_enq, clock) @[Decoupled.scala 286:16 287:8]
    node _GEN_2 = mux(do_enq, UInt<1>("h1"), UInt<1>("h0")) @[Decoupled.scala 286:16 287:8 273:95]
    node _GEN_3 = validif(do_enq, UInt<1>("h1")) @[Decoupled.scala 286:16 287:24]
    node _GEN_4 = validif(do_enq, io_enq_bits) @[Decoupled.scala 286:16 287:24]
    node _GEN_5 = mux(do_enq, _value_T_1, enq_ptr_value) @[Decoupled.scala 286:16 Counter.scala 77:15 61:40]
    node wrap_1 = eq(deq_ptr_value, UInt<2>("h3")) @[Counter.scala 73:24]
    node _value_T_2 = add(deq_ptr_value, UInt<1>("h1")) @[Counter.scala 77:24]
    node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 77:24]
    node do_deq = _do_deq_T @[Decoupled.scala 281:{27,27}]
    node _GEN_6 = mux(do_deq, _value_T_3, deq_ptr_value) @[Decoupled.scala 290:16 Counter.scala 77:15 61:40]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 293:15]
    node _GEN_7 = mux(_T, do_enq, maybe_full) @[Decoupled.scala 293:27 294:16 276:27]
    node _GEN_8 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_5) @[Decoupled.scala 296:15 Counter.scala 98:11]
    node _GEN_9 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_6) @[Decoupled.scala 296:15 Counter.scala 98:11]
    node _GEN_10 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_7) @[Decoupled.scala 296:15 299:16]
    node _io_deq_valid_T = eq(empty, UInt<1>("h0")) @[Decoupled.scala 302:19]
    node _io_enq_ready_T = eq(full, UInt<1>("h0")) @[Decoupled.scala 303:19]
    node _ptr_diff_T = sub(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 326:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 326:32]
    node _io_count_T = and(maybe_full, ptr_match) @[Decoupled.scala 329:32]
    node _io_count_T_1 = mux(_io_count_T, UInt<3>("h4"), UInt<1>("h0")) @[Decoupled.scala 329:20]
    node _io_count_T_2 = or(_io_count_T_1, ptr_diff) @[Decoupled.scala 329:62]
    io_enq_ready <= _io_enq_ready_T @[Decoupled.scala 303:16]
    io_deq_valid <= _io_deq_valid_T @[Decoupled.scala 302:16]
    io_deq_bits <= ram.io_deq_bits_MPORT.data @[Decoupled.scala 310:17]
    io_count <= _io_count_T_2 @[Decoupled.scala 329:14]
    ram.io_deq_bits_MPORT.addr <= deq_ptr_value @[Decoupled.scala 310:23]
    ram.io_deq_bits_MPORT.en <= UInt<1>("h1") @[Decoupled.scala 310:23]
    ram.io_deq_bits_MPORT.clk <= clock @[Decoupled.scala 310:23]
    ram.MPORT.addr <= _GEN_0
    ram.MPORT.en <= _GEN_2
    ram.MPORT.clk <= _GEN_1
    ram.MPORT.data <= _GEN_4
    ram.MPORT.mask <= _GEN_3
    enq_ptr_value <= mux(reset, UInt<2>("h0"), _GEN_8) @[Counter.scala 61:{40,40}]
    deq_ptr_value <= mux(reset, UInt<2>("h0"), _GEN_9) @[Counter.scala 61:{40,40}]
    maybe_full <= mux(reset, UInt<1>("h0"), _GEN_10) @[Decoupled.scala 276:{27,27}]

  module PE_Module :
    input clock : Clock
    input reset : UInt<1>
    output io_query_ready : UInt<1>
    input io_query_valid : UInt<1>
    input io_query_bits_0 : SInt<16>
    output io_refs_ready : UInt<1>
    input io_refs_valid : UInt<1>
    input io_refs_bits_0 : SInt<16>
    output io_dist_k_ready : UInt<1>
    input io_dist_k_valid : UInt<1>
    input io_dist_k_bits : SInt<16>
    input io_address_i : UInt<16>
    output io_address_north_ready : UInt<1>
    input io_address_north_valid : UInt<1>
    input io_address_north_bits : UInt<16>
    input io_address_south_ready : UInt<1>
    output io_address_south_valid : UInt<1>
    output io_address_south_bits : UInt<16>
    output io_dist_north_ready : UInt<1>
    input io_dist_north_valid : UInt<1>
    input io_dist_north_bits : SInt<16>
    input io_dist_south_ready : UInt<1>
    output io_dist_south_valid : UInt<1>
    output io_dist_south_bits : SInt<16>
    output io_skip_to_next : UInt<1>
    output io_partial_dist : SInt<16>

    inst fifo_dist of Queue @[PE.scala 23:27]
    inst fifo_addr of Queue_1 @[PE.scala 24:27]
    reg state : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state) @[PE.scala 33:24]
    reg dist_in_topk : SInt<16>, clock with :
      reset => (UInt<1>("h0"), dist_in_topk) @[PE.scala 34:31]
    reg dist_north_reg : SInt<16>, clock with :
      reset => (UInt<1>("h0"), dist_north_reg) @[PE.scala 35:33]
    reg addr_north_reg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), addr_north_reg) @[PE.scala 36:33]
    reg reg_ready_to_enq_north : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_ready_to_enq_north) @[PE.scala 37:41]
    reg addr_PE_reg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), addr_PE_reg) @[PE.scala 38:30]
    reg reg_ready_to_enq_PE : UInt<1>, clock with :
      reset => (UInt<1>("h0"), reg_ready_to_enq_PE) @[PE.scala 39:38]
    reg counter : UInt<8>, clock with :
      reset => (UInt<1>("h0"), counter) @[PE.scala 40:26]
    reg acc_dist : SInt<16>, clock with :
      reset => (UInt<1>("h0"), acc_dist) @[PE.scala 42:27]
    node _substract_T = sub(io_query_bits_0, io_refs_bits_0) @[PE.scala 44:84]
    node _substract_T_1 = tail(_substract_T, 1) @[PE.scala 44:84]
    node _substract_T_2 = asSInt(_substract_T_1) @[PE.scala 44:84]
    node substract_0 = _substract_T_2 @[PE.scala 44:{28,28}]
    node _square_T = mul(substract_0, substract_0) @[PE.scala 45:57]
    node _square_T_1 = shr(_square_T, 8) @[PE.scala 45:62]
    node _square_T_2 = bits(_square_T_1, 15, 0) @[PE.scala 45:67]
    node _square_T_3 = asSInt(_square_T_2) @[PE.scala 45:75]
    reg square_REG : SInt<16>, clock with :
      reset => (UInt<1>("h0"), square_REG) @[PE.scala 45:52]
    node square_0 = square_REG @[PE.scala 45:{25,25}]
    node _tmp_T = add(acc_dist, square_0) @[PE.scala 50:16]
    node _tmp_T_1 = tail(_tmp_T, 1) @[PE.scala 50:16]
    node tmp = asSInt(_tmp_T_1) @[PE.scala 50:16]
    reg compute_valid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), compute_valid) @[PE.scala 52:32]
    node _T = eq(UInt<1>("h0"), state) @[PE.scala 56:19]
    node _T_1 = and(io_query_valid, io_refs_valid) @[PE.scala 58:29]
    node _GEN_0 = mux(_T_1, UInt<1>("h0"), UInt<1>("h0")) @[PE.scala 58:46 59:19 64:19]
    node _GEN_1 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[PE.scala 58:46 60:17 65:17]
    node _GEN_2 = mux(_T_1, io_address_i, addr_PE_reg) @[PE.scala 58:46 61:23 66:23]
    node _T_2 = eq(UInt<1>("h1"), state) @[PE.scala 56:19]
    node _T_3 = sub(UInt<6>("h20"), UInt<1>("h1")) @[PE.scala 72:56]
    node _T_4 = tail(_T_3, 1) @[PE.scala 72:56]
    node _T_5 = eq(counter, _T_4) @[PE.scala 72:40]
    node _T_6 = and(compute_valid, _T_5) @[PE.scala 72:29]
    node _T_7 = sub(UInt<6>("h20"), UInt<1>("h1")) @[PE.scala 83:58]
    node _T_8 = tail(_T_7, 1) @[PE.scala 83:58]
    node _T_9 = lt(counter, _T_8) @[PE.scala 83:44]
    node _T_10 = and(compute_valid, _T_9) @[PE.scala 83:33]
    node _counter_T = add(counter, UInt<1>("h1")) @[PE.scala 85:30]
    node _counter_T_1 = tail(_counter_T, 1) @[PE.scala 85:30]
    node _T_11 = gt(tmp, dist_in_topk) @[PE.scala 89:23]
    node _GEN_3 = mux(_T_11, UInt<1>("h0"), state) @[PE.scala 89:38 90:17 33:24]
    node _GEN_4 = mux(_T_11, asSInt(UInt<1>("h0")), acc_dist) @[PE.scala 89:38 91:20 42:27]
    node _GEN_5 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[PE.scala 54:21 89:38 92:27]
    node _GEN_6 = mux(_T_11, UInt<1>("h0"), counter) @[PE.scala 89:38 93:19 40:26]
    node _GEN_7 = mux(_T_10, _counter_T_1, _GEN_6) @[PE.scala 83:64 85:19]
    node _GEN_8 = mux(_T_10, tmp, _GEN_4) @[PE.scala 83:64 86:20]
    node _GEN_9 = mux(_T_10, UInt<1>("h0"), _GEN_5) @[PE.scala 83:64 87:27]
    node _GEN_10 = mux(_T_10, state, _GEN_3) @[PE.scala 33:24 83:64]
    node _GEN_11 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[PE.scala 25:28 72:62 74:34]
    node _GEN_12 = validif(_T_6, tmp) @[PE.scala 72:62 76:33]
    node _GEN_13 = validif(_T_6, addr_PE_reg) @[PE.scala 72:62 77:33]
    node _GEN_14 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_8) @[PE.scala 72:62 78:20]
    node _GEN_15 = mux(_T_6, UInt<1>("h1"), _GEN_9) @[PE.scala 72:62 79:27]
    node _GEN_16 = mux(_T_6, UInt<1>("h0"), _GEN_10) @[PE.scala 72:62 80:17]
    node _GEN_17 = mux(_T_6, UInt<1>("h0"), _GEN_7) @[PE.scala 72:62 81:19]
    node _GEN_18 = mux(_T_2, addr_PE_reg, addr_PE_reg) @[PE.scala 56:19 71:21 38:30]
    node _GEN_19 = mux(_T_2, _GEN_11, UInt<1>("h0")) @[PE.scala 56:19 25:28]
    node _GEN_20 = validif(_T_2, _GEN_12) @[PE.scala 56:19]
    node _GEN_21 = validif(_T_2, _GEN_13) @[PE.scala 56:19]
    node _GEN_22 = mux(_T_2, _GEN_14, acc_dist) @[PE.scala 56:19 42:27]
    node _GEN_23 = mux(_T_2, _GEN_15, UInt<1>("h0")) @[PE.scala 56:19 54:21]
    node _GEN_24 = mux(_T_2, _GEN_16, state) @[PE.scala 56:19 33:24]
    node _GEN_25 = mux(_T_2, _GEN_17, counter) @[PE.scala 56:19 40:26]
    node _GEN_26 = mux(_T, _GEN_0, _GEN_25) @[PE.scala 56:19]
    node _GEN_27 = mux(_T, _GEN_1, _GEN_24) @[PE.scala 56:19]
    node _GEN_28 = mux(_T, _GEN_2, _GEN_18) @[PE.scala 56:19]
    node _GEN_29 = mux(_T, UInt<1>("h0"), _GEN_19) @[PE.scala 56:19 25:28]
    node _GEN_30 = validif(eq(_T, UInt<1>("h0")), _GEN_20) @[PE.scala 56:19]
    node _GEN_31 = validif(eq(_T, UInt<1>("h0")), _GEN_21) @[PE.scala 56:19]
    node _GEN_32 = mux(_T, acc_dist, _GEN_22) @[PE.scala 56:19 42:27]
    node _GEN_33 = mux(_T, UInt<1>("h0"), _GEN_23) @[PE.scala 56:19 54:21]
    node _GEN_34 = mux(io_dist_k_valid, io_dist_k_bits, dist_in_topk) @[PE.scala 100:26 101:20 34:31]
    node _T_12 = eq(state, UInt<1>("h1")) @[PE.scala 103:44]
    node _T_13 = gt(tmp, dist_in_topk) @[PE.scala 103:64]
    node _T_14 = sub(UInt<6>("h20"), UInt<1>("h1")) @[PE.scala 103:106]
    node _T_15 = tail(_T_14, 1) @[PE.scala 103:106]
    node _T_16 = eq(counter, _T_15) @[PE.scala 103:90]
    node _T_17 = or(_T_13, _T_16) @[PE.scala 103:79]
    node _T_18 = and(_T_12, _T_17) @[PE.scala 103:56]
    node _T_19 = eq(_T_18, UInt<1>("h0")) @[PE.scala 103:36]
    node _T_20 = and(reg_ready_to_enq_north, _T_19) @[PE.scala 103:33]
    node _GEN_35 = mux(_T_20, UInt<1>("h1"), _GEN_29) @[PE.scala 103:114 104:30]
    node _GEN_36 = mux(_T_20, dist_north_reg, _GEN_30) @[PE.scala 103:114 106:29]
    node _GEN_37 = mux(_T_20, addr_north_reg, _GEN_31) @[PE.scala 103:114 107:29]
    node _T_21 = and(io_address_north_valid, io_dist_north_valid) @[PE.scala 112:33]
    node _GEN_38 = mux(_T_21, io_address_north_bits, addr_north_reg) @[PE.scala 112:56 113:22 119:22]
    node _GEN_39 = mux(_T_21, io_dist_north_bits, dist_north_reg) @[PE.scala 112:56 114:22 118:22]
    node _GEN_40 = mux(_T_21, UInt<1>("h1"), reg_ready_to_enq_north) @[PE.scala 112:56 115:30 37:41]
    io_query_ready <= UInt<1>("h1") @[PE.scala 129:20]
    io_refs_ready <= UInt<1>("h1") @[PE.scala 128:19]
    io_dist_k_ready <= UInt<1>("h1") @[PE.scala 130:21]
    io_address_north_ready <= UInt<1>("h1") @[PE.scala 126:28]
    io_address_south_valid <= fifo_addr.io_deq_valid @[PE.scala 123:22]
    io_address_south_bits <= fifo_addr.io_deq_bits @[PE.scala 123:22]
    io_dist_north_ready <= UInt<1>("h1") @[PE.scala 127:25]
    io_dist_south_valid <= fifo_dist.io_deq_valid @[PE.scala 124:19]
    io_dist_south_bits <= fifo_dist.io_deq_bits @[PE.scala 124:19]
    io_skip_to_next <= _GEN_33
    io_partial_dist <= tmp @[PE.scala 55:21]
    fifo_dist.clock <= clock
    fifo_dist.reset <= reset
    fifo_dist.io_enq_valid <= _GEN_35
    fifo_dist.io_enq_bits <= _GEN_36
    fifo_dist.io_deq_ready <= io_dist_south_ready @[PE.scala 124:19]
    fifo_addr.clock <= clock
    fifo_addr.reset <= reset
    fifo_addr.io_enq_valid <= _GEN_35
    fifo_addr.io_enq_bits <= _GEN_37
    fifo_addr.io_deq_ready <= io_address_south_ready @[PE.scala 123:22]
    state <= mux(reset, UInt<1>("h0"), _GEN_27) @[PE.scala 33:{24,24}]
    dist_in_topk <= mux(reset, asSInt(UInt<16>("h7fff")), _GEN_34) @[PE.scala 34:{31,31}]
    dist_north_reg <= mux(reset, asSInt(UInt<16>("h0")), _GEN_39) @[PE.scala 35:{33,33}]
    addr_north_reg <= mux(reset, UInt<16>("h0"), _GEN_38) @[PE.scala 36:{33,33}]
    reg_ready_to_enq_north <= mux(reset, UInt<1>("h0"), _GEN_40) @[PE.scala 37:{41,41}]
    addr_PE_reg <= mux(reset, UInt<16>("h0"), _GEN_28) @[PE.scala 38:{30,30}]
    reg_ready_to_enq_PE <= mux(reset, UInt<1>("h0"), reg_ready_to_enq_PE) @[PE.scala 39:{38,38,38}]
    counter <= mux(reset, UInt<8>("h0"), _GEN_26) @[PE.scala 40:{26,26}]
    acc_dist <= mux(reset, asSInt(UInt<16>("h0")), _GEN_32) @[PE.scala 42:{27,27}]
    square_REG <= _square_T_3 @[PE.scala 45:52]
    compute_valid <= io_refs_valid @[PE.scala 52:32]

  module topUnit :
    input clock : Clock
    input reset : UInt<1>
    output io_broadcast_query_ready : UInt<1>
    input io_broadcast_query_valid : UInt<1>
    input io_broadcast_query_bits_0 : SInt<16>
    output io_refs_0_ready : UInt<1>
    input io_refs_0_valid : UInt<1>
    input io_refs_0_bits_0 : SInt<16>
    output io_refs_1_ready : UInt<1>
    input io_refs_1_valid : UInt<1>
    input io_refs_1_bits_0 : SInt<16>
    output io_refs_2_ready : UInt<1>
    input io_refs_2_valid : UInt<1>
    input io_refs_2_bits_0 : SInt<16>
    output io_refs_3_ready : UInt<1>
    input io_refs_3_valid : UInt<1>
    input io_refs_3_bits_0 : SInt<16>
    input io_addrs_0 : UInt<16>
    input io_addrs_1 : UInt<16>
    input io_addrs_2 : UInt<16>
    input io_addrs_3 : UInt<16>
    input io_finish : UInt<1>
    output io_terminates_0 : UInt<1>
    output io_terminates_1 : UInt<1>
    output io_terminates_2 : UInt<1>
    output io_terminates_3 : UInt<1>
    output io_addrOut_0 : UInt<16>
    output io_addrOut_1 : UInt<16>
    output io_addrOut_2 : UInt<16>
    output io_addrOut_3 : UInt<16>
    output io_addrOut_4 : UInt<16>
    output io_addrOut_5 : UInt<16>
    output io_addrOut_6 : UInt<16>
    output io_addrOut_7 : UInt<16>
    output io_addrOut_8 : UInt<16>
    output io_addrOut_9 : UInt<16>
    output io_addrOut_10 : UInt<16>
    output io_addrOut_11 : UInt<16>
    output io_addrOut_12 : UInt<16>
    output io_addrOut_13 : UInt<16>
    output io_addrOut_14 : UInt<16>
    output io_addrOut_15 : UInt<16>
    output io_addrValid : UInt<1>

    inst topk_unit of KthSmallestTracker @[topUnit.scala 15:27]
    inst group_0 of PE_Module @[topUnit.scala 19:35]
    inst group_1 of PE_Module @[topUnit.scala 19:35]
    inst group_2 of PE_Module @[topUnit.scala 19:35]
    inst group_3 of PE_Module @[topUnit.scala 19:35]
    node _topk_unit_io_in_valid_T = and(group_3.io_address_south_valid, group_3.io_dist_south_valid) @[topUnit.scala 37:70]
    io_broadcast_query_ready <= group_3.io_query_ready @[topUnit.scala 25:27]
    io_refs_0_ready <= group_0.io_refs_ready @[topUnit.scala 28:26]
    io_refs_1_ready <= group_1.io_refs_ready @[topUnit.scala 28:26]
    io_refs_2_ready <= group_2.io_refs_ready @[topUnit.scala 28:26]
    io_refs_3_ready <= group_3.io_refs_ready @[topUnit.scala 28:26]
    io_terminates_0 <= group_0.io_skip_to_next @[topUnit.scala 29:26]
    io_terminates_1 <= group_1.io_skip_to_next @[topUnit.scala 29:26]
    io_terminates_2 <= group_2.io_skip_to_next @[topUnit.scala 29:26]
    io_terminates_3 <= group_3.io_skip_to_next @[topUnit.scala 29:26]
    io_addrOut_0 <= topk_unit.io_addrOut_0 @[topUnit.scala 17:16]
    io_addrOut_1 <= topk_unit.io_addrOut_1 @[topUnit.scala 17:16]
    io_addrOut_2 <= topk_unit.io_addrOut_2 @[topUnit.scala 17:16]
    io_addrOut_3 <= topk_unit.io_addrOut_3 @[topUnit.scala 17:16]
    io_addrOut_4 <= topk_unit.io_addrOut_4 @[topUnit.scala 17:16]
    io_addrOut_5 <= topk_unit.io_addrOut_5 @[topUnit.scala 17:16]
    io_addrOut_6 <= topk_unit.io_addrOut_6 @[topUnit.scala 17:16]
    io_addrOut_7 <= topk_unit.io_addrOut_7 @[topUnit.scala 17:16]
    io_addrOut_8 <= topk_unit.io_addrOut_8 @[topUnit.scala 17:16]
    io_addrOut_9 <= topk_unit.io_addrOut_9 @[topUnit.scala 17:16]
    io_addrOut_10 <= topk_unit.io_addrOut_10 @[topUnit.scala 17:16]
    io_addrOut_11 <= topk_unit.io_addrOut_11 @[topUnit.scala 17:16]
    io_addrOut_12 <= topk_unit.io_addrOut_12 @[topUnit.scala 17:16]
    io_addrOut_13 <= topk_unit.io_addrOut_13 @[topUnit.scala 17:16]
    io_addrOut_14 <= topk_unit.io_addrOut_14 @[topUnit.scala 17:16]
    io_addrOut_15 <= topk_unit.io_addrOut_15 @[topUnit.scala 17:16]
    io_addrValid <= topk_unit.io_addrValid @[topUnit.scala 18:18]
    topk_unit.clock <= clock
    topk_unit.reset <= reset
    topk_unit.io_in_valid <= _topk_unit_io_in_valid_T @[topUnit.scala 37:35]
    topk_unit.io_in_bits_distance <= group_3.io_dist_south_bits @[topUnit.scala 36:44]
    topk_unit.io_in_bits_addr <= group_3.io_address_south_bits @[topUnit.scala 35:39]
    topk_unit.io_finish <= io_finish @[topUnit.scala 16:25]
    topk_unit.io_kthOut_ready <= group_3.io_dist_k_ready @[topUnit.scala 27:28]
    group_0.clock <= clock
    group_0.reset <= reset
    group_0.io_query_valid <= io_broadcast_query_valid @[topUnit.scala 25:27]
    group_0.io_query_bits_0 <= io_broadcast_query_bits_0 @[topUnit.scala 25:27]
    group_0.io_refs_valid <= io_refs_0_valid @[topUnit.scala 28:26]
    group_0.io_refs_bits_0 <= io_refs_0_bits_0 @[topUnit.scala 28:26]
    group_0.io_dist_k_valid <= topk_unit.io_kthOut_valid @[topUnit.scala 27:28]
    group_0.io_dist_k_bits <= topk_unit.io_kthOut_bits @[topUnit.scala 27:28]
    group_0.io_address_i <= io_addrs_0 @[topUnit.scala 26:31]
    group_0.io_address_north_valid is invalid
    group_0.io_address_north_bits is invalid
    group_0.io_address_south_ready <= group_1.io_address_north_ready @[topUnit.scala 31:39]
    group_0.io_dist_north_valid is invalid
    group_0.io_dist_north_bits is invalid
    group_0.io_dist_south_ready <= group_1.io_dist_north_ready @[topUnit.scala 32:36]
    group_1.clock <= clock
    group_1.reset <= reset
    group_1.io_query_valid <= io_broadcast_query_valid @[topUnit.scala 25:27]
    group_1.io_query_bits_0 <= io_broadcast_query_bits_0 @[topUnit.scala 25:27]
    group_1.io_refs_valid <= io_refs_1_valid @[topUnit.scala 28:26]
    group_1.io_refs_bits_0 <= io_refs_1_bits_0 @[topUnit.scala 28:26]
    group_1.io_dist_k_valid <= topk_unit.io_kthOut_valid @[topUnit.scala 27:28]
    group_1.io_dist_k_bits <= topk_unit.io_kthOut_bits @[topUnit.scala 27:28]
    group_1.io_address_i <= io_addrs_1 @[topUnit.scala 26:31]
    group_1.io_address_north_valid <= group_0.io_address_south_valid @[topUnit.scala 31:39]
    group_1.io_address_north_bits <= group_0.io_address_south_bits @[topUnit.scala 31:39]
    group_1.io_address_south_ready <= group_2.io_address_north_ready @[topUnit.scala 31:39]
    group_1.io_dist_north_valid <= group_0.io_dist_south_valid @[topUnit.scala 32:36]
    group_1.io_dist_north_bits <= group_0.io_dist_south_bits @[topUnit.scala 32:36]
    group_1.io_dist_south_ready <= group_2.io_dist_north_ready @[topUnit.scala 32:36]
    group_2.clock <= clock
    group_2.reset <= reset
    group_2.io_query_valid <= io_broadcast_query_valid @[topUnit.scala 25:27]
    group_2.io_query_bits_0 <= io_broadcast_query_bits_0 @[topUnit.scala 25:27]
    group_2.io_refs_valid <= io_refs_2_valid @[topUnit.scala 28:26]
    group_2.io_refs_bits_0 <= io_refs_2_bits_0 @[topUnit.scala 28:26]
    group_2.io_dist_k_valid <= topk_unit.io_kthOut_valid @[topUnit.scala 27:28]
    group_2.io_dist_k_bits <= topk_unit.io_kthOut_bits @[topUnit.scala 27:28]
    group_2.io_address_i <= io_addrs_2 @[topUnit.scala 26:31]
    group_2.io_address_north_valid <= group_1.io_address_south_valid @[topUnit.scala 31:39]
    group_2.io_address_north_bits <= group_1.io_address_south_bits @[topUnit.scala 31:39]
    group_2.io_address_south_ready <= group_3.io_address_north_ready @[topUnit.scala 31:39]
    group_2.io_dist_north_valid <= group_1.io_dist_south_valid @[topUnit.scala 32:36]
    group_2.io_dist_north_bits <= group_1.io_dist_south_bits @[topUnit.scala 32:36]
    group_2.io_dist_south_ready <= group_3.io_dist_north_ready @[topUnit.scala 32:36]
    group_3.clock <= clock
    group_3.reset <= reset
    group_3.io_query_valid <= io_broadcast_query_valid @[topUnit.scala 25:27]
    group_3.io_query_bits_0 <= io_broadcast_query_bits_0 @[topUnit.scala 25:27]
    group_3.io_refs_valid <= io_refs_3_valid @[topUnit.scala 28:26]
    group_3.io_refs_bits_0 <= io_refs_3_bits_0 @[topUnit.scala 28:26]
    group_3.io_dist_k_valid <= topk_unit.io_kthOut_valid @[topUnit.scala 27:28]
    group_3.io_dist_k_bits <= topk_unit.io_kthOut_bits @[topUnit.scala 27:28]
    group_3.io_address_i <= io_addrs_3 @[topUnit.scala 26:31]
    group_3.io_address_north_valid <= group_2.io_address_south_valid @[topUnit.scala 31:39]
    group_3.io_address_north_bits <= group_2.io_address_south_bits @[topUnit.scala 31:39]
    group_3.io_address_south_ready <= topk_unit.io_in_ready @[topUnit.scala 38:45]
    group_3.io_dist_north_valid <= group_2.io_dist_south_valid @[topUnit.scala 32:36]
    group_3.io_dist_north_bits <= group_2.io_dist_south_bits @[topUnit.scala 32:36]
    group_3.io_dist_south_ready <= topk_unit.io_in_ready @[topUnit.scala 39:42]
