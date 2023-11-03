library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity HighPassFilter is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        input_data1 : in STD_LOGIC_VECTOR(7 downto 0);
		  input_data2 : in STD_LOGIC_VECTOR(7 downto 0);
        output_data : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity HighPassFilter;

architecture Behavioral of HighPassFilter is
    signal input1_new, input2_new : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    process (clk, reset)
    begin
        if rising_edge(clk) then
            input1_new(7)<='0';
				input2_new(7)<='0';
				input1_new(6 downto 0)<=input_data1(7 downto 1);
				input2_new(6 downto 0)<=input_data2(7 downto 1);
				output_data<=input1_new - input2_new;				
        end if;
    end process;
end architecture Behavioral;
