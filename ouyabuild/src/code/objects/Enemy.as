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
    //LOCAL
    import code.objects.Player;
    import code.objects.Gun;
    import code.objects.Bullet;
    import code.achievements.Medals;

	public class Enemy extends Entity
	{
		public static var SPEED:Number = 2;
		public static var MAXSPEED:Number = 5;

		private var rotationSpeed:Number;
		private var e1:symEnemy01;

		public function Enemy() {
			super();
		}

		function randomRange(max:Number, min:Number = 0):Number
		{
		     return Math.random() * (max - min) + min;
		}

		protected override function initialize():void {
			super.initialize();

			e1 = new symEnemy01();

			var xpos = Math.floor(Math.random() * 5);
			e1.x = 120 + (xpos * (1920 - 240) / 4); 
			e1.y = -200;// - Math.random() * 500;
			
			Starling.current.nativeOverlay.addChild(e1);

			rotationSpeed = randomRange(5,-5);
		}

		protected override function update(e:Event):void {
			e1.y += SPEED;
			e1.rotation += rotationSpeed;

			doCollisionDetection();

			if (e1.y >= 1080) {
				remove();
			}
		}

		private function doCollisionDetection():void {
			var rem:Boolean = false;

			for(var j:Number = Bullet.bullets.length -1; j >= 0; j--) {
				var b:Bullet = Bullet.bullets[j];
				if (b != null) {
					if (e1.hitTestObject(b.sprite)){
						Bullet.bullets[j].remove();
						rem = true;
						break;
					}	
				}
			}

			if (rem) {
				remove();
			}
		}

		private function remove():void {
			Starling.current.nativeOverlay.removeChild(e1);
			this.removeEventListener(Event.ENTER_FRAME, update);
			this.parent.removeChild(this);
		}
	}
}