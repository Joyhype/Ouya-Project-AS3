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
    import code.objects.Bullet;

	public class Gun extends Entity
	{

		//##ATTR-------------------------------------------------------------------|
		public static var AMMOCOUNT:int = 9999;
		public static const BACK:uint = 0x01000016;
		public static const ENTER:uint = 0x01000016;
		//-------------------------------------------------------------------------|
        

        //-------------------------------------------------------------------------|
        //##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
		public function Gun()
		{
			super();
		}

		protected override function initialize():void {
			super.initialize();
		}

		protected override function update(e:Event):void {

		}

		protected override function onKeyDown(e:KeyboardEvent):void {
			if (e.keyCode == ENTER || e.keyCode == 13) {
				trace("** Bullet Fired");

				var b = new Bullet(Player.playerSprite.x, Player.playerSprite.y);
				this.addChild(b);
			}
		}

		protected override function onKeyUp(e:KeyboardEvent):void {

		}

		//-------------------------------------------------------------------------|
	}
}