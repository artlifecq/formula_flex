package com.game.engine3D.vo
{
	import away3d.utils.GCObject;

	/**
	 *
	 * 渐变遮罩矩形数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-25 下午1:26:38
	 *
	 */
	public class FadeAlphaRectData extends GCObject
	{
		private var _fadeX : Number;
		private var _fadeY : Number;
		private var _fadeWidth : Number;
		private var _fadeHeight : Number;

		/**
		 *
		 * @param fadeX
		 * @param fadeY
		 * @param fadeWidth
		 * @param fadeHeight
		 * @param screenWidth
		 * @param screenHeight
		 *
		 */
		public function FadeAlphaRectData(fadeX : Number = 0, fadeY : Number = 0, fadeWidth : Number = 0, fadeHeight : Number = 0)
		{
			_fadeX = fadeX;
			_fadeY = fadeY;
			_fadeWidth = fadeWidth;
			_fadeHeight = fadeHeight;
		}

		public function setTo(fadeX : Number = 0, fadeY : Number = 0, fadeWidth : Number = 0, fadeHeight : Number = 0) : void
		{
			_fadeX = fadeX;
			_fadeY = fadeY;
			_fadeWidth = fadeWidth;
			_fadeHeight = fadeHeight;
		}

		public function get fadeX() : Number
		{
			return _fadeX;
		}

		public function get fadeY() : Number
		{
			return _fadeY;
		}

		public function get fadeWidth() : Number
		{
			return _fadeWidth;
		}

		public function get fadeHeight() : Number
		{
			return _fadeHeight;
		}
	}
}
