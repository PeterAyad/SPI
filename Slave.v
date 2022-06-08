module Slave(slaveDataIN,slaveDataOUT,reset,cpha,miso,mosi,clk,cs);
  input reset,cpha,mosi,clk,cs;
  output reg miso;
  input [7:0] slaveDataIN;
  output [7:0]  slaveDataOUT;

  reg [7:0] data;
  integer mode = 0;

  assign  slaveDataOUT = data;

  always @ (posedge clk)
    begin
      if (reset)
        begin
        data <= 8'b00000000;
        miso <= 1'b0;
      end
      else if (cs === 1'b0) begin
        if (cpha === 1'b0) 
            mode = 0;
          else
            mode = 1;
        case (mode)
          0 : miso <= data[7];
          1 : begin
            data [7:1] <= data [6:0];
            data [0] <= mosi;
          end
        endcase
      end
      else if (cs === 1'b1 && slaveDataIN !== 1'b0)
        data <= slaveDataIN;
    end
  
  always @ (negedge clk)
    begin
      if (reset)
        begin
        data <= 8'b00000000;
        miso <= 1'b0;
      end
      else if (cs === 1'b0) begin
        if (cpha === 1'b0) 
            mode = 0;
          else
            mode = 1;
        case (mode)
          0 : begin
            data [7:1] <= data [6:0];
            data [0] <= mosi;
          end
          1 : miso <= data[7];
        endcase
      end
      else if (cs === 1'b1 && slaveDataIN !== 1'b0)
        data <= slaveDataIN;
    end
endmodule