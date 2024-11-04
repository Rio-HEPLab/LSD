library ieee;
use ieee.std_logic_1164.all;

entity ne_detector is 
	port(
			i_clk:		in std_logic;
			i_resetb: 	in std_logic;
			i_sig:		in std_logic; 		-- input signal
			ne_det:		out	std_logic	-- negative transition detected
			
	);
end entity;

architecture rtl of ne_detector is 
	signal sig_d1: std_logic;
	signal sig_d2: std_logic;
	
	begin
		process(i_clk, i_resetb)
		
		begin
				if (i_resetb = '0') then
					sig_d1 <='0';
					sig_d2 <='0';
				elsif rising_edge(i_clk) then
					sig_d1 <= i_sig;
					sig_d2 <= sig_d1;
				end if;
		end process;
		
		ne_det <= not(sig_d1) and sig_d2;
	end rtl;