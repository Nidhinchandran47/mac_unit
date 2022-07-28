library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity accumulator is
  port (
    DIN:  in  std_logic_vector(7 downto 0);
    CLK:  in  std_logic;
    RST:  in  std_logic;
    DOUT: out std_logic_vector(7 downto 0)
  );
end entity accumulator;

architecture behave of accumulator is

component bit8_adder
    Port ( a0 : in STD_LOGIC_VECTOR (3 downto 0);
           a1 : in STD_LOGIC_VECTOR (3 downto 0);
           b0 : in STD_LOGIC_VECTOR (3 downto 0);
           b1 : in STD_LOGIC_VECTOR (3 downto 0);
           sum1 : out STD_LOGIC_VECTOR (3 downto 0);
           sum2 : out STD_LOGIC_VECTOR (3 downto 0);
           cry : out STD_LOGIC);
end component;

component d_flipflop
   Port ( D : in std_logic_vector(7 downto 0);
           Q : out std_logic_vector(7 downto 0);
           Q_bar : out std_logic_vector(7 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end component;

  signal inp,acc_value : std_logic_vector(7 downto 0);

begin

adder: bit8_adder port map(a0=>DIN(3 downto 0),a1=>DIN(7 downto 4),b0=>acc_value(3 downto 0),b1=>acc_value(7 downto 4),sum1=>inp(3 downto 0),sum2=>inp(7 downto 4));
ff: d_flipflop port map(D=>inp,Q=>acc_value,clk=>CLK,rst=>RST);

DOUT <= acc_value;

end behave;