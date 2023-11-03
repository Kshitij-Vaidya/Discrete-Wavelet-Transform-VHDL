library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Module_1D_wavelet is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        input_data1 : in STD_LOGIC_VECTOR(63 downto 0);
        output_data : out STD_LOGIC_VECTOR(63 downto 0)
    );
end entity Module_1D_wavelet;

architecture Behavioral of Module_1D_wavelet is
	component AveragingFilter is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        input_data1 : in STD_LOGIC_VECTOR(7 downto 0);
		  input_data2 : in STD_LOGIC_VECTOR(7 downto 0);
        output_data : out STD_LOGIC_VECTOR(7 downto 0)
    );
	end component AveragingFilter;
	
	component HighPassFilter is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        input_data1 : in STD_LOGIC_VECTOR(7 downto 0);
		  input_data2 : in STD_LOGIC_VECTOR(7 downto 0);
        output_data : out STD_LOGIC_VECTOR(7 downto 0)
    );
end component HighPassFilter;

	begin
		LP : for i in 0 to 3 generate
			Avg_Filter: AveragingFilter port map (clk => clk, reset=> reset, input_data1 => input_data1(8*i+7 downto 8*i), 
																input_data2 => input_data1(8*i+32+7 downto 8*i+32), 
																output_data => output_data(8*i+7 downto 8*i));
		end generate;
		HP : for i in 0 to 3 generate
			Sub_Filter: HighPassFilter port map (clk => clk, reset=> reset, input_data1 => input_data1(8*i+7 downto 8*i), 
																input_data2 => input_data1(8*i+7+32 downto 8*i+32), 
																output_data => output_data(8*i+7+32 downto 8*i+32));
		end generate;
end architecture Behavioral;


