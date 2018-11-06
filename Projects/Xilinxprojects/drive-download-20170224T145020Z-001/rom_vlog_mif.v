`timescale 1ns / 1ps

module rom_vlog_mif 
#(
    parameter ADDR_WIDTH = 10,
    parameter DATA_WIDTH = 8
)
(
    input                       clk_i,
    input      [ADDR_WIDTH-1:0] addr_i,
    output reg [DATA_WIDTH-1:0] data_o
);


(* ram_style = "block" *) reg [DATA_WIDTH-1:0] mem[0:2**ADDR_WIDTH-1];

initial begin
    $readmemb("verilogmemfile.mem", mem); 
end


always @(posedge clk_i)
    data_o <= mem[addr_i];
    
endmodule
