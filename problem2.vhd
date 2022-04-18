library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all;

entity timer_1s is
   port(Clock	: in   std_logic; -- freq = 100MHz
Resetn : in   std_logic;
tick 	: out std_logic); 
end timer_1s;


architecture behavioral of timer_1s is
   signal Count : unsigned(26 downto 0);
begin
   process (Clock, Resetn)
   begin
if rising_edge(Clock) then
if Resetn = '0' then
	Count <= (others => '0');
elsif Count = 100000 then
Count <= (others => '0');
else
Count <= Count + 1 ;
end if;  end if;
end process;
tick <= '1' when Count = 100000 else '0';
end behavioral ;