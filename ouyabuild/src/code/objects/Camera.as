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

	public class Camera extends Sprite
	{
		//..SPRITES
		public var coinSprite:Image;

		public var dropper:Array;

		//-------------------------------------------------------------------------|
		//##SETUP------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		public function Camera()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}

		public function stageSetup(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
		}
		
	
		//-------------------------------------------------------------------------|
	}
}