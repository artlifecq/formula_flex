package com.rpgGame.app.ui
{


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
		private var _actualInstance : Object;

		public function ResLoadingView()
		{

		}

		public static function get instance() : ResLoadingView
		{
			if (_instance == null)
			{
				_instance = new ResLoadingView();
			}
			return _instance;
		}

		public function setActual(actual : Class) : void
		{
			_actualInstance = actual.instance;
		}

		public function set percent(value : Number) : void
		{
			_actualInstance.percent = value;
		}

		public function set title(text : String) : void
		{
			_actualInstance.title = text;
		}

		public function show() : void
		{
			_actualInstance.show();
		}

		public function hide() : void
		{
			_actualInstance.hide();
		}

		public function destroy() : void
		{
			if (_actualInstance)
			{
				_actualInstance.destroy();
				_actualInstance = null;
			}
		}
	}
}
