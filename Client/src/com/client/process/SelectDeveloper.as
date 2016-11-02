package com.client.process
{
	import com.client.ClientGlobal;
	import com.client.view.SelectDeveloperView;
	import com.game.engine3D.process.BaseProcess;

	/**
	 *
	 * 选择服务器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午3:45:32
	 *
	 */
	public class SelectDeveloper extends BaseProcess
	{
		private var _devView : SelectDeveloperView;

		public function SelectDeveloper()
		{
			super();
		}

		override public function getState() : String
		{
			return ProcessState.STATE_SELECT_DEVELOPER;
		}

		override public function startProcess() : void
		{
			super.startProcess();
			_devView = new SelectDeveloperView(onSelectDev);
			_devView.x = (ClientGlobal.stage.stageWidth - _devView.width) * 0.5;
			_devView.y = (ClientGlobal.stage.stageHeight - _devView.height) * 0.5;
			ClientGlobal.stage.addChild(_devView);
		}

		private function onSelectDev(ip : String, port : String) : void
		{
			ClientGlobal.loginIP = ip;
			ClientGlobal.loginPort = uint(port);

			completeProcess();
		}

		override public function dispose() : void
		{
			if (_devView)
			{
				if (_devView.parent)
					_devView.parent.removeChild(_devView);
				_devView = null;
			}
			super.dispose();
		}
	}
}
