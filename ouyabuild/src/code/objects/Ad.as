package code.objects 
{
	
	import flash.display.MovieClip
	import flash.display.DisplayObject;
	import com.newgrounds.components.*;
	import com.newgrounds.API;
	
	public class Ad extends MovieClip
	{
		public var flashAd:FlashAd;
		public var adType:String = "Simple"; 	//SIMPLE FOR PIC AS OR VIDEO FOR BOTH VIDEO AND SIMPLE

		public function createAd() {
			flashAd = new FlashAd();
			flashAd.adType = "Simple";
			flashAd.x = (stage.stageWidth - flashAd.width) /2 - 6;
			flashAd.y = (stage.stageHeight - flashAd.height) /2 - 24;
			this.addChild(flashAd);
		}

		public function removeAll() {
			this.removeChild(flashAd);
			trace("[ENGINE] :: ==== AD REMOVED")
		}
	}
}