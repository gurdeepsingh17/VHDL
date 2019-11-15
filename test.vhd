LIBRARY ieee;

USE ieee.std_logic_1164.ALL;



--	Uncomment the following library declaration if using

--	arithmetic functions with Signed or Unsigned values

--USE ieee.numeric_std.ALL;



ENTITY Thunder_test_bench IS

END Thunder_test_bench;



ARCHITECTURE behavior OF Thunder_test_bench IS



-- Component Declaration for the Unit Under Test (UUT)



    COMPONENT Thunder_bird

    PORT(

clock : IN std_logic;

RESET : IN std_logic;

Right : IN std_logic;

Left : IN std_logic;

Halt : IN std_logic;

LA : OUT std_logic;

       LB : OUT std_logic;

LC : OUT std_logic;

RA : OUT std_logic;

RB : OUT std_logic;

RC : OUT std_logic;

Stop : OUT std_logic

);

END COMPONENT;
 
--Inputs

signal clock : std_logic := '0';

signal RESET : std_logic := '0';

signal Right : std_logic := '0';

signal Left : std_logic := '0';

signal Halt : std_logic := '0';



--Outputs

signal LA : std_logic;

signal LB : std_logic;

signal LC : std_logic;

signal RA : std_logic;

signal RB : std_logic;

signal RC : std_logic;

signal Stop : std_logic;



-- Clock period definitions

constant clock_period : time := 10 ns;



BEGIN

--	Instantiate the Unit Under Test (UUT) uut: Ford_CarPORT MAP (

clock => clock, RESET => RESET, Right => Right, Left => Left, Halt => Halt, LA=>LA,

LB=>LB, LC=>LCRA=>RARB=>RBRC=>RC
      stop=>stop );

--	Clock process definitions clock_process :process begin

clock <= '1';

wait for clock_period/2; clock <= '0';

wait for clock_period/2;

end process;


--	Stimulus process

stim_proc: process

begin

-- hold reset state for 100 ns.

RESET <= '1';

Right <='0';

Left <='0';

Halt <='0';

wait for 10 ns;

RESET <= '0';

Right <='1';

Left <='0';

Halt <='0';


wait for 10 ns;

Right <='0';
wait for 10 ns;

Halt <='1';

wait for 10 ns;

wait for 10 ns;

RESET <= '0';

Right <='0';

Left <='1';

Halt <='0';

wait for 10 ns;



Left <='0';

wait for 10 ns;



Left <='0';

wait for 10 ns;



Left <='0';

wait for 10 ns;



Left <='0';

wait for 10 ns;



Left <='0';

wait for 10 ns;

RESET <= '0';

Right <='0';

Left <='0';

Halt <='0';

-- insert stimulus here

end process;
END;
