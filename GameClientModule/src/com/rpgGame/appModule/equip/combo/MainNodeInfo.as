package com.rpgGame.appModule.equip.combo
{
	import com.rpgGame.core.ui.tip.RTNodeID;

	/**
	 *
	 *@author dik
	 *2017-4-25下午2:17:16
	 */
	public class MainNodeInfo implements INodeData
	{
		public var type:int;
		
		public function MainNodeInfo()
		{
		}
		public function getRTNkey():String
		{
			return RTNodeID.EQUIP_HC+type;
		}
		public function getParentKey():String
		{
			return RTNodeID.EQUIP_HC;
		}
	}
}