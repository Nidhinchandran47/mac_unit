----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2022 19:36:15
-- Design Name: 
-- Module Name: multiplier - Behavioral
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

entity multiplier is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end multiplier;

architecture Behavioral of multiplier is

component mul4x4
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           y0 : out STD_LOGIC_VECTOR (3 downto 0);
           y1 : out STD_LOGIC_VECTOR (3 downto 0);
           y2 : out STD_LOGIC_VECTOR (3 downto 0);
           y3 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component bit4_adder
Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
           Y : in STD_LOGIC_VECTOR (3 downto 0);
           carryIn : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (3 downto 0);
           carryOut : out STD_LOGIC);
end component;

signal k0,k1,k2,k3,sm:std_logic_vector(3 downto 0);
signal s0,s1,s2,s3,s4,s5:std_logic;
signal c0,c1:std_logic;
begin

d1: mul4x4 port map(a=>a,b=>b,y0=>k0,y1=>k1,y2=>k2,y3=>k3);
d2: bit4_adder port map(X=>k0,Y(0)=>'0',Y(1)=>k1(0),Y(2)=>k1(1),y(3)=>k1(2),carryIn=>'0',Z(0)=>y(0),Z(1)=>y(1),Z(2)=>s0,Z(3)=>s1,carryOut=>c0);
d3: bit4_adder port map(X(0)=>s0,X(1)=>s1,X(2)=>k1(3),X(3)=>'0',Y(0)=>k2(0),Y(1)=>k2(1),Y(2)=>k2(2),Y(3)=>k2(3),carryIn=>'0',Z(0)=>y(2),Z(1)=>s2,Z(2)=>s3,Z(3)=>s4,carryOut=>c1);
d4: bit4_adder port map(X(0)=>s2,X(1)=>s3,X(2)=>s4,X(3)=>c1,Y(0)=>k3(0),Y(1)=>k3(1),Y(2)=>k3(2),Y(3)=>k3(3),carryIn=>'0',Z=>sm,carryOut=>s5);
d5: bit4_adder port map(X=>sm,Y(0)=>'0',Y(1)=>c0,Y(2)=>'0',Y(3)=>s5,carryIn=>'0',Z(0)=>y(3),Z(1)=>y(4),Z(2)=>y(5),Z(3)=>y(6),carryOut=>y(7));


end Behavioral;
