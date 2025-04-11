FIRRTL version 1.1.0
circuit PE_Module :
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
    node _square_T = mul(substract_0, substract_0) @[PE.scala 45:55]
    reg square_REG : SInt<32>, clock with :
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
    io_partial_dist <= asSInt(bits(tmp, 15, 0)) @[PE.scala 55:21]
    fifo_dist.clock <= clock
    fifo_dist.reset <= reset
    fifo_dist.io_enq_valid <= _GEN_35
    fifo_dist.io_enq_bits <= asSInt(bits(_GEN_36, 15, 0))
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
    acc_dist <= asSInt(bits(mux(reset, asSInt(UInt<16>("h0")), _GEN_32), 15, 0)) @[PE.scala 42:{27,27}]
    square_REG <= _square_T @[PE.scala 45:52]
    compute_valid <= io_refs_valid @[PE.scala 52:32]
