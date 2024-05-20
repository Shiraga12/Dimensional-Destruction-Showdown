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
MODES = []
MODES[0]	=	["Battle",			"Other"]
MODES[1]	=	["Versus",		"Tutorial",	"Training"]
MODES[2]	=	["Encyclopedia",	"Settings"]

globalvar CHARACTER;
CHARACTER = [];
array_push(CHARACTER, new CharacterData("Malachi and Darla",			"A completely original character duo with distinct abilities and a mysterious past. Malachi, the cunning tactician, and Darla, the fierce warrior, bring a unique dynamic to the battlefield.",								"Original Generation",						"Gimmick Fighter",		[],	{
	Portrait: sMalachiDarlaPortrait,
}));
array_push(CHARACTER, new CharacterData("SpongeBob SquarePants",	"The optimistic and enthusiastic sea sponge who lives in a pineapple under the sea. Known for his infectious energy and unwavering positivity, SpongeBob is always ready for a new adventure.",						"SpongeBob SquarePants",					"All-Rounder",			[],	{
	Portrait: sSpongeBobPortrait,
}));
array_push(CHARACTER, new CharacterData("Mickey Mouse",				"The legendary Disney character in his adventurous form. Mickey Mouse is beloved worldwide for his courage, cleverness, and ability to bring joy to those around him.",													"Epic Mickey",								"Rush-Down - Footsie",	[],	{}));
array_push(CHARACTER, new CharacterData("Dexter and Dee Dee",		"Dexter, the boy genius with a secret laboratory, and his meddlesome sister Dee Dee from the animated series Dexter's Laboratory. Together, they create a mix of brilliant inventions and chaotic antics.",		"Dexter's Laboratory",					"Zoner",					[],	{}));
array_push(CHARACTER, new CharacterData("Shrek",						"The lovable ogre from the swamp with a heart of gold. Shrek may appear gruff, but he's a true hero who values friendship and courage above all.",																			"Shrek",										"Grappler",				[],	{}));
array_push(CHARACTER, new CharacterData("Wallace and Gromit",		"The eccentric inventor Wallace and his intelligent dog Gromit, known for their quirky and ingenious adventures. Their inventive spirit and teamwork make them a beloved duo.",											"Wallace and Gromit",						"Trapper",				[],	{}));
array_push(CHARACTER, new CharacterData("PAC-MAN",					"The classic arcade character who navigates mazes, eats pellets, and avoids ghosts. PAC-MAN is an enduring icon of video gaming, known for his timeless gameplay and charming design.",								"Pac-Man",									"Mid-Range Offensive",	[],	{
	Portrait: sPACMANPortrait,
}));
array_push(CHARACTER, new CharacterData("Pac-Man",					"The reimagined version of PAC-MAN from the Pac-Man and the Ghostly Adventures series. This modern take on the classic character brings new adventures and a fresh look to the iconic hero.",					"Pac-Man and the Ghostly Adventures",	"Pseudo-Stance",		[],	{}));

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
array_push(CREDIT,	new CreditData("Programmers",				["Shiraga",	"Sato",			"BadGameDev",	"Joshus_sarn",		"Whisperer"]))
array_push(CREDIT,	new CreditData("Artists",						["Kio",			"arli",				"Spyder",			"Lucien Sawaqov",	"The Elite"]))
array_push(CREDIT,	new CreditData("Concept Designers",		["Kio",			"CrockerJack",	"Freaky Chips"]))
array_push(CREDIT,	new CreditData("Composers",					["SubjectLoser"]))
// Licensed Properites:
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
ENCYCLOPEDIA = [[],[],[]]
array_push(ENCYCLOPEDIA[0], new EncyclopediaData("T",						"Team"));
array_push(ENCYCLOPEDIA[0], new EncyclopediaData("T1",					"Player 1's team"));
array_push(ENCYCLOPEDIA[0], new EncyclopediaData("T2",					"Player 2's team"));
array_push(ENCYCLOPEDIA[0], new EncyclopediaData("Point Character",	"The main character on each team, selected first. Also known as the character that initiates interactions with Player 2's Point Character."));
array_push(ENCYCLOPEDIA[0], new EncyclopediaData("Mid Character",		"The character selected second on a team."));
array_push(ENCYCLOPEDIA[0], new EncyclopediaData("Anchor Character",	"The character selected third on a team."));

array_push(ENCYCLOPEDIA[1], new EncyclopediaData("SpongeBob SquarePants",	"Name: SpongeBob SquarePants \n\nUniverse: SpongeBob SquarePants \n\nFirst Appearance: Help Wanted (1999) \nVoice Actor: Tom Kenny (Official) / NA (In-game) \n\nOccupation: Fry Cook at the Krusty Krab \n\nWeapons / Abilites: Ol' Reliable, KA-RAE-TAE Gear, his trusty spatula, his bubbles \n\nProfile: SpongeBob is a sea sponge who lives in a pineapple under the sea in a place called Bikini Bottom. He works as a fry cook in the restaurant owned by Mr. Krabs called the Krusty Krab, where they create one of the most iconic foods in animation, the Krabby Patty. SpongeBob’s always friendly, but can be a bit naive and likeable stupidity, even if those people don’t like him back. No matter how much people don’t like him, he will ALWAYS be ready for anything that he gets thrown at. \n\nRival: Ruby Gillman (This section only appears after the Arcade Mode / Final update) \n\nTechnical: \n\nArchetype: All-Rounder \n\nStats (Working on it) \n\nReferences: \n\nMoveset references: \n\nAlt References: \n\nArcade Mode References: (After Arcade Mode / Final Update) \n\nFight 1: Pink Kraid is meant to represent Patrick Star \nFight 2: Brown Shrek is meant to represent Bubble Bass"))
array_push(ENCYCLOPEDIA[1], new EncyclopediaData("Mickey Mouse",				"Name: Mickey Mouse \n\nUniverse: Disney \n\nFirst Appearance: Steamboat Willie (1928) \nVoice Actor: Bret Iwan (Official) / NA (In-game) \n\nOccupation: Adventurer, Mascot \n\nWeapons / Abilities: Paintbrush, Magical Brush, Quick Reflexes \n\nProfile: Mickey Mouse is one of the most iconic and beloved characters in the world. As Disney's mascot, he has been part of countless adventures and stories, bringing joy to millions. Mickey's courageous and clever nature makes him a formidable fighter and a joy to watch. \n\nRival: Pete \n\nTechnical: \n\nArchetype: Rush-Down - Footsie \n\nStats: \n\nReferences: \n\nMoveset references: \n\nAlt References: \n\nArcade Mode References:"));
array_push(ENCYCLOPEDIA[1], new EncyclopediaData("Dexter and Dee Dee",		"Name: Dexter and Dee Dee \n\nUniverse: Dexter's Laboratory \n\nFirst Appearance: Dexter's Laboratory (1996) \nVoice Actor: Christine Cavanaugh (Dexter, Official) / Kat Cressida (Dee Dee, Official) / NA (In-game) \n\nOccupation: Boy Genius / Troublemaker \n\nWeapons / Abilities: High-tech gadgets, robotic assistants, Dee Dee's unpredictable antics \n\nProfile: Dexter is a boy genius with a secret laboratory where he invents amazing gadgets and conducts experiments. His sister Dee Dee, however, always manages to find her way into the lab, causing chaos with her playful nature. Together, they bring a unique blend of brilliance and mayhem. \n\nRival: Mandark \n\nTechnical: \n\nArchetype: Zoner \n\nStats: \n\nReferences: \n\nMoveset references: \n\nAlt References: \n\nArcade Mode References:"));
array_push(ENCYCLOPEDIA[1], new EncyclopediaData("Shrek",						"Name: Shrek \n\nUniverse: Shrek \n\nFirst Appearance: Shrek (2001) \nVoice Actor: Mike Myers (Official) / NA (In-game) \n\nOccupation: Ogre, Hero \n\nWeapons / Abilities: Ogre strength, swamp environment manipulation \n\nProfile: Shrek is a grumpy but good-hearted ogre who values his privacy but ultimately cherishes friendship and love. His adventures often see him rescuing friends and fighting against villains, showing his courage and loyalty. \n\nRival: Lord Farquaad \n\nTechnical: \n\nArchetype: Grappler \n\nStats: \n\nReferences: \n\nMoveset references: \n\nAlt References: \n\nArcade Mode References:"));
array_push(ENCYCLOPEDIA[1], new EncyclopediaData("Wallace and Gromit",			"Name: Wallace and Gromit \n\nUniverse: Wallace and Gromit \n\nFirst Appearance: A Grand Day Out (1989) \nVoice Actor: Peter Sallis (Wallace, Official) / NA (Gromit is silent) \n\nOccupation: Inventor / Canine assistant \n\nWeapons / Abilities: Ingenious contraptions, teamwork \n\nProfile: Wallace, the eccentric inventor, and his loyal dog Gromit are known for their clever inventions and thrilling adventures. Together, they solve problems and face challenges with creativity and determination. \n\nRival: Feathers McGraw \n\nTechnical: \n\nArchetype: Trapper \n\nStats: \n\nReferences: \n\nMoveset references: \n\nAlt References: \n\nArcade Mode References:"));
array_push(ENCYCLOPEDIA[1], new EncyclopediaData("PAC-MAN",						"Name: PAC-MAN \n\nUniverse: Pac-Man \n\nFirst Appearance: Pac-Man (1980) \nVoice Actor: NA \n\nOccupation: Maze Navigator, Pellet Eater \n\nWeapons / Abilities: Navigating mazes, eating power pellets, avoiding ghosts \n\nProfile: PAC-MAN is one of the most iconic characters in video game history. Known for his maze-chasing antics and pellet-eating prowess, he remains a beloved figure in gaming culture. \n\nRival: Blinky \n\nTechnical: \n\nArchetype: Mid-Range Offensive \n\nStats: \n\nReferences: \n\nMoveset references: \n\nAlt References: \n\nArcade Mode References:"));
array_push(ENCYCLOPEDIA[1], new EncyclopediaData("Pac-Man",						"Name: Pac-Man \n\nUniverse: Pac-Man and the Ghostly Adventures \n\nFirst Appearance: Pac-Man and the Ghostly Adventures (2013) \nVoice Actor: Erin Mathews (Official) / NA (In-game) \n\nOccupation: Hero, Ghost Hunter \n\nWeapons / Abilities: Power berries, ghost-chomping abilities, various gadgets \n\nProfile: This reimagined version of PAC-MAN brings new adventures and a modern twist to the classic character. With new abilities and a fresh look, Pac-Man continues to battle against ghosts and protect his friends. \n\nRival: Betrayus \n\nTechnical: \n\nArchetype: Pseudo-Stance \n\nStats: \n\nReferences: \n\nMoveset references: \n\nAlt References: \n\nArcade Mode References:"));

array_push(ENCYCLOPEDIA[2], new EncyclopediaData("Honolulu",						"Stage: Honolulu \n\nUniverse: Original Generation \n\nDescription: Malachi and Darla's stage. Set on a vibrant platform with hula dancers performing in the background. The dancers will cheer enthusiastically whenever a character is KOed. \n\nSpecial Features: Environmental interactions with the hula dancers. \n\nAssociated Characters: Malachi and Darla \n\nReferences:"));
array_push(ENCYCLOPEDIA[2], new EncyclopediaData("Conch Street",				"Stage: Conch Street \n\nUniverse: SpongeBob SquarePants \n\nDescription: The iconic neighborhood where SpongeBob lives. The stage features familiar sights from Bikini Bottom, with various sea creatures and characters cheering on the fighters. \n\nSpecial Features: Environmental interactions with Bikini Bottom characters. \n\nAssociated Characters: SpongeBob SquarePants \n\nReferences:"));
array_push(ENCYCLOPEDIA[2], new EncyclopediaData("Steamboat Willie",				"Stage: Steamboat Willie \n\nUniverse: Epic Mickey \n\nDescription: A classic black-and-white stage inspired by Mickey Mouse's early adventures. The vintage setting brings a nostalgic feel, complete with the steamboat and whimsical animations. \n\nSpecial Features: Black-and-white visual effects, dynamic animations of the steamboat. \n\nAssociated Characters: Mickey Mouse \n\nReferences:"));
array_push(ENCYCLOPEDIA[2], new EncyclopediaData("Dexter's Lab",				"Stage: Dexter's Lab \n\nUniverse: Dexter's Laboratory \n\nDescription: The high-tech laboratory of Dexter, filled with gadgets and experiments. The stage is dynamic, with various machines and inventions activating during the fight. \n\nSpecial Features: Interactive lab equipment, changing environment. \n\nAssociated Characters: Dexter and Dee Dee \n\nReferences:"));
array_push(ENCYCLOPEDIA[2], new EncyclopediaData("Swamp",						"Stage: Swamp \n\nUniverse: Shrek \n\nDescription: Shrek's home swamp, a murky and atmospheric stage with plenty of environmental hazards. The swamp is full of life, with creatures and objects reacting to the fight. \n\nSpecial Features: Environmental hazards, interactive swamp creatures. \n\nAssociated Characters: Shrek \n\nReferences:"));
array_push(ENCYCLOPEDIA[2], new EncyclopediaData("West Wallaby Street",		"Stage: West Wallaby Street \n\nUniverse: Wallace and Gromit \n\nDescription: The cozy home and neighborhood of Wallace and Gromit. The stage features their house, inventions, and quirky neighbors, adding charm and humor to the fight. \n\nSpecial Features: Interactive inventions, dynamic background characters. \n\nAssociated Characters: Wallace and Gromit \n\nReferences:"));
array_push(ENCYCLOPEDIA[2], new EncyclopediaData("Pac-Maze",					"Stage: Pac-Maze \n\nUniverse: Pac-Man \n\nDescription: A maze-like stage inspired by the classic Pac-Man game, complete with ghosts and pellets. The stage shifts and changes, creating a dynamic fighting environment. \n\nSpecial Features: Moving walls, interactive ghosts, collectible pellets. \n\nAssociated Characters: PAC-MAN \n\nReferences:"));
array_push(ENCYCLOPEDIA[2], new EncyclopediaData("Pacopolis",						"Stage: Pacopolis \n\nUniverse: Pac-Man and the Ghostly Adventures \n\nDescription: The vibrant city from the Ghostly Adventures series. The stage features futuristic elements and characters from the series, providing a lively backdrop for battles. \n\nSpecial Features: Dynamic city environment, interactive elements from the series. \n\nAssociated Characters: Pac-Man (Ghostly Adventures) \n\nReferences:"));


room_goto_next()