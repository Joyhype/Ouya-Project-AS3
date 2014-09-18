package code.system 
{
	
	//GAME APIS AND LIBRARIES
	import flash.system.*;
	import flash.display.Stage;
	import starling.display.Stage;
	//GAME CODE LIBRARIES
	import code.system.GS; 

	public class Layer extends Object 
	{

		//DECLARE WORLD LAYERS
		public static var FG1:GS;
		public static var BG1:GS;
		public static var HUD:GS;
		public static var UNIVERSAL:GS;

		public static function init(stageRef:Stage) 
		{
			Layer.FG1 = new GS();
			stageRef.addChild(Layer.FG1);

			Layer.BG1 = new GS();
			stageRef.addChild(Layer.BG1);

			Layer.HUD = new GS();
			stageRef.addChild(Layer.HUD);

			Layer.UNIVERSAL = new GS();
			stageRef.addChild(Layer.UNIVERSAL);
		}


		public function removAll():void {
			//CLEANUP
			super.dispose();
			system.gc();
		}
	}






}