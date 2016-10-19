package com.game.engine3D.scene.render.vo
{
	/**
	 *
	 * 渲染单元同步信息，同步快照。
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-8 下午1:26:38
	 *
	 */
	public class RenderUnitSyncInfo
	{
		private var _status : String;
		private var _animateSpeed : Number;
		private var _playing : Boolean;
		private var _time : int;

		public function RenderUnitSyncInfo(status : String, animateSpeed : Number, playing : Boolean, time : int)
		{
			_status = status;
			_animateSpeed = animateSpeed;
			_playing = playing;
			_time = time;
		}

		public function get time() : int
		{
			return _time;
		}

		public function get playing() : Boolean
		{
			return _playing;
		}

		public function get animateSpeed() : Number
		{
			return _animateSpeed;
		}

		public function get status() : String
		{
			return _status;
		}

		public function destroy() : void
		{
			_status = null;
			_animateSpeed = NaN;
			_playing = false;
			_time = 0;
		}
	}
}
