package com.client.view.loading
{
	import com.client.utils.ClientUrlManager;

	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * Client登录界面
	 * @author carver
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-4-3 下午6:05:12
	 *
	 */
	public class ClientLoadingView extends BaseLoadingView implements ILoading
	{
		private var _mainUI : Sprite;
		private var _decode : Function;
		private var _clientLoadingBg : ClientLoadingBg;

		public function ClientLoadingView(mc : Sprite, decode : Function = null)
		{
			super(mc, decode);
			_mainUI = mc;
			_decode = decode;
			loadLogoBg(ClientUrlManager.getLoadLogoBg());
		}

		private function loadLogoBg(url : String) : void
		{
			_clientLoadingBg = new ClientLoadingBg(url, _decode);
			_clientLoadingBg.addEventListener(Event.COMPLETE, onClientLoadingBgComplete);
			_continer.addChildAt(_clientLoadingBg, 0)
		}

		protected function onClientLoadingBgComplete(event : Event) : void
		{
			resize();
		}

		override public function set percent(value : Number) : void
		{
			super.percent = value;
		}

		override public function show(parentCon : DisplayObjectContainer) : void
		{
			super.show(parentCon);
		}

		override public function hide() : void
		{
			super.hide();
		}

		override public function destroy() : void
		{
			if (_clientLoadingBg)
			{
				if (_clientLoadingBg.parent)
					_clientLoadingBg.parent.removeChild(_clientLoadingBg);
				_clientLoadingBg.dispose();
				_clientLoadingBg = null;
			}
			super.destroy();
		}

		override public function resize() : void
		{
			super.resize();
			if (_clientLoadingBg)
			{
				_clientLoadingBg.x = int((_parentCon.stage.stageWidth - _clientLoadingBg.width) * 0.5);
				_clientLoadingBg.y = int((_parentCon.stage.stageHeight - _clientLoadingBg.height) * 0.5);
			}
		}

		public function get loadBg() : Sprite
		{
			return _clientLoadingBg;
		}
	}
}
