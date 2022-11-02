`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Company: Codebyfaizan
// Engineer: Muhammad Faizan
// 
//  
// Design Name: Car Parking Test Bench
// Module Name: tb_car_parking.sv
// Project Name: Car Parking System

//////////////////////////////////////////////////////////////////////////////////

module tb_car_parking;

   reg clk;
   reg rst_n;
   reg sensor_entrance;
   reg sensor_exit;
   reg [1:0] password_1;
   reg [1:0] password_2;
   wire GREEN_LED;
   wire RED_LED;
   wire [6:0] HEX_1;
   wire [6:0] HEX_2;

   car_parking cps(clk, rst_n, sensor_entrance, sensor_exit, password_1, 
                   password_2, GREEN_LED, RED_LED, HEX_1, HEX_2);

   initial 
     begin
       clk = 0;
       forever #10 clk = ~clk;
     end
 
   initial 
     begin
       rst_n = 0;
       sensor_entrance = 0;
       sensor_exit = 0;
       password_1 = 0;
       password_2 = 0;
       #100;
       rst_n = 1;
       #20;
       sensor_entrance = 1;
       #1000;
       sensor_entrance = 0;
       password_1 = 1;
       password_2 = 2;
       #2000;
       sensor_exit = 1;
     end
      
endmodule