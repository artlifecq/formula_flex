package com.editor.data
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 * 输入类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-6 上午11:32:15
	 *
	 */
	public class InputType
	{
		public var type : String;
		public var editable : Boolean;
		public var minValue : Number;
		public var maxValue : Number;
		public var period : int;
		public var setterField : String;
		public var getterField : String;
		public var listData : ArrayCollection;

		public function InputType(type : String, editable : Boolean = true, minValue : Number = -2147483648, maxValue : Number = 2147483647, period : int = 0)
		{
			this.type = type;
			this.editable = editable;
			this.minValue = minValue;
			this.maxValue = maxValue;
			this.period = period;
		}
	}
}
