package com.rpgGame.coreData.cfg
{
	public class TriggerArea
	{
		private  var _areaId:uint;
		
		
		public function TriggerArea(_aId:uint)
		{
			_areaId=_aId;
		}
		
		
		
		/**  区域id */
		public function get areaId():uint
		{
			return _areaId;
		}

		/**
		 * @private
		 */
		public function set areaId(value:uint):void
		{
			_areaId = value;
		}

	}
}