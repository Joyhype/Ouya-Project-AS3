/*
	* GAME: ULTRABLASTO
	* AUTHOR: MATTHEW STENQUISt
	* COMPANY: JOYHYPE / NIGHTMARE PANDA
	* ALL RIGHTS RESEVERED 

	- Last updated: June, 27, 2014 
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

	//NEWGROUNDS
	import com.newgrounds.*;
	import com.newgrounds.components.*;

	//INTERNAL LIBRARIES
	import code.system.GameEngine;
	import code.system.Layer;

	[SWF(frameRate="60", width="1920", height="1080", backgroundColor="#FFFFFF")]
	public class Main extends MovieClip {
		
		public var _starling:Starling;
		public static var screenWidth:Number = 0.0;
		public static var screenHeight:Number = 0.0;

		public function Main() {
			API.connect(root, "37262:kmNmHbga", "3ALi7a1btK6bfSpZc94assGDXFdAsA6g");
			//API.debugMode = API.RELEASE_MODE;
			addEventListener(Event.ADDED_TO_STAGE, stageSetup);	
		}

		private function stageSetup(e:Event):void  {
			removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
			
			stage.displayState = StageDisplayState.NORMAL;
		  	stage.scaleMode = StageScaleMode.EXACT_FIT;
		   	stage.align = "";

			var rect:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
			//screenWidth = stage.fullScreenWidth  > 2560 ? 2560 : stage.fullScreenWidth;
			//screenHeight = stage.fullScreenHeight > 1440 ? 1440  : stage.fullScreenHeight;

			Starling.handleLostContext = false;
			_starling = new Starling( GameEngine, stage);
			_starling.antiAliasing = 1;
			_starling.start();
			
			_starling.showStats = true;	
			stage.addEventListener(KeyboardEvent.KEY_DOWN, escKeyOverride);	
			stage.addEventListener(KeyboardEvent.KEY_DOWN, enableFullScreen);
			stage.addEventListener(Event.RESIZE, resize);	
		}
		private function enableFullScreen(e:KeyboardEvent):void {
		    if (e.keyCode == 8) {
		    	stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
		  		stage.scaleMode = StageScaleMode.NO_SCALE
		   		stage.align = "";
		    } 
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