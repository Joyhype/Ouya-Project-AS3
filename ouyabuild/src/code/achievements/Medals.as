package code.achievements
{

	import flash.display.MovieClip;
	import com.newgrounds.*;
	import com.newgrounds.components.*;

	public class Medals extends MovieClip {

		public function Medals() {
			//var popup:MedalPopup = new MedalPopup();
			//this.addChild(popup);
		}

		public function unlockCoin() {
			API.unlockMedal("TestMedal2");
			trace("Medal Unlocked!");
			var popup:MedalPopup = new MedalPopup();
			popup.x = (stage.stageWidth - popup.width)/2;
			popup.y = 15;
			this.addChild(popup);
		}
	}
}