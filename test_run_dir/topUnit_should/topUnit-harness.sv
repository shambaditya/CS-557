module testbench;
  reg clock = 1;
  reg[0:0] reset = 0;
  reg[0:0] io_broadcast_query_valid = 0;
  reg[15:0] io_broadcast_query_bits_0 = 0;
  reg[0:0] io_refs_0_valid = 0;
  reg[15:0] io_refs_0_bits_0 = 0;
  reg[0:0] io_refs_1_valid = 0;
  reg[15:0] io_refs_1_bits_0 = 0;
  reg[0:0] io_refs_2_valid = 0;
  reg[15:0] io_refs_2_bits_0 = 0;
  reg[0:0] io_refs_3_valid = 0;
  reg[15:0] io_refs_3_bits_0 = 0;
  reg[15:0] io_addrs_0 = 0;
  reg[15:0] io_addrs_1 = 0;
  reg[15:0] io_addrs_2 = 0;
  reg[15:0] io_addrs_3 = 0;
  reg[0:0] io_finish = 0;
  wire[0:0] io_broadcast_query_ready;
  wire[0:0] io_refs_0_ready;
  wire[0:0] io_refs_1_ready;
  wire[0:0] io_refs_2_ready;
  wire[0:0] io_refs_3_ready;
  wire[0:0] io_terminates_0;
  wire[0:0] io_terminates_1;
  wire[0:0] io_terminates_2;
  wire[0:0] io_terminates_3;
  wire[15:0] io_addrOut_0;
  wire[15:0] io_addrOut_1;
  wire[15:0] io_addrOut_2;
  wire[15:0] io_addrOut_3;
  wire[15:0] io_addrOut_4;
  wire[15:0] io_addrOut_5;
  wire[15:0] io_addrOut_6;
  wire[15:0] io_addrOut_7;
  wire[15:0] io_addrOut_8;
  wire[15:0] io_addrOut_9;
  wire[15:0] io_addrOut_10;
  wire[15:0] io_addrOut_11;
  wire[15:0] io_addrOut_12;
  wire[15:0] io_addrOut_13;
  wire[15:0] io_addrOut_14;
  wire[15:0] io_addrOut_15;
  wire[0:0] io_addrValid;
  always #`CLOCK_PERIOD clock = ~clock;
  reg [4095:0] dumpfile = 0;
  reg dumpon = 0;

  /*** DUT instantiation ***/
  topUnit topUnit(
    .clock(clock),
    .reset(reset),
    .io_broadcast_query_valid(io_broadcast_query_valid),
    .io_broadcast_query_bits_0(io_broadcast_query_bits_0),
    .io_refs_0_valid(io_refs_0_valid),
    .io_refs_0_bits_0(io_refs_0_bits_0),
    .io_refs_1_valid(io_refs_1_valid),
    .io_refs_1_bits_0(io_refs_1_bits_0),
    .io_refs_2_valid(io_refs_2_valid),
    .io_refs_2_bits_0(io_refs_2_bits_0),
    .io_refs_3_valid(io_refs_3_valid),
    .io_refs_3_bits_0(io_refs_3_bits_0),
    .io_addrs_0(io_addrs_0),
    .io_addrs_1(io_addrs_1),
    .io_addrs_2(io_addrs_2),
    .io_addrs_3(io_addrs_3),
    .io_finish(io_finish),
    .io_broadcast_query_ready(io_broadcast_query_ready),
    .io_refs_0_ready(io_refs_0_ready),
    .io_refs_1_ready(io_refs_1_ready),
    .io_refs_2_ready(io_refs_2_ready),
    .io_refs_3_ready(io_refs_3_ready),
    .io_terminates_0(io_terminates_0),
    .io_terminates_1(io_terminates_1),
    .io_terminates_2(io_terminates_2),
    .io_terminates_3(io_terminates_3),
    .io_addrOut_0(io_addrOut_0),
    .io_addrOut_1(io_addrOut_1),
    .io_addrOut_2(io_addrOut_2),
    .io_addrOut_3(io_addrOut_3),
    .io_addrOut_4(io_addrOut_4),
    .io_addrOut_5(io_addrOut_5),
    .io_addrOut_6(io_addrOut_6),
    .io_addrOut_7(io_addrOut_7),
    .io_addrOut_8(io_addrOut_8),
    .io_addrOut_9(io_addrOut_9),
    .io_addrOut_10(io_addrOut_10),
    .io_addrOut_11(io_addrOut_11),
    .io_addrOut_12(io_addrOut_12),
    .io_addrOut_13(io_addrOut_13),
    .io_addrOut_14(io_addrOut_14),
    .io_addrOut_15(io_addrOut_15),
    .io_addrValid(io_addrValid)  );

  initial begin
    $init_ins(reset, io_broadcast_query_valid, io_broadcast_query_bits_0, io_refs_0_valid, io_refs_0_bits_0, io_refs_1_valid, io_refs_1_bits_0, io_refs_2_valid, io_refs_2_bits_0, io_refs_3_valid, io_refs_3_bits_0, io_addrs_0, io_addrs_1, io_addrs_2, io_addrs_3, io_finish);
    $init_outs(io_broadcast_query_ready, io_refs_0_ready, io_refs_1_ready, io_refs_2_ready, io_refs_3_ready, io_terminates_0, io_terminates_1, io_terminates_2, io_terminates_3, io_addrOut_0, io_addrOut_1, io_addrOut_2, io_addrOut_3, io_addrOut_4, io_addrOut_5, io_addrOut_6, io_addrOut_7, io_addrOut_8, io_addrOut_9, io_addrOut_10, io_addrOut_11, io_addrOut_12, io_addrOut_13, io_addrOut_14, io_addrOut_15, io_addrValid);
    $init_sigs(topUnit);
    /*** Enable VCD dump ***/
    if ($value$plusargs("dumpfile=%s", dumpfile)) begin
      $dumpfile(dumpfile);
      $dumpvars(0, topUnit);
      /* exclude the startup from the wave dump */
      $dumpoff;
    end
  end

  always @(negedge clock)  begin
    if (dumpfile && !dumpon) begin
      dumpon = 1;
      $dumpon;
    end
    $tick();
    $dumpflush;
  end

endmodule
