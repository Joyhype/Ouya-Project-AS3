package io.arkeus.ouya.control {
	import flash.ui.GameInputControl;
	
	import io.arkeus.ouya.controller.GameController;

	public class JoystickControl extends ButtonControl {
		private static const JOYSTICK_THRESHOLD:Number = 0.5;

		private var xAxis:GameControl;
		private var yAxis:GameControl;
		
		public var left:ButtonControl;
		public var right:ButtonControl;
		public var up:ButtonControl;
		public var down:ButtonControl;
		
		private var reversedY:Boolean;
		
		public function JoystickControl(device:GameController, xAxis:GameInputControl, yAxis:GameInputControl, joystickButton:GameInputControl, reversedY:Boolean = false) {
			super(device, joystickButton);
			
			this.xAxis = new GameControl(device, xAxis);
			this.yAxis = new GameControl(device, yAxis);
			
			this.left = new ButtonControl(device, xAxis, -1, -JOYSTICK_THRESHOLD);
			this.right = new ButtonControl(device, xAxis, JOYSTICK_THRESHOLD, 1);
			
			if (reversedY) {
				this.down = new ButtonControl(device, yAxis, JOYSTICK_THRESHOLD, 1);
				this.up = new ButtonControl(device, yAxis, -1, -JOYSTICK_THRESHOLD);
			} else {
				this.up = new ButtonControl(device, yAxis, JOYSTICK_THRESHOLD, 1);
				this.down = new ButtonControl(device, yAxis, -1, -JOYSTICK_THRESHOLD);
			}
			
			this.reversedY = reversedY;
		}
		
		public function get x():Number {
			return xAxis.value;
		}
		
		public function get y():Number {
			return reversedY ? -yAxis.value : yAxis.value;
		}
		
		/**
		 * Returns the angle of the joystick in radians.
		 * 
		 * @return The rotation of the joystick in radians.
		 */
		public function get angle():Number {
			return Math.atan2(y, x);
		}
		
		/**
		 * Returns a flash-friendly value for this stick's position in degrees.
		 * 
		 * @return The rotation of the joystick in degrees.
		 */
		public function get rotation():Number {
			return (Math.atan2(-y, x) + (Math.PI / 2)) * 180 / Math.PI;
		}
		
		public function get distance():Number {
			return Math.min(1, Math.sqrt(x * x + y * y));
		}
	}
}
