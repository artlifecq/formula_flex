package com.rpgGame.appModule.maps
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.utils.MathUtil;
	import com.rpgGame.app.manager.input.KeyMoveManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.ui.main.smallmap.MapPathIcon;
	import com.rpgGame.app.ui.main.smallmap.SmallMapUtil;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.Shape;
	import starling.display.Sprite;

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
			
		/*	var pathIco : MapPathIcon = SmallMapUtil.getMapIco();
			var po:Point=new Point(100,100);
			pathIco.updatePos(po);
			pathSpr.addChild(pathIco);*/
		}
		private var _roadOpend:Boolean;
		public function openRoad() : void
		{
			_roadOpend = true;
			EventManager.addEvent(UserMoveEvent.MOVE_START, onDrawPath);
			EventManager.addEvent(UserMoveEvent.MOVE_END, onClearPath);
			
		}
		
		/**
		 * 关闭寻路路径的绘制
		 */
		public function closeRoad() : void
		{
			_roadOpend = false;
			EventManager.removeEvent(UserMoveEvent.MOVE_START, onDrawPath);
			EventManager.removeEvent(UserMoveEvent.MOVE_END, onClearPath);
			
			/*EventManager.removeEvent(MapEvent.UPDATE_MAP_ROLE_ADD, updateMoveIco);
			EventManager.removeEvent(MapEvent.UPDATE_MAP_ROLE_MOVE, updateMoveIco);
			EventManager.removeEvent(MapEvent.UPDATE_MAP_ROLE_REMOVE, updateRemoveIco);
			
			if (gTime != null)
			{
				gTime.stop();
			}
			
			_lastPath = null;
			myIco.visible = false;*/
			onClearPath();
		}
		private function onDrawPath() : void
		{
			if (MainRoleManager.actor == null)
				return;
			if (KeyMoveManager.getInstance().keyMoving)
			{
				_lastPath = null;
			}
			else
			{
				//寻找镖车的引导路线，在大地图显示不出来的bug（bug单号：31241）2016-08-26-陈鹉光改
				var ref : WalkMoveStateReference;
				var camouflageEntity : SceneRole = MainRoleManager.actor.getCamouflageEntity() as SceneRole;
				if (camouflageEntity)
					ref = camouflageEntity.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
				else
					ref = MainRoleManager.actor.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
				_lastPath = (ref && ref.path) ? ref.path : null;
			}
			updateDrawPath();
		}
		
		private function updateDrawPath() : void
		{
			if (!BigMapsData.isMapLoadComplete || !_roadOpend)
			{
				return;
			}
			onClearPath();
			if (_lastPath == null)
				return;
			
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
			/*if (pixNextPos)
			{
				_lastPointPos.setTo(pixNextPos.x, pixNextPos.y);
				if (!_xunluPointEffect)
				{
					_xunluPointEffect = _rootUI.playInter3DAt(ClientConfig.getEffect(EffectUrl.XUN_LU_END_POINT_EFFECT), 0, 0, 0);
				}
				updateXunluPoint();
			}*/
		}
		
		/*private function updateXunluPoint() : void
		{
			if (_xunluPointEffect)
			{
				_xunluPointEffect.x = _lastPointPos.x + _thumbnailX + baseSpr.x;
				_xunluPointEffect.y = _lastPointPos.y + _thumbnailY + baseSpr.y;
				
				var canShow : Boolean = false;
				if (_xunluPointEffect.x < _thumbnailX)
				{
					canShow = false;
				}
				else if (_xunluPointEffect.x > _thumbnailX + _miniMapWidth)
				{
					canShow = false;
				}
				else if (_xunluPointEffect.y < _thumbnailY)
				{
					canShow = false;
				}
				else if (_xunluPointEffect.y > _thumbnailY + _miniMapHeight)
				{
					canShow = false;
				}
				else
				{
					canShow = true;
				}
				_xunluPointEffect.visible = canShow;
			}
		}*/
		
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
			
			/*if(pathIcoVect==null)return;
			while (pathIcoVect.length > 0)
			{
				//pathIcoVect[0].removeMyself();
				//SmallMapUtil.putMapIco(pathIcoVect.shift());
			}
			if (_xunluPointEffect)
			{
				//_rootUI.removeChild3D(_xunluPointEffect);
				_xunluPointEffect = null;
			}
			_lastPointPos.setTo(0, 0);*/
		}
		
		
	}
}