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
		public static var bulletBlu:Image; 
		//-------------------------------------------------------------------------|
		
		//##ATTR-------------------------------------------------------------------|
		public var _bullet:Array;
		public var fireGun:Boolean = false;

		public static var AMMOCOUNT:int = 500;
		public static const BULLETSPEED:Number = 65;
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

				_bullet[i].y -= BULLETSPEED;						//Add negative for Y-axis
										
				_bullet[i].alpha = 1; 								//Make Bullet Visible

				for (var bCount=0; bCount< _bullet.length; bCount++) {
					if ( _bullet[bCount].y <= 0 ) {
						trace('Bullet Terminated');
						removeChild(_bullet[bCount]);
						_bullet.splice(bCount, 1);
					} 
					else if ( _bullet[bCount] == null ) {
						_bullet.splice(bCount, 1);
						removeChild(_bullet[bCount])
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
				bulletBlu = new Image(Assets.getTexture("bulletBlu"));
				//lletBlu.x = Player.playerSprite.x;
				bulletBlu.x = Player.playerSprite.x + 31; //Position of Bullet synced to the player
				bulletBlu.alpha = 0;
				bulletBlu.y = Player.playerSprite.y;
				this.addChild(bulletBlu);
				_bullet.push(bulletBlu);
				AMMOCOUNT --;
			}
		}
		//-------------------------------------------------------------------------|


 		//-------------------------------------------------------------------------|
        //##KILL BULLET|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
		public function removeBullet(bullet:Image):void {
			trace("** Bullet Terminated");
			removeChild(bulletBlu);
		}
		//-------------------------------------------------------------------------|
	}
}