package code.system {
	
	import flash.display.Sprite;
	import starling.display.Sprite;

	public class GS extends Sprite {
		public var dx:Number;
		public var dy:Number;

		public function GS() {
			super();
			cacheAsBitmap = true;

			dx = 0;
			dy = 0;
		}

		public function get top():Number {
			return y - height/2;
		}

		public function set top(value:Number):void {
			y = value + height/2;
		}

		public function get bottom():Number {
			return y + height/2;
		}

		public function set bottom(value:Number):void {
			y = value - height/2;
		}
		
	}
}