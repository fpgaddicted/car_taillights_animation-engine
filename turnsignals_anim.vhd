----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Stefan Naco (fpgaddicted)
-- 
-- Create Date:    13:05:35 04/27/2017 
-- Design Name: 
-- Module Name:    turnsignals_anim - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: Xilinx ISE 14.7
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.4 Commentary added
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity turnsignals_anim is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
	 command : in STD_LOGIC;
         led_out : out  STD_LOGIC_VECTOR(2 downto 0));
end turnsignals_anim;

architecture animation_engine of turnsignals_anim is
type state is (s0,s1,s2,s3,s4,s5); -- 6 FSM states 
signal s : state;
 

begin
  process(clk,reset,s,command)
  variable  i: integer:=0;
	begin
	if reset = '1' or command = '0' then
		s <= s0;
	elsif rising_edge(clk) then
		case s is
			when s0=>
			i:=i+1;
			led_out <="000";
				if(i=6250000) then
					i:=0;
					s <= s1;
				end if;
			when s1=>
			i:=i+1;
			led_out <="100";
				if(i=6250000) then
					s <= s2;
					i:=0;
				end if;
			when s2=>
			i:=i+1;
			led_out <="110";
				if(i=6250000) then
					s <= s3;
					i:=0;
				end if;
			when s3=>
			i:=i+1;
			led_out <="111";
				if(i=6250000) then
					s <= s4;
					i:=0;
				end if;
					
			when s4=>
			i:=i+1;
			led_out <="011";
				if(i=6250000) then
					s <= s5;
					i:=0;
				end if;
					
			when s5=>
			i:=i+1;
			led_out <="001";
				if(i=6250000) then
					s <= s0;
					i:=0;
				end if;
			end case;
		end if;
	end process;
				
				
			

end animation_engine;

