// SYSTEMVERILOG: timeunit and timeprecision specification
timeunit 1ns;
timeprecision 1ns;


interface mem_interface (input clk); 
                   logic read;
                   logic write; 
                   logic [4:0] addr; 
                   logic [7:0] data_in;     // data TO memory
                   logic [7:0] data_out; 
			bit         debug = 1;


modport TB (
		  input clk, 
                  output  read, write, 
                  output  addr, 
                  output  data_in,     // data TO memory
                  input   data_out  ,
import read_mem,
import write_mem
);//define the modport for testbench "defining the ports according to the tb

modport DUT (

	input        clk,read,write, 
	input    addr  ,
	input    data_in  ,
        output   data_out

); //signals are defining according to the design

  ///////////////////// Write Task /////////////////////
  task write_mem ( input [7:0] data_i,input [4:0] addr_in );
  
    begin
      @ (negedge clk);
      read =0;
      write =1;
      
      addr = addr_in;
      data_in = data_i;
      
      if (debug)
        $display ("write data is %d and address is %d", data_i,addr_in);
    end
      
endtask
  
  
  ////////////////////// Read Task /////////////////////////////////
  
  task read_mem (input [4:0] addr_in, output [7:0] rdata);
    @ (negedge clk);
    read =1;
    write =0;
    
    addr= addr_in;
@ (negedge clk);
    #1;
    
    rdata = data_out;
    
     if (debug)
       $display ("read address is %d and read data value is %d", addr_in, rdata);

  endtask

endinterface
