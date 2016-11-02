package com.client.view.loading
{
	import com.client.ClientGlobal;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.gameClient.log.GameLog;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	
	import away3d.loaders.multi.MultiLoadData;
	
	import feathers.themes.ThemeLoader;
	
	import gs.TweenLite;
	import gs.easing.Linear;
	
	import org.mokylin.skin.loading.ResLoadingViewSkin;
	
	import starling.core.Starling;
	import starling.display.Shape;
	import starling.display.Sprite;

	/**
	 *
	 * 资源加载视图
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-7 下午5:30:13
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
		private var _bgShape : Shape;
		private var _barPercent : Number = 0;
		private var _offsetX : int = -24;
		private var _title : String = "";
		private var _themeLoader : ThemeLoader;

		public function ResLoadingView()
		{
			_container = new Sprite();
			_bgShape = new Shape();
			_container.addChildAt(_bgShape, 0);

			_firstLoadMc = new FirstLoadingMc();
			_titleTextFlied = _firstLoadMc["txt"];
			_loadingMC = _firstLoadMc["mc"];

			_themeLoader = new ThemeLoader();
			_themeLoader.load(ClientGlobal.getLoadingResUrl(), onResLoaded, null, onResError);
		}

		private function onResLoaded(loader : ThemeLoader) : void
		{
			removeFirstLoadMc();
			_resLoadingViewSkin = new ResLoadingViewSkin();
			_resLoadingViewSkin.toSprite(_container);
			if (ClientGlobal.isBanShu)
			{
				_resLoadingViewSkin.healthInfoGroup.visible = true;
				_resLoadingViewSkin.healthInfoTxt1.nativeFilters = getDefaultStrokeFilter();
				_resLoadingViewSkin.healthInfoTxt2.nativeFilters = getDefaultStrokeFilter();
			}
			else
			{
				_resLoadingViewSkin.healthInfoGroup.visible = false;
			}
			barPercent = _barPercent;
			title = _title;
			onStageResize();
		}

		private function getDefaultStrokeFilter() : Array
		{
			//TODO: re-use GlowFilter?
			return [new GlowFilter(0x0A0A0A, 1, 1.4, 1.4, 20, BitmapFilterQuality.LOW, false, false)];
		}

		private function onResError(ld : MultiLoadData, e : Event) : void
		{
			GameLog.addShow("========资源加载进度界面资源加载错误：" + ClientGlobal.getLoadingResUrl());
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
			TweenLite.killDelayedCallsTo(doHide);
			_stage = Starling.current.nativeStage;
			_stage.addEventListener(Event.RESIZE, onStageResize);
			if (_firstLoadMc)
			{
				_stage.addChild(_firstLoadMc);
			}
			Stage3DLayerManager.starlingLayer.getLayer("loading").addChild(_container);
			barPercent = 0;
			title = "";
			onStageResize();
		}

		public function hide() : void
		{
			TweenLite.killDelayedCallsTo(doHide);
			TweenLite.delayedCall(0.5, doHide);
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
				_resLoadingViewSkin.barLine.width = _resLoadingViewSkin.bgImage.width * _barPercent;
				_resLoadingViewSkin.barHead.x = _offsetX - _resLoadingViewSkin.barGroup.x + _resLoadingViewSkin.bgImage.width * _barPercent;
			}
		}

		private function onStageResize(e : Event = null) : void
		{
			if (!_stage)
				return;
			if (_resLoadingViewSkin)
			{
				_container.x = int((_stage.stageWidth - _resLoadingViewSkin.bgImage.width) * 0.5);
				if (_stage.stageHeight < _resLoadingViewSkin.bgImage.height)
				{
					_container.y = int(_stage.stageHeight - _resLoadingViewSkin.bgImage.height);
				}
				else
				{
					_container.y = int((_stage.stageHeight - _resLoadingViewSkin.bgImage.height) * 0.5);
				}
				_resLoadingViewSkin.leftTxtGroup.x = (_stage.stageWidth < _resLoadingViewSkin.bgImage.width ? 38 + (_resLoadingViewSkin.bgImage.width - _stage.stageWidth) * 0.5 : 38);
			}

			if (_firstLoadMc)
			{
				_firstLoadMc.x = int((_stage.stageWidth - _firstLoadMc.width) * 0.5);
				_firstLoadMc.y = int((_stage.stageHeight - _firstLoadMc.height) * 0.5);
			}

			_bgShape.graphics.clear();
			_bgShape.graphics.beginFill(0, 1);
			_bgShape.graphics.drawRect(-_container.x, -_container.y, _stage.stageWidth, _stage.stageHeight);
			_bgShape.graphics.endFill();
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
			if (_bgShape)
			{
				if (_bgShape.parent)
					_bgShape.parent.removeChild(_bgShape);
				_bgShape.dispose();
				_bgShape = null;
			}
		}
	}
}
