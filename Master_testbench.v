module Master_tb;
  reg [7:0] dataIN;
  wire [7:0] dataOUT;
  reg [1:0] slaveno;
  reg enable, reset, cpha, cpol, miso, clk;
  wire mosi, cs0, cs1, cs2;
  reg [7:0] test;

  Master m (dataIN,dataOUT,slaveno,enable,reset,cpha,cpol,miso,mosi,clk,cs0,cs1,cs2);

always #5 clk=~clk;

initial 
begin
    //mode 0 test
    $display("Testing mode 0: cpol = 0 && cpha = 0");
    $display("by input the following in the miso 10001111");
    test = 8'b10001111;
    $display("dataOUT \t enable \t cpol \t cpha \t miso \t mosi");
    dataIN = 0;
    slaveno = 11;
    enable = 0;
    reset = 1;
    cpha = 0;
    clk = 0;
    cpol = 0;
    #5 reset = 0;
    #5 enable = 1;
    miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 enable = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    if (test === dataOUT) begin
        $display("Mode 0 : TESTED OK");
    end else begin
      $display("Mode 0 : TEST FAILED");
    end
    //mode 1 test
    $display("Testing mode 1: cpol = 0 && cpha = 1");
    $display("by input the following in the miso 01001001");
    test = 8'b01001001;
    $display("dataOUT \t enable \t cpol \t cpha \t miso \t mosi");
    cpha = 1;
    clk = 0;
    cpol = 0;
    #5 enable = 1;
    miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 enable = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    if (test === dataOUT) begin
        $display("Mode 1 : TESTED OK");
    end else begin
      $display("Mode 1 : TEST FAILED");
    end
    //mode 2 test
    $display("Testing mode 2: cpol = 1 && cpha = 1");
    $display("by input the following in the miso 10000001");
    test = 8'b10000001;
    $display("dataOUT \t enable \t cpol \t cpha \t miso \t mosi");
    cpha = 1;
    clk = 1;
    cpol = 1;
    enable = 1;
    miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 enable = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    if (test === dataOUT) begin
        $display("Mode 2 : TESTED OK");
    end else begin
      $display("Mode 2 : TEST FAILED");
    end
    //mode 2 test
    $display("Testing mode 3: cpol = 1 && cpha = 0");
    $display("by input the following in the miso 10111001");
    test = 8'b10111001;
    $display("dataOUT \t enable \t cpol \t cpha \t miso \t mosi");
    cpha = 0;
    clk = 1;
    cpol = 1;
    #5 enable = 1;
    miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 miso = 1;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    #10 enable = 0;
    $display("%b \t %b  \t %b \t %b \t %b \t %b", dataOUT, enable, cpol, cpha, miso, mosi); 
    if (test === dataOUT) begin
        $display("Mode 3 : TESTED OK");
    end else begin
      $display("Mode 3 : TEST FAILED");
    end
    $finish;
end
endmodule