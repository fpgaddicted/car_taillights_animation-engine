----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Stefan Naco (fpgaddicted)
-- 
-- Create Date:    18:58:26 04/27/2017 
-- Design Name: 
-- Module Name:    alarm_anim - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.2 - Bug fix
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

entity alarm_anim is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           en : in  STD_LOGIC;
           led_out : out  STD_LOGIC_VECTOR (2 downto 0));
end alarm_anim;

architecture animation_engine of alarm_anim is
type state is (s0,s1);
signal s : state;
 

begin
  process(clk,reset,s,en)
  variable  i: integer:=0;
	begin
	
	if rising_edge(clk) then
	  if (reset = '1') or (en = '0') then
		   s <= s0;
		led_out <= "000";
	  else
		case s is
			when s0=>
			i:=i+1;
			led_out <="000";
				if(i=12500000) then
					i:=0;
					s <= s1;
				end if;
			when s1=>
			i:=i+1;
			led_out <="111";
				if(i=12500000) then
					i:=0;
					s <= s0;
					
				end if;
			end case;
	 end if;
	end if;
end process;


end animation_engine;

