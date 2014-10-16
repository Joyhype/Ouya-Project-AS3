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
	import flash.events.KeyboardEvent; 
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.utils.Timer;
	import flash.system.*;
	//GAME STUFF
	import code.managers.ScreenManager;
	import code.achievements.Medals;
	import code.objects.Ad;

	public class Entity extends Sprite
	{

		//-------------------------------------------------------------------------|
		//##SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function Entity() {
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, initialize);
		}

		protected virtual function initialize():void {
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, initialize);

			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			this.addEventListener(Event.ENTER_FRAME, update);
		}

		protected virtual function update(e:Event):void {

		}

		protected virtual function onKeyDown(e:KeyboardEvent):void {

		}

		protected virtual function onKeyUp(e:KeyboardEvent):void {

		}


		//-------------------------------------------------------------------------|
		//#ENDFILE-----------------------------------------------------------------|
	}
}