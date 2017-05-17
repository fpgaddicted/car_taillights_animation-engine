----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:38:28 05/16/2017 
-- Design Name: 
-- Module Name:    signal_mux - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity signal_mux is
    Port ( sel : in  STD_LOGIC;
           sig_out : out  STD_LOGIC_VECTOR (2 downto 0);
           sig_turn : in  STD_LOGIC_VECTOR (2 downto 0);
           sig_alarm : in  STD_LOGIC_VECTOR (2 downto 0));
end signal_mux;

architecture Behavioral of signal_mux is

begin
	process(sel,sig_turn,sig_alarm)
		begin
			case sel is 
				when '0' => sig_out <= sig_turn;
				when '1' => sig_out <= sig_alarm;
				when others => sig_out <= "XXX";
			end case;
	end process;

end Behavioral;

