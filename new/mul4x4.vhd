----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2022 19:21:49
-- Design Name: 
-- Module Name: mul4x4 - Behavioral
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

entity mul4x4 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           y0 : out STD_LOGIC_VECTOR (3 downto 0);
           y1 : out STD_LOGIC_VECTOR (3 downto 0);
           y2 : out STD_LOGIC_VECTOR (3 downto 0);
           y3 : out STD_LOGIC_VECTOR (3 downto 0));
end mul4x4;

architecture Behavioral of mul4x4 is

component and_array
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

begin

s1: and_array port map(a=>a,b=>b(0),y=>y0);
s2: and_array port map(a=>a,b=>b(1),y=>y1);
s3: and_array port map(a=>a,b=>b(2),y=>y2);
s4: and_array port map(a=>a,b=>b(3),y=>y3);


end Behavioral;
