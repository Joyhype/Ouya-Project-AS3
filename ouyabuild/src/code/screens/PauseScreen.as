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

	public class PauseScreen extends Sprite
	{

		public var pauseBtn:PauseBtn;
		public var pauseOverlay:Image;
		public var sandbox:SandboxLvl;

		//##IMAGES-----------------------------------------------------------------|

		//-------------------------------------------------------------------------|
	

		//-------------------------------------------------------------------------|
		//##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function PauseScreen()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}
		private function stageSetup(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
			initAssets();
			pauseBtn.addEventListener(MouseEvent.CLICK, onClickPause);
		}
		//-------------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		//##INIT||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function initAssets() {
			drawPauseBtn();
		}
		//-------------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		//##UPDDATE LOOP||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function updateFrame(event:Event):void {

		}
		public function onClickPause(e:MouseEvent):void {
			trace("click");
			drawOverlay();
		}

		public function drawPauseBtn():void {
			pauseBtn = new PauseBtn();
			pauseBtn.x = 30;
			pauseBtn.y = 25;
			Starling.current.nativeOverlay.addChild(pauseBtn);
		}

		public function drawOverlay():void {
			pauseOverlay = new Image(Assets.getTexture("pauseOverlay"));
			this.addChild(pauseOverlay);
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