----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:15:33 04/27/2017 
-- Design Name: 
-- Module Name:    brake_anim - Behavioral 
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

entity brake_anim is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           en : in  STD_LOGIC;
           led_out : out  STD_LOGIC_VECTOR (1 downto 0));
end brake_anim;

architecture animation_engine of brake_anim is
type state is (s0,s1);
signal s : state;
 

begin
  process(clk,reset,s,en)
  variable  i: integer:=0;
	begin
	if rising_edge(clk) then
	  if reset = '1' or en = '0' then
			s <= s0;
	  else 
		case s is
			when s0=>
			i:=i+1;
			led_out <="00";
				if(i=2000000) then
					i:=0;
					s <= s1;
				end if;
			when s1=>
			i:=i+1;
			led_out <="11";
				if(i=2000000) then
					s <= s0;
					i:=0;
				end if;
			end case;
	 end if;
	end if;
end process;

end animation_engine;


