/*
	* GAME: HYPERSPHERE
	
	* AUTHOR: MATTHEW STENQUIST
	
	* -- @MATTSTENQUIST
	
	* COMPANY: JOYHYPE
	
	* ALL RIGHTS RESERVED;

	* HTTP://WWW.JOYHYPE.COM
*/

package
{
	//BASIC APIS
	import flash.display.Sprite;
	import starling.core.Starling;
	import flash.desktop.*;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.display.Sprite;	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Rectangle;
	import flash.events.MouseEvent;

	//INTERNAL LIBRARIES
	import code.system.GameEngine;
	import code.system.Layer;

	[SWF(frameRate="60", width="1920", height="1080", backgroundColor="#000000")]
	public class Main extends MovieClip {
		
		public var _starling:Starling;
		public static var screenWidth:Number = 0.0;
		public static var screenHeight:Number = 0.0;

		public function Main() {
			addEventListener(Event.ADDED_TO_STAGE, stageSetup);	
		}

		private function stageSetup(e:Event):void  {
			removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
			
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		  	stage.scaleMode = StageScaleMode.EXACT_FIT;
		   	stage.align = "";

			var rect:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
			screenWidth = stage.fullScreenWidth  > 1920 ? 1920 : stage.fullScreenWidth;
			screenHeight = stage.fullScreenHeight > 1080 ? 1080  : stage.fullScreenHeight;

			Starling.handleLostContext = true;
			e.preventDefault();
			
			//Create GameEngine Class
			_starling = new Starling( GameEngine, stage);
			_starling.antiAliasing = 0;
			_starling.start();
			
			_starling.showStats = true;	
			stage.addEventListener(KeyboardEvent.KEY_DOWN, escKeyOverride);	
			stage.addEventListener(KeyboardEvent.KEY_DOWN, enableFullScreen);
			stage.addEventListener(Event.RESIZE, resize);	
		}
		
		private function enableFullScreen(e:KeyboardEvent):void {
		}
		
		private function escKeyOverride(e:KeyboardEvent):void  {
			 if (e.keyCode == 27) {
			 	e.preventDefault();
			   	stage.align = "";
		    }
		}

		private function resize(e:Event):void {
			var viewPortRectangle:Rectangle = new Rectangle();
			viewPortRectangle.width     = stage.stageWidth;
			viewPortRectangle.height    = stage.stageHeight;
			Starling.current.viewPort   = viewPortRectangle;
			_starling.stage.stageWidth  = stage.stageWidth;
			_starling.stage.stageHeight = stage.stageHeight;
		}
	}
}