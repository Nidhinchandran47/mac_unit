----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2022 19:15:19
-- Design Name: 
-- Module Name: and_array - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity and_array is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (3 downto 0));
end and_array;

architecture Behavioral of and_array is

component and_gate
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           y : out STD_LOGIC);
end component;

begin

a1: and_gate port map(a=>a(0),b=>b,y=>y(0));
a2: and_gate port map(a=>a(1),b=>b,y=>y(1));
a3: and_gate port map(a=>a(2),b=>b,y=>y(2));
a4: and_gate port map(a=>a(3),b=>b,y=>y(3));

end Behavioral;
