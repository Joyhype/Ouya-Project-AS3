package code.managers
{
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.system.*;
	
	import code.screens.StudioScreen;
	import code.screens.AdScreen;
	import code.screens.MenuStartup;

	public class ScreenManager extends Sprite
	{
		//##SCREEN OBJECTS---------------------------------------------------------|
		public static var _adScreen:AdScreen;						
		public static var _studio:StudioScreen;										
		public static var _menuStartup:MenuStartup;		
		//-------------------------------------------------------------------------|

		//##SCREEN STATES----------------------------------------------------------|
		public static var STATE:uint = 0;						
		public static const AD:int = 0;								
		public static const STUDIO:int = 1;	
		public static const MENU:int = 2;													
		//-------------------------------------------------------------------------|

		//##GAME ENGINE -----------------------------------------------------------|
		public static var gameEngine:Sprite;
		//-------------------------------------------------------------------------|

		//-------------------------------------------------------------------------|
		//##HANDLE STATE||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public static function handleState(STATE:int):void {			
			switch(STATE) {		
				case AD:  
					screenAd(); 
				break;

				case STUDIO: 
					screenStudio();
				break;

				case MENU: 
					screenMenuStartup(); 
				break;
			}
		}
		//-------------------------------------------------------------------------|

		//-------------------------------------------------------------------------|
		//##CREATE SCREENS||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		//--ADVERTISEMENT SCREEN (SPONSOR-PRELOADER)
		public static function screenAd() {
			trace("[GAME] :: SCREEN SWITCHED TO AD SCREEN");
			_adScreen = new AdScreen();
			gameEngine.addChild(_adScreen);
		}
		//--STUDIO SCREEN (COMPANY LOGOS)
		public static function screenStudio() {
			trace("[GAME] :: SCREEN SWITCHED TO STUDIO SCREEN");
			_studio = new StudioScreen();
			gameEngine.addChild(_studio);
		}
		//--FX OVERLAY SCREEN (OVERLAY FX)
		public static function screenMenuStartup() {
			trace("[GAME] :: SCREEN SWITCHED TO MENUSTARTUP");
			_menuStartup = new MenuStartup();
			gameEngine.addChild(_menuStartup);
		}
		//-------------------------------------------------------------------------|
		//##CLEANUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public static function removeAll():void {
			gameEngine.removeChild(_studio);
			gameEngine.removeChild(_adScreen);
			System.gc();
		}
		//-------------------------------------------------------------------------|
		//##END FILE
	}
}