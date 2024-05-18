/// @description Insert description here
// CREATE Event - oINIT

globalvar T1, T2, TIME;
T1		=	new TeamData() 
T2		=	new TeamData() 
TIME	=	90

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
array_push(CREDIT,	new CreditData("Programming",	["Shiraga",	"Sato",	"BadGameDev",	"Joshus_sarn", "Whisperer"]) )
array_push(CREDIT,	new CreditData("Artists",			[""]) )
