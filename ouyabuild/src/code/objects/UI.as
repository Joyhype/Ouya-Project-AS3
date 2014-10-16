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
	import code.objects.Health;

	public class UI extends Entity
	{		
		//##IMAGES-----------------------------------------------------------------|
		private var _uiScore:uiScoreWrap;
		//-------------------------------------------------------------------------|
		
		private var hp:Health;

		public function UI()
		{
			super();
		}

		protected override function initialize():void {
			super.initialize();
			createUIScore();
			hp = new Health();
			this.addChild(hp);
		}

		protected override function update(e:Event):void {
		}

		//-------------------------------------------------------------------------|
        //##CREATE GRAPHICS|||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
        public function createUIScore():void {
           _uiScore = new uiScoreWrap();
           _uiScore.x = 960;
           _uiScore.y = 100;
           Starling.current.nativeOverlay.addChild(_uiScore);
        }
		//-------------------------------------------------------------------------|
	}
}