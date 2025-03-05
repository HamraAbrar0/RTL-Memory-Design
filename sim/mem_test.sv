/////////////////////////////////////////////////////////////////////////TB
// (c) Copyright 2013 Cadence Design Systems, Inc. All Rights Reserved.
//
// File name   : mem_test.sv
// Title       : Memory Testbench Module
// Project     : SystemVerilog Training
// Created     : 2013-4-8
// Description : Defines the Memory testbench module
// Notes       :
// 
///////////////////////////////////////////////////////////////////////////

module mem_test ( mem_interface.TB mem_int);


//interface call
bit clk;



// SYSTEMVERILOG: timeunit and timeprecision specification
timeunit 1ns;
timeprecision 1ns;


// SYSTEMVERILOG: new data types - bit ,logic

//bit         debug = 1;
logic [7:0] rdata;      // stores data read from memory for checking



// void function for the read memory
 // function void  read_mem_func (tb_interface);
   // $display ("Address = %d, Data = %d", tb_interface.addr_in, tb_interface.data_ou


// Monitor Results
  initial begin
      $timeformat ( -9, 0, " ns", 9 );
// SYSTEMVERILOG: Time Literals
      #40000ns $display ( "MEMORY TEST TIMEOUT" );
      $finish;
    end

initial
  begin: memtest
  int error_status;

    $display("Clear Memory Test");

    for (int i = 0; i< 32; i++)
       // Write zero data to every address location
      mem_int.write_mem (0,i); //data,address

    for (int i = 0; i<32; i++)
      begin 
       // Read every address location
       mem_int.read_mem (i,rdata);

       // check each memory location for data = 'h00
        if (rdata != 0)
          begin
            
            $display ("expected result is 8'h00 but address %h contains the data %h ",i,rdata);
            
          end
      end

   // print results of test

    $display("Data = Address Test");

    for (int i = 0; i< 32; i++)
       // Write data = address to every address location
     mem_int.write_mem (i,i); //data = addr
       
    for (int i = 0; i<32; i++)
      begin
       // Read every address location
        mem_int.read_mem (i,rdata);
       // check each memory location for data = address
        
        if (rdata !== 0)
          begin
            
            $display ("address %h contains the data %h but expected is %h",i,rdata,i);
            
          end
      end

   // print results of test
    printstatus (error_status);
    
    $finish;
  end


  
 
    
// / add result print function 
  function void printstatus (input int status);
    if (status ==0)
    begin 
      $display ("test passed");
  end
    else 
      begin 
        $display ("%d errors",status);
      end    
    endfunction
  
  initial begin 
    
    $dumpfile ("dump.vcd");
    $dumpvars;
    
  end
endmodule

