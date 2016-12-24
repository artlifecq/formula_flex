package com.editor.enum
{
	import flash.utils.Dictionary;

	/**
	 * 技能图形类型
	 * @author Administrator
	 *
	 */
	public class SpellShapeType
	{
		public static const NONE : uint = 0;
		/**圆*/
		public static const CIRCLE : uint = 1;
		/**正方形*/
		public static const SQUARE : uint = 2;
		/**扇形*/
		public static const SECTOR : uint = 3;
		/**直线*/
		public static const LINE : uint = 4;

		public static var nameByType : Dictionary = new Dictionary();
		nameByType[NONE] = "默认";
		nameByType[CIRCLE] = "圆形";
		nameByType[SQUARE] = "正方形";
		nameByType[SECTOR] = "扇形";
		nameByType[LINE] = "直线";

		public function SpellShapeType()
		{
		}

		public static function getTypeList() : Array
		{
			var types : Array = [];
			for (var type : * in nameByType)
			{
				types.push({type: type, name: nameByType[type]});
			}
			return types;
		}
	}
}
