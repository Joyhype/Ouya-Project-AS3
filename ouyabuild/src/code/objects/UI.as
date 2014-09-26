package code.objects
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
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.events.KeyboardEvent;
	import flash.events.Event;; 
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.system.*;
	//LOCAL CODE

	public class UI extends Sprite
	{		
		//##IMAGES-----------------------------------------------------------------|
		private var _uiScore:Image;
		//-------------------------------------------------------------------------|
		
		//##ATTR-------------------------------------------------------------------|
		
		//-------------------------------------------------------------------------|
        
        //-------------------------------------------------------------------------|
        //##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
		public function UI()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}
		public function stageSetup(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
			//this.addEventListener(Event.ENTER_FRAME, updateFrame);
		}
		//-------------------------------------------------------------------------|

		//-------------------------------------------------------------------------|
        //##CREATE GRAPHICS|||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
        public function createUIScore():void {
           _uiScore = new Image(Assets.getTexture("objUIScore"));
           _uiScore.x = (stage.stageWidth - _uiScore.width)/2;
           _uiScore.y = 30;
           this.addChild(_uiScore);
        }
		//-------------------------------------------------------------------------|
	}
}