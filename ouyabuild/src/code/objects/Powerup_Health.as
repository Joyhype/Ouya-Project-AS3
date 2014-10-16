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

	public class Powerup_Health extends Entity
	{
		private var _pwrHP:Image;
		private var posY:Number = 5;

		// TO DO
		//
		// Setup Timer to randomly drop HP Pickup when Health < 3
		// Randomly set HP drop into the slots
		// If Go off Screen Remove
		//

		public function Powerup_Health()
		{
			super();
		}

		protected override function initialize():void {
			super.initialize();
			createHPSprite();
		}

		protected override function update(e:Event):void {
			_pwrHP.y += posY;
			remove();
		}

		private function createHPSprite():void {
			_pwrHP = new Image(Assets.getTexture("objPWRUPHealth"));
			_pwrHP.y = -500;
			_pwrHP.x = 90 + ((1920 - 240) / 4); 
			this.addChild(_pwrHP);
		}

		private function remove():void {
			if (_pwrHP.y >= stage.stageHeight + 20) {
				this.removeChild(_pwrHP);
			}
		}

	}
}