library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity AveragingFilter is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        input_data1 : in STD_LOGIC_VECTOR(7 downto 0);
		  input_data2 : in STD_LOGIC_VECTOR(7 downto 0);
        output_data : out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity AveragingFilter;

architecture Behavioral of AveragingFilter is
    --signal sum : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    --signal counter : integer := 0;
    --constant AVERAGING_SIZE : integer := 2; -- Adjust this for different averaging window sizes
	signal input1_new, input2_new: std_logic_vector(7 downto 0);
begin
    process (clk, reset)
    begin
        if rising_edge(clk) then
            input1_new(7)<='0';
				input2_new(7)<='0';
				input1_new(6 downto 0)<=input_data1(7 downto 1);
				input2_new(6 downto 0)<=input_data2(7 downto 1);
				output_data<=input1_new + input2_new;
        end if;
    end process;

end architecture Behavioral;

