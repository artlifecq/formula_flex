package com.rpgGame.app.manager
{
	import com.game.mainCore.core.timer.GameTimer;

	/**
	 *
	 * 防沉迷管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-3-31 下午3:05:12
	 *
	 */
	public class FangChenMiManager
	{
		private static var _isInChenMi : Boolean = false;

		private static var _fangChenMiInfoTimer : GameTimer = null;

		public function FangChenMiManager()
		{
		}

		public static function setInChenMi(isInChenMi : Boolean) : void
		{
			_isInChenMi = true;
		}

		public static function checkInChenMi() : Boolean
		{
			return _isInChenMi;
		}

		public static function startFangChenMiInfoTick(delay : Number, infoFun : Function) : void
		{
			if (_fangChenMiInfoTimer)
			{
				_fangChenMiInfoTimer.destroy();
				_fangChenMiInfoTimer = null;
			}
			_fangChenMiInfoTimer = new GameTimer("FangChenMiInfoTimer", delay, 0, infoFun);
			_fangChenMiInfoTimer.start();
		}
	}
}
