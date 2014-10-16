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
    import code.objects.Enemies;

	public class Health extends Entity
	{
		//##IMAGE ASSETS-----------------------------------------------------------|	
		private var _pwrHP:Image;
		//-------------------------------------------------------------------------|	
	    
	    //##ATTR-------------------------------------------------------------------|	
		private static var playerLives:Number = 3;
		private var _setHP:Array = new Array(); 
		//-------------------------------------------------------------------------|	

		//-------------------------------------------------------------------------|
		//##INIT||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function Health()
		{
			super();
		}

		protected override function initialize():void {
			super.initialize();
			setLives();
		}

		protected override function update(e:Event):void {

		}
		//-------------------------------------------------------------------------|	

		//-------------------------------------------------------------------------|
		//##ARRAY|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function setLives():void {
			var length:Number = playerLives;

			for ( var i:Number = 0; i < length; i++) {
				createBaseSprite();
				_setHP[i].x = ( (stage.stageWidth - _pwrHP.width) / 2 - 360) + i * 40;
				trace("Player HP is", _setHP.length);
			}
		}
		//-------------------------------------------------------------------------|	
		
		//-------------------------------------------------------------------------|
		//##CREATE||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function createBaseSprite():void {
			_pwrHP = new Image(Assets.getTexture("objUIHPAlive"));
			_pwrHP.y = 87;
			this.addChild(_pwrHP);
			_setHP.push(_pwrHP);
		}

		private function removeHP():void {
			//TODO: When Player hits Enemy remove HP 
			//TODO: When Enemy Falls Below Screen Remove HP?
		}

		private function addHP():void {
			//TODO: When Player Collides with HP Powerup ++
		}

		private function killPlayer():void {
			//TODO: When Player HP reaches 0 Call GameOver.
		}
		//-------------------------------------------------------------------------|	
	}
}