library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Module_2D_wavelet is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        input_data1 : in STD_LOGIC_VECTOR(63 downto 0);
		  input_data2 : in STD_LOGIC_VECTOR(63 downto 0);
        output_data1 : out STD_LOGIC_VECTOR(63 downto 0);
		  output_data2: out STD_LOGIC_VECTOR(63 downto 0)
    );
end entity Module_2D_wavelet;

architecture Behavioral of Module_2D_wavelet is
	component Module_1D_wavelet is
		 Port (
			  clk : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  input_data1 : in STD_LOGIC_VECTOR(63 downto 0);
			  output_data : out STD_LOGIC_VECTOR(63 downto 0)
		 );
	end component Module_1D_wavelet;
	signal temp_data1, temp_data2: std_logic_vector(63 downto 0);
	begin 
		OneDM1: Module_1D_Wavelet port map (clk=>clk, reset=> reset, input_data1(63 downto 56)=>input_data1(63 downto 56),
																input_data1(55 downto 48)=>input_data1(47 downto 40),
																input_data1(47 downto 40)=>input_data1(31 downto 24),
																input_data1(39 downto 32)=>input_data1(15 downto 8),
																input_data1(31 downto 24)=>input_data1(55 downto 48),
																input_data1(23 downto 16)=>input_data1(39 downto 32),
																input_data1(15 downto 8)=>input_data1(23 downto 16),
																input_data1(7 downto 0)=>input_data1(7 downto 0),
																output_data=>temp_data1);
		OneDM2: Module_1D_Wavelet port map (clk=>clk, reset=> reset, input_data1(63 downto 56)=>input_data2(63 downto 56),
																input_data1(55 downto 48)=>input_data2(47 downto 40),
																input_data1(47 downto 40)=>input_data2(31 downto 24),
																input_data1(39 downto 32)=>input_data2(15 downto 8),
																input_data1(31 downto 24)=>input_data2(55 downto 48),
																input_data1(23 downto 16)=>input_data2(39 downto 32),
																input_data1(15 downto 8)=>input_data2(23 downto 16),
																input_data1(7 downto 0)=>input_data2(7 downto 0),
																output_data=>temp_data2);
		TwoDM1: Module_1D_Wavelet port map (clk=>clk, reset=>reset, input_data1(63 downto 32)=>temp_data1(63 downto 32), 
															input_data1(31 downto 0)=>temp_data2(63 downto 32), 
															output_data(63 downto 32) => output_data1(63 downto 32),
															output_data(31 downto 0) => output_data2(63 downto 32));
		TwoDM2: Module_1D_Wavelet port map (clk=>clk, reset=>reset, input_data1(63 downto 32)=>temp_data1(31 downto 0), 
															input_data1(31 downto 0)=>temp_data2(31 downto 0), 
															output_data(63 downto 32) => output_data1(31 downto 0),
															output_data(31 downto 0) => output_data2(31 downto 0));															
end architecture Behavioral;

	