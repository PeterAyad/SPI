module SPI(masterDataIN,slave0DataIN,slave1DataIN,slave2DataIN,masterDataOUT,slave0DataOUT,
            slave1DataOUT,slave2DataOUT,slaveno,enable,reset,cpha,cpol,clk);
            
input [7:0] masterDataIN,slave0DataIN,slave1DataIN,slave2DataIN;
output wire [7:0] masterDataOUT,slave0DataOUT,slave1DataOUT,slave2DataOUT;
input [1:0] slaveno;
input enable,reset,cpha,cpol,clk;
wire miso,miso1, miso2, miso3,mosi,cs0,cs1,cs2;

assign miso = (slaveno == 0) ? miso1 : (slaveno == 1) ? miso2 : miso3;

Master m (masterDataIN,masterDataOUT,slaveno,enable,reset,cpha,cpol,miso,mosi,clk,cs0,cs1,cs2);
Slave s1 (slave0DataIN,slave0DataOUT,reset,cpha, miso1, mosi,clk,cs0);
Slave s2 (slave1DataIN,slave1DataOUT,reset,cpha, miso2, mosi,clk,cs1);
Slave s3 (slave2DataIN,slave2DataOUT,reset,cpha, miso3, mosi,clk,cs2);

endmodule