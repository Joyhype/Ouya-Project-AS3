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
    import code.objects.Powerups;
    import code.objects.Enemy;

    //import code.managers.LevelManager;

    public class SandboxLvl extends Sprite
    {
            //##OBJECTS----------------------------------------------------------------|
            public var player:Player;
            public var enemy:Enemies;
            public var powerups:Powerups;
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
            private var _mtnsBG:Image;
            //-------------------------------------------------------------------------|

            //##TIMERS-----------------------------------------------------------------|
            private var startGameplay:Timer;
            //-------------------------------------------------------------------------|

            private var speedIncreaseTimer:Timer;
            private var addEnemyTimer:Timer;


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

                addEnemyTimer = new Timer(1000);
                addEnemyTimer.addEventListener(TimerEvent.TIMER, onAddEnemy);
                addEnemyTimer.start();

                speedIncreaseTimer = new Timer(10000);
                speedIncreaseTimer.addEventListener(TimerEvent.TIMER, onIncreaseVelocity);
                speedIncreaseTimer.start();
            }
            //-------------------------------------------------------------------------|
            
            private function onAddEnemy(e:TimerEvent):void {
                var ee = new Enemy();
                this.addChild(ee);
            }

            private function onIncreaseVelocity(e:TimerEvent):void {
                if (Enemy.SPEED < Enemy.MAXSPEED) {
                    Enemy.SPEED += 0.3;
                }

            }

            //-------------------------------------------------------------------------|
            //##LEVEL SETUP|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            public function initLevel():void {    

                createBG();                         //..Z
               

                stars = new Stars();                
                //this.addChild(stars);
            
                createPlanet();                     //..Z  
                createMtns();                       //..Z

                //enemy = new Enemies();              //..Z
                //this.addChild(enemy);
        
                player = new Player();              //..Z
                this.addChild(player); 

                gun = new Gun();                    //..Z
                this.addChild(gun);

                powerups = new Powerups();          //..Z
                this.addChild(powerups); 

                ui = new UI();                      //..Z
                this.addChild(ui);
            }
            //-------------------------------------------------------------------------|
            
            //-------------------------------------------------------------------------|
            //##UPDATE FRAME||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            //-------------------------------------------------------------------------|
            private function updateFrame(e:Event):void {
                //enemy.checkBounds();
                //enemy.collisionDetection();
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
               _planetBG.x = (stage.stageWidth - _planetBG.width)/2 + 320;
               _planetBG.y = (stage.stageHeight - _planetBG.height)/2 - 300;
               this.addChild(_planetBG);
            }

            public function createMtns():void {
               _mtnsBG = new Image(Assets.getTexture("bgMtns"));
               _mtnsBG.x = (stage.stageWidth - _mtnsBG.width)/2 + 320;
               _mtnsBG.y = (stage.stageHeight - _mtnsBG.height)/2 - 150;
               this.addChild(_mtnsBG);
            }
            //-------------------------------------------------------------------------/
    }
}