library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all; 

entity HEX41 is
    port(
        SETUP: in std_logic_vector(1 downto 0);
        E5: in std_logic;
        E6: in std_logic;
        end_round_aux: in std_logic;
        s: out std_logic_vector(6 downto 0)
    );
end HEX41;

architecture teste of HEX41 is
    signal S1,S2,V1,V2,V3,V4: std_logic_vector(6 downto 0);
    signal X: std_logic_vector(3 downto 0);

    component multiplexador2x1 is
        port (a: in std_logic_vector (6 downto 0);
              b: in std_logic_vector (6 downto 0);
              c: in std_logic;
              d: out std_logic_vector(6 downto 0));
    end component;

    component disp7seg is
        port (a: in std_logic_vector(3 downto 0);
              b: out std_logic_vector(6 downto 0)
              );
    end component;

begin

    X <= "00" & SETUP;
    V2 <= "0101011";
    V3 <= "0001000";
    V4 <= "0101111";


    D7S1: disp7seg port map(a => X,
                            b => V1);

    MUX1: multiplexador2x1 port map(a => V1,
                                    b => V2,
                                    c => E5,
                                    d => S1);
    MUX2: multiplexador2x1 port map(a => V3,
                                    b => V4,
                                    c => end_round_aux,
                                    d => S2);
    MUX3: multiplexador2x1 port map(a => S1,
                                    b => S2,
                                    c => E6,
                                    d => s);
end teste;