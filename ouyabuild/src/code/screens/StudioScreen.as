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

	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import code.managers.ScreenManager;

	public class StudioScreen extends Sprite
	{
		//##SYMBOLS----------------------------------------------------------------|
		private var tank:ngTank;							//..NG TANK ANIMATION
		private var nmLogo:Image;
		//-------------------------------------------------------------------------|

		//##OBJECTS----------------------------------------------------------------|
		private var screenManager:ScreenManager;			//..MANAGER OBJECT
		//-------------------------------------------------------------------------|
		
		//##TIMERS-----------------------------------------------------------------|
		private var createStudio:Timer; 					//..TIMER FOR IMGS
		private var removeNG:Timer; 						//..KILL NG LOGO
		private var removePanda:Timer;
		//-------------------------------------------------------------------------|

		private var tweenNM:Tween; 

		//-------------------------------------------------------------------------|
		//##SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function StudioScreen()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}
		//--STAGE SETUP
		private function stageSetup(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
	
			createStudio = new Timer(1600);
			createStudio.addEventListener( TimerEvent.TIMER, onTimerComplete);
			createStudio.start();

			removeNG = new Timer( 5300 );
			removeNG.addEventListener( TimerEvent.TIMER, onRemoveNG);

			removePanda = new Timer( 2500 );
			removePanda.addEventListener( TimerEvent.TIMER, onPandaComplete);
		}

		//-------------------------------------------------------------------------|


		//-------------------------------------------------------------------------|
		//##INIT ASSETS|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function initAssets():void {
			drawTank();
			removeNG.start();
		}
		//-------------------------------------------------------------------------|


		//-------------------------------------------------------------------------|
		//##ONTIMER|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		
		private function onTimerComplete(e:TimerEvent):void {
			createStudio.stop();
			initAssets(); 
		}

		private function onRemoveNG(e:TimerEvent):void {
			removeNG.stop();
			removePanda.start();
			Starling.current.nativeOverlay.removeChild(tank);
			drawPanda();
		}

		private function onPandaComplete(e:TimerEvent):void {
			removePanda.stop();
			tweenNM = new Tween(nmLogo, 0.85, Transitions.EASE_IN);
			tweenNM.fadeTo(0);
			Starling.juggler.add(tweenNM);
			ScreenManager.handleState(2);
		}

		//-------------------------------------------------------------------------|
		

		//-------------------------------------------------------------------------|
		//##ONCLICK|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function onClickNG(e:MouseEvent):void {
			trace("[AXION ENGINE] :: ==== NEWGROUNDS IMAGE CLICKED");
			var urlRedirect:URLRequest = new URLRequest("http://www.newgrounds.com");
			navigateToURL(urlRedirect, "_blank");
		}
		//-------------------------------------------------------------------------|
		

		//-------------------------------------------------------------------------|
		//##DRAW||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function drawTank() {
			tank = new ngTank();
			tank.x = stage.stageWidth/2;
			tank.y = stage.stageHeight/2;
			Starling.current.nativeOverlay.addChild(tank);
		}
		private function drawPanda() {
			nmLogo = new Image(Assets.getTexture("panda"));
			nmLogo.alpha = 0;
			this.addChild(nmLogo);
			tweenNM = new Tween(nmLogo, 0.85, Transitions.EASE_IN);
			tweenNM.fadeTo(1);
			Starling.juggler.add(tweenNM);
		}
		//-------------------------------------------------------------------------|
		//#ENDFILE-----------------------------------------------------------------|
	}
}