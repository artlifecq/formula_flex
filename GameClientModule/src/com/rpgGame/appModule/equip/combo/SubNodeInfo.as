package com.rpgGame.appModule.equip.combo
{
	import com.rpgGame.core.ui.tip.RTNodeID;

	/**
	 *
	 *@author dik
	 *2017-4-25下午2:17:27
	 */
	public class SubNodeInfo implements INodeData
	{
		public var type:int;
		public var subType:int;
		
		public function SubNodeInfo()
		{
		}
		public function getRTNkey():String
		{
			return RTNodeID.EQUIP_HC+type+"-"+subType;
		}
		public function getParentKey():String
		{
			return RTNodeID.EQUIP_HC+type;
		}
	}
}