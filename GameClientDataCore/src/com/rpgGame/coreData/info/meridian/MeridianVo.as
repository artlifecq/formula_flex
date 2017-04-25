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
		private var _meridianHash:HashMap=new HashMap();
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
		public function getMeridianMapData(merdianId:int):Array
		{
			return meridianHash.getValue(merdianId);
		}
		public function updatePointData(p:AcuPointInfo):void
		{
			var tmp:Array;
			tmp=meridianHash.getValue(p.MeridId);
			if (!tmp) 
			{
				throw new Error("unkonw meridian acudata:"+p.MeridId+"_"+p.acuPointId);
			}
			var len:int=tmp.length;
			for (var i:int = 0; i < len; i++) 
			{
				if (tmp[i].MeridId==p.MeridId&&tmp[i].acuPointId==p.acuPointId)
				{
					tmp[i]=p;
					break;
				}
			}
		}
		public function getMeridianAcuInfo(merid:int,posId:int):AcuPointInfo
		{
			var arr:Array=meridianHash.getValue(merid);
			if (arr) 
			{
				for each (var info:AcuPointInfo in arr) 
				{
					if (info.acuPointId==posId) 
					{
						return info;
					}
				}
			}
			return null;
		}
		public function get meridianHash():HashMap
		{
			return _meridianHash;
		}

	}
}