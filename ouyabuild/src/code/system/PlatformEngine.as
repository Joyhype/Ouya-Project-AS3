package code.system 
{
	import starling.display.Sprite;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.KeyboardEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	import flash.net.*;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getTimer;
	import flash.utils.Timer;

	public class PlatformEngine.as extends Sprite {

		protected var _gravity:Vector3D;
		protected var _friction:Number;
		protected var _config:PlatformConfig;
		protected var _currentLevel:XML;
		protected var _walls:Array;
		protected var _gameRunning:Boolean = false;

		protected var _assetDomain:ApplicationDomain;
		protected var _assetPath:String = "";
		protected var _assetQueue:Vector.<String> = new Vector.<String>();
		protected var _assets:Vector.<Loader> = new Vector.<Loader>();


		public function PlatformEngine() {

		}

		public function init(config:PlatformConfig):void {
			_config = config;
			_gravity = _config.gravity;
			_friction = _config.friction;
			_assetDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
		}

		public function startGame():void {
			if (!stage) throw new Error("PlatformEngine instance must be added to the stage before startGame() is called.");
			_gameRunning = true;
		}

		public function stopGame():void {
			_gameRunning = false;
		}


		public function destroy():void {
			clearReferences();
			for (var i:int = numChildren-1; i >= 0; i--) {
				removeChildAt(i);
			}
		}

		protected function clearReferences():void {
			_collisionGrid.clear();
			_inventory = null;
			_walls = null;
			_items = null;
			_enemies = null;
			_portals = null;
			_player = null;
			for each(var loader:Loader in _assets) {
				loader.unload();
			}
			_assets = null;
			_assetQueue = null;
		}


		public function loadLevel(uri:String):void {
			var request:URLRequest = new URLRequest(uri);
			var levelLoader:URLLoader = new URLLoader(request);
			levelLoader.addEventListener(Event.COMPLETE, levelLoaded, false, 0, true);
			levelLoader.addEventListener(IOErrorEvent.IO_ERROR, levelError, false, 0, true);
			levelLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError, false, 0, true);
		}

		public function levelLoaded(e:Event):void {
			_currentLevel = XML(e.target.data);
			var assets:XMLLIst = _currentLevel.assets.children();
			for (var i:int = 0; i < assets.length(); i++)
			_assetQueue.push(assets[i].@file); {

				var pe:PlatformerEvent = new PlatformerEvent(PlatformerEvent.LEVEL_LOAD_COMPLETE);
				dispatchEvent(pe);
				loadNextAsset();
			}
		}

		protected function levelError(e:IOErrorEvent):void {
			trace("PlatformEngine: Error Loading Level:",e.text);
		}
		
		protected function securityError(e:SecurityErrorEvent):void {
			trace("SecurityError:",e.text);
		}







		protected function loadNextAsset(e:Event = null):void {
			var loader:Loader = new Loader();
			var nextAsset:String = _assetQueue[_assets.length];
			var context:LoaderContext = new LoaderContext(false, _assetDomain);
			loader.load(new URLRequest(_assetPath + nextAsset), context);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, assetsLoaded, false, 0, true);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, assetLoadProgress, false, 0, true);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, assetLoadError, false, 0, true);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError, false, 0, true);
			_assets.push(loader);
		}
		
		protected function assetsLoaded(e:Event):void {
			if (_assets.length < _assetQueue.length) {
				loadNextAsset();
				return;
			}
			var pe:PlatformerEvent = new PlatformerEvent(PlatformerEvent.ASSET_LOAD_COMPLETE);
			dispatchEvent(pe);
			createLevel();
		}
		
		protected function assetLoadProgress(e:ProgressEvent):void {
			var baseCompletion:Number = 100 * (_assets.length-1)/_assetQueue.length;
			var currentProgress:Number = (100/_assetQueue.length) * (e.bytesLoaded/e.bytesTotal);
			var bytesLoaded:int = Math.round(baseCompletion + currentProgress);
			var pe:ProgressEvent = new ProgressEvent(ProgressEvent.PROGRESS, false, false, bytesLoaded, 100);
			dispatchEvent(pe);
		}
		
		protected function assetLoadError(e:IOErrorEvent):void {
			trace("PlatformEngine: Error Loading Asset: ",_assetQueue[_assets.length-1]);
		}
		
		protected function getAssetClass(assetName:String):Class {
			if (_assetDomain.hasDefinition(assetName)) {
				return _assetDomain.getDefinition(assetName) as Class;
			}
			throw new ArgumentError("Asset Class "+assetName+" cannot be found in loaded asset files.");
		}

		protected function createLevel():void {
			createWalls();
			createPortals();
			createEnemies();
			createItems();
			//CREATE PLAYER
			var playerClass:Class = getAssetClass(_currentLevel.player.@spriteClass);
			_player = new playerClass();
			_player.x = Number(_currentLevel.player.@x) * Number(_currentLevel.@gridSquareSize);
			_player.y = Number(_currentLevel.player.@y) * Number(_currentLevel.@gridSquareSize);
			addChild(_player as DisplayObject);
		}


		protected function createWalls():void {
			_walls = new Array();
			var walls:XMLList = _currentLevel.walls.children();
			for (var i:int = 0; i < walls.length(); i++) {
				var wallClass:Class = getAssetClass(walls[i].@spriteClass);
				var wallSprite:IWall = new wallClass() ;
				wallSprite.x = Number(walls[i].@x) * Number(_currentLevel.@gridSquareSize);
				wallSprite.y = Number(walls[i].@y) * Number(_currentLevel.@gridSquareSize);
				_walls.push(wallSprite);
				var gridReference:GridReference = _collisionGrid.getGridReference(Number(walls[i].@x), Number(walls[i].@y));
				gridReference.walls.push(wallSprite);
				addChild(wallSprite as DisplayObject);
			}
		}

	}


}