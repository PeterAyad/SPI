module SPI_tb;
reg [7:0] masterDataIN,slave0DataIN,slave1DataIN,slave2DataIN;
wire [7:0] masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT;
reg [1:0] slaveno;
reg enable,reset,cpha,cpol,clk;

SPI s (masterDataIN,slave0DataIN,slave1DataIN,slave2DataIN,masterDataOUT,slave0DataOUT,
            slave1DataOUT,slave2DataOUT,slaveno,enable,reset,cpha,cpol,clk);

always #5 clk=~clk;

initial begin
    $display("Testing case 1: sending 01101001 to slave 0 on mode 0 (cpol = 0 & cpha =0)");
    enable= 1'b0;
    reset= 1'b1;
    slaveno = 2'b00;
    cpha = 1'b0;
    clk = 1'b0;
    cpol = 1'b0;
    masterDataIN = 8'b00000000;
    slave0DataIN = 8'b00000000;
    slave1DataIN = 8'b00000000;
    slave2DataIN = 8'b00000000;
    #5 reset = 1'b0;
    masterDataIN = 8'b01101001;
    slaveno = 2'b00;
    #5 enable = 1'b1;
    $display("masterDataOUT \t slave0DataOUT \t slave1DataOUT \t slave2DataOUT \t slaveno \t enable \t cpol \t cpha");
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 enable = 1'b0;
    $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    if (masterDataIN === slave0DataOUT) begin
        $display("TEST CASE 1: TESTED OK");
    end else begin
        $display("TEST CASE 1: TEST FAILED");
    end
    $display("Testing case 2: receiving 11010110 from slave 1 on mode 1 (cpol = 0 & cpha = 1)");
    slaveno = 2'b01;
    cpha = 1'b1;
    clk = 1'b0;
    cpol = 1'b0;
    #5 slave1DataIN = 8'b11010110;
    #5 enable = 1'b1;
    $display("masterDataOUT \t slave0DataOUT \t slave1DataOUT \t slave2DataOUT \t slaveno \t enable \t cpol \t cpha");
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 enable = 1'b0;
    $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    if (masterDataOUT === slave1DataIN) begin
        $display("TEST CASE 2: TESTED OK");
    end else begin
        $display("TEST CASE 2: TEST FAILED");
    end
    $display("Testing case 3: sending 10000001 to slave 2 on mode 2 (cpol = 1 & cpha = 1)");
    slaveno = 2'b10;
    cpha = 1'b1;
    clk = 1'b1;
    cpol = 1'b1;
    #5 masterDataIN = 8'b10000001;
    #10 enable = 1'b1;
    $display("masterDataOUT \t slave0DataOUT \t slave1DataOUT \t slave2DataOUT \t slaveno \t enable \t cpol \t cpha");
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 enable = 1'b0;
    $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    if (slave2DataOUT === masterDataIN) begin
        $display("TEST CASE 3: TESTED OK");
    end else begin
        $display("TEST CASE 3: TEST FAILED");
    end
    $display("Testing case 4: receiving 11111101 from slave 0 on mode 3 (cpol = 1 & cpha = 0)");
    slaveno = 2'b00;
    cpha = 1'b0;
    clk = 1'b1;
    cpol = 1'b1;
    #5 slave0DataIN = 8'b11111101;
    #5 enable = 1'b1;
    $display("masterDataOUT \t slave0DataOUT \t slave1DataOUT \t slave2DataOUT \t slaveno \t enable \t cpol \t cpha");
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 enable = 1'b0;
    $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    if (masterDataOUT === slave0DataIN) begin
        $display("TEST CASE 4: TESTED OK");
    end else begin
        $display("TEST CASE 4: TEST FAILED");
    end
    $display("Testing case 5: sending 11100000 to slave 1 on mode 1 (cpol = 0 & cpha = 1)");
    slaveno = 2'b01;
    cpha = 1'b1;
    clk = 1'b0;
    cpol = 1'b0;
    #5 masterDataIN = 8'b11100000;
    #5 enable = 1'b1;
    $display("masterDataOUT \t slave0DataOUT \t slave1DataOUT \t slave2DataOUT \t slaveno \t enable \t cpol \t cpha");
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 enable = 1'b0;
    $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    if (slave1DataOUT === masterDataIN) begin
        $display("TEST CASE 5: TESTED OK");
    end else begin
        $display("TEST CASE 5: TEST FAILED");
    end
    $display("Testing case 6: receiving 00011000 from slave 2 on mode 0 (cpol = 0 & cpha = 0)");
    slaveno = 2'b10;
    cpha = 1'b0;
    clk = 1'b0;
    cpol = 1'b0;
    #5 slave2DataIN = 8'b00011000;
    #10 enable = 1'b1;
    $display("masterDataOUT \t slave0DataOUT \t slave1DataOUT \t slave2DataOUT \t slaveno \t enable \t cpol \t cpha");
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    #10 
    $display("%b \t %b  \t %b \t %b \t %b  \t %b \t %b \t %b ",
    masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT,slaveno,enable,cpol,cpha);
    if (masterDataOUT === slave2DataIN) begin
        $display("TEST CASE 6: TESTED OK");
    end else begin
        $display("TEST CASE 6: TEST FAILED");
    end
    #5 enable = 1'b0;
    $finish;
end
endmodule