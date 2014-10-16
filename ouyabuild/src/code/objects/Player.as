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
	//LIBRARIES
	import flash.events.KeyboardEvent; 
	import flash.events.Event;
	import flash.events.TimerEvent;
 	import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.utils.Timer;

	public class Player extends Entity
	{
		//..SPRITE
		public static var playerSprite:symPlayer;
       
		//..INPUT
		public var leftPressed:Boolean = false;
		public var rightPressed:Boolean = false;
		public var upPressed:Boolean = false;
		//..PHYSICS
		public var gravity:Number = 2.5;
		public var drag:Number = 0.92;
		public var friction:Number = 0.75;
		public var MAX_xSpeed:Number = 35;
		public var MIN_xSpeed:Number = 1;
		public var MAX_ySpeed:Number = 25;
        public var MIN_ySpeed:Number = 5;
        public var onGround:Boolean; 

        private var playerFirstSpawn:Timer;			
        private var activateGravity:Timer;

        private var bgTween:Tween;
        private var linesTween:Tween;

        //-------------------------------------------------------------------------|
		//##SETUP------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function Player() {
			super();
		}

		protected override function initialize():void {
			super.initialize();
			createPlayer();
		}

		protected override function update(e:Event):void {
			checkPlayerBounds();
		}

		//-------------------------------------------------------------------------|


		//-------------------------------------------------------------------------|
		//##KEYBOARD INPUT---------------------------------------------------------|
		//-------------------------------------------------------------------------|
		protected override function onKeyDown(e:KeyboardEvent):void {
			if(e.keyCode == 39 || e.keyCode == 68) {
				rightPressed = true;

				playerSprite.x += (1920 - 240) / 4;
			} 
			if (e.keyCode == 37 || e.keyCode == 65) {
				leftPressed = true;

				playerSprite.x -= (1920 - 240) / 4;
			} 

			checkPlayerBounds();
		}

		protected override function onKeyUp(e:KeyboardEvent):void {
			if (e.keyCode == 39 || e.keyCode == 68) {
				playerSprite.rotation = 0;
				rightPressed = false;
			} 
			if (e.keyCode == 37 || e.keyCode == 65) {
				playerSprite.rotation = 0;
				leftPressed = false;
			}


		}
		//-------------------------------------------------------------------------|

		//-------------------------------------------------------------------------|
		//##PLAYERBOUNDS-----------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function checkPlayerBounds():void {
			if (playerSprite.x > (1920 - 120)) {
				playerSprite.x = 1920 - 120;			
			} else if (playerSprite.x < 120) {
				playerSprite.x = 120;
			}
		}
		//-------------------------------------------------------------------------|
		
		//-------------------------------------------------------------------------|
		//##DRAW-------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function createPlayer():void {
			playerSprite = new symPlayer();
			playerSprite.x = 120; //+ (stage.stageWidth / 4 ) * 1; 
			playerSprite.y = 950; 
			playerSprite.gotoAndStop(1);
			Starling.current.nativeOverlay.addChild(playerSprite);
		}

        public function drawLines():void {
        }
		//-------------------------------------------------------------------------|
	}
}