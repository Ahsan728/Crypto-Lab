LIBRARY IEEE; USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.mod_mm_exponentiation_parm.ALL;
ENTITY test_mod_mm_exponentiation IS END test_mod_mm_exponentiation;

ARCHITECTURE test OF test_mod_mm_exponentiation IS
COMPONENT mod_mm_exponentiation IS 
  PORT(
    x, y: IN STD_LOGIC_VECTOR(k-1 DOWNTO 0);
    clk, reset, start:IN STD_LOGIC;
    z: OUT STD_LOGIC_VECTOR(k-1 DOWNTO 0);
    done: OUT STD_LOGIC
  );
END COMPONENT;

SIGNAL x, y, z: STD_LOGIC_VECTOR(k-1 DOWNTO 0);
SIGNAL reset, start, done: STD_LOGIC;
SIGNAL clk: STD_LOGIC := '0';

BEGIN

dut: mod_mm_exponentiation
PORT MAP(x => x, y => y, z => z, clk => clk, reset => reset, start => start, done => done);

clk <= NOT(clk) AFTER 1 nS;

test_vectors: PROCESS
BEGIN
    x <= "10000000";
    y <= (k-1 => '0', others => '1');
    reset <= '1';
    start <= '1';
    WAIT FOR 100 NS;
    reset <= '0';
    WAIT FOR 100 NS;
    start <= '0';
    WAIT FOR 100 NS;
    start <= '1';
    WAIT;
    
--    WAIT FOR 8000000 NS;
--    x <= (k-1 => '1', others => '0');
--    start <= '0';
--    WAIT FOR 100 NS;
--    start <= '1';

    END PROCESS;
    END test;