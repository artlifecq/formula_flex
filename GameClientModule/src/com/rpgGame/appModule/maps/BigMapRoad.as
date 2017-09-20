package com.rpgGame.appModule.maps
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.utils.MathUtil;
	import com.rpgGame.app.manager.input.KeyMoveManager;
	import com.rpgGame.app.manager.map.BigMapsManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.ui.main.smallmap.MapPathIcon;
	import com.rpgGame.app.ui.main.smallmap.SmallMapUtil;
	import com.rpgGame.coreData.cfg.MapJumpCfgData;
	import com.rpgGame.coreData.role.SceneJumpPointData;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import away3d.pathFinding.DistrictWithPath;
	
	import gameEngine2D.PolyUtil;
	
	import starling.display.Sprite;

	/**
	 * 大地图上寻路小点显示
	 * @author YT
	 * 
	 */	
	public class BigMapRoad extends Sprite
	{
		private var _lastPointPos : Point = new Point();
		private var _lastPath : Vector.<Vector3D> = null;
		/**记录画到地图上面最后一个点的位置*/
		private var _lastDrawPoint : Point;
		private var _lastDist : int;
		private var _xunluPointEffect : InterObject3D;
		private static const POINT_DIS : int = 10;
		
		
		/**寻路的点**/
		private var pathSpr : Sprite;
		/**寻路的点图标**/
		private var pathIcoVect : Vector.<MapPathIcon>;
		public function BigMapRoad()
		{
			
			pathSpr=new Sprite();
			addChild(pathSpr);
			
		}
		private var _roadOpend:Boolean=true;
		public function openRoad() : void
		{
			
			_roadOpend = true;
			//EventManager.addEvent(UserMoveEvent.MOVE_START, onDrawPath);
			//EventManager.addEvent(UserMoveEvent.MOVE_END, closeRoad);
		}
		
		/**
		 * 关闭寻路路径的绘制
		 */
		public function closeRoad() : void
		{
			_roadOpend = false;
			//EventManager.removeEvent(UserMoveEvent.MOVE_START, onDrawPath);
			//EventManager.removeEvent(UserMoveEvent.MOVE_END, onClearPath);
			onClearPath();
		}
		public function onDrawPathRoad(walkPoint:Vector3D=null) : void
		{
			/*if(_roadOpend&&pathIcoVect&&pathIcoVect.length>0)
				return;*/
			
			if (MainRoleManager.actor == null)
				return;
			if (!MainRoleManager.actor.stateMachine.isWalkMoving)
				return;
			onClearPath();
			if (KeyMoveManager.getInstance().keyMoving)
			{
				_lastPath = null;
			}
			else
			{
				
				var ref : WalkMoveStateReference;
				var camouflageEntity : SceneRole = MainRoleManager.actor.getCamouflageEntity() as SceneRole;
				if (camouflageEntity)
					ref = camouflageEntity.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
				else
					ref = MainRoleManager.actor.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
				
				if(ref==null||ref.vectorPath==null)
					return;
				if(walkPoint==null)
				{
					walkPoint=ref.vectorPath;
				}
				if(walkPoint==null)
					return;
				var actPo:Vector3D=MainRoleManager.actor.position;
				var districtWithPath : DistrictWithPath = SceneManager.getDistrict();
				if (PolyUtil.isFindPath(districtWithPath, actPo, walkPoint))///有寻路路径直接走
				{
					_lastPath = (ref && ref.path) ? ref.path : null;
				}
				else
				{
					var jumpPash:Vector.<Vector3D>=MainRoleSearchPathManager.jumpPointList;
					if(jumpPash!=null&&jumpPash.length>0)
					{
						_lastPath=new Vector.<Vector3D>();
						var start:Vector3D=new Vector3D(actPo.x,actPo.y,actPo.z);
						var stop:Vector3D;
						var pash:Vector.<Vector3D>;
						var jumpData:SceneJumpPointData;
						for(var i:int=jumpPash.length-1;i>=0;i--)
						{
							stop=new Vector3D(jumpPash[i].x,jumpPash[i].y,jumpPash[i].z);
							pash=PolyUtil.findPath(districtWithPath, start, stop);
							if(pash!=null)
							{
								_lastPath=_lastPath.concat(pash);
							}
							if(i>0)
							{
								jumpData=MapJumpCfgData.getJumpportData(jumpPash[i].w);
								start=new Vector3D(jumpData.stopPoint.x,jumpData.stopPoint.y,jumpData.stopPoint.y);
							}
						}
						
					}
				}
			}
			
			
			updateDrawPath();
			
		}
		public function onThrough(px:Number,py:Number) : void
		{
			if(_roadOpend&&pathIcoVect&&pathIcoVect.length>0)
			{
				var i:int,length:Number,mid:int=-1;
				var ioc:MapPathIcon;
				for(i=0;i<pathIcoVect.length;i++)
				{
					ioc=pathIcoVect[i];
					length=Math.sqrt((ioc.x-px)*(ioc.x-px)+(ioc.y-py)*(ioc.y-py));
					if(length<10)
					{
						mid=i;
					}
				}
				if(mid>=0)
				{
					for(i=0;i<=mid;i++)
					{
						pathIcoVect[0].removeMyself();
						pathIcoVect.shift();
					}
				}
				
			}
		
			
		}
		
		
		private function updateDrawPath() : void
		{
			if (!BigMapsManager.isMapLoadComplete || !_roadOpend)
			{
				return;
			}
			//onClearPath();
			if (_lastPath == null)
				return;
			Lyt.a("_lastPath:"+_lastPath.length);
			var beforePoint : Vector3D = MainRoleManager.actor.position;
			
			_lastDrawPoint = BigMaps.getChangeSceneToMap(beforePoint);
			drawPointOnMiniMap(_lastDrawPoint);
			
			var pos3D : Vector3D;
			var len : int = _lastPath.length;
			var pixNextPos : Point;
			
			
			for (var i : int = 0; i < len; i++)
			{
				pos3D = _lastPath[i];
				pixNextPos = BigMaps.getChangeSceneToMap(pos3D);
				_lastDist = int.MAX_VALUE;
				addPointOnPaths(_lastDrawPoint, pixNextPos);
			}
		}
		
		
		
		/**
		 * 在两点之间填充连接点数据
		 * @param lastPos
		 * @param nextPos
		 */
		private function addPointOnPaths(beforePos : Point, endPos : Point) : void
		{
			if (beforePos == null || endPos == null)
				return;
			var dx : Number = endPos.x - beforePos.x;
			var dy : Number = endPos.y - beforePos.y;
			var d : int = MathUtil.getDistance(beforePos.x, beforePos.y, endPos.x, endPos.y);
			if (d < _lastDist)
			{
				_lastDist = d;
			}
			if (_lastDist < d || d <= POINT_DIS)
			{
				_lastDrawPoint = beforePos;
				return;
			}
			
			var radians : Number = Math.atan2(dy, dx);
			var cos : Number = Math.cos(radians);
			var sin : Number = Math.sin(radians);
			
			_lastDrawPoint.x = beforePos.x + POINT_DIS * cos;
			_lastDrawPoint.y = beforePos.y + POINT_DIS * sin;
			
			drawPointOnMiniMap(_lastDrawPoint);
			addPointOnPaths(_lastDrawPoint, endPos);
		}
		
		/**
		 * 往小地图上面画一个点
		 * @param pos
		 */
		private function drawPointOnMiniMap(pos : Point) : void
		{
			var pathIco : MapPathIcon = SmallMapUtil.getMapIco();
			pathIco.updatePos(pos);
			pathIcoVect.push(pathIco);
			pathSpr.addChild(pathIco);
		}
		
		
		/**
		 * 清除路线
		 */
		public function onClearPath() : void
		{
			while(pathSpr.numChildren>0){
				pathSpr.removeChildAt(0);
			}
			pathIcoVect=new Vector.<MapPathIcon>();
			
		}
		
		
	}
}