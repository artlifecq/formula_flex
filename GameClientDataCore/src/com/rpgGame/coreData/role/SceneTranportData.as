package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.cfg.AreaCfgData;
	import com.rpgGame.coreData.cfg.TranportsDataManager;
	import com.rpgGame.coreData.clientConfig.Q_map_transfer;
	import com.rpgGame.coreData.info.MapDataManager;
	
	import flash.geom.Point;
	
	import app.message.SceneTransportProto;
	import app.message.MazeDungeonProto.MazePortalDataProto;

	/**
	 *
	 * 场景传送数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class SceneTranportData extends RoleData
	{
		public var effectRes : String;
		public var polygon : Vector.<Point>;
		//public var destCountry : int = 0;
		public var destScene : int = 0;
		/**能够使用传送门的国家**/
		//public var canTransportCountry : int;
		public var offsetUp : int = 0;
		/**
		 * 在小地图的显示方式，0：全部显示；1：全部不显示；2、只显示图标，不显示名字；3、只显示名字，不显示图标。
		 */
		public var showInSmallMapType : int;

		public function SceneTranportData(type : int)
		{
			super(type);
		}
        
        public function setConfigData(data : Q_map_transfer) : void {
            this.id = data.q_tran_id;
            this.name = data.q_name;
            this.effectRes = data.q_tran_res;
            this.x = data.q_tran_res_x;
            this.y = data.q_tran_res_y;
            this.offsetUp = 0;
            this.direction = data.q_tran_res_direction;
            this.sizeScale = 1;
            this.polygon = AreaCfgData.getAreaPointsByID(data.q_tran_source_area_id);
            this.showInSmallMapType = 0;
        }

		public function setProtocData(data : SceneTransportProto) : void
		{
			this.id = data.id;
			this.name = MapDataManager.getMapName(data.destSceneDataId) + "传送门";
			this.effectRes = data.res;
			this.x = data.resX;
			this.y = data.resY;
			this.offsetUp = data.resOffsetUp;
			this.direction = data.resDirection;
			this.sizeScale = data.scale > 0 ? (data.scale * 0.01) : 1;
			//this.destCountry = data.destCountry;
			//this.destScene = data.destSceneDataId;
			this.polygon = TranportsDataManager.getPolygon(data);
			//this.canTransportCountry = data.canTransportCountry;
			this.showInSmallMapType = data.showInSmallMapType;
		}

		/**
		 * 构建一个迷宫传送门数据
		 * @param data
		 *
		 */
		public function setMazeProtocData(data : MazePortalDataProto, index : int) : void
		{
			id = index;
			name = data.name;
			polygon = new Vector.<Point>();
			var pos : Array = data.sourceAreaData.pos;
			var posLen : int = pos.length;
			for (var i : int = 0; i < posLen; i += 2)
			{
				polygon.push(new Point(pos[i], pos[i + 1]));
			}
			effectRes = data.res;
			direction = data.resDirection;
			sizeScale = data.scale > 0 ? (data.scale * 0.01) : 1;
			x = data.resX;
			y = data.resY;
			offsetUp = data.resOffsetUp;
			showInSmallMapType = data.showInSmallMapType;
		}
	}
}
