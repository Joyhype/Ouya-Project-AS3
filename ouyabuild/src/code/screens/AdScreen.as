package code.screens
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
	import flash.events.KeyboardEvent; 
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.utils.Timer;
	import flash.system.*;
	//GAME STUFF
	import code.managers.ScreenManager;
	import code.achievements.Medals;
	import code.objects.Ad;

	public class AdScreen extends Sprite
	{
		//##IMAGE ASSETS-----------------------------------------------------------|	
		private var ad_spaceBg:Image;						
		private var ad_Cover:Image;	
		private var flash:flashWhite;
		//-------------------------------------------------------------------------|
		//##BUTTONS----------------------------------------------------------------|	
		private var button_Play:PlayBTN; 					//..PLAYBTN
		private var button_Avatar:AvatarBTN;				//..AVATARBTN
		private var button_NG:NGBTN;
		//-------------------------------------------------------------------------|
		//##SYMBOLS----------------------------------------------------------------|
		private var ad_whiteBg:animateWhiteBg;				//..WHITEBG FADEOUT
		private var preloadAnimation:animatePreloader; 		//..ANIMATION BAR
		private var enableSound:animateEnable; 				//..ENABLE SOUND TXT
		//-------------------------------------------------------------------------|
		//##OBJECTS----------------------------------------------------------------|	
		private var achievement:Medals;						//..MEDAL OBJECT
		private var ad:Ad;									//..AD OBJECT
		private var screenManager:ScreenManager;			//..MANAGER OBJECT
		//-------------------------------------------------------------------------|
		//##TWEENS-----------------------------------------------------------------|	
		private var playBtnTween:Tween;						//..TWEEN FOR PLAYBT		
		//-------------------------------------------------------------------------|
		//##TIMERS-----------------------------------------------------------------|
		private var removeScreen:Timer;				//..REMOVE SCREEN
		//-------------------------------------------------------------------------|

		//-------------------------------------------------------------------------|
		//##SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function AdScreen() {
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup)
		}
		private function stageSetup(event:Event):void {
			initAssets();						
			button_Avatar.addEventListener(MouseEvent.CLICK, onClickAvatar);
			button_Play.addEventListener(MouseEvent.CLICK, onClickPlay);
			removeScreen = new Timer(250,1);
			removeScreen.addEventListener(TimerEvent.TIMER, onFlash);
		}
		//-------------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		//##INIT||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function initAssets():void {
			drawAdCover();
			createAd();	
			drawAvatar();
			drawPlayBTN();
			drawNGBTN();

			//createScreenManager();							//..NEEDS TO EXIST
		}
		//-------------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		//##CREATEOBJECTS|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function createAd() {
			ad = new Ad();
			Starling.current.nativeOverlay.addChild(ad);
			ad.createAd();
		}
		private function createScreenManager() {
			screenManager = new ScreenManager();
			this.addChild(screenManager);
		}

		//-------------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		//##ONCLICK|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function onClickAvatar(e:MouseEvent):void {
			trace("[AXION ENGINE] :: ==== AVATAR BUTTON CLICKED");
			var urlRedirect:URLRequest = new URLRequest("http://joyhype.newgrounds.com");
			navigateToURL(urlRedirect, "_blank");
		}
		private function onClickPlay(e:MouseEvent):void {
			removeScreen.start();
			drawFlash();		
		}
		private function onFlash(e:TimerEvent):void {
			removeScreen.stop();
			removeAll();	
			ScreenManager.handleState(1);
		}


		//-------------------------------------------------------------------------|
		//-------------------------------------------------------------------------|
		//##DRAW||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		private function drawBg() {
			//--SPACE BG
			ad_spaceBg = new Image(Assets.getTexture("adBg"));
			this.addChild(ad_spaceBg);
		}
		private function drawAdCover() {
			ad_Cover = new Image(Assets.getTexture("adCover"));
			this.addChild(ad_Cover);
		}
		private function drawAvatar() {
			button_Avatar = new AvatarBTN();
			button_Avatar.x = 573;//573;	
			button_Avatar.y = 435;	
			Starling.current.nativeOverlay.addChild(button_Avatar);
		}
		private function drawFlash() {
			flash = new flashWhite();
			flash.x = (stage.stageWidth - flash.width)/2;
			flash.y = (stage.stageHeight - flash.height)/2;
			Starling.current.nativeOverlay.addChild(flash);
		}
		private function drawNGBTN() {
			button_NG = new NGBTN();
			button_NG .alpha = 0;
			button_NG.x = 230;
			button_NG.y = 361;
			Starling.current.nativeOverlay.addChild(button_NG);
			playBtnTween = new Tween(button_NG, 0.85, Transitions.EASE_IN);
			playBtnTween.fadeTo(1);
			Starling.juggler.add(playBtnTween);
		}
		private function drawPlayBTN() {
			button_Play = new PlayBTN();
			button_Play.alpha = 0;
			button_Play.x = 410;
			button_Play.y = 361;
			Starling.current.nativeOverlay.addChild(button_Play);
			playBtnTween = new Tween(button_Play, 0.85, Transitions.EASE_IN);
			playBtnTween.fadeTo(1);
			Starling.juggler.add(playBtnTween);
		}
		//-------------------------------------------------------------------------|

		//-------------------------------------------------------------------------|
		//##REMOVE||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|
		public function removeAll():void {
			this.removeChild(ad_spaceBg);
			this.removeChild(ad_Cover);
			Starling.current.nativeOverlay.removeChild(flash);
			Starling.current.nativeOverlay.removeChild(button_Avatar);
			Starling.current.nativeOverlay.removeChild(button_NG);
			Starling.current.nativeOverlay.removeChild(button_Play);
			ad.removeAll();
			System.gc();
			super.dispose();
		}
		//-------------------------------------------------------------------------|
		//#ENDFILE-----------------------------------------------------------------|
	}
}