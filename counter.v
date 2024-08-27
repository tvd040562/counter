module counter (
    input clk,
    input reset,
    input preload,
    input up_dn,
    input [3:0] delta,
    input [7:0] pl_data,
    output reg[7:0] qout
);

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            qout = 8'h0;
        else if (preload)
            qout = pl_data;
        else if (up_dn)
            qout = qout + delta;
        else qout = qout - delta;
    end
endmodule
