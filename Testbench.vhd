library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_textio.all;
use std.textio.all;

entity Testbench is 
end entity Testbench;


architecture Behav of Testbench is 
component Block_Compress is 
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
end component Block_Compress;

function to_std_logic_vector(x: bit_vector) return std_logic_vector is
  alias lx: bit_vector(1 to x'length) is x;
  variable ret_val: std_logic_vector(1 to x'length);
begin
  for I in 1 to x'length loop
	  if(lx(I) = '1') then
		 ret_val(I) := '1';
	  else
		 ret_val(I) := '0';
	  end if;
  end loop; 
  return ret_val;
end to_std_logic_vector;

function to_bit_vector(x: std_logic_vector) return bit_vector is
  alias lx: std_logic_vector(1 to x'length) is x;
  variable ret_val: bit_vector(1 to x'length);
begin
  for I in 1 to x'length loop
	  if(lx(I) = '1') then
		 ret_val(I) := '1';
	  else
		 ret_val(I) := '0';
	  end if;
  end loop; 
  return ret_val;
end to_bit_vector;

file input_file : text open read_mode is "512BitBinaryOutput.txt";
file output_file : text open write_mode is "output_file.txt";
	 
variable read_line : line;
variable write_line : line;

signal input_data, output_data: std_logic_vector(511 downto 0);
signal clk: std_logic;

begin
	Transform : Block_Compress port map (	input_data1 => input_data(511 downto 448),
														input_data2 => input_data(447 downto 384),
														input_data3 => input_data(383 downto 320),
														input_data4 => input_data(319 downto 256),
														input_data5 => input_data(255 downto 192),
														input_data6 => input_data(191 downto 128),
														input_data7 => input_data(127 downto 64),
														input_data8 => input_data(63 downto 0),
														clk => clk, reset => '0',
														output_data1 => output_data(511 downto 448),
														output_data2 => output_data(447 downto 384),
														output_data3 => output_data(383 downto 320),
														output_data4 => output_data(319 downto 256),
														output_data5 => output_data(255 downto 192),
														output_data6 => output_data(191 downto 128),
														output_data7 => output_data(127 downto 64),
														output_data8 => output_data(63 downto 0));
								
	process begin
		Clk <= '1';
		wait for 10 ns;
		Clk <= '0';
		wait for 10 ns;
	end process;

process begin 
    while not endfile(input_file) loop 
			readline(input_file, read_line);
			read(read_line, input_data_temp);  -- Assumes data in the file is formatted correctly
			input_data <= to_std_logic_vector(input_data_temp);
			wait for 15ns;
			-- Write the output_data to the output file
			write(writeline, output_data);  -- Format as needed
			writeline(output_file, writeline);
			wait for 5ns;
	  end loop;
	  
	  -- Close the files
	  file_close(input_file);
	  file_close(output_file);
	  
	  -- End the simulation
	  wait;
end process;
end architecture Behav;