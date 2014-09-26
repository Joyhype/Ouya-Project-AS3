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

	public class Stars extends Sprite
	{		
		//##IMAGES-----------------------------------------------------------------|
		private var _starSprite:Image;
		private var _starSprite2:Image;
		//-------------------------------------------------------------------------|
		
		//##ATTR-------------------------------------------------------------------|
		public static var STARCOUNT1:Number = 50;
		public static var STARCOUNT2:Number = 10;
		public static var STARSPEED1:Number = 2;
        public var _starArray:Array = new Array();

        public var speedIncrease:Timer;
		//-------------------------------------------------------------------------|
        
        //-------------------------------------------------------------------------|
        //##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
		public function Stars()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}
		public function stageSetup(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
			this.addEventListener(Event.ENTER_FRAME, updateFrame)

			speedIncrease = new Timer(1000,9999);
			speedIncrease.addEventListener(TimerEvent.TIMER, onSpeedIncrease);
			speedIncrease.start();

			spawnStars1();
			spawnStars2();
		}
		//-------------------------------------------------------------------------|
        
        public function spawnStars1():void {
       		var length:Number = STARCOUNT1;
        	for ( var i:Number = 0; i < length; i++) {
            	createStars1();
        	}
    	}

    	public function spawnStars2():void {
    		var length:Number = STARCOUNT2;
        	for ( var i:Number = 0; i < length; i++) {
            	createStars2();
        	}
    	}

		public function moveStars():void {
            for ( var i:Number = 0; i < _starArray.length; i++) {
                _starArray[i].y += STARSPEED1;
                if (_starArray[i].y >= 1080) {
                	_starArray[i].x = Math.random() * 1920;
            		_starArray[i].y = Math.random() * -900;
                }
            }   
        }

        public function onSpeedIncrease(e:TimerEvent):void {
        	STARSPEED1 += 0.05; 
        }
        public function updateFrame(e:Event):void {
        	moveStars();
        }
        //-------------------------------------------------------------------------|
        //##CREATE STARS||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
        public function createStars1():void {
            _starSprite = new Image(Assets.getTexture("bgStar"));
            _starSprite.x = Math.random() * 1920;
            _starSprite.y = Math.random() * 900;
            _starSprite.alpha = 0.6;
            this.addChild(_starSprite);
            _starArray.push(_starSprite);
        }

        public function createStars2():void {
        	_starSprite2 = new Image(Assets.getTexture("bgStar"));
            _starSprite2.x = Math.random() * 1920;
            _starSprite2.y = Math.random() * 1080;
            _starSprite2.alpha = 0.1;
            this.addChild(_starSprite2);
        }
		//-------------------------------------------------------------------------|
	}
}