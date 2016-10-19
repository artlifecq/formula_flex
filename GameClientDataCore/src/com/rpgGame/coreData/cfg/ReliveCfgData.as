package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.info.scene.ReliveCostData;
	import com.rpgGame.coreData.type.ReliveType;
	
	import app.message.ReliveConfig;
	import app.message.ReliveTypeDataProto;
	
	import org.client.mainCore.ds.HashMap;

	public class ReliveCfgData
	{
		/**多少级, 可以原地复活**/
		public static var freePerfectReliveLevel:int;
		
		/**所有复活类型对应的数据，包括消耗，免费次数等**/
		public static var reliveDatas:HashMap;
		
		
		/**
		 * 设置配置数据
		 * @param freePerfectReliveLevel		<= 多少级, 可以不用道具原地完美复活
		 * @param reliveData						ReliveDataProto
		 * 
		 */		
		public static function setConfig( reliveData:ReliveConfig ):void
		{
			if( reliveData == null )
				return;
			if(reliveData.data == null)
				return;
			reliveDatas = new HashMap;
			var upgradeData:ReliveCostData;
			var reliveTypeData:ReliveTypeDataProto;
			for(var i:int = 0;i<reliveData.data.length;i++)
			{
				upgradeData = new ReliveCostData();
				upgradeData.setData( reliveData.data[i]);
				reliveDatas.add(upgradeData.reliveType,upgradeData);
			}
		}
		/**获得完美复活消耗**/
		public static function get prefectReliveCost():ReliveCostData
		{
			return reliveDatas.getValue(ReliveType.RELIVE_TYPE_2);
		}
		/**获得原地复活消耗**/
		public static function get originReliveCost():ReliveCostData
		{
			return reliveDatas.getValue(ReliveType.RELIVE_TYPE_1);
		}
	}
}