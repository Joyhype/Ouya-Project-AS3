package 
{
	import flash.utils.Dictionary;
	import flash.display.Bitmap;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets 
	{
		//-------------------------------------------------------------------------|
		//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//||||||||||||||||||||||||||||||--[IMAGES]--||||||||||||||||||||||||||||||||
		//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
		//-------------------------------------------------------------------------|

		//$$AD SCREEN ASSETS-------------------------------------------------------|
		//
		//-- AD BOX CONTAINER
		[Embed(source="../media/graphics/ad_container.png")]			
		public static const adBox:Class;
		//--BG FOR AD PAGE
		[Embed(source="../media/graphics/ad_bg.png")]				
		public static const adBg:Class;
		//--GAME TILTE FOR AD PAGE
		[Embed(source="../media/graphics/ad_gametitle.png")]		
		public static const adGameTitle:Class;
		//--BLACK FADE BG 
		[Embed(source="../media/graphics/ad_blkbg.png")]			
		public static const adBlkBG:Class;
		//--LINES AD PAGE
		[Embed(source="../media/graphics/ad_lines.png")]			
		public static const adLines:Class;
		//--LOADING PRELOADER
		[Embed(source="../media/graphics/loading.png")]				
		public static const loadingBar:Class;
		//--SOUND ENABLED TEXT
		[Embed(source="../media/graphics/text/txt_soundenabled.png")]
		public static const txtSoundEnabled:Class;
		//--SOUND DISABLED TEXT
		[Embed(source="../media/graphics/text/txt_sounddisabled.png")]
		public static const txtSoundDisabled:Class;

		[Embed(source="../media/graphics/1920graphic.png")]			
		public static const G19201080:Class;

		[Embed(source="../media/graphics/testimg.png")]			
		public static const testImg:Class;












		[Embed(source="../media/graphics/whitebg.png")]			
		public static const bgWhite:Class;

		[Embed(source="../media/graphics/logos/gameLogoCircle.png")]			
		public static const gameLogoCircle:Class;

		//[Embed(source="../media/graphics/logos/gameLogoHelmet.png")]			
		//public static const gameLogoHelmet:Class;

		[Embed(source="../media/graphics/buttons/buttonO_Ouya.png")]			
		public static const btnO:Class;

		[Embed(source="../media/graphics/buttons/buttonO_ouyaGreen.png")]			
		public static const btnOGreen:Class;

		[Embed(source="../media/graphics/text/copyright.png")]			
		public static const copyrightFooter:Class;

		[Embed(source="../media/graphics/buttons/backbtn.png")]			
		public static const btnBack:Class;


		[Embed(source="../media/graphics/weapons/bullet.png")]			
		public static const bulletBlu:Class;






		[Embed(source="../media/graphics/noise/noise_ov1.png")]			
		public static const noise1:Class;


		[Embed(source="../media/graphics/mxv2.png")]			
		public static const mxv2:Class;




		[Embed(source="../media/graphics/clouds/bigcloud.png")]			
		public static const bigCloud:Class;


		[Embed(source="../media/graphics/background/blackbg.png")]			
		public static const blackBG:Class;

		[Embed(source="../media/graphics/text/gameTitle.png")]			
		public static const gameTitle:Class;


		[Embed(source="../media/graphics/text/gameTitleSkull.png")]			
		public static const gameTitleSkull:Class;


		[Embed(source="../media/graphics/text/copyrightTEXT.png")]			
		public static const copyrightText:Class;












		//-------------------------------------------------------------------------|

		//$$MENU SCREEN ASSETS-----------------------------------------------------|
		//
		//--MENU CREDITS COVER POPUP
		[Embed(source="../media/graphics/menu/menu_creditsCover.png")]	
		public static const menuCreditsCover:Class;
		//--CREDITS INFO TEXT
		[Embed(source="../media/graphics/menu/menu_creditsInfo.png")]	
		public static const menuCreditsInfo:Class;
		//-------------------------------------------------------------------------|

		//$$DIFFICULTY ASSETS------------------------------------------------------|
		//
		//--SELECT IFFICULTY TEXT
		[Embed(source="../media/graphics/text/txt_selectdiff.png")]		
		public static const textDifficulty:Class;
		//--EASY (TELL ME A STORY)
		[Embed(source="../media/graphics/buttons/button_easy.png")]	
		public static const btnEasy:Class;
		//--MEDIUM (CHALLENGE ME)
		[Embed(source="../media/graphics/buttons/button_medium.png")]	
		public static const btnMedium:Class;
		//--HARD (BREAK MY KEYBOARD)
		[Embed(source="../media/graphics/buttons/button_hard.png")]
		public static const btnHard:Class;
		//--EASY COVER
		[Embed(source="../media/graphics/menu/difficulty/easycover.png")]
		public static const difficultyEasy:Class;
		//--MEDIUM COVER
		[Embed(source="../media/graphics/menu/difficulty/mediumcover.png")]
		public static const difficultyMedium:Class;
		//--HARD COVER
		[Embed(source="../media/graphics/menu/difficulty/hardcover.png")]
		public static const difficultyHard:Class;
		//-------------------------------------------------------------------------|


		[Embed(source="../media/graphics/player.png")]
		public static const playerBase:Class;


		[Embed(source="../media/graphics/levels/level0/ground_level0.png")]
		public static const level0Ground:Class;


		[Embed(source="../media/graphics/levels/level0/bg_level0.png")]
		public static const level0BG:Class;

		[Embed(source="../media/graphics/text/txt_introduction.png")]	
		public static const txtIntro:Class;


		//$$OVERLAY ASSETS---------------------------------------------------------|
		//
		//--TV SCAN
		[Embed(source="../media/graphics/overlay_tvscan.png")]			
		public static const scanlines:Class;
		//--NOISE1
		[Embed(source="../media/graphics/overlay_noise.png")]		
		public static const noise:Class;
		//--NOISE2
		[Embed(source="../media/graphics/overlay_noiseDis.png")]	
		public static const noiseDis:Class;
		[Embed(source="../media/graphics/vignette.png")]	
		public static const vignette:Class;


		//-------------------------------------------------------------------------|
		

		[Embed(source="../media/graphics/text/txt_save.png")]	
		public static const txt_save:Class;
		[Embed(source="../media/graphics/saveslot/slot_1cover.png")]	
		public static const slot1cover:Class;
		[Embed(source="../media/graphics/saveslot/slot_2cover.png")]	
		public static const slot2cover:Class;
		[Embed(source="../media/graphics/saveslot/slot_3cover.png")]	
		public static const slot3cover:Class;

		[Embed(source="../media/graphics/titleGraphic.png")]	
		public static const titleGraphic:Class;
























		[Embed(source="../media/graphics/adcover.png")]			
		public static const adCover:Class;


		//$$CAT PLAYER-------------------------------------------------------------|
		//-------------------------------------------------------------------------|

		[Embed(source="../media/graphics/speedlines.png")]			
		public static const speedLines:Class;

		[Embed(source="../media/graphics/staticLines.png")]			
		public static const staticLines:Class;

		[Embed(source="../media/graphics/staticbg.png")]			
		public static const staticBG:Class;
		
		[Embed(source="../media/graphics/staticbg2.png")]			
		public static const staticBG2:Class;

		[Embed(source="../media/graphics/objects/coin.png")]			
		public static const coin:Class;



		[Embed(source="../media/graphics/pausebutton.png")]			
		public static const pause:Class;


		[Embed(source="../media/graphics/pauseOverlay.png")]			
		public static const pauseOverlay:Class;


		[Embed(source="../media/graphics/panda.png")]			
		public static const panda:Class;











		//** OUYA SHIT **//
		//..Objects
		[Embed(source="../media/graphics/ImageAssets/object_player.png")]
		public static const objPlayer:Class;
		//..BG Items
		[Embed(source="../media/graphics/ImageAssets/bg_base01.png")]
		public static const bgBase01:Class;
















		//$$SPRITE SHEET-----------------------------------------------------------|
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		//[Embed(source="../media/graphics/mySpritesheet.png")]
		//public static const AtlasTextureGame:Class;

		//[Embed(source="../media/graphics/mySpritesheet.xml", mimeType="application/octet-stream")]
		//public static const AtlasXmlGame:Class;

		/*public static function getAtlas():TextureAtlas
		{
			if (gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame());
				gameTextureAtlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
		}*/

		public static function getTexture(name:String):Texture 
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
	}
}