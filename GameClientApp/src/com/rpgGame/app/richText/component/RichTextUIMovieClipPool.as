package com.rpgGame.app.richText.component
{
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	
	/**
	 * 
	 * zhangguodong
	 * 2017-3-23
	 */
	public class RichTextUIMovieClipPool
	{
		private static var unitPool : Vector.<UIMovieClip> = new Vector.<UIMovieClip>;
		
		public static function getFromPool() : UIMovieClip
		{
			var value : UIMovieClip;
			if (unitPool.length > 0)
			{
				value = unitPool.pop();
			}
			else
			{
				value = new UIMovieClip();
				value.imageScaleMode = UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
			}
			return value;
		}
		
		public static function putToPool(value : UIMovieClip) : void
		{
			if (value == null)
				return;
			value.styleName = "";
			unitPool.push(value);
		}
		public function RichTextUIMovieClipPool()
		{
		}
	}
}