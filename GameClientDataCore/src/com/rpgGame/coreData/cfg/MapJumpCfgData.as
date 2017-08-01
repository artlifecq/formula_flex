package com.rpgGame.coreData.cfg
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.coreData.clientConfig.Q_map_jump;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.role.SceneJumpPointData;
	import com.rpgGame.coreData.role.SceneTranportData;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
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
		private static var _dataSenceDic : Dictionary = new Dictionary();
		public static function setup(data : ByteArray) : void {
			var arr : Array = data.readObject();
			var list : Vector.<Q_map_jump>;
			for each(var info : Q_map_jump in arr) {
				_dataDic[info.q_jump_id]=info;
				list = _dataSenceDic[info.q_map_id];
				if (null == list) {
					list = new Vector.<Q_map_jump>();
					_dataSenceDic[info.q_map_id] = list;
				}
				list.push(info);
			}
		}
		public static function getJumpBySceneID(sceneID : uint) : Vector.<Q_map_jump> {
			return _dataSenceDic[sceneID];
		}
		/**返回场景中跳跃点数据*/
		public static function getJumpportData(jumpid:int) : SceneJumpPointData
		{
			var data : Q_map_jump=_dataDic[jumpid];
			if (data) {
				var jumpData:SceneJumpPointData=new SceneJumpPointData(RoleType.TYPE_JUMP);
				jumpData.setConfigData(data);
				return jumpData;
			}
			return null;
		}
		
		
		
		/**返回场景中跳跃点数据*/
		public static function getSceneJumpportDatas(sceneID : uint) : Array
		{
			var arr : Array = new Array();
			var list : Vector3D.<Q_map_jump> = _dataSenceDic[sceneID];
			if (!list) {
				return [];
			}
			for each (var data : Q_map_jump in list)
			{
				if (data.q_map_id == sceneID)
				{
					var jumpData:SceneJumpPointData=new SceneJumpPointData(RoleType.TYPE_JUMP);
					jumpData.setConfigData(data);
					arr.push(jumpData);
					
					/*var sourceArea:Vector.<Point>=AreaCfgData.getAreaPointsByID(data.q_jump_source_area_id);//传送区域点
					var centerPoint:Point=AreaCfgData.getAreaPointsCenter(sourceArea);//传送区域中点
					if(!centerPoint)
						continue;
					var startPoint:Vector3D=new Vector3D(centerPoint.x,0,centerPoint.y);
					var destList:Array=JSONUtil.decode(data.q_jump_dest_list);
					if(!destList||destList.length==0)
						continue;
					var stopPoint:Vector3D=new Vector3D(destList[destList.length-1][0],0,destList[destList.length-1][1]);
					arr.push([startPoint,stopPoint]);*/
					
				}
			}
			return arr;
		}
		
		
		public function MapJumpCfgData()
		{
		}
	}
}