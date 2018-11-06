module uart_rx(
  input  wire        clock,
  input  wire        reset,
  input  wire        rx,
  output reg   [7:0] data,
  output reg         busy);

  localparam         CLOCK_FREQUENCY = 100000000;
  localparam         BAUD_RATE = 9600;
  localparam         BAUD_DIVIDE = CLOCK_FREQUENCY/BAUD_RATE;

  reg          [8:0] parallel_data;
  reg         [15:0] baud_count;
  reg          [3:0] bit_number;

  initial begin
    bit_number <= 4'b0000;
    baud_count <= 16'h0000;
    parallel_data <= 9'b000000000;
    data <= 8'b00000000;
    busy <= 1'b0;
  end

  always@(posedge clock)
    if (reset) begin
      bit_number <= 4'b0000;
      baud_count <= BAUD_DIVIDE/2-1;
      parallel_data <= 9'b000000000;
    end
    else if (!busy) begin
      bit_number <= 4'b0000;
      baud_count <= BAUD_DIVIDE/2-1;
      parallel_data <= parallel_data;
    end
    else if (baud_count == BAUD_DIVIDE-1) begin
      bit_number <= bit_number + 4'b0001;
      baud_count <= 16'h0000;
      parallel_data <= {rx,parallel_data[8:1]};
    end
    else begin
      bit_number <= bit_number;
      baud_count <= baud_count + 16'h0001;
      parallel_data <= parallel_data;
    end

  always@(posedge clock)
    if (reset) begin
      busy <= 1'b0;
      data <= 8'b00000000;
    end
    else if (!busy && !rx) begin
      busy <= 1'b1;
      data <= data;
    end
    else if ((bit_number == 10) && rx) begin
      busy <= 1'b0;
      data <= parallel_data[7:0];
    end
    else begin
      busy <= busy;
      data <= data;
    end
      
endmodule