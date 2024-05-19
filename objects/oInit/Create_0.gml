/// @description Insert description here
// CREATE Event - oINIT

globalvar T1, T2, TIME;
T1		=	new TeamData() 
T2		=	new TeamData() 
TIME	=	90


#macro KEY				keyboard_check
#macro KEY_PRESSED	keyboard_check_pressed
#macro KEY_RELEASED	keyboard_check_released

#macro GAMEPAD				gamepad_button_check
#macro GAMEPAD_PRESSED		gamepad_button_check_pressed
#macro GAMEPAD_RELEASED	gamepad_button_check_released
#macro GAMEPAD_AXIS			gamepad_axis_value

// Player 1
#macro P1_KEYLEFT		max(KEY(ord("A")),			GAMEPAD(0,				gp_padl),		GAMEPAD_AXIS(0,gp_axislh),	0)
#macro P1_KEYRIGHT		max(KEY(ord("D")),			GAMEPAD(0,				gp_padr),		-GAMEPAD_AXIS(0,gp_axislh),	0)
#macro P1_KEYJUMP		max(KEY(ord("W")),			GAMEPAD(0,				gp_padu),		-GAMEPAD_AXIS(0,gp_axislv),	0)
#macro P1_KEYCROUCH		max(KEY(ord("S")),			GAMEPAD(0,				gp_padd),		GAMEPAD_AXIS(0,gp_axislv),	0)
#macro P1_KEYLP			max(KEY(ord("J")),			GAMEPAD(0,				gp_face1))
#macro P1_KEYLK			max(KEY(ord("K")),			GAMEPAD(0,				gp_face2))
#macro P1_KEYHP			max(KEY(ord("U")),			GAMEPAD(0,				gp_face3))
#macro P1_KEYHK			max(KEY(ord("I")),			GAMEPAD(0,				gp_face4))
#macro P1_KEYASSIST1	max(KEY(ord("L")),			GAMEPAD(0,				gp_shoulderl))
#macro P1_KEYASSIST2	max(KEY(ord("O")),			GAMEPAD(0,				gp_shoulderr))
#macro P1_KEYSWAP		max(KEY(ord("P")),			GAMEPAD_PRESSED(0,	gp_shoulderrb))
#macro P1_KEYSTART		max(KEY(ord("ENTER")),		GAMEPAD_PRESSED(0,	gp_start))
// Player 2
#macro P2_KEYLEFT		max(KEY(ord("LEFT")),		GAMEPAD(1,				gp_padl),		GAMEPAD_AXIS(1, gp_axislh),	0)
#macro P2_KEYRIGHT		max(KEY(ord("RIGHT")),		GAMEPAD(1,				gp_padr),		-GAMEPAD_AXIS(1, gp_axislh),	0)
#macro P2_KEYJUMP		max(KEY(ord("UP")),			GAMEPAD(1,				gp_padu),		-GAMEPAD_AXIS(1, gp_axislv),	0)
#macro P2_KEYCROUCH		max(KEY(ord("DOWN")),		GAMEPAD(1,				gp_padd),		GAMEPAD_AXIS(1, gp_axislv),	0)
#macro P2_KEYLP			max(KEY(ord("NUMPAD1")),	GAMEPAD(1,				gp_face1))
#macro P2_KEYLK			max(KEY(ord("NUMPAD2")),	GAMEPAD(1,				gp_face2))
#macro P2_KEYHP			max(KEY(ord("NUMPAD4")),	GAMEPAD(1,				gp_face3))
#macro P2_KEYHK			max(KEY(ord("NUMPAD5")),	GAMEPAD(1,				gp_face4))
#macro P2_KEYASSIST1	max(KEY(ord("NUMPAD3")),	GAMEPAD(1,				gp_shoulderl))
#macro P2_KEYASSIST2	max(KEY(ord("NUMPAD0")),	GAMEPAD(1,				gp_shoulderr))
#macro P2_KEYSWAP		max(KEY(ord("DECIMAL")),	GAMEPAD_PRESSED(1,	gp_shoulderrb))
#macro P2_KEYSTART		max(KEY(ord("RETURN")),	GAMEPAD_PRESSED(1,	gp_start))

globalvar MODES;
MODES = ["Battle", "Other"]

globalvar CHARACTER;
CHARACTER = [];
array_push(CHARACTER, new CharacterData("Malachi and Darla",			"A 100% original character with unique abilities and a mysterious background.",											"Original Generation",						"",	[],	{
	Portraits: sMalachiDarlaPortrait,
}));
array_push(CHARACTER, new CharacterData("SpongeBob SquarePants",	"The optimistic and enthusiastic sea sponge who lives in a pineapple under the sea.",									"SpongeBob SquarePants",					"",	[],	{
	Portraits: sSpongeBobPortrait,
}));
array_push(CHARACTER, new CharacterData("Mickey Mouse",				"The iconic Disney character in his adventurous form.",																		"Epic Mickey",								"",	[],	{}));
array_push(CHARACTER, new CharacterData("Dexter and Dee Dee",		"Dexter, the boy genius, and his meddlesome sister Dee Dee from the animated series Dexter's Laboratory.",		"Dexter's Laboratory",					"",	[],	{}));
array_push(CHARACTER, new CharacterData("Shrek",						"The lovable ogre from the swamp with a heart of gold.",																	"Shrek",										"",	[],	{}));
array_push(CHARACTER, new CharacterData("Wallace and Gromit",		"The eccentric inventor Wallace and his intelligent dog Gromit, known for their quirky adventures.",					"Wallace and Gromit",						"",	[],	{}));
array_push(CHARACTER, new CharacterData("PAC-MAN",					"The classic arcade character who navigates mazes and eats pellets while avoiding ghosts.",							"Pac-Man",									"",	[],	{}));
array_push(CHARACTER, new CharacterData("Pac-Man",					"The reimagined version of PAC-MAN from the Pac-Man and the Ghostly Adventures series.",							"Pac-Man and the Ghostly Adventures",	"",	[],	{}));

globalvar STAGE;
STAGE = [];
array_push(STAGE,	new StageData("Honolulu",															"Malachi and Darla's stage. Set on a vibrant platform with hula dancers performing in the background. The dancers will cheer enthusiastically whenever a character is KOed.",									"Original Generation"));
array_push(STAGE,	new StageData("Conch Street",													"The iconic neighborhood where SpongeBob lives. The stage features familiar sights from Bikini Bottom, with various sea creatures and characters cheering on the fighters.",									"SpongeBob SquarePants"));
array_push(STAGE,	new StageData("Steamboat Willie",												"A classic black-and-white stage inspired by Mickey Mouse's early adventures. The vintage setting brings a nostalgic feel, complete with the steamboat and whimsical animations.",								"Epic Mickey"));
array_push(STAGE,	new StageData("Dexter's Laboratory",											"Step into the high-tech lab of Dexter, the boy genius. The stage is filled with scientific gadgets and experiments, with Dee Dee often seen causing playful chaos in the background.",							"Dexter's Laboratory"));
array_push(STAGE,	new StageData("Shrek's Swamp",													"Fight in the lush, green swamp where Shrek makes his home. The swamp is filled with various fairy tale creatures who react to the action, adding a magical touch to the battle.",								"Shrek"));
array_push(STAGE,	new StageData("The Moon - A Grand Day Out",									"A whimsical stage set on the Moon from Wallace and Gromit's adventure. Expect to see quirky inventions and cheese-themed scenery as Wallace and Gromit cheer you on.",										"Wallace and Gromit"));
array_push(STAGE,	new StageData("West Wallaby Zoo - The Wrong Trousers / Project Zoo",	"A bustling zoo setting with various animals and zany contraptions. Wallace and Gromit can be seen interacting with the environment, adding to the stage's charm.",												"Wallace and Gromit"));
array_push(STAGE,	new StageData("Pac-Maze",														"Navigate the iconic maze from the classic Pac-Man arcade game. The stage features ghosts, power pellets, and the nostalgic feel of the original game, with twists to keep the action lively.",				"Pac-Man"));
array_push(STAGE,	new StageData("Pacopolis",														"A vibrant, modern stage based on Pac-Man and the Ghostly Adventures. The setting includes futuristic elements and various characters from the series, creating an exciting backdrop for battles.",		"Pac-Man and the Ghostly Adventures"));
array_push(STAGE,	new StageData("The Resistance Hotel",											"A bustling hotel serving as a haven for various heroes. The background is filled with cameo appearances by potential future playable characters, creating an atmosphere of hope and camaraderie.",		"Original Generation"));
array_push(STAGE,	new StageData("Villains Reality",													"A desolate wasteland where the game's most notorious villains gather. The environment is dark and foreboding, with the villains cheering and reacting dramatically to each KO, heightening the tension.",	"Original Generation"));

globalvar CREDIT;
CREDIT = []
// Team
array_push(CREDIT,	new CreditData("TEAM",""))
array_push(CREDIT,	new CreditData("",""))
array_push(CREDIT,	new CreditData("Project Lead",				["Kio"]))
array_push(CREDIT,	new CreditData("Programmers",				["Shiraga",			"Sato",	"BadGameDev",	"Joshus_sarn",	"Whisperer"]))
array_push(CREDIT,	new CreditData("Artists",						["Kio",	"arli",				"Spyder, 愚かな性交",	"Lucien Sawaqov",	"The Elite"]))
array_push(CREDIT,	new CreditData("Concept Designers",		["Kio",	"CrockerJack",		"Freaky Chips"]))
array_push(CREDIT,	new CreditData("Composers",					["SubjectLoser"]))
// Character/Stage Credit
array_push(CREDIT,	new CreditData("",""))
array_push(CREDIT,	new CreditData("Licensed Properites",""))
array_push(CREDIT,	new CreditData("",""))
array_push(CREDIT,	new CreditData("Dexter's Laboratory",		["Cartoon Network", "Warner Bros. Discovery"]));
array_push(CREDIT,	new CreditData("Mickey Mouse",				"Disney"));
array_push(CREDIT,	new CreditData("PAC-MAN",					"Bandai Namco Entertainment"));
array_push(CREDIT,	new CreditData("Shrek",						"DreamWorks Animation LLC"));
array_push(CREDIT,	new CreditData("SpongeBob SquarePants",	["Nickelodeon", "Viacom International", "Paramount Global"]));
array_push(CREDIT,	new CreditData("Wallace and Gromit",		"Aardman Animations"));

globalvar ENCYCLOPEDIA;
ENCYCLOPEDIA = []
array_push(ENCYCLOPEDIA, new EncyclopediaData("T", "Team"));
array_push(ENCYCLOPEDIA, new EncyclopediaData("T1", "Player 1's team"));
array_push(ENCYCLOPEDIA, new EncyclopediaData("T2", "Player 2's team"));
array_push(ENCYCLOPEDIA, new EncyclopediaData("Point Character", "The main character on each team, selected first. Also known as the character that initiates interactions with Player 2's Point Character."));
array_push(ENCYCLOPEDIA, new EncyclopediaData("Mid Character", "The character selected second on a team."));
array_push(ENCYCLOPEDIA, new EncyclopediaData("Anchor Character", "The character selected third on a team."));

room_goto_next()