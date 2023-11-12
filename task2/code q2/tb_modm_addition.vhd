library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.ALL;
use work.dar_modm_multiplier_parameters.all;
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb iS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
 component dar_modm_multiplier is
    port (
      x, y: in std_logic_vector(K-1 downto 0);
      clk, reset, start: in std_logic;
      z: out std_logic_vector(K-1 downto 0);
      done: out std_logic
    );
 end component;
   --Inputs
   signal x : std_logic_vector(7 downto 0) := (others => '0');
   signal y : std_logic_vector(7 downto 0) := (others => '0');
  
   signal z : std_logic_vector(7 downto 0) := (others => '0');
   signal clk,done,reset, start:  std_logic := '0';
 
BEGIN
     clk <= NOT(clk) AFTER 20 NS; 
	-- Instantiate the Unit Under Test (UUT)
  uut: dar_modm_multiplier PORT MAP (
            x => x,
            y => y,
            z => z,
          
            reset=> reset,
            start => start,
            clk => clk,
            done => done
            
          );

   -- Stimulus process
    stim_proc: process
    begin        
         reset <= '1';
         start <= '0';
         x <= std_logic_vector(to_unsigned(6, 8));
         y <= std_logic_vector(to_unsigned(2, 8));
             
       wait for 100 ns;    
         reset <= '0';
       wait for 100 ns;    
         start <= '1';
       wait;
     
   end process;

END;
