module ClkDiv (

input	wire		i_ref_clk,
input	wire		i_rst_n,
input	wire		i_clk_enable,
input	wire	[3:0]	i_div_ratio,
output	wire		o_div_clk

);

wire		clk_div_enable ;
wire	[3:0]	half_cycle;
reg	[3:0]	 counter ;
//wire		count_done;	
wire		even_case;
reg		div_clk;
reg		odd_toggle;


assign clk_div_enable = (i_clk_enable && (i_div_ratio != 4'b0)&&(i_div_ratio !=4'd1)) ? 1: 0;
assign even_case = (i_div_ratio[0] == 1'b0)? 1'b1 : 1'b0;
assign half_cycle = i_div_ratio >> 1'b1 ;


always@(posedge i_ref_clk or negedge i_rst_n)
begin
	if(!i_rst_n)
begin
	div_clk <= 1'b0;
	counter <=4'b0;
	odd_toggle <=1'b0;
end
	else if(clk_div_enable && even_case && counter == (half_cycle - 1'b1) )
begin
	div_clk <= ~div_clk ;
	counter <= 4'b0;
end

	else if (clk_div_enable && !even_case && counter == (half_cycle-1'b1) && odd_toggle || clk_div_enable && !even_case && counter == half_cycle && !odd_toggle)
begin	
	div_clk <= ~div_clk ;
	counter <= 4'b0;
	odd_toggle <= ~odd_toggle;
end


	else
begin
	counter <= counter +1'b1 ;
end

	
end


assign o_div_clk = (i_clk_enable == 1'b1) ? div_clk: i_ref_clk ;

endmodule
