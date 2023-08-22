# Clock_Divider
> Clock divider or also called frequency divider is a circuit that takes an input signal of frequency fin and generates an output signal of frequency 
fout = fin / n 
where n is an integer number


> they can be used as clock buffers when used in divide by 1 mode ,they can also function as a fanout buffer ,and they also make multiple copies of the output frequency.


# Specs :-

# inputs:

> i_ref_clk is the reference frequency


> i_rst_n is an active low reset signal


> i_clk_enable is responsible for enabling or disapling the clock divider


> i_div_ratio is the integer n   

# outputs:

> o_div_clk is the divided frequency

# operation:


> it's required to implement a clock divider that's able to generate different copies of frequencies when the i_clk_enable is high and when it's low it's required to out the reference frequency.


