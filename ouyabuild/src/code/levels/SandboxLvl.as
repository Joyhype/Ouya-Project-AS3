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
    import flash.events.MouseEvent;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.utils.Timer;
    //CODE BASE
    import code.objects.Player;
    import code.objects.Camera;
    import code.objects.Coin;
    import code.objects.Enemies;
    import code.objects.Gun;
    import code.levels.Sandbox;
    import code.screens.PauseScreen;

    //import code.managers.LevelManager;

    public class SandboxLvl extends Sprite
    {
            public var player:Player;
            public var coin:Coin;
            public var enemy:Enemies;
            public var gun:Gun;
            public var cam:Camera;
            public var sandbox:Sandbox;

            public var ground:Image;
            private var _staticBG:Image;

            public var pauseBtn:PauseBtn;
            public var pauseOverlay:Image;

            public var themeSnd:themeSong;

            private var ScrollX:Number = 8;
            private var ScrollY:Number = 1.2;
            private var onGround:Boolean;

            private var startGameplay:Timer;


            //-------------------------------------------------------------------------|
            //##STAGE SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            public function SandboxLvl()
            {
                    super();
                    this.addEventListener(starling.events.Event.ADDED_TO_STAGE, stageSetup);
            }
            private function stageSetup(event:Event):void {
                    this.removeEventListener(Event.ADDED_TO_STAGE, stageSetup);
                    initLevel();
            }
            //-------------------------------------------------------------------------|
            //##LEVEL SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            public function initLevel() {    
                    this.addEventListener(Event.ENTER_FRAME, updateFrame);

                    drawBG();

                    player = new Player();
                    this.addChild(player); 

                    gun = new Gun();
                    this.addChild(gun);

                    enemy = new Enemies();
                    this.addChild(enemy);
            }

            //-------------------------------------------------------------------------|
            //##UPDATE FRAMES|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            private function updateFrame(e:Event):void {
                player.handlePlayerInput();
                player.checkPlayerBounds();
                gun.handlePlayerInput();
                enemy.checkBounds();
                enemy.collisionDetection();
            }
            //-------------------------------------------------------------------------|

            //-------------------------------------------------------------------------|
            //##DRAW||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            public function drawBG():void {
                   _staticBG = new Image(Assets.getTexture("bgBase01"));
                   this.addChild(_staticBG);
            }
            //-------------------------------------------------------------------------|


            //-------------------------------------------------------------------------|
            //#ENDFILE-----------------------------------------------------------------|


    }
}