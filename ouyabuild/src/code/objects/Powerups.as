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
    import code.objects.Powerup_Health;

	public class Powerups extends Entity
	{
		private var HP:Powerup_Health;

        //-------------------------------------------------------------------------|
        //##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //-------------------------------------------------------------------------|
		public function Powerups()
		{
			super();
		}

		protected override function initialize():void {
			super.initialize();

			HP = new Powerup_Health();
			this.addChild(HP);
		}

		protected override function update(e:Event):void {
			
		}



		//-------------------------------------------------------------------------|
	}
}