package code.managers
{
	import starling.display.Sprite;
	import starling.events.Event;

	import code.levels.Level0Manager;
	import code.levels.SandboxLvl;
	import code.managers.ScreenManager;
	import code.objects.Player;

	public class LevelManager extends Sprite
	{
		//##SCREEN OBJECTS---------------------------------------------------------|
		private var _level0Manager:Level0Manager;
		private var _sandboxLvl:SandboxLvl;
		//-------------------------------------------------------------------------|

		//##SCREEN STATES----------------------------------------------------------|
		public var STATE:int;
		public const LEVEL0:int = 0;
		public const SANDBOX:int = 1;
		//-------------------------------------------------------------------------|


		public static const LEVEL_LOAD_COMPLETE:String = "levelLoadComplete";
		public static const ASSET_LOAD_COMPLETE:String = "assetLoadComplete";
		public static const GAME_START:String = "gameStart";
		public static const PLAYER_DEAD:String = "playerDead";
		public static const NEXT_LEVEL:String = "nextLevel";
		public static const PREV_LEVEL:String = "prevLevel";
		public static var GAMESTATE:Boolean;

		//-------------------------------------------------------------------------|
		//##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function LevelManager()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}

		private function stageSetup(event:Event):void {
			trace("[GAME] :: **** LEVEL MANAGER ACTIVE");
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
		}

		public function handleState(GAMESTATE:Boolean, STATE:int):void {	
			switch(STATE) {	

				case LEVEL0:  
					GAMESTATE = true;
					levelIntro();
				break;

				case SANDBOX:  
					GAMESTATE = true;
					sandboxLevel();
				break;
			}
		}
		//-------------------------------------------------------------------------|

		//-------------------------------------------------------------------------|
		//##CREATE SCREENS||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function levelIntro():void {
			trace("[GAME] :: LEVEL CREATED - INTRODUCTION");
			_level0Manager = new Level0Manager();
			this.addChild(_level0Manager);
			GAMESTATE = true;
		}

		private function sandboxLevel():void {
			trace("[GAME] :: Sandbox Lvl Created");
			_sandboxLvl = new SandboxLvl();
			this.addChild(_sandboxLvl);
			GAMESTATE = true;
		}


		//-------------------------------------------------------------------------|
	}
}