package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_map_jump;
	import com.rpgGame.coreData.role.RoleType;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 *地图跳跃点数据表
	 * @author YT
	 * 
	 */	
	public class MapJumpCfgData
	{
		
		private static var _dataDic : Dictionary = new Dictionary();
		
		public static function setup(data : ByteArray) : void {
			var arr : Array = data.readObject();
			var list : Vector.<Q_map_jump>;
			for each(var info : Q_map_jump in arr) {
				list = _dataDic[info.q_map_id];
				if (null == list) {
					list = new Vector.<Q_map_jump>();
					_dataDic[info.q_map_id] = list;
				}
				list.push(info);
			}
		}
		public static function getJumpBySceneID(sceneID : uint) : Vector.<Q_map_jump> {
			return _dataDic[sceneID];
		}
		
		/*public static function getSceneJumpportDatas(sceneID : uint) : Array
		{
			var arr : Array = new Array();
			var list : Vector3D.<Q_map_jump> = _dataDic[sceneID];
			if (!list) {
				return [];
			}
			for each (var data : Q_map_jump in list)
			{
				if (data.q_map_id == sceneID)
				{
					var tranportData : SceneTranportData = new SceneTranportData(RoleType.TYPE_TRANPORT_NORMAL);
					tranportData.setConfigData(data);
					arr.push(tranportData);
				}
			}
			return arr;
		}*/
		
		
		public function MapJumpCfgData()
		{
		}
	}
}