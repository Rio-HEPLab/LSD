library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;




entity simple_counter_de10 is
	port(
	
			CLOCK_50:	in	std_logic;
			SW:			in std_logic_vector(1 downto 0);
			LEDR:			out std_logic_vector(7 downto 0)
	
		);
end entity;


architecture hardware of simple_counter_de10 is 


	signal CLK_SIG: std_logic; -- intermediate clock signal
	
	-- Component prototypes
	
	component clk_3Hz
		port(
			i_clk_50Mhz	: IN 	STD_LOGIC;
			i_rstb		: IN 	STD_LOGIC;
			o_clk_3Hz	: OUT	STD_LOGIC
			);
	end component;
	
	component simple_counter
		generic( n: NATURAL := 4);
		port
		(
			i_rstb	: IN STD_LOGIC;
			i_clk		: IN STD_LOGIC;
			o_cnt		: OUT STD_LOGIC_VECTOR((n-1) downto 0)
			
		);
	end component;	
	
	
	begin
	
	 CK:clk_3Hz
		port map
		(
			i_clk_50Mhz => CLOCK_50,
			i_rstb		=> SW(0),
			o_clk_3Hz	=> CLK_SIG
		
		);
		
	 DUT: simple_counter
		port map 
		(
		
			i_clk => CLK_SIG,
			i_rstb => SW(0),
			o_cnt => LEDR( 3 downto 0)
		);


end architecture;