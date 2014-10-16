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
    import code.objects.Gun;

	public class Bullet extends Entity
	{		

		public static var bullets:Array = new Array();
		//##IMAGES-----------------------------------------------------------------| 
		public var sprite:symBullet;
		//-------------------------------------------------------------------------|
		
		//##ATTR-------------------------------------------------------------------|
		public var PosX:Number;
		public var PosY:Number;
		public var Speed:Number = 50;
		public var rotationSpeed:Number = 0.2;

		public var sfx_gun:gunSnd;

		private var initialized:Boolean = false;

		//-------------------------------------------------------------------------|

        //-------------------------------------------------------------------------|
        //##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
		public function Bullet( posX:Number, posY:Number)
		{
			super();
			
			PosX = posX;
			PosY = posY;

			bullets.push(this);
		}

		protected override function initialize():void {
			super.initialize();

			sfx_gun = new gunSnd();
			sfx_gun.play();

			sprite = new symBullet();
			sprite.x = PosX;
			sprite.y = PosY;
			sprite.alpha = 1;
			Starling.current.nativeOverlay.addChild(sprite);
			initialized = true;
		}

		protected override function update(e:Event):void {
			sprite.y -= Speed;
			sprite.rotation += rotationSpeed;

			if (sprite.y <= -2) {
				remove();
			}
		}

		public function remove():void {
			if (initialized) {
				Starling.current.nativeOverlay.removeChild(sprite);
			}
			this.removeEventListener(Event.ENTER_FRAME, update);
			this.parent.removeChild(this);

			bullets.splice(bullets.indexOf(this),1);
		}

		//-------------------------------------------------------------------------|
	}
}