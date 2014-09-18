package code.screens
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.animation.Juggler;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.events.KeyboardEvent;
	import flash.events.KeyboardEvent; 
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	import code.managers.ScreenManager;
	import code.levels.SandboxLvl;

	public class MenuStartup extends Sprite
	{

		public var infoBtn:InfoBTN;
		//##IMAGES-----------------------------------------------------------------|

		//-------------------------------------------------------------------------|
	

		//-------------------------------------------------------------------------|
		//##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function MenuStartup()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}
		private function stageSetup(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
			initAssets();
		}
		//-------------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		//##INIT||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function initAssets() {
			trace("Test");
			drawInfo();
		}
		
		private function drawInfo() {
			infoBtn = new InfoBTN();
			infoBtn.x = 25;
			infoBtn.y = 25;
			Starling.current.nativeOverlay.addChild(infoBtn);
		}



		//-------------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		//##CLEANUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function removeAll():void {
			//clean your shit up when switching screens
		}
		//-------------------------------------------------------------------------|
		//#ENDFILE-----------------------------------------------------------------|
	}
}