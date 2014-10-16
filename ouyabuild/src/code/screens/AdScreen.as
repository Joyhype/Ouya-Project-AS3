package code.screens
{
	//STARLING LIBRARIES
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
	//FLASH LIBRARIES
	import flash.events.KeyboardEvent; 
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.utils.Timer;
	import flash.system.*;
	//GAME STUFF
	import code.managers.ScreenManager;
	import code.achievements.Medals;
	import code.objects.Ad;

	public class AdScreen extends Sprite
	{
		//##IMAGE ASSETS-----------------------------------------------------------|	
		private var _staticBG:Image;

		//-------------------------------------------------------------------------|
		//##SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function AdScreen() {
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}
		private function stageSetup(event:Event):void {
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
			initAssets();						
		}
		//-------------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		//##INIT||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function initAssets():void {
			createBG();
		}

	    public function createBG():void {
           _staticBG = new Image(Assets.getTexture("bgBase01"));
           this.addChild(_staticBG);
        }

		//-------------------------------------------------------------------------|
		//##REMOVE||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function removeAll():void {
			System.gc();
			super.dispose();
		}
		//-------------------------------------------------------------------------|
		//#ENDFILE-----------------------------------------------------------------|
	}
}