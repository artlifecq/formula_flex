package com.rpgGame.core.view.ui.tip.vo
{
	public class DynamicTipData implements IDynamicTipData
	{
		protected var _data:*
		public function DynamicTipData(d:*=null)
		{
			this._data=d;
		}
		public function get data():*
		{
			return _data;
		}

		public function set data(value:*):void
		{
			_data = value;
		}


	}
}