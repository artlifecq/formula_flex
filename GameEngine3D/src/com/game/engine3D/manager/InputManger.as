package com.game.engine3D.manager
{
	import com.game.engine3D.controller.CameraController;
	import com.game.mainCore.core.controller.FocusKeyController;
	import com.game.mainCore.core.controller.KeyController;
	import com.game.mainCore.core.manager.LayerManager;

	import flash.system.IME;

	/**
	 *
	 * 输入管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-10 上午10:26:37
	 *
	 */
	public class InputManger
	{
		private static var _instance : InputManger;

		public static function getInstance() : InputManger
		{
			if (!_instance)
			{
				_instance = new InputManger();
			}
			return _instance;
		}

		/**用户操作是否被锁定*/
		public var isOperateLocked : Boolean;

		public function InputManger()
		{
		}

		/**
		 * 开启用户操作
		 * @param isMouse 是否允许鼠标移动
		 *
		 */
		public function openOperate() : void
		{
			LayerManager.openMouseEvent();
			KeyController.instance.init();
			FocusKeyController.instance.init();
			CameraController.openOperate();
			IME.enabled = false;
			Stage3DLayerManager.stage.focus = Stage3DLayerManager.stage;
			isOperateLocked = false;
		}

		/**
		 * 关闭用户操作
		 * @param isTop 是否禁止Top层鼠标事件，默认为false
		 */
		public function closeOperate(isTop : Boolean = false, isTools : Boolean = true) : void
		{
			LayerManager.closeMouseEvent(isTop, isTools);
			KeyController.instance.clear();
			FocusKeyController.instance.clear();
			CameraController.closeOperate();
			Stage3DLayerManager.stage.focus = Stage3DLayerManager.stage;
			isOperateLocked = true;
		}
	}
}
