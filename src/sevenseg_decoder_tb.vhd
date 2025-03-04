----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 09:03:29 PM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

    component sevenseg_decoder is
    port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
    end component sevenseg_decoder;
    
    signal w_seg_n : std_logic_vector(6 downto 0);
    signal w_hex : std_logic_vector(3 downto 0);
    
   begin
   sevenseg1 : sevenseg_decoder
        port map(
	       i_Hex => w_hex,
	       o_seg_n => w_seg_n
	       );
            
    
    
    test_process : process 
	begin
	   for i in 0 to 15 loop 
	       w_hex <= std_logic_vector(to_unsigned(i,4));
	       wait for 20 ns;
	   end loop;
--        sw <= o"0000"; wait for 10 ns;
--            assert seg = not "1111110" report "Error on input o0" severity failure;
--        sw <= "0001"; wait for 10 ns;
--            assert seg = not "0110000" report "Error on input o1" severity failure;
--        sw <= "0010"; wait for 10 ns;
--            assert seg = not "1101101" report "Error on input o2" severity failure;
--        sw <= "0011"; wait for 10 ns;
--            assert seg = not "1111001" report "Error on input o3" severity failure;
--        sw <= "0100"; wait for 10 ns;
--            assert seg = not "0110011" report "Error on input o4" severity failure;
--        sw <= "1000"; wait for 10 ns;
--            assert seg = not "1111111" report "Error on input o8" severity failure; 
--        sw <= "1001"; wait for 10 ns;
--            assert seg = not "1110011" report "Error on input oA" severity failure;                                         
                                
		wait; -- wait forever
		
	end process;

end Behavioral;
