package com.rpgGame.coreData.info.key
{
	import flash.utils.IDataInput;

	/**
	 * 单键位信息 (2701)
	 * @author carver
	 * 
	 */	
	public class KeyInfo
	{
		public var funcID:uint;
		public var funcS:String = "";
		public var name:String = "";
		public var code:uint;
		public var dataID:uint;//数据ID，记录动作ID，或者itemID，或者技能ID，具体是什么由type决定
		public var type:int;
		public var lv:uint;//技能等级
		public var funName:String="";
		
		public function KeyInfo(data:IDataInput=null)
		{
			if(data)
			{
				dataID = data.readUnsignedInt();
				lv = data.readUnsignedInt();
				funcID = data.readUnsignedInt();
			}
		}
		
		public function setSkill(data:IDataInput):void
		{
			dataID = data.readUnsignedInt();
			lv = data.readUnsignedInt();
			funcID = data.readUnsignedInt();
		}
		
		public function setItem(data:IDataInput):void
		{
			funcID = data.readUnsignedInt();
			dataID = data.readUnsignedInt();
		}
		
		public function clear():void
		{
			dataID = 0;
			type = 0;
			lv = 0;
		}
		
		public function clone():KeyInfo
		{
			var info:KeyInfo = new KeyInfo();
			info.name = name;
			info.type = type;
			info.code = code;
			info.funcID = funcID;
			info.dataID = dataID;
			info.lv = lv;
			info.funName = funName;
			return info;
		}
	}
}