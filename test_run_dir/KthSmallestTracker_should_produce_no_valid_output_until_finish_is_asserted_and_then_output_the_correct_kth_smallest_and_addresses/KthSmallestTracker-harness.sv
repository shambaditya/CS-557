module testbench;
  reg clock = 1;
  reg[0:0] reset = 0;
  reg[0:0] io_in_valid = 0;
  reg[31:0] io_in_bits_distance = 0;
  reg[7:0] io_in_bits_addr = 0;
  reg[0:0] io_finish = 0;
  reg[0:0] io_kthOut_ready = 0;
  wire[0:0] io_in_ready;
  wire[0:0] io_kthOut_valid;
  wire[31:0] io_kthOut_bits;
  wire[7:0] io_addrOut_0;
  wire[7:0] io_addrOut_1;
  wire[7:0] io_addrOut_2;
  wire[0:0] io_addrValid;
  always #`CLOCK_PERIOD clock = ~clock;
  reg [4095:0] dumpfile = 0;
  reg dumpon = 0;

  /*** DUT instantiation ***/
  KthSmallestTracker KthSmallestTracker(
    .clock(clock),
    .reset(reset),
    .io_in_valid(io_in_valid),
    .io_in_bits_distance(io_in_bits_distance),
    .io_in_bits_addr(io_in_bits_addr),
    .io_finish(io_finish),
    .io_kthOut_ready(io_kthOut_ready),
    .io_in_ready(io_in_ready),
    .io_kthOut_valid(io_kthOut_valid),
    .io_kthOut_bits(io_kthOut_bits),
    .io_addrOut_0(io_addrOut_0),
    .io_addrOut_1(io_addrOut_1),
    .io_addrOut_2(io_addrOut_2),
    .io_addrValid(io_addrValid)  );

  initial begin
    $init_ins(reset, io_in_valid, io_in_bits_distance, io_in_bits_addr, io_finish, io_kthOut_ready);
    $init_outs(io_in_ready, io_kthOut_valid, io_kthOut_bits, io_addrOut_0, io_addrOut_1, io_addrOut_2, io_addrValid);
    $init_sigs(KthSmallestTracker);
    /*** Enable VCD dump ***/
    if ($value$plusargs("dumpfile=%s", dumpfile)) begin
      $dumpfile(dumpfile);
      $dumpvars(0, KthSmallestTracker);
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
