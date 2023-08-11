`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:04:18 08/07/2023
// Design Name:   combine
// Module Name:   C:/.Xilinx/My projects/ddr2/ddr_tb.v
// Project Name:  ddr2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: combine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ddr_tb;

	// Inputs
	reg reset;
	reg clock;
	reg wr;
	reg rd;
	reg [2:0] wr_add;
	reg [2:0] rd_add;
	reg [7:0] data_in;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	combine uut (
		.reset(reset), 
		.clock(clock), 
		.wr(wr), 
		.rd(rd), 
		.wr_add(wr_add), 
		.rd_add(rd_add), 
		.data_in(data_in), 
		.data_out(data_out)
	);
	
	initial
	begin
	clock=0;
	forever
	#100 clock= ~clock;
	end

	initial begin
		// Initialize Inputs
		reset = 0;
		wr = 0;
		rd = 0;
		wr_add = 0;
		rd_add = 0;
		data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;wr = 1;rd = 0;wr_add = 1;#5rd_add = 0;data_in = 11101;
		#100 reset = 0;wr = 1;rd = 0;wr_add = 10;#5rd_add = 0;data_in = 1;
		#100 reset = 0;wr = 0;rd = 1;wr_add = 0;#5rd_add = 1;data_in = 0;
		#100 reset = 0;wr = 0;rd = 1;wr_add = 0;#5rd_add = 10;data_in = 0;
		#100 reset = 0;wr = 1;rd = 1;wr_add = 11;#5rd_add = 1;data_in = 111;
		#100 reset = 0;wr = 0;rd = 1;wr_add = 0;#5rd_add = 11;data_in = 0;
		
		
		
		
	end
	initial begin
	$monitor ("data store at memory location %8b is %8b",wr_add,data_in);

		end
	
	
      
endmodule

