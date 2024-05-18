/// @description Insert description here
// CREATE Event - oINIT

globalvar T1, T2, TIME;
T1		=	new TeamData() 
T2		=	new TeamData() 
TIME	=	90

globalvar CHARACTER;
CHARACTER = [];
array_push(CHARACTER, new CharacterData("Malachi and Darla",			"A 100% original character with unique abilities and a mysterious background.",											"Original Generation",						[],	{}));
array_push(CHARACTER, new CharacterData("SpongeBob SquarePants",	"The optimistic and enthusiastic sea sponge who lives in a pineapple under the sea.",									"SpongeBob SquarePants",					[],	{}));
array_push(CHARACTER, new CharacterData("Mickey Mouse",				"The iconic Disney character in his adventurous form.",																		"Epic Mickey",								[],	{}));
array_push(CHARACTER, new CharacterData("Dexter and Dee Dee",		"Dexter, the boy genius, and his meddlesome sister Dee Dee from the animated series Dexter's Laboratory.",		"Dexter's Laboratory",					[],	{}));
array_push(CHARACTER, new CharacterData("Shrek",						"The lovable ogre from the swamp with a heart of gold.",																	"Shrek",										[],	{}));
array_push(CHARACTER, new CharacterData("Wallace and Gromit",		"The eccentric inventor Wallace and his intelligent dog Gromit, known for their quirky adventures.",					"Wallace and Gromit",						[],	{}));
array_push(CHARACTER, new CharacterData("PAC-MAN",					"The classic arcade character who navigates mazes and eats pellets while avoiding ghosts.",							"Pac-Man",									[],	{}));
array_push(CHARACTER, new CharacterData("Pac-Man",					"The reimagined version of PAC-MAN from the Pac-Man and the Ghostly Adventures series.",							"Pac-Man and the Ghostly Adventures",	[],	{}));

globalvar STAGE;
STAGE = [];
array_push(STAGE, new StageData("Honolulu",																"Malachi and Darla's stage. Done on top of a stage with hula dancers in the background. The dancers will cheer when someone's KOed!",				"Original Generation")
array_push(STAGE, new StageData("Conch Street",														"SpongeBob's Stage",																																						"SpongeBob SquarePants")
array_push(STAGE, new StageData("Steamboat Willie",														"Mickey's stage",																																							"Epic Mickey")
array_push(STAGE, new StageData("Dexter's Laboratory",												"Dexter and Dee Dee's stage",																																			"Dexter's Laboratory")
array_push(STAGE, new StageData("Shrek's Swamp",														"Shrek's Stage",																																								"Shrek")
array_push(STAGE, new StageData("The Moon - A Grand Day Out",										"Wallace and Gromit's Stage",																																				"Wallace and Gromit");
array_push(STAGE, new StageData("West Wallaby Zoo - The Wrong Trousers / Project Zoo",		"Another option for Wallace and Gromit's Stage",																														"Wallace and Gromit");
array_push(STAGE, new StageData("Pac-Maze",															"PAC-MAN's Stage",																																							"Pac-Man");
array_push(STAGE, new StageData("Pacopolis",																"GA Pac-Man's Stage",																																						"Pac-Man and the Ghostly Adventures");
array_push(STAGE, new StageData("The Resistance Hotel",												"A hotel with cameos of several heroes in the background, possibly make them soon to be playable characters",											"Original Generation");
array_push(STAGE, new StageData("Villains Reality",														"A giant wasteland filled with cameos of villains in the background, preferably the big Bosses of the game. They'd all cheer when someone is KOed",	"Original Generation");

