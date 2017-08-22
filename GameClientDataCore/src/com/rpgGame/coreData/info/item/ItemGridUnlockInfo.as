package com.rpgGame.coreData.info.item
{
	public class ItemGridUnlockInfo
	{
		private var _containerID:int=0;  //剩余时间
		private var _id:String; //id
		
		public function setdate(containerID:int,id:String):void
		{
			_containerID=containerID;
			_id=id;
		}
		
		public function get containerID():int
		{
			return _containerID;
		}
		
		public function get id():String
		{
			return _id;
		}
	}
}