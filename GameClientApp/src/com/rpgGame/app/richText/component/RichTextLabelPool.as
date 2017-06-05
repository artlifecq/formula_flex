package com.rpgGame.app.richText.component
{
	import feathers.controls.Label;
	
	/**
	 * 
	 * zhangguodong
	 * 2017-3-23
	 */
	public class RichTextLabelPool
	{
		private static var unitPool : Vector.<Label> = new Vector.<Label>;
		
		public static function getFromPool() : Label
		{
			var value : Label;
			if (unitPool.length > 0)
			{
				value = unitPool.pop();
			}
			else
				value = new Label();
			return value;
		}
		
		public static function putToPool(value : Label) : void
		{
			if (value == null)
				return;
			value.width = value.maxWidth = 0;
			value.text = "";
			unitPool.push(value);
		}
		public function RichTextLabelPool()
		{
		}
	}
}