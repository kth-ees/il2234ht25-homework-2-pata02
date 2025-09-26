module shift_register_tb;

    parameter N = 4;

  // Testbench signals
        logic clk;
        logic rst_n;
        logic serial_parallel;
        logic load_enable;
        logic serial_in;
        logic [N-1:0] parallel_in;
        logic [N-1:0] parallel_out;
        logic serial_out;

always #5 clk = ~clk;

  // Instantiate the decoder module
  shift_register uut (

    .clk(clk),
    .rst_n(rst_n),
    .serial_parallel(serial_parallel),
    .load_enable(load_enable),
    .serial_in(serial_in),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out),
    .serial_out(serial_out)
  );

  // Complete your testbench here
  initial begin
    clk = 1;
    rst_n = 0;
    serial_in = 0;
    parallel_in = 4'b1111;
    serial_parallel = 1;
    load_enable = 0;
    rst_n = 1;
    #10;

    //Test parallell load without enable
    load_enable = 0;
    #10;

    //Test parallell load with enable
    load_enable = 1;
    #10;

    //Test serial load without enable
    load_enable = 0;
    serial_in = 0;
    serial_parallel = 0;
    #10;
    //Test serial load with enable
    load_enable = 1;
    serial_parallel = 0;
    serial_in = 0;
    #60;
    $finish;
  end

endmodule