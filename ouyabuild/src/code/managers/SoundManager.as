package code.managers
{
	import starling.display.Sprite;
	import starling.events.Event;

	import code.screens.StudioScreen;
	import code.screens.GameOverlay;
	import code.screens.AdScreen;
	import code.screens.MenuStartup;
	import code.screens.MenuDifficulty;

	public class SoundManager extends Sprite
	{
		//##SCREEN OBJECTS---------------------------------------------------------|
		public var studio:StudioScreen;							//..STUDIO SCREEN
		public var overlay:GameOverlay;							//..FX OVERLAY
		public var adScreen:AdScreen;							//..AD SCREEN
		public var menuStartup:MenuStartup;						//..MENU STARTUP
		public var menuDifficulty:MenuDifficulty;				//..MENU STARTUP
		//-------------------------------------------------------------------------|

		 public var state:int;
		 public const AD:int = 0;
		 public const STUDIO:int = 1;
		 public const STARTMENU:int = 2;
		 public const DIFFICULTY:int = 3;
		 public const OVERLAY:int = 4;

		//-------------------------------------------------------------------------|
		//##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function SoundManager()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}

		private function stageSetup(event:Event):void {
			trace("[AXION ENGINE] :: **** LEVEL MANAGER ACTIVE");
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
		}
		//--HANDLES STATE OF MENU SCREENS
		public function handleState():void {
			//..SET STATE FOR QUICK MENU CHANGING FOR DEBUG
			
			state = OVERLAY;										
			switch(state) {										
				case AD: 
					;
				break;
				//
				case STUDIO:
				
				break;
				//
				case STARTMENU:
					
				break; 
				// 
				case DIFFICULTY:
				
				break;
				//
				case OVERLAY:
				
				break;
			}
		}
		//-------------------------------------------------------------------------|

		//-------------------------------------------------------------------------|
		//##CREATE SCREENS||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|


		//-------------------------------------------------------------------------|
	}
}