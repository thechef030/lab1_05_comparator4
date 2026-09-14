`timescale 1ns/1ps
module tb_compare_4;
  reg [3:0] a,b; wire [2:0] o; compare_4 dut(a,b,o);
  integer n,checked=0;
  reg [2:0] expected;
  initial begin
    $dumpfile("wave.vcd"); $dumpvars(0,tb_compare_4);

    for(n=0;n<256;n=n+1) begin
      {a,b}=n;
      expected=((n/16)>(n%16)) ? 4 : (((n/16)==(n%16)) ? 2 : 1);
      #10;
      if (o !== expected)
        $fatal(1,"FAIL compare_4 vector=%0d expected=%h actual=%h",n,expected,o);
      checked=checked+1;
    end
    if(checked!=256) $fatal(1,"Incomplete test");
    $display("LAB1_PASS compare_4 cases=%0d",checked);
    $finish;
  end
  initial begin #100000; $fatal(1,"Watchdog"); end
endmodule
