library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simple_counter is 
	generic(
				n: natural :=4
	);
	port(
			i_clk:	in std_logic;
			i_rstb:	in std_logic;
			
			
			o_cnt :  out std_logic_vector(n-1 downto 0)
	);
end entity;

architecture behavioral of simple_counter is

	-- internal signal
	signal cnt_sig: unsigned(n-1 downto 0);
begin
		process(i_clk, i_rstb)
		begin
		if (i_rstb = '0') then
			cnt_sig <= ( others => '0');
		elsif ( rising_edge(i_clk) ) then
				cnt_sig <= cnt_sig + 1;
				
		end if;
      end process;
		
		o_cnt <= std_logic_vector(cnt_sig);
end behavioral;