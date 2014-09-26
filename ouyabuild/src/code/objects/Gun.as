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
    import code.objects.Player;

	public class Gun extends Sprite
	{		
		//##IMAGES-----------------------------------------------------------------|
		//public static var bulletSprite:Image; 
		public static var bulletSprite:symBullet;
		//-------------------------------------------------------------------------|
		
		//##ATTR-------------------------------------------------------------------|
		public var _bullet:Array;
		public var fireGun:Boolean = false;

		public static var AMMOCOUNT:int = 9999;
		public static const BULLETSPEED:Number = 35;
		public static const BACK:uint = 0x01000016;
		public static const ENTER:uint = 0x01000016;
		//-------------------------------------------------------------------------|
        

        //-------------------------------------------------------------------------|
        //##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
		public function Gun()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}
		public function stageSetup(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
			this.addEventListener(KeyboardEvent.KEY_UP, onKeyUpInput);
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownInput);
			_bullet = new Array();
			drawBullet();
		}
		//-------------------------------------------------------------------------|
		

		//-------------------------------------------------------------------------|
        //##HANDLE INPUT||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
		public function onKeyDownInput(e:KeyboardEvent):void {
			if ( e.keyCode == ENTER || e.keyCode == 13 ) {
				fireGun = true;
				trace("** Bullet Fired");
				drawBullet();
			}
			//RELOAD KEY
			if ( e.keyCode == 82 ) {
				trace("** Ammo Reloaded");
				AMMOCOUNT = 10;
			}
		}
		public function onKeyUpInput(e:KeyboardEvent):void {
			if ( e.keyCode == ENTER || e.keyCode == 13 ) {
				//fireGun = false;
			}
		}
		public function handlePlayerInput():void {
			if ( fireGun == true ) {
				this.addEventListener(Event.ENTER_FRAME, updateFrame);
			} 

		}
		//-------------------------------------------------------------------------|


		//-------------------------------------------------------------------------|
        //##UPDATE||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   		//-------------------------------------------------------------------------|
		public function updateFrame(e:Event):void {
			bulletArray();
		}
		//-------------------------------------------------------------------------|
		

		//-------------------------------------------------------------------------|
        //##BULLET ARRAY||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
		public function bulletArray():void {
			
			var length:Number = _bullet.length;

			for(var i:Number=0; i< _bullet.length; i++) {
				_bullet[i].x = Player.playerSprite.x; 
				_bullet[i].y -= BULLETSPEED + Math.sin(1) * 3 ;
				_bullet[i].rotation += 0.25;
				//_bullet[i].scaleX += 0.2;
				//_bullet[i].scaleY += 0.2;											
				_bullet[i].alpha = 1; 								

				for (var bCount=0; bCount< _bullet.length; bCount++) {
					if ( _bullet[bCount].y <= 0 ) {
						trace('Bullet Terminated');
						Starling.current.nativeOverlay.removeChild(_bullet[bCount]);
						_bullet.splice(bCount, 1);
					} 
					else if ( _bullet[bCount] == null ) {
						_bullet.splice(bCount, 1);
						Starling.current.nativeOverlay.removeChild(_bullet[bCount])
					}
				}
			}
		}
		//-------------------------------------------------------------------------|


        //-------------------------------------------------------------------------|
        //##MAKE BULLET|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
		public function drawBullet():void {
			if (AMMOCOUNT >= 1 ) {
				//bulletSprite = new Image(Assets.getTexture("bulletBlu"));
				bulletSprite = new symBullet();
				bulletSprite.alpha = 0;
				bulletSprite.y = Player.playerSprite.y;
				Starling.current.nativeOverlay.addChild(bulletSprite);
				_bullet.push(bulletSprite);
				AMMOCOUNT --;
			}
		}
		//-------------------------------------------------------------------------|


 		//-------------------------------------------------------------------------|
        //##KILL BULLET|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
		public function removeBullet(bullet:Image):void {
			trace("** Bullet Terminated");
			Starling.current.nativeOverlay.removeChild(bulletSprite);
		}
		//-------------------------------------------------------------------------|
	}
}