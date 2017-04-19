package com.rpgGame.coreData.info.meridian
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;

	/**
	 *经脉数据 
	 * @author Administrator
	 * 
	 */	
	public class MeridianVo
	{
		private var meridianHash:HashMap=new HashMap();
		public function MeridianVo()
		{
		}
		public function updateFromServerList(list:Vector.<AcuPointInfo>):void
		{
			meridianHash.clear();
			var tmp:Array;
			for each (var p:AcuPointInfo in list) 
			{
				tmp=meridianHash.getValue(p.MeridId);
				if (!tmp) 
				{
					tmp=new Array();
					meridianHash.put(p.MeridId,tmp);
				}
				tmp.push(p);
			}
		}
		public function updatePointData(p:AcuPointInfo):void
		{
			var tmp:Array;
			tmp=meridianHash.getValue(p.MeridId);
			if (!tmp) 
			{
				tmp=new Array();
				meridianHash.put(p.MeridId,tmp);
			}
			tmp.push(p);
		}
	}
}