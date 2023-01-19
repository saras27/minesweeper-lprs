
-------------------------------------------------------
-- Logicko projektovanje racunarskih sistema 1
-- 2011/2012,2020
--
-- Data RAM
--
-- author:
-- Ivan Kastelan (ivan.kastelan@rt-rk.com)
-- Milos Subotic (milos.subotic@uns.ac.rs)
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity data_ram is
	port(
		iCLK  : in  std_logic;
		inRST : in  std_logic;
		iA    : in  std_logic_vector(7 downto 0);
		iD    : in  std_logic_vector(15 downto 0);
		iWE   : in  std_logic;
		oQ    : out std_logic_vector(15 downto 0)
	);
end entity data_ram;

architecture Behavioral of data_ram is

	type tMEM is array(0 to 255) of std_logic_vector(15 downto 0);
	signal rMEM : tMEM;
	signal sMEM : tMEM := (others => x"0000");

begin

	process(iCLK, inRST)
	begin
		if inRST = '0' then
			for i in 0 to 255 loop
				rMEM(i) <= sMEM(i);
			end loop;
		elsif rising_edge(iCLK) then
			if iWE = '1' then
				rMEM(conv_integer(iA)) <= iD;
			end if;
		end if;
	end process;
-- ubaciti sadrzaj *.dat datoteke generisane pomocu lprsasm ------
sMEM(0) <= x"0008";
sMEM(1) <= x"004b";
sMEM(2) <= x"0000";
sMEM(3) <= x"0028";
sMEM(4) <= x"0100";
sMEM(5) <= x"0140";
sMEM(6) <= x"0202";
sMEM(7) <= x"008d";
sMEM(8) <= x"0003";
sMEM(9) <= x"0003";
sMEM(10) <= x"0000";
sMEM(11) <= x"0000";
sMEM(12) <= x"0000";
sMEM(13) <= x"0000";
sMEM(14) <= x"0000";
sMEM(15) <= x"0000";
sMEM(16) <= x"0000";
sMEM(17) <= x"0000";
sMEM(18) <= x"0000";
sMEM(19) <= x"0008";
sMEM(20) <= x"0000";
sMEM(21) <= x"0000";
sMEM(22) <= x"0000";
sMEM(23) <= x"0000";
sMEM(24) <= x"0000";
sMEM(25) <= x"0000";
sMEM(26) <= x"0000";
sMEM(27) <= x"0000";
sMEM(28) <= x"0000";
sMEM(29) <= x"0000";
sMEM(30) <= x"0000";
sMEM(31) <= x"0000";
sMEM(32) <= x"0000";
sMEM(33) <= x"0000";
sMEM(34) <= x"0000";
sMEM(35) <= x"0000";
sMEM(36) <= x"0000";
sMEM(37) <= x"0000";
sMEM(38) <= x"0000";
sMEM(39) <= x"0000";
sMEM(40) <= x"0000";
sMEM(41) <= x"0000";
sMEM(42) <= x"0000";
sMEM(43) <= x"0000";
sMEM(44) <= x"0000";
sMEM(45) <= x"0000";
sMEM(46) <= x"0000";
sMEM(47) <= x"0000";
sMEM(48) <= x"0000";
sMEM(49) <= x"0000";
sMEM(50) <= x"0000";
sMEM(51) <= x"0000";
sMEM(52) <= x"0000";
sMEM(53) <= x"0000";
sMEM(54) <= x"0000";
sMEM(55) <= x"0000";
sMEM(56) <= x"0000";
sMEM(57) <= x"0000";
sMEM(58) <= x"0000";
sMEM(59) <= x"0000";
sMEM(60) <= x"0000";
sMEM(61) <= x"0000";
sMEM(62) <= x"0008";
sMEM(63) <= x"0008";
sMEM(64) <= x"0000";
sMEM(65) <= x"0000";
sMEM(66) <= x"0000";
sMEM(67) <= x"0000";
sMEM(68) <= x"0000";
sMEM(69) <= x"0000";
sMEM(70) <= x"0008";
sMEM(71) <= x"0008";
sMEM(72) <= x"0000";
sMEM(73) <= x"0000";
sMEM(74) <= x"ffff";
sMEM(75) <= x"0000";
sMEM(76) <= x"0000";
sMEM(77) <= x"0000";
sMEM(78) <= x"0000";
sMEM(79) <= x"0000";
sMEM(80) <= x"0000";
sMEM(81) <= x"0000";
sMEM(82) <= x"0000";
sMEM(83) <= x"0000";
sMEM(84) <= x"0000";
sMEM(85) <= x"0000";
sMEM(86) <= x"0000";
sMEM(87) <= x"0000";
sMEM(88) <= x"0000";
sMEM(89) <= x"0000";
sMEM(90) <= x"0000";
sMEM(91) <= x"0000";
sMEM(92) <= x"0000";
sMEM(93) <= x"0000";
sMEM(94) <= x"0000";
sMEM(95) <= x"0000";
sMEM(96) <= x"0000";
sMEM(97) <= x"0000";
sMEM(98) <= x"0000";
sMEM(99) <= x"0000";
sMEM(100) <= x"0000";
sMEM(101) <= x"0000";
sMEM(102) <= x"0000";
sMEM(103) <= x"0000";
sMEM(104) <= x"0000";
sMEM(105) <= x"0000";
sMEM(106) <= x"0000";
sMEM(107) <= x"0000";
sMEM(108) <= x"0000";
sMEM(109) <= x"0000";
sMEM(110) <= x"0000";
sMEM(111) <= x"0000";
sMEM(112) <= x"0000";
sMEM(113) <= x"0000";
sMEM(114) <= x"0000";
sMEM(115) <= x"0000";
sMEM(116) <= x"0000";
sMEM(117) <= x"0000";
sMEM(118) <= x"0000";
sMEM(119) <= x"0000";
sMEM(120) <= x"0000";
sMEM(121) <= x"0000";
sMEM(122) <= x"0000";
sMEM(123) <= x"0000";
sMEM(124) <= x"0000";
sMEM(125) <= x"0000";
sMEM(126) <= x"0000";
sMEM(127) <= x"0000";
sMEM(128) <= x"0000";
sMEM(129) <= x"0000";
sMEM(130) <= x"0000";
sMEM(131) <= x"0000";
sMEM(132) <= x"0000";
sMEM(133) <= x"0000";
sMEM(134) <= x"0000";
sMEM(135) <= x"0000";
sMEM(136) <= x"0000";
sMEM(137) <= x"0000";
sMEM(138) <= x"0000";
sMEM(139) <= x"ffff";
sMEM(140) <= x"0000";
sMEM(141) <= x"ffff";
------------------------------------------------------------------
	
	oQ <= rMEM(conv_integer(iA));

end Behavioral;
