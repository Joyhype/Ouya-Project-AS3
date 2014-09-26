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
    import code.objects.Enemies;
    import code.objects.Stars;
    import code.objects.Gun;
    import code.objects.UI;
    import code.levels.Sandbox;
    import code.screens.PauseScreen;

    //import code.managers.LevelManager;

    public class SandboxLvl extends Sprite
    {
            //##OBJECTS----------------------------------------------------------------|
            public var player:Player;
            public var enemy:Enemies;
            public var gun:Gun;
            public var cam:Camera;
            public var stars:Stars;
            public var sandbox:Sandbox;
            public var ui:UI; 
            //-------------------------------------------------------------------------|

            //##IMAGES-----------------------------------------------------------------|
            public var ground:Image;
            private var _staticBG:Image;
            private var _planetBG:Image;
            //-------------------------------------------------------------------------|

            //##TIMERS-----------------------------------------------------------------|
            private var startGameplay:Timer;
            //-------------------------------------------------------------------------|

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
                this.addEventListener(Event.ENTER_FRAME, updateFrame);
                initLevel();
            }
            //-------------------------------------------------------------------------|
            
            //-------------------------------------------------------------------------|
            //##LEVEL SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            public function initLevel() {    

                createBG();                         //..Z1
                   
                stars = new Stars();                //..Z2
                this.addChild(stars);
            
                createPlanet();                     //..Z3
                
                enemy = new Enemies();              //..Z4
                this.addChild(enemy);
        
                player = new Player();              //..Z5
                this.addChild(player); 

                gun = new Gun();                    //..Z6
                this.addChild(gun);

                //ui = new UI();                      //..Z7
                //this.addChild(UI);
            }
            //-------------------------------------------------------------------------|
            
            //-------------------------------------------------------------------------|
            //##UPDATE FRAME||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
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
            //##Create||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            public function createBG():void {
               _staticBG = new Image(Assets.getTexture("bgBase01"));
               this.addChild(_staticBG);
            }
            public function createPlanet():void {
               _planetBG = new Image(Assets.getTexture("bgPlanet"));
               _planetBG.x = (stage.stageWidth - _planetBG.width)/2 + 400;
               _planetBG.y = (stage.stageHeight - _planetBG.height)/2 - 150;
               this.addChild(_planetBG);
            }
            //-------------------------------------------------------------------------/
    }
}