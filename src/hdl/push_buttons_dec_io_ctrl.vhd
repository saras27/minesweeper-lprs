	
----------------------------------------------------------------------------------
-- Logicko projektovanje racunarskih sistema 1
-- 2020
--
-- Input/Output controler for RGB matrix
--
-- authors:
-- Milos Subotic (milos.subotic@uns.ac.rs)
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

library work;

entity push_buttons_dec_io_ctrl is
	port(
		iCLK       : in  std_logic;
		inRST      : in  std_logic;
		iPB_UP     : in  std_logic;
		iPB_DOWN   : in  std_logic;
		iPB_LEFT   : in  std_logic;
		iPB_RIGHT  : in  std_logic;
		iBUS_A     : in  std_logic_vector(7 downto 0);
		oBUS_RD    : out std_logic_vector(15 downto 0);
		iBUS_WD    : in  std_logic_vector(15 downto 0);
		iBUS_WE    : in  std_logic;
		
		--the stuff I added
		iread_user_input : in std_logic_vector(1 downto 0);
		iPB_CENTAR : in std_logic
	);
end entity push_buttons_dec_io_ctrl;

architecture Behavioral of push_buttons_dec_io_ctrl is
	
	signal sRST_CURSOR_X : std_logic := '1';
	signal sMOVE_CURSOR_X : std_logic_vector(15 downto 0);
	
	signal sRST_CURSOR_Y : std_logic := '1';
	signal sMOVE_CURSOR_Y : std_logic_vector(15 downto 0);
	
	signal sRST_CENTER_PRESSED : std_logic := '1';
	signal sCENTER_PRESSED : std_logic;
	

begin

	process(iread_user_input, iBUS_A, sRST_CURSOR_X, sRST_CURSOR_Y, sMOVE_CURSOR_X, sMOVE_CURSOR_Y, iCLK, inRST, iPB_UP, iPB_DOWN, iPB_LEFT, iPB_RIGHT)
	begin
		
		if (iread_user_input = "10") 
		then
		
			case iBUS_A is
				when x"00" =>
					oBUS_RD <= sMOVE_CURSOR_X;
					sRST_CURSOR_X <= '0';
				when x"01" =>
					oBUS_RD <= sMOVE_CURSOR_Y;
					sRST_CURSOR_Y <= '0';
				when x"02" => 
					oBUS_RD <= "000000000000000" & sCENTER_PRESSED;
					sRST_CENTER_PRESSED <= '0';
				when others =>
					oBUS_RD <= (others => '0');
			end case;
		
		else	
			oBUS_RD <= (others => '0');
			
			if (inRST = '0') then
				sMOVE_CURSOR_X <= (others=>'0');
				sMOVE_CURSOR_Y <= (others=>'0');
				sCENTER_PRESSED <= '0';
			elsif rising_edge(iCLK) then
				
				if (sRST_CURSOR_X = '0') then
					sMOVE_CURSOR_X <= conv_std_logic_vector(0, 16);
					sRST_CURSOR_X <= '1';
				elsif (iPB_LEFT = '1') then
					sMOVE_CURSOR_X <= conv_std_logic_vector(-1, 16);
				elsif (iPB_RIGHT = '1') then
					sMOVE_CURSOR_X <= conv_std_logic_vector(1, 16);
				end if;
				
				if (sRST_CURSOR_Y = '0') then
					sMOVE_CURSOR_Y <= conv_std_logic_vector(0, 16);
					sRST_CURSOR_Y <= '1';
				elsif (iPB_UP = '1') then
					sMOVE_CURSOR_Y <= conv_std_logic_vector(-1, 16);
				elsif (iPB_DOWN = '1') then
					sMOVE_CURSOR_Y <= conv_std_logic_vector(1, 16);
				end if;
				
				if (sRST_CENTER_PRESSED = '0') then
					sCENTER_PRESSED <= '0';
					sRST_CENTER_PRESSED <= '1';
				elsif (iPB_CENTAR = '1') then
					sCENTER_PRESSED <= '1';
				end if;
				
			end if;
		
		
		end if;
		
	end process;
	
	
end architecture;

