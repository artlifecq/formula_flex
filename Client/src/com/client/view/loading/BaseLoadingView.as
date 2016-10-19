package com.client.view.loading
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TextEvent;
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.utils.Timer;

	/**
	 * Client登录界面
	 * @author carver
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-6-3 上午10:05:12
	 *
	 */
	public class BaseLoadingView extends EventDispatcher
	{
		protected var _continer : Sprite;
		protected var _parentCon : DisplayObjectContainer;

		protected var _loadingView : Sprite;
		protected var _percentBar : MovieClip;
		protected var _tipTxt : TextField;
		protected var _wordsTxt : TextField;

		private var _timer : Timer;
		private var _lang : Array = ["按数字1-4可以执行人物动作", "按W,A,S,D或者鼠标单击行走", "按Tab键在两个主角间切换"];
		private var _title : String = "正在加载模块...";

		public function BaseLoadingView(mc : Sprite, decode : Function = null)
		{
			_continer = new Sprite();
			_loadingView = mc;
			_percentBar = _loadingView["m_Progress"];

			_percentBar.visible = false;
			_loadingView["m_LightMc"].stop();

			_wordsTxt = _loadingView["wordsTxt"];
			_wordsTxt.multiline = true;
			_wordsTxt.height = 50;
			_tipTxt = _loadingView["tip_txt"];
			//_tipTxt.visible = false;

			_timer = new Timer(2000);
			_timer.addEventListener(TimerEvent.TIMER, onChangeTip);
			_continer.addChild(_loadingView);

			_title = "";

			_wordsTxt.htmlText = "第一次加载时间较长，如果加载不成功，<u><font color='#a10000'><a href='event:refresh'>请点击重新刷新</a></font></u>" + //
				"<br><br>抵制不良游戏 拒绝盗版游戏 注意自我保护 谨防上当受骗 适度游戏益脑 沉迷游戏伤身 合理安排时间 享受健康生活";
			_wordsTxt.addEventListener(TextEvent.LINK, onLink);
		}

		public function set parseLang(str : String) : void
		{
			var xml : XML = XML(str);
			for each (var item : XML in xml.loading.node)
			{
				_lang.push(item.toString());
			}
		}

		public function startTip() : void
		{
			var num : uint = Math.floor(Math.random() * _lang.length);
			_tipTxt.text = _lang[num];
			_timer.start();
		}

		public function set percent(value : Number) : void
		{
			if (value <= 0)
			{
				_percentBar.visible = false;
				return;
			}

			if (!_percentBar.visible)
				_percentBar.visible = true;

			var posx : int = 24 + (647 - 24) * value;
			if (posx < _percentBar.x)
				_percentBar.x = 24;

			_percentBar.x = posx;

			_loadingView["content_txt"].text = _title + int(value * 100) + "%";
		}

		public function set title(text : String) : void
		{
			_title = text;
			_loadingView["content_txt"].text = text;
		}

		public function show(parentCon : DisplayObjectContainer) : void
		{
			if (parentCon.stage)
			{
				parentCon.stage.addEventListener(Event.RESIZE, onStgResize);
			}
			parentCon.addChild(_continer);
			_parentCon = parentCon;
			_loadingView["m_LightMc"].play();
			startTip();
			resize();
		}

		protected function onStgResize(event : Event) : void
		{
			resize();
		}

		public function hide() : void
		{
			_title = "";
			_loadingView["m_LightMc"].stop();
			if (_parentCon)
			{
				if (_parentCon.stage)
				{
					_parentCon.stage.removeEventListener(Event.RESIZE, onStgResize);
				}
				if (_parentCon.contains(_continer))
					_parentCon.removeChild(_continer);
			}
			_timer.stop();
			percent = 0;
		}

		private function onLink(e : TextEvent) : void
		{
			if (ExternalInterface.available)
			{
				var query : String = ExternalInterface.call("function getURL(){return window.location.href}");
				navigateToURL(new URLRequest(query), "_self");
			}
		}

		public function destroy() : void
		{
			_timer.stop();
			_timer.removeEventListener(TimerEvent.TIMER, onChangeTip);

			hide();
			_percentBar = null;
			_parentCon = null;
			_continer = null;
			_timer = null;
			_lang = null;
			_loadingView = null;
			_tipTxt = null;
			_wordsTxt = null;
		}

		private function onChangeTip(e : TimerEvent) : void
		{
			var num : uint = Math.floor(Math.random() * _lang.length);
			_tipTxt.text = _lang[num];
		}

		public function resize() : void
		{
			if (_parentCon && _parentCon.stage)
			{
				if (_continer)
				{
					_continer.graphics.beginFill(0, 1);
					_continer.graphics.drawRect(0, 0, _parentCon.stage.stageWidth, _parentCon.stage.stageHeight);
					_continer.graphics.endFill();
				}
				if (_loadingView)
				{
					_loadingView.x = int((_parentCon.stage.stageWidth - _loadingView["m_loadBG"].width) * 0.5);
					_loadingView.y = int((_parentCon.stage.stageHeight - 200));
				}
			}
		}
	}
}
