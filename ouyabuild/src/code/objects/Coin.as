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
    import code.achievements.Medals;

	public class Coin extends Sprite
	{
		//..SPRITES
		public static var coinSprite:CoinSprite;
			
		public static var coinHitSND:coinSnd;
		//public var soundPlay:SoundChannel;

		public var _coins:Array = new Array();
		public var c = new CoinSprite();
		public static var COINCOUNT:int = 4;
		public static const COINSPEED:Number = 5.5;
		public static const COINROTATE:Number = 3.5;

		private var firstDrop:Timer;
		private var coinDrop:Timer;

		private var medal:Medals;


		//-------------------------------------------------------------------------|
		//##SETUP------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function Coin()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}

		public function stageSetup(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
			firstDrop = new Timer( 5500 );                
			firstDrop.addEventListener(TimerEvent.TIMER, onStart);
			firstDrop.start(); 

			medal = new Medals();
			Starling.current.nativeOverlay.addChild(medal);
		}
		//-------------------------------------------------------------------------|
		
		//-------------------------------------------------------------------------|
		//##MANAGER----------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function manager():void {
			//..to call update loop from outside class
			this.addEventListener(Event.ENTER_FRAME, updateCoin);
		}
		//-------------------------------------------------------------------------|
		
		//-------------------------------------------------------------------------|
		//##COINSOUNDS-------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function playCoinSound():void {
			coinHitSND = new coinSnd();
			coinHitSND.play();
		}
		//-------------------------------------------------------------------------|

		//-------------------------------------------------------------------------|
		//##COINPATTERNS-----------------------------------------------------------|
		//-------------------------------------------------------------------------|

		public function pattern1():void {
			var length:Number = COINCOUNT;

		    for ( var i:Number = 0; i < length; i++) {
		        createCoin();
		        _coins[i].y = -500;
		        c.y = -500 + i * 50;
		    }
		}

		public function pattern2():void {
			var length:Number = COINCOUNT;

		    for ( var i:Number = 0; i < length; i++) {

		        createCoin();
		        c.x = i * 20;
		        c.y = i * 50;
		    }
		}
        //-------------------------------------------------------------------------|

        //-------------------------------------------------------------------------|
		//##COLLISION--------------------------------------------------------------|
		//-------------------------------------------------------------------------|

		public function hitCoinPlayer():void {
		
        	for ( var i:Number = 0; i < _coins.length; i++) {
		     	//..cleanup
			    if (_coins[i].hitTestObject(Player.playerSprite)) {
			    	medal.unlockCoin();
			    	Starling.current.nativeOverlay.removeChild(_coins[i]);
			    	_coins.splice(i, 1);
			    	playCoinSound();
			    }
			    //..check bounds
			    if (_coins[i].y >= 1500) {
			    	_coins[i].y = -500;

        		} 
		    }
		}
		//-------------------------------------------------------------------------|

		 //------------------------------------------------------------------------|
		//##MOVECOIN---=-----------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function moveCoin(){
		    for ( var i:Number = 0; i < _coins.length; i++) {
		        _coins[i].y += COINSPEED;
		        _coins[i].rotation += COINROTATE;
		    }
		}

		public function freezeCoin():void {
			this.removeEventListener(Event.ENTER_FRAME, updateCoin);
		}

		//-------------------------------------------------------------------------|
		//##UPDATE-----------------------------------------------------------------|
		//-------------------------------------------------------------------------|

        public function updateCoin(e:Event):void {
        	hitCoinPlayer();
        	moveCoin();
        }

        private function onStart(e:TimerEvent):void {
           	manager();
           	pattern1();
            firstDrop.stop();

			coinDrop = new Timer( 5500 );                
			coinDrop.addEventListener(TimerEvent.TIMER, onDropCoins);
			coinDrop.start(); 
        }

        private function onDropCoins(e:TimerEvent):void {
        	//pattern1();
        	//pattern2();
        }
        //-------------------------------------------------------------------------|

		//-------------------------------------------------------------------------|
		//##CREATE COIN------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function createCoin():void {
			c = new CoinSprite();
        	c.x = 305;
        	c.y = -500;
        	Starling.current.nativeOverlay.addChild(c);
        	_coins.push(c);
		}
		//-------------------------------------------------------------------------|
	}
}