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
    
    import code.objects.Player;
    import code.objects.Gun;
    import code.achievements.Medals;

	public class Enemies extends Sprite
	{
		//..SPRITES
		//public var e1:Image; 
		public var e1:symEnemy01;
		public var _enemies:Array = new Array();
	
		public static var ENEMYDROP:Number = 4; 
		public static var ENEMYSPEED:Number = 2;
		public static var ENEMYROTATION:Number = -0.25;
		
		private var speedIncrease:Timer;

		//-------------------------------------------------------------------------|
		//##SETUP------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function Enemies()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}

		public function stageSetup(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
			this.addEventListener(Event.ENTER_FRAME, updateEnemies);
			speedIncrease = new Timer( 10000 , 9999 );  
			speedIncrease.addEventListener(TimerEvent.TIMER, onIncreaseVelocity);
			speedIncrease.start();
			
			enemyArray();
		}
		//-------------------------------------------------------------------------|
		
		//-------------------------------------------------------------------------|
		public function enemyArray():void {
			var length:Number = ENEMYDROP;

			for ( var i:Number = 0; i < length; i++) {
				drawEnemey01();
				e1.x = 120 + (i * 1780/ 4 ); 
			}
		}
		
		public function onIncreaseVelocity(e:TimerEvent):void {
			updateVelocity();
			for ( var i:Number = 2; i < _enemies.length; i++) {
		     	if (_enemies[i].y >= 1080) {
					updateVelocity();
				}
		    }
		}
		public function updateVelocity():void {
			ENEMYSPEED += 0.5;
		}

		//-------------------------------------------------------------------------|

		 //------------------------------------------------------------------------|
		//##MOVEENMIES-------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function moveEnemies():void {
			  for ( var i:Number = 0; i < _enemies.length; i++) {
		        _enemies[i].y += ENEMYSPEED;
		        _enemies[i].rotation += Math.random() * 5;
		    }
		}

		public function checkBounds():void {
			for ( var i:Number = 0; i < _enemies.length; i++) {
		     	if (_enemies[i].y >= 1080) {
					_enemies[i].y = -200 - Math.random() * 500;
				}
		    }
		
		}

		public function collisionDetection():void {
			for ( var i:Number = 0; i < _enemies.length; i++) {
		     	if (_enemies[i].hitTestObject(Gun.bulletSprite)) {
					trace('hit');
					Starling.current.nativeOverlay.removeChild(_enemies[i]);
					_enemies.splice(i, 1)
				}
		    }
		}

		//-------------------------------------------------------------------------|
		//##UPDATE-----------------------------------------------------------------|
		//-------------------------------------------------------------------------|

        public function updateEnemies(e:Event):void {
        	moveEnemies();
        	if (ENEMYSPEED >= 5) {
				ENEMYSPEED = 5;
				//speedIncrease.stop();
			}
        }

        //-------------------------------------------------------------------------|

		//-------------------------------------------------------------------------|
		//##CREATE codeIN------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function drawEnemey01():void {
			//e1 = new Image(Assets.getTexture("objEnemy01"));
			e1 = new symEnemy01();
			e1.y = -300 - Math.random() * 500;
			Starling.current.nativeOverlay.addChild(e1);
			_enemies.push(e1);
		}
		//-------------------------------------------------------------------------|
	}
}