module counter (clk, reset, preload, pl_data, qout);
    input clk;
    input reset;
    input preload;
    input [7:0] pl_data;
    output reg[7:0] qout;

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            qout = 8'h0;
        else if (preload)
            qout = pl_data;
        else
            qout = qout + 8'h1;
    end
endmodule
