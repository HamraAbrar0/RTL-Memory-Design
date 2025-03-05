///////////////////////////////////////////////////////////////////////////
// (c) Copyright 2013 Cadence Design Systems, Inc. All Rights Reserved.
//
// File name   : top.sv
// Title       : top module for Memory labs 
// Project     : SystemVerilog Training
// Created     : 2013-4-8
// Description : Defines the top module for memory labs
// Notes       :
// Memory Lab - top-level 
// A top-level module which instantiates the memory and mem_test modules
// 
///////////////////////////////////////////////////////////////////////////

module top;
// SYSTEMVERILOG: timeunit and timeprecision specification
timeunit 1ns;
timeprecision 1ns;

// SYSTEMVERILOG: logic and bit data types
bit         clk;

// SYSTEMVERILOG:: implicit .* port connections
//instantiate mem_test via interface

//Design instantiate 

mem_interface mem_int (.clk);
mem DUTT (.mem_int(mem_int));

// SYSTEMVERILOG:: implicit .name port connections
//instantiate via interface the memory design 

mem_test tb (.mem_int(mem_int));

always #5 clk = ~clk;
endmodule
