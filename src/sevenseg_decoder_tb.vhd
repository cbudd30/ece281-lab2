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
    
    signal sw : std_logic_vector(3 downto 0);
    signal o_seg_n : std_logic_vector(6 downto 0);
    signal seg : std_logic_vector(6 downto 0);
    
   begin
   sevenseg1 : sevenseg_decoder
        port map(
	       i_Hex(0) => sw(0),
	       i_Hex(1) => sw(1),
	       i_Hex(2) => sw(2),
	       i_Hex(3) => sw(3),
	       
	       o_seg_n => seg
	       );
            
    
    
    test_process : process 
	begin
        -- Octal test cases based on full adder truth table
        -- https://usafa-ece.github.io/ece281-book/ICE/ICE3.html#full-adder-truth
        sw <= o"0"; wait for 10 ns;
            assert seg = "1111110" report "Error on input o0" severity failure;
        sw <= "0001"; wait for 10 ns;
            assert seg = "0110000" report "Error on input o1" severity failure;
        sw <= "0010"; wait for 10 ns;
            assert seg = "1101101" report "Error on input o2" severity failure;
        sw <= "0011"; wait for 10 ns;
            assert seg = "1111001" report "Error on input o3" severity failure;
        sw <= "0100"; wait for 10 ns;
            assert seg = "0110011" report "Error on input o4" severity failure;
        sw <= "1000"; wait for 10 ns;
            assert seg = "1111111" report "Error on input o7" severity failure; 
        sw <= "1001"; wait for 10 ns;
            assert seg = "1110011" report "Error on input o7" severity failure;                                         
                                
		wait; -- wait forever
		
	end process;


end Behavioral;
