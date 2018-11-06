module uart_tx(
  input  wire        clock,
  input  wire        reset,
  input  wire  [7:0] data,
  input  wire        send,
  output wire        tx,
  output reg         busy);

  localparam         CLOCK_FREQUENCY = 100000000;
  localparam         BAUD_RATE = 9600;
  localparam         BAUD_DIVIDE = CLOCK_FREQUENCY/BAUD_RATE;

  reg          [8:0] parallel_data;
  reg         [15:0] baud_count;
  reg          [3:0] bit_number;

  assign tx = parallel_data[0];

  initial begin
    bit_number <= 4'b0000;
    baud_count <= 16'h0000;
    parallel_data <= 9'b111111111;
    busy <= 1'b0;
  end

  always@(posedge clock)
    if (reset) begin
      bit_number <= 4'b0000;
      baud_count <= 16'h0000;
      parallel_data <= 9'b111111111;
    end
    else if (!busy) begin
      bit_number <= 4'b0000;
      baud_count <= 16'h0000;
      if (send) parallel_data <= {data,1'b0};
      else parallel_data <= parallel_data;
    end
    else if (baud_count == BAUD_DIVIDE-1) begin
      bit_number <= bit_number + 4'b0001;
      baud_count <= 16'h0000;
      parallel_data <= {1'b1,parallel_data[8:1]};
    end
    else begin
      bit_number <= bit_number;
      baud_count <= baud_count + 16'h0001;
      parallel_data <= parallel_data;
    end

  always@(posedge clock)
    if (reset) busy <= 1'b0;
    else if (!busy && send) busy <= 1'b1;
    else if (bit_number == 10) busy <= 1'b0;
    else busy <= busy;

endmodule