package com.rpgGame.appModule.equip.combo
{
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.clientConfig.Q_hecheng;

	/**
	 *
	 *@author dik
	 *2017-4-25下午2:17:41
	 */
	public class DetailNodeInfo implements INodeData
	{
		public var data:Q_hecheng;
		
		public function DetailNodeInfo()
		{
		}
		public function getRTNkey():String
		{
			return RTNodeID.EQUIP_HC+data.q_type+"-"+data.q_sub_type+"-"+data.q_subson_type;
		}
		public function getParentKey():String
		{
			return RTNodeID.EQUIP_HC+data.q_type+"-"+data.q_sub_type;
		}
	}
}