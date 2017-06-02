package com.rpgGame.app.richText.component
{
	import feathers.controls.UIAsset;
	
	/**
	 * 
	 * zhangguodong
	 * 2017-3-23
	 */
	public class RichTextUIAssetPool
	{
		private static var unitPool : Vector.<UIAsset> = new Vector.<UIAsset>;
		
		public static function getFromPool() : UIAsset
		{
			var value : UIAsset;
			if (unitPool.length > 0)
			{
				value = unitPool.pop();
			}
			else
			{
				value = new UIAsset();
				value.imageScaleMode = UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
			}
			return value;
		}
		
		public static function putToPool(value : UIAsset) : void
		{
			if (value == null)
				return;
			value.styleName = "";
			unitPool.push(value);
		}
		public function RichTextUIAssetPool()
		{
		}
	}
}