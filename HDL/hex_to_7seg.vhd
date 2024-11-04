library ieee;
use ieee.std_logic_1164.all;

entity hex_to_7seg is
	port (
		i_digit: 	in 	std_logic_vector(3 downto 0);
		o_out:	out	std_logic_vector(0 to 6)
	
	);
end entity;
architecture ckt of hex_to_7seg is 

begin
	process(i_digit)
	begin
	
		case i_digit is
            when "0000" => o_out <= not "1111110";
            when "0001" => o_out <= not "0110000";
            when "0010" => o_out <= not "1101101";
            when "0011" => o_out <= not "1111001";
            when "0100" => o_out <= not "0110011";
            when "0101"=> o_out  <= not "1011011";
            when "0110" => o_out <= not "1011111";
            when "0111" => o_out <= not "1110000";
            when "1000" => o_out <= not "1111111";
            when "1001" => o_out <= not "1111011";
				when "1010" => o_out <= not "1110111";
				when "1011" => o_out <= not "0011110";
			   when "1100" => o_out <= not "1001110";
				when "1101" => o_out <= not "0111101";
				when "1110" => o_out <= not "1001111";
			   when "1111" => o_out <= not "1000111";
				

            when others => o_out <= "0000000";
        end case;
	end process;
	

end ckt;
