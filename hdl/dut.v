module dut(input [WIDTH-1:0] A,
           input [WIDTH-1:0] B,
           output [WIDTH-1:0] Res,
           input wire clk,
           output reg Dbz

);

    //the size of input and output ports of the division module is generic.
    parameter WIDTH = 16;
    reg [WIDTH-1:0] Res;
    reg [WIDTH-1:0] a1,b1;
    reg [WIDTH:0] p1;   
    integer i;

    always@ B
    begin
        if (B == 0)
        begin
            Dbz <= 1;
        end
        else 
        begin
            Dbz <= 0;
        end
    end

    always@ (posedge clk)
    begin
        if (~Dbz)
        begin
            //initialize the variables.
            a1 = A;
            b1 = B;
            p1= 0;
            for(i=0;i < WIDTH;i=i+1)    
            begin //start the for loop
                p1 = {p1[WIDTH-2:0],a1[WIDTH-1]};
                a1[WIDTH-1:1] = a1[WIDTH-2:0];
                p1 = p1-b1;
                if(p1[WIDTH-1] == 1)  
                begin  
                    a1[0] = 0;
                    p1 = p1 + b1;   
                end
                else
                begin
                    a1[0] = 1;
                end
            end
            Res = a1;
        end
        else begin
            a1 = 0;
            b1 = 0;
            p1= 0;
            Res = 0;
        end
    end
initial begin
	$dumpfile("division.vcd");
	$dumpvars;
end
endmodule