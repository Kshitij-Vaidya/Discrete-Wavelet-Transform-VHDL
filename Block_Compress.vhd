library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Block_Compress is 
port (clk, reset: in std_logic;
		  input_data1 : in STD_LOGIC_VECTOR(63 downto 0);
		  input_data2 : in STD_LOGIC_VECTOR(63 downto 0);
		  input_data3 : in STD_LOGIC_VECTOR(63 downto 0);
		  input_data4 : in STD_LOGIC_VECTOR(63 downto 0);
		  input_data5 : in STD_LOGIC_VECTOR(63 downto 0);
		  input_data6 : in STD_LOGIC_VECTOR(63 downto 0);
		  input_data7 : in STD_LOGIC_VECTOR(63 downto 0);
		  input_data8 : in STD_LOGIC_VECTOR(63 downto 0);
		  output_data1, output_data2, output_data3, output_data4 : out STD_LOGIC_VECTOR(63 downto 0);
		  output_data5, output_data6, output_data7, output_data8 : out STD_LOGIC_VECTOR(63 downto 0)
		);
end entity Block_Compress;

architecture Behavioral of Block_Compress is
	component Module_2D_wavelet is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        input_data1 : in STD_LOGIC_VECTOR(63 downto 0);
		  input_data2 : in STD_LOGIC_VECTOR(63 downto 0);
        output_data1 : out STD_LOGIC_VECTOR(63 downto 0);
		  output_data2: out STD_LOGIC_VECTOR(63 downto 0)
    );
end component Module_2D_wavelet;
begin 
	Block1: Module_2D_Wavelet port map (clk=>clk, reset=>reset, input_data1=>input_data1, input_data2=>input_data2, 
														output_data1=>output_data1, output_data2=>output_data5);
	Block2: Module_2D_Wavelet port map (clk=>clk, reset=>reset, input_data1=>input_data3, input_data2=>input_data4, 
														output_data1=>output_data2, output_data2=>output_data6);
	Block3: Module_2D_Wavelet port map (clk=>clk, reset=>reset, input_data1=>input_data5, input_data2=>input_data6, 
														output_data1=>output_data3, output_data2=>output_data7);
	Block4: Module_2D_Wavelet port map (clk=>clk, reset=>reset, input_data1=>input_data7, input_data2=>input_data8, 
														output_data1=>output_data4, output_data2=>output_data8);
end architecture Behavioral;