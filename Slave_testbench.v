module Slave_tb;
  reg [7:0] slaveDataIN;
  wire [7:0] slaveDataOUT;
  reg reset, cpha, mosi, clk, cs;
  wire miso;
  
  reg [7:0] test;

  Slave s (slaveDataIN,slaveDataOUT,reset,cpha, miso,mosi,clk,cs);

always #5 clk=~clk;

initial 
begin
  $display("Test case 1: cpha = 0");
  $display("by entering the following in the mosi 10101101");
    test = 8'b10101101;
    $display("slaveDataOUT \t cpha \t mosi \t miso \t cs");
    slaveDataIN = 0;
    cs = 1;
    reset = 1;
    cpha = 0;
    clk = 0; 
    mosi = 0;
    #5 reset = 0;
    cs = 0;
    mosi = 1;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 0;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 1;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 0;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 1;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 1;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 0;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 1;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 cs = 1;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    if (test === slaveDataOUT) begin
      $display("Test 1: TESTED OK");
    end else begin
      $display("Test 1: TEST FAILED");
    end
  $display("Test case 2: cpha = 1");
  $display("by entering the following in the mosi 01101001");
    test = 8'b01101001;
    $display("slaveDataOUT \t cpha \t mosi \t miso \t cs");
    cpha = 1;
    clk = 0; 
    #5 cs = 0;
    mosi = 0;
    #10 mosi = 1;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 1;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 0;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 1;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 0;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 0;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 mosi = 1;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    #10 cs = 1;
    $display(" %b  \t %b \t %b \t %b \t %b ",slaveDataOUT, cpha,mosi,miso,cs);
    if (test === slaveDataOUT) begin
        $display("Test 2: TESTED OK");
    end else begin
      $display("Test 2: TEST FAILED");
    end
  $finish;
end
endmodule