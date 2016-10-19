package com.game.engine3D.utils
{

	/**
	 *
	 * 颜色工具
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-8 下午19:05:12
	 *
	 */
	public class ColorUtil
	{
		public function ColorUtil()
		{
		}

		/**
		 * 分解
		 */
		public static function toRGB(color : uint) : Array
		{
			var r : Number = color >> 16;
			var g : Number = (color >> 8) & 0xff;
			var b : Number = color & 0xff;
			return [r, g, b];
		}

		/**
		 * 合成
		 */
		public static function toDec(rgb : Array) : int
		{
			if (rgb == null || rgb.length != 3 || //
				rgb[0] < 0 || rgb[0] > 255 || //
				rgb[1] < 0 || rgb[1] > 255 || //
				rgb[2] < 0 || rgb[2] > 255)
				return 0xFFFFFF;
			return rgb[0] << 16 | rgb[1] << 8 | rgb[2];
		}

		/**
		 * 比例颜色
		 */
		public static function ratioColor(fromColor : uint, toColor : uint, ratio : Number) : int
		{
			if (ratio < 0)
				ratio = 0;
			else if (ratio > 1)
				ratio = 1;
			var fromColorRGB : Array = toRGB(fromColor);
			var toColorRGB : Array = toRGB(toColor);
			var redDiff : int = fromColorRGB[0] + (toColorRGB[0] - fromColorRGB[0]) * ratio;
			var greenDiff : int = fromColorRGB[1] + (toColorRGB[1] - fromColorRGB[1]) * ratio;
			var blueDiff : int = fromColorRGB[2] + (toColorRGB[2] - fromColorRGB[2]) * ratio;
			return toDec([redDiff, greenDiff, blueDiff]);
		}

		/**
		 * 比例颜色变换
		 * @param fromTransform
		 * @param toTransform
		 * @param ratio
		 * @return
		 *
		 */
		public static function ratioColorTransform(fromTransform : Array, toTransform : Array, ratio : Number) : Array
		{
			var redMulDiff : Number = Number(fromTransform[0]) + (Number(toTransform[0]) - Number(fromTransform[0])) * ratio;
			var greenMulDiff : Number = Number(fromTransform[1]) + (Number(toTransform[1]) - Number(fromTransform[1])) * ratio;
			var blueMulDiff : Number = Number(fromTransform[2]) + (Number(toTransform[2]) - Number(fromTransform[2])) * ratio;
			var alphaMulDiff : Number = Number(fromTransform[3]) + (Number(toTransform[3]) - Number(fromTransform[3])) * ratio;
			return [redMulDiff, greenMulDiff, blueMulDiff, alphaMulDiff];
		}
	}
}
