package code.system {

	//API LIBRARIES 
	import com.newgrounds.components.*;
	import com.newgrounds.API;
	import flash.desktop.*;
	import flash.events.KeyboardEvent;
	import starling.display.Sprite;
	import starling.events.Event;
	//INTERNAL LIBRARIES
	import code.managers.ScreenManager;
	import code.managers.LevelManager;
	
	public class GameEngine extends Sprite {

		private var _screenManager:ScreenManager;			
		private var _levelManager:LevelManager;					

		public function GameEngine() {
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}

		private function stageSetup(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);	
			initEngine();
		}

		private function initEngine():void {
			ScreenManager.gameEngine = this;
			ScreenManager.handleState(0);

			_levelManager = new LevelManager();
			_levelManager.handleState(true, 1);
			this.addChild(_levelManager);
		}
	}
}