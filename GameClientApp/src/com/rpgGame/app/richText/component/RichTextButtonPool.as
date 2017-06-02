package com.rpgGame.app.richText.component
{
	import flash.utils.getDefinitionByName;
	
	import feathers.controls.Button;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 * 
	 * zhangguodong
	 * 2017-4-25
	 */
	public class RichTextButtonPool
	{
		private static var _map:HashMap = new HashMap();
		
		public static function getFromPool(key : String) : Button
		{
			var value : Button;
			var unitPool : Vector.<Button> = _map.getValue(key);
			if(unitPool && unitPool.length > 0)
			{
				value = unitPool.pop();
			}
			else
			{
				value = new Button();
				value.styleClass = getDefinitionByName(key) as Class;
			}
			return value;
		}
		
		public static function putToPool(key : String,value : Button) : void
		{
			if (value == null)
				return;
			var unitPool : Vector.<Button> = _map.getValue(key);
			if(!unitPool)
			{
				unitPool = new Vector.<Button>();
				_map.add(key,unitPool);
			}
			unitPool.push(value);
		}
		
		public function RichTextButtonPool()
		{
		}
	}
}