package com.rpgGame.coreData.role
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.coreData.cfg.AreaCfgData;
	import com.rpgGame.coreData.clientConfig.Q_map_jump;
	
	import flash.geom.Point;
	/**
	 *场景跳跃点数据 
	 * @author YT
	 * 
	 */	
	public class SceneJumpPointData extends RoleData
	{
		public var effectRes : String;
		public var polygon : Vector.<Point>;
		public var offsetUp : int = 0;
		public var destPointList:Vector.<Point>;
		public var sceneID:int;
		public var startPoint:Point;
		public var stopPoint:Point;
		public var equalPash:int;
		public function SceneJumpPointData(type : int)
		{
			super(type);
		}
		public function setConfigData(data : Q_map_jump) : void {
			this.id = data.q_jump_id;
			this.name = data.q_name;
			this.effectRes = data.q_jump_res;
			this.x = data.q_jump_res_x;
			this.y = data.q_jump_res_y;
			this.offsetUp = 0;
			this.equalPash=data.q_equal_pash;
			this.direction = data.q_jump_res_direction;
			this.sizeScale = 1;
			this.sceneID=data.q_map_id;
			this.polygon = AreaCfgData.getAreaPointsByID(data.q_jump_source_area_id);
			this.startPoint=AreaCfgData.getAreaPointsCenter(AreaCfgData.getAreaPointsByID(data.q_jump_source_area_id));//传送区域中点;
			this.destPointList=new Vector.<Point>();
			var dest:Array=JSONUtil.decode(data.q_jump_dest_list);
			if(dest&&dest.length>0)
			{
				for(var i:int=0;i<dest.length;i++)
				{
					var point:Point=new Point();
					point.x=dest[i][0];
					point.y=dest[i][1];
					this.destPointList.push(point);
				}
				this.stopPoint = new Point(this.destPointList[this.destPointList.length-1].x,this.destPointList[this.destPointList.length-1].y);
			}
			
			
			
		}

	}
}