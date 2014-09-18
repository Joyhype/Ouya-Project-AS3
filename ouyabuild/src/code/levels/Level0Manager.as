package code.levels
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
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.utils.Timer;
    //CODE BASE
    import code.objects.Player;
    import code.levels.Level0;

    public class Level0Manager extends Sprite
    {
            public var player:Player;
            public var level0:Level0;
            private var _vignette:Image;
            private var _blackBG:Image;
            private var _txtIntro:Image;
            private var _1920x1080:Image;
            private var _testIMG:Image;

            private var ScrollX:Number = 8;
            private var ScrollY:Number = 1.2;
            private var onGround:Boolean;

            private var introTimer:Timer;
            private var spawnIntroTxt:Timer;

            private var uniTween:Tween;
            private var logoGameTween:Tween;

            //-------------------------------------------------------------------------|
            //##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            public function Level0Manager()
            {
                    super();
                    this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
            }
            private function stageSetup(event:Event):void {
                    this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
                    this.addEventListener(Event.ENTER_FRAME, updateFrame);
                    initLevel();
                    
                    //drawBlackBG();
                    /*introTimer = new Timer(00);
                    introTimer.addEventListener(TimerEvent.TIMER, onIntroComplete);
                    introTimer.start();

                    spawnIntroTxt = new Timer(00);
                    spawnIntroTxt.addEventListener(TimerEvent.TIMER, onSpawnIntroTxt);*/

            }
            //-------------------------------------------------------------------------|
            //##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            public function initLevel() {                  
                    level0 = new Level0();
                    this.addChild(level0);     
                    drawtest();
            }

            //-------------------------------------------------------------------------|
            //##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            private function onIntroComplete(e:TimerEvent):void {
                    drawIntroductionTitle();
                    spawnIntroTxt.start();
                    introTimer.stop();
            }

            private function onSpawnIntroTxt(e:TimerEvent):void {
                    spawnIntroTxt.stop();
                    this.removeChild(_blackBG);
                    this.removeChild(_txtIntro);
                    this.addEventListener(Event.ENTER_FRAME, updateFrame);
                    initLevel();
            }
            //-------------------------------------------------------------------------|

            private function draw1920():void {
                    _1920x1080 = new Image(Assets.getTexture("G19201080"));
                    this.addChild(_1920x1080);
            }



            private function drawtest():void {
                    _testIMG = new Image(Assets.getTexture("testImg"));
                     _testIMG.alpha = 0;
                    this.addChild(_testIMG);
                    logoGameTween = new Tween(_testIMG, 3, Transitions.EASE_IN);
                    logoGameTween.fadeTo(1);
                    Starling.juggler.add(logoGameTween);
            }










            private function drawBlackBG():void {
                    _blackBG = new Image(Assets.getTexture("adBlkBG"));
                    this.addChild(_blackBG);
                    uniTween = new Tween(_blackBG, 3.5, Transitions.EASE_OUT);
                    uniTween.fadeTo(0);
                    Starling.juggler.add(uniTween);
            }
            private function drawIntroductionTitle():void {
                    _txtIntro = new Image(Assets.getTexture("txtIntro"));
                    _txtIntro.alpha = 0;
                    this.addChild(_txtIntro);
                    uniTween = new Tween(_txtIntro, 3.5, Transitions.EASE_OUT);
                    uniTween.fadeTo(1);
                    Starling.juggler.add(uniTween);
            }

            //-------------------------------------------------------------------------|
            //##UPDATE FRAMES|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            private function updateFrame(event:Event):void {
                    player.handlePlayerInput();
                    worldCamera();
                    player.checkPlayerBounds();
                    detectBounds();
                    //trace(level0.bg.x);
            }
            //-------------------------------------------------------------------------|
            private function worldCamera():void {
                if((player.rightPressed)) {
                    level0.bg.x -= ScrollX;
                } 

                if((player.leftPressed)) {
                    level0.bg.x += ScrollX;
                }

                if ((player.upPressed)) {
                    player.onGround = false;
                    //level0.bg.y += ScrollY;
                } 
            }
            //-------------------------------------------------------------------------|
            //##DETECT BOUNDS|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            private function detectBounds() {
                    //DETECT IF PLAYER IS ON GROUND
                    if (level0.ground.getBounds(level0.ground.parent).intersects
                       (player.getBounds(player.parent)) == true)
                    {
                            player.onGround = true;
                            player.gravity = 0;
                            //level0.bg.y -= ScrollY + 3;
                    }
                    //WORLD
                    if (level0.bg.y <= 0) {
                    	level0.bg.y = 0;
                    }
                    if (level0.bg.y >= 30) {
                    	level0.bg.y += -ScrollY;
                    }
            }
            //-------------------------------------------------------------------------|
            //#ENDFILE-----------------------------------------------------------------|
    }
}