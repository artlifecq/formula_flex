package com.client.view.loading
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.external.ExternalInterface;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.utils.getTimer;
	
	import away3d.loaders.multi.MultiLoadData;
	
	import feathers.controls.UIAsset;
	import feathers.themes.GuiTheme;
	import feathers.themes.ThemeLoader;
	
	import gs.TweenLite;
	import gs.easing.Linear;
	
	import org.mokylin.skin.loading.ResLoadingViewSkin;
	import org.mokylin.skin.loading.loadingBarSkin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.IStarlingTexture;
	
	/**
	 *
	 * 资源加载界面
	 * @author NEIL
	 * 创建时间：2016-11-17 下午5:30:13
	 *
	 */
	public class ResLoadingView
	{
		private static var _instance : ResLoadingView;
		
		public static function get instance() : ResLoadingView
		{
			if (_instance == null)
			{
				_instance = new ResLoadingView();
			}
			return _instance;
		}
		
		private var _firstLoadMc : MovieClip;
		private var _titleTextFlied : TextField;
		private var _loadingMC : MovieClip;
		
		private var _container : Sprite;
		private var _stage : Stage;
		private var _resLoadingViewSkin : ResLoadingViewSkin;
		private var _bgShapeUP : Shape;
		private var _bgShapeDown : Shape;
		private var _bgShapeLeft : Shape;
		private var _bgShapeRight : Shape;
		private var _barPercent : Number = 0;
		private var _offsetX : int = -24;
		private var _title : String = "";
		private var _themeLoader : ThemeLoader;
		private var _tipTimer:GameTimer;
		private var _randomArr:Array=null;
		private var _initTime:int;
		public function ResLoadingView()
		{
			_container = new Sprite();
			_bgShapeUP = new Shape();
			_container.addChildAt(_bgShapeUP, 0);
			_bgShapeUP.graphics.beginFill(0);
			_bgShapeUP.graphics.drawRect(0,0,1,1);
			_bgShapeUP.graphics.endFill();
			
			_bgShapeDown = new Shape();
			_bgShapeDown.graphics.beginFill(0);
			_bgShapeDown.graphics.drawRect(0,0,1,1);
			_bgShapeDown.graphics.endFill();
			_container.addChildAt(_bgShapeDown, 0);
			
			_bgShapeLeft = new Shape();
			_bgShapeLeft.graphics.beginFill(0);
			_bgShapeLeft.graphics.drawRect(0,0,1,1);
			_bgShapeLeft.graphics.endFill();
			_container.addChildAt(_bgShapeLeft, 0);
			
			_bgShapeRight = new Shape();
			_bgShapeRight.graphics.beginFill(0);
			_bgShapeRight.graphics.drawRect(0,0,1,1);
			_bgShapeRight.graphics.endFill();
			_container.addChildAt(_bgShapeRight, 0);
			
			_firstLoadMc = new FirstLoadingMc();
			_titleTextFlied = _firstLoadMc["txt"];
			_loadingMC = _firstLoadMc["mc"];
			_tipTimer=new GameTimer("ResLoadingView",5000);
			_tipTimer.onUpdate=onTipsTimer;
			_themeLoader = new ThemeLoader();
			_themeLoader.load(ClientConfig.getLoadingResUrl(), onResLoaded, null, onResError);
		}
		
		private function onTipsTimer():void
		{
			// TODO Auto Generated method stub
			if (_resLoadingViewSkin) 
			{
				_resLoadingViewSkin.infoTxt2.text=LoadingTipStr.getTips();
			}
			
		}
		
		private function onResLoaded(loader : ThemeLoader) : void
		{
			removeFirstLoadMc();
			_resLoadingViewSkin = new ResLoadingViewSkin();
			var bar:loadingBarSkin=_resLoadingViewSkin.loadingBar.skin as loadingBarSkin;
			var sp:Shape=new Shape();
			sp.graphics.beginFill(0xfefae7,1);
			sp.graphics.drawRect(0,0,705,33);
			sp.graphics.endFill();
			sp.x=7;
			sp.y=bar.barLine.y;
			bar.barLine.mask=sp;
			bar.container.addChild(sp);
			_resLoadingViewSkin.toSprite(_container);
			/*		if (ClientConfig.isBanShu)
			{
			_resLoadingViewSkin.healthInfoGroup.visible = true;
			_resLoadingViewSkin.healthInfoTxt1.nativeFilters = getDefaultStrokeFilter();
			_resLoadingViewSkin.healthInfoTxt2.nativeFilters = getDefaultStrokeFilter();
			}
			else
			{
			_resLoadingViewSkin.healthInfoGroup.visible = false;
			}*/
			barPercent = _barPercent;
			title = _title;
			onStageResize();
			onTipsTimer();
			if (_tipTimer) 
			{
				_tipTimer.start();
			}
			_resLoadingViewSkin.inSuaxin.addEventListener(TouchEvent.TOUCH,onTouch);
			_randomArr=[_resLoadingViewSkin.bgImage];
			_initTime=getTimer();
			
		}
		private var isLoad:Boolean;
		private function loadRandomBg():void
		{
			if (isLoad) 
			{
				return;
			}
			isLoad=true;
			GuiTheme.ins.LoadAsset("ui/big_bg/bg_bing.png",onAssetComplete1);
			
			GuiTheme.ins.LoadAsset("ui/big_bg/bg_yi.png",onAssetComplete2);
		}
		
		private function onAssetComplete1(texture:IStarlingTexture):void
		{
			// TODO Auto Generated method stub
			var ui:UIAsset=new UIAsset();
			ui.setTexture(texture,"ui/big_bg/bg_bing.png");
			_resLoadingViewSkin.container.addChildAt(ui,0);
			_randomArr.push(ui);
		}
		private function onAssetComplete2(texture:IStarlingTexture):void
		{
			// TODO Auto Generated method stub
			var ui:UIAsset=new UIAsset();
			ui.setTexture(texture,"ui/big_bg/bg_yi.png");
			_randomArr.push(ui);
			_resLoadingViewSkin.container.addChildAt(ui,0);
		
		}
		private var isMouseOut:Boolean=true;
		private function onTouch(e:TouchEvent):void
		{
		
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				isMouseOut = true;
				_resLoadingViewSkin.inSuaxin.color=0xe8c958;
				return;
			}
			
			touch = e.getTouch(target, TouchPhase.HOVER);
			if (touch != null && isMouseOut)
			{
				isMouseOut = false;
				_resLoadingViewSkin.inSuaxin.color=0x5cb006;
				return;
			}
			touch = e.getTouch(target, TouchPhase.ENDED);
			if (touch != null)
			{
				isMouseOut = false;
				refresh();
				return;
			}
		}
		private function refresh():void
		{
			if (ExternalInterface.available) 
			{
				ExternalInterface.call("reloadswf");
			}
		}
		private function getDefaultStrokeFilter() : Array
		{
			//TODO: re-use GlowFilter?
			return [new GlowFilter(0x0A0A0A, 1, 1.4, 1.4, 20, BitmapFilterQuality.LOW, false, false)];
		}
		
		private function onResError(ld : MultiLoadData, e : Event) : void
		{
			GameLog.addShow("========资源加载进度界面资源加载错误：" + ClientConfig.getLoadingResUrl());
		}
		
		private function removeFirstLoadMc() : void
		{
			if (_firstLoadMc)
			{
				if (_firstLoadMc.parent)
					_firstLoadMc.parent.removeChild(_firstLoadMc);
				_firstLoadMc = null;
			}
			_titleTextFlied = null;
			if (_loadingMC)
			{
				_loadingMC.stop();
				_loadingMC = null;
			}
		}
		
		public function show() : void
		{
			if (_stage)
				return;
			onTipsTimer();
			if (_tipTimer) 
			{
				_tipTimer.start();
			}
			TweenLite.killDelayedCallsTo(doHide);
			_stage = Starling.current.nativeStage;
			_stage.addEventListener(Event.RESIZE, onStageResize);
			if (_firstLoadMc)
			{
				_stage.addChild(_firstLoadMc);
			}
			
			barPercent = 0;
			title = "";
			onStageResize();
			if (_randomArr) 
			{
				if (_randomArr.length!=1) 
				{
					randomChangeBg();
				}
					//只有一个
				else
				{
					if (getTimer()-_initTime>90*1000) 
					{
						loadRandomBg();
					}
				}
			}
			Stage3DLayerManager.starlingLayer.getLayer("loading").addChild(_container);
		}
		
		private function randomChangeBg():void
		{
			// TODO Auto Generated method stub
			var index:int=_randomArr.length*Math.random();
			for (var i:int = 0; i < _randomArr.length; i++) 
			{
				_randomArr[i].visible=index==i;
				_randomArr[i].x=_resLoadingViewSkin.bgImage.x;
				_randomArr[i].y=_resLoadingViewSkin.bgImage.y;
			}
			
		}
		
		public function hide() : void
		{
			TweenLite.killDelayedCallsTo(doHide);
			TweenLite.delayedCall(0.5, doHide);
			_tipTimer.stop();
		}
		
		private function doHide() : void
		{
			if (_stage)
			{
				_stage.removeEventListener(Event.RESIZE, onStageResize);
				_stage = null;
			}
			if (_container.parent)
			{
				_container.parent.removeChild(_container);
			}
			if (_firstLoadMc)
			{
				if (_firstLoadMc.parent)
					_firstLoadMc.parent.removeChild(_firstLoadMc);
			}
			if (_loadingMC)
			{
				_loadingMC.stop();
			}
			TweenLite.killTweensOf(this);
		}
		
		public function set title(text : String) : void
		{
			_title = text;
			if (_resLoadingViewSkin)
			{
				_resLoadingViewSkin.infoTxt.text = _title;
			}
		}
		
		public function set percent(value : Number) : void
		{
			if (!_stage)
				return;
			TweenLite.killTweensOf(this);
			if (value > 0 && value < 1 && value > _barPercent)
				TweenLite.to(this, 0.5, {barPercent: value, ease: Linear.easeNone});
			else
				barPercent = value;
		}
		
		public function get barPercent() : Number
		{
			return _barPercent;
		}
		
		public function set barPercent(value : Number) : void
		{
			_barPercent = value;
			if (_titleTextFlied)
			{
				_titleTextFlied.text = int(_barPercent * 100) + "%";
			}
			if (_loadingMC)
			{
				_loadingMC.gotoAndStop(int(_barPercent * 100));
			}
			if (_resLoadingViewSkin)
			{
				_resLoadingViewSkin.progressTxt.text = "总进度：" + int(_barPercent * 100) + "%";
				var bar:loadingBarSkin=_resLoadingViewSkin.loadingBar.skin as loadingBarSkin;
				bar.barLine.width=bar.load_bg.width*_barPercent;
			}
		}
		
		private function onStageResize(e : Event = null) : void
		{
			if (!_stage)
				return;
			if (_resLoadingViewSkin)
			{
				var bgX:int=(_stage.stageWidth-_resLoadingViewSkin.bgImage.width)*0.5;
				var bgY:int=(_stage.stageHeight-_resLoadingViewSkin.bgImage.height)*0.5;
				_resLoadingViewSkin.bgImage.x=bgX;
				_resLoadingViewSkin.bgImage.y=bgY;
				
				_resLoadingViewSkin.skinUp.x=bgX;
				_resLoadingViewSkin.grpBottom.x=bgX;
				
				_resLoadingViewSkin.skinUp.y=Math.max(0,bgY-82);//上面的非透明title是高度是这么多
				_resLoadingViewSkin.grpBottom.y=Math.min(_stage.stageHeight-190,(bgY+_resLoadingViewSkin.bgImage.height-70));
				
				_bgShapeUP.width=_stage.stageWidth;
				_bgShapeUP.height=_resLoadingViewSkin.skinUp.y+5;
				
				_bgShapeDown.width=_stage.stageWidth;
				_bgShapeDown.height=_stage.stageHeight-(_resLoadingViewSkin.grpBottom.y+_resLoadingViewSkin.grpBottom.height)+5;
				_bgShapeDown.y=_stage.stageHeight-_bgShapeDown.height;
				
				
				_bgShapeLeft.width=Math.max(0,bgX,5);
				_bgShapeLeft.height=_stage.stageHeight;
				
				_bgShapeRight.width=Math.max(0,bgX,5);
				_bgShapeRight.height=_stage.stageHeight;
				_bgShapeRight.x=_stage.stageWidth-bgX;
//				_container.x = int((_stage.stageWidth - _resLoadingViewSkin.bgImage.width) * 0.5);
//				if (_stage.stageHeight < _resLoadingViewSkin.bgImage.height)
//				{
//					_container.y = int(_stage.stageHeight - _resLoadingViewSkin.bgImage.height);
//				}
//				else
//				{
//					_container.y = int((_stage.stageHeight - _resLoadingViewSkin.bgImage.height) * 0.5);
//				}
				//				_resLoadingViewSkin.leftTxtGroup.x = (_stage.stageWidth < _resLoadingViewSkin.bgImage.width ? 38 + (_resLoadingViewSkin.bgImage.width - _stage.stageWidth) * 0.5 : 38);
			}
			
			if (_firstLoadMc)
			{
				_firstLoadMc.x = int((_stage.stageWidth - _firstLoadMc.width) * 0.5);
				_firstLoadMc.y = int((_stage.stageHeight - _firstLoadMc.height) * 0.5);
			}
			
//			_bgShape.graphics.clear();
//			_bgShape.graphics.beginFill(0, 1);
//			_bgShape.graphics.drawRect(-_container.x, -_container.y, _stage.stageWidth, _stage.stageHeight);
//			_bgShape.graphics.endFill();
		}
		
		public function destroy() : void
		{
			removeFirstLoadMc();
			if (_stage)
			{
				_stage.removeEventListener(Event.RESIZE, onStageResize);
				_stage = null;
			}
			if (_container)
			{
				if (_container.parent)
					_container.parent.removeChild(_container);
				_container = null;
			}
			
			TweenLite.killTweensOf(this);
			if (_themeLoader)
			{
				_themeLoader.dispose();
				_themeLoader = null;
			}
			_resLoadingViewSkin = null;
			
			if (_bgShapeUP)
			{
				if (_bgShapeUP.parent)
					_bgShapeUP.parent.removeChild(_bgShapeUP);
				_bgShapeUP.dispose();
				_bgShapeUP = null;
			}
			if (_bgShapeDown)
			{
				if (_bgShapeDown.parent)
					_bgShapeDown.parent.removeChild(_bgShapeDown);
				_bgShapeDown.dispose();
				_bgShapeDown = null;
			}
			if (_bgShapeLeft)
			{
				if (_bgShapeLeft.parent)
					_bgShapeDown.parent.removeChild(_bgShapeLeft);
				_bgShapeLeft.dispose();
				_bgShapeLeft = null;
			}
			if (_bgShapeRight)
			{
				if (_bgShapeRight.parent)
					_bgShapeRight.parent.removeChild(_bgShapeRight);
				_bgShapeRight.dispose();
				_bgShapeRight = null;
			}
			if (_tipTimer) 
			{
				_tipTimer.destroy();
				_tipTimer=null;
			}
		}
	}
}
