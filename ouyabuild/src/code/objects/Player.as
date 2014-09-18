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

	public class Player extends Sprite
	{
		//..SPRITES
		public static var playerSprite:Image;
        public var _speedLines:Image;
        public var _staticLines:Image;
		public var _staticBG:Image;
		//..INPUT
		public var leftPressed:Boolean = false;
		public var rightPressed:Boolean = false;
		public var upPressed:Boolean = false;
		//..PHYSICS
		public var gravity:Number = 2.5;
		public var drag:Number = 0.92;
		public var friction:Number = 0.75;
		public var MAX_xSpeed:Number = 28;
		public var MIN_xSpeed:Number = 1;
		public var MAX_ySpeed:Number = 25;
        public var MIN_ySpeed:Number = 5;
        public var onGround:Boolean;


        //public var boundingBox:Rectangle = playerSprite.bounds; 

        private var playerFirstSpawn:Timer;			
        private var activateGravity:Timer;

        private var bgTween:Tween;
        private var linesTween:Tween;
		//-------------------------------------------------------------------------|
		//##SETUP------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function Player()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}

		public function stageSetup(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);

			drawPlayer();
			this.addEventListener(Event.ENTER_FRAME, updateFrame);
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownInput);
			this.addEventListener(KeyboardEvent.KEY_UP, onKeyUpInput);
		}
		//-------------------------------------------------------------------------|

		private function updateFrame(e:Event):void {

		}


		public function killInput():void {
			this.removeEventListener(Event.ENTER_FRAME, updateFrame);
			this.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDownInput);
			this.removeEventListener(KeyboardEvent.KEY_UP, onKeyUpInput);
		}


		//-------------------------------------------------------------------------|
		//##KEYBOARD INPUT---------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function onKeyDownInput(e:KeyboardEvent):void {
			if(e.keyCode == 39 || e.keyCode == 68) {
				rightPressed = true;

				playerSprite.x += 1780 / 8;
			} 
			if (e.keyCode == 37 || e.keyCode == 65) {
				leftPressed = true;

				playerSprite.x -= 1780 / 8;
			} 

			checkPlayerBounds();
		}

		public function onKeyUpInput(e:KeyboardEvent):void {
			if (e.keyCode == 39 || e.keyCode == 68) {
				playerSprite.rotation = 0;
				rightPressed = false;
			} 
			if (e.keyCode == 37 || e.keyCode == 65) {
				playerSprite.rotation = 0;
				leftPressed = false;
			}


		}

		public function handlePlayerInput():void {
	        //if((rightPressed)) {
            //    playerSprite.x += MAX_xSpeed;
            //} 
            //if((leftPressed)) {
            //    playerSprite.x -= MAX_xSpeed;
            //}
		}
		//-------------------------------------------------------------------------|

		//-------------------------------------------------------------------------|
		//##PLAYERBOUNDS-----------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function checkPlayerBounds():void {
			if (playerSprite.x >= 1780) {
				playerSprite.x = 1780;
			} else if (playerSprite.x <= 65) {
				playerSprite.x = 65;
			}
		}
		//-------------------------------------------------------------------------|
		
		//-------------------------------------------------------------------------|
		//##DRAW-------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function drawPlayer():void {
			playerSprite = new Image(Assets.getTexture("objPlayer"));
			playerSprite.x = (stage.stageWidth - playerSprite.width)/2;
			//playerSprite.y = 900;
			playerSprite.y = 100;
			addChild(playerSprite);
		}

        public function drawLines():void {
        }
		//-------------------------------------------------------------------------|
	}
}