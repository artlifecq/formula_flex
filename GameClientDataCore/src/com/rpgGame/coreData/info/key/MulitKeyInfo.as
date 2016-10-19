package com.rpgGame.coreData.info.key
{

	/**
	 * 多键位信息
	 * @author carver
	 *
	 */
	public class MulitKeyInfo
	{
		public var funcs : Array = [];
		public var codes : Array = [];
		public var dataID : uint;
		public var type : int;
		public var name : String = "";

		public function clone() : MulitKeyInfo
		{
			var info : MulitKeyInfo = new MulitKeyInfo();
			info.funcs = funcs.concat();
			info.codes = codes.concat();
			info.dataID = dataID;
			info.type = type;
			info.name = name;
			return info;
		}

		public function get funcID() : String
		{
			if (funcs == null)
			{
				return "";
			}
			return funcs.join("_");
		}
	}
}
