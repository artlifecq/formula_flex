package com.game.engine3D.utils
{
	import away3d.materials.methods.CorrodeMethod;
	import away3d.materials.methods.GrayScaleMethod;
	import away3d.textures.AsyncTexture2D;

	/**
	 *
	 * 特效方法工具
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-29 下午4:05:12
	 *
	 */
	public class EffectMethodUtil
	{
//		public static function createOutlineMethod() : OutlineMethod
//		{
//			var outlineMethod : OutlineMethod = new OutlineMethod(0xff0000, 0.8, false);
//			return outlineMethod;
//		}

		public static function createGrayScaleMethod() : GrayScaleMethod
		{
			var grayScaleMethod : GrayScaleMethod = new GrayScaleMethod();
			return grayScaleMethod;
		}

		/**
		 *
		 * @param corrodeTexture 溶解效果贴图
		 * @return
		 *
		 */
		public static function createCorrodeMethod(corrodeTexture : AsyncTexture2D) : CorrodeMethod
		{
			if (!corrodeTexture)
				return null;
			var corrodeMethod : CorrodeMethod = new CorrodeMethod(corrodeTexture);
			return corrodeMethod;
		}

		public function EffectMethodUtil()
		{
		}
	}
}
