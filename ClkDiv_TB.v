module ClkDiv_TB ;

reg		i_ref_clk_tb;
reg		i_rst_n_tb;
reg		i_clk_enable_tb;
reg	[3:0]	i_div_ratio_tb;
wire		o_div_clk_tb;

integer i;
localparam T=10;

always
begin
#(T/2.0) i_ref_clk_tb =~ i_ref_clk_tb;
end



initial 
begin
i_ref_clk_tb =1'b1;

i_rst_n_tb = 1'b0;

i_clk_enable_tb =1'b0;

i_div_ratio_tb = 4'd0;



#T	i_rst_n_tb =1'b1;

#T	i_clk_enable_tb =1'b0; i_div_ratio_tb = 4'd2;

#T	i_rst_n_tb = 1'b0;

#T	i_rst_n_tb = 1'b1;


for (i = 2 ; i < 16 ; i = i+1)
begin


#T	i_clk_enable_tb =1'b1; i_div_ratio_tb = i;

#T	i_rst_n_tb = 1'b0;

#T	i_rst_n_tb = 1'b1;

#(3*i*T);
end





#(10*T) $stop;

end


ClkDiv DUT (
.i_ref_clk(i_ref_clk_tb),
.i_rst_n (i_rst_n_tb),
.i_clk_enable (i_clk_enable_tb),
.i_div_ratio (i_div_ratio_tb),
.o_div_clk (o_div_clk_tb)

);







endmodule
