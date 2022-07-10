module Master(dataIN,dataOUT,slaveno,enable,reset,cpha,cpol,miso,mosi,clk,cs0,cs1,cs2);
  input enable,reset,cpha,cpol,miso,clk;
  output reg mosi,cs0,cs1,cs2;
  input [1:0] slaveno;
  input [7:0] dataIN;
  output [7:0] dataOUT;

  integer mode = 0;
  reg [7:0] data;

  assign dataOUT = data;

  always @ (posedge clk or negedge clk)
    begin
      if (clk == 1)
        begin
      if (reset)
        begin
          data <= 8'b00000000; 
          cs0 <= 1'b1;
          cs1 <= 1'b1;
          cs2 <= 1'b1;
          mosi <= 1'b0;
        end
        else if (enable === 1) begin
        case(slaveno)    
          2'b00    : cs0 <= 1'b0;
          2'b01    : cs1 <= 1'b0;
          2'b10    : cs2 <= 1'b0; 
          2'b11    : begin
            cs0 <= 1'b1;
            cs1 <= 1'b1;
            cs2 <= 1'b1;  
          end  
          default  : begin
            cs0 <= 1'b1;
            cs1 <= 1'b1;
            cs2 <= 1'b1;  
          end  
        endcase
        if (cpol === 1'b0 && cpha === 1'b0) 
            mode = 0;
          else if (cpol === 1'b0 && cpha === 1'b1)
            mode = 1;
          else if (cpol === 1'b1 && cpha === 1'b1)
            mode = 1;
          else if (cpol === 1'b1 && cpha === 1'b0)
            mode = 0;
        case (mode)
        1 : mosi <= data[7];
        0 : begin
          data [7:1] <= data [6:0];          
          data [0] <= miso;      
        end
        endcase
      end
      else if (enable === 1'b0 && dataIN !== 1'b0) begin
        data <= dataIN;
        cs0 <= 1'b1;
        cs1 <= 1'b1;
        cs2 <= 1'b1;
      end
    end
  else if(clk == 0)
    begin
      if (reset)
        begin
          data <= 8'b00000000; 
          cs0 <= 1'b1;
          cs1 <= 1'b1;
          cs2 <= 1'b1;
          mosi <= 1'b0;
        end
        else if (enable === 1'b1) begin   
        case(slaveno)
          2'b00    : cs0 <= 1'b0;
          2'b01    : cs1 <= 1'b0;
          2'b10    : cs2 <= 1'b0;
          2'b11    : begin
            cs0 <= 1'b1;
            cs1 <= 1'b1;
            cs2 <= 1'b1;  
          end
          default  : begin
            cs0 <= 1'b1;
            cs1 <= 1'b1;  
            cs2 <= 1'b1;  
          end  
        endcase
        if (cpol === 1'b0 && cpha === 1'b0) 
            mode = 0;
          else if (cpol === 1'b0 && cpha === 1'b1)
            mode = 1;
          else if (cpol === 1'b1 && cpha === 1'b1)
            mode = 1;
          else if (cpol === 1'b1 && cpha === 1'b0)
            mode = 0;
        case (mode)
        1 : begin
          data [7:1] <= data [6:0];
          data [0] <= miso;      
        end
        0 : mosi <= data[7];
        endcase  
      end
      else if (enable === 1'b0 && dataIN !== 1'b0) begin
        data <= dataIN;
        cs0 <= 1'b1;
        cs1 <= 1'b1;
        cs2 <= 1'b1;
      end
    end
    end
endmodule