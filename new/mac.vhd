----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2022 20:34:03
-- Design Name: 
-- Module Name: mac - Behavioral
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

entity mac is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           rst : in std_logic;
           output : out STD_LOGIC_VECTOR (7 downto 0));
end mac;

architecture Behavioral of mac is

component multiplier
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0)
           );
end component;

component accumulator
port (
    DIN:  in  std_logic_vector(7 downto 0);
    CLK:  in  std_logic;
    RST:  in  std_logic;
    DOUT: out std_logic_vector(7 downto 0)
  );
end component;

signal k1:std_logic_vector(7 downto 0);

begin

z1: multiplier port map(a,b,k1);
z2: accumulator port map(k1,clk,rst,output);


end Behavioral;
