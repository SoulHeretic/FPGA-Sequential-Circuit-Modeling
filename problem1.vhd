library ieee;
use ieee.std_logic_1164.all;

entity problem1 is
   port(
      clk   : in std_logic;
      reset : in std_logic;
      load : in std_logic;
      left   : in std_logic;
      din   : in std_logic_vector(3 downto 0);
      dout  : out std_logic_vector(3 downto 0)
   );
end problem1;

architecture behavioral of problem1 is
   signal reg  : std_logic_vector(3 downto 0);
begin
   process(clk)
   begin
      if rising_edge(clk) then
         if reset = '1' then
            reg <= (others => '0');
         else
            if load = '0' then
                if left = '0' then
                    reg <= reg(3 downto 0); --this means to shift right.
                else
                    reg(3 downto 1) <= reg(2 downto 0); -- shift left
                end if;
            else
               reg <= din;  --load  in parallel
            end if;
         end if;
      end if;
   
   
   
   -- read reg to output dout
   if load = '1' then
        dout <= reg;
   else
    if left = '0' then
        dout <= reg(2 downto 0) & din(0);
    else
        dout <= din(0) & reg(3 downto 1);
   end if;
   end if;
   end process;
    
end behavioral;