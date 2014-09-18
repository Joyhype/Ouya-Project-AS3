/*
	* GAME: ULTRABLASTO
	* AUTHOR: MATTHEW STENQUISt
	* COMPANY: JOYHYPE / NIGHTMARE PANDA
	* ALL RIGHTS RESEVERED 

	- Last updated: June, 27, 2014 
*/

package code.levels
{
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
	import starling.display.MovieClip;

	import code.objects.Player;

	import flash.events.TimerEvent;
 	import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.geom.Point;
    import flash.geom.Rectangle;

	public class Level0 extends Sprite
	{
		
		public var bg:Image;
		public var ground:Image;

		public function Level0()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
		}

		private function stageSetup(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
			drawBG();
			drawGround();
		}

		public function drawBG():void {
			bg = new Image(Assets.getTexture("level0BG"));
			this.addChild(bg);
		}

		public function drawGround():void {
			ground = new Image(Assets.getTexture("level0Ground"));
			ground.y = 500;
			this.addChild(ground);
		}
	}
}