library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


-- Defining the input and output ports of the 8 bit adder
entity parallel_adder4 is

-- Port Declaration
port ( input0, input1 : in std_logic_vector(3 downto 0);
		 carry_in : in std_logic;
		 sum : out std_logic_vector (3 downto 0);
		 carry_out : out std_logic
		 );
end parallel_adder4;

-- Defining the black box of the adder(functionality of the adder)
architecture parallel_adder4_function of parallel_adder4 is 
-- Wire Declaration
signal sum_4 : std_logic_vector (4 downto 0);
begin
-- Experession for 4 input addition 
sum_4 <= '0'& input0 + input1 + carry_in;
-- Seperating the bits as sum and carry bits
sum <= sum_4(3 downto 0);
carry_out <= sum_4(4);
end parallel_adder4_function;
-- End of the program

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--Declaration of the input and output pins of 8 bit adder
entity parallel_adder8 is 
	port (A : in std_logic_vector (7 downto 0);
			B : in std_logic_vector (7 downto 0);
			c_in : in std_logic;
			sum : out std_logic_vector (7 downto 0);
			c_out: out std_logic
			);
end parallel_adder8;

--Describe the functionality of the adder 8 bit using 4 bit IC74LS283
architecture parallel_adder8_functional of parallel_adder8 is

--Calling/Declaration of the component of 4 bit adder
component parallel_adder4 is 
	port ( input0, input1 : in std_logic_vector(3 downto 0);
			carry_in : in std_logic;
			sum : out std_logic_vector (3 downto 0);
			carry_out : out std_logic
		   );
end component;

-- Wire Declaration/Internal Signals 
signal carry : std_logic;

begin 

-- Calling the component to add 8 bit inputs
stage_1: parallel_adder4 port map(input0=>A(3 downto 0),input1=>B(3 downto 0),carry_in=>c_in,sum=>sum(3 downto 0),carry_out=>carry);
stage_2: parallel_adder4 port map(input0=>A(7 downto 4),input1=>B(7 downto 4),carry_in=>carry,sum=>sum(7 downto 4),carry_out=>c_out);


end parallel_adder8_functional;
-- End of the program

