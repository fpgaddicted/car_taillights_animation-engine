----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Stefan Naco (fpgaaddicted)
-- 
-- Create Date:    17:26:19 04/27/2017 
-- Design Name: 
-- Module Name:    animation_engine - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.1 - Info change
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

entity animation_engine is
    Port ( t_left,t_right,t_brake,t_alarm : in  STD_LOGIC;
           clk,reset : in  STD_LOGIC;
           led_left,led_right : out  STD_LOGIC_VECTOR (2 downto 0);
           led_stop : out  STD_LOGIC_VECTOR (1 downto 0));
end animation_engine;

architecture Behavioral of animation_engine is

COMPONENT turnsignals_anim
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
			en : IN std_logic;
         led_out : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
	 
COMPONENT alarm_anim
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
			en : IN std_logic;
         led_out : OUT  std_logic_vector(2 downto 0)
			);
    END COMPONENT;
	 
COMPONENT brake_anim
	 PORT(
			clk : IN  std_logic;
         reset : IN  std_logic;
			en : IN std_logic;
         led_out : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
	 
signal led_signal_R: std_logic_vector (2 downto 0);
signal led_signal_L : std_logic_vector (2 downto 0);
signal led_signal_A : std_logic_vector (2 downto 0);	 


begin
	    RIGHT: turnsignals_anim PORT MAP (
          clk => clk,
          reset => reset,
			 en => t_right,
          led_out => led_signal_R
        );
		  
		  LEFT: turnsignals_anim PORT MAP (
          clk => clk,
          reset => reset,
			 en => t_left,
          led_out => led_signal_L
        );
		  
		  ALARM : alarm_anim PORT MAP (
			 clk=> clk,
			 reset => reset,
			 en => t_alarm,
			 led_out => led_signal_A
		  );
		  
		  BRAKE : brake_anim PORT MAP (
			 clk=> clk,
			 reset => reset,
			 en => t_brake,
			 led_out => led_stop
		  );
			 
	led_left <= led_signal_L or led_signal_A;
	led_right <= led_signal_R or led_signal_A;

		  
end Behavioral;

