package com.game.engine2D.scene
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine2D.events.SceneCameraEvent;
	import com.game.engine2D.utils.SceneUtil;
	import com.game.engine2D.vo.BaseObj;
	import com.game.engine3D.scene.render.vo.ISceneCameraTarget;
	
	import flash.geom.Point;
	
	import away3d.events.EventDispatcher;

	/**
	 * @private
	 * 场景镜头 
	 * @author Carver
	 */	
	public class SceneCamera extends EventDispatcher
	{
		/**地图滚动阈值比例系数,此值影响角色移动灵敏度，越小越灵敏*/
		public const LIMEN_RATIO:Number = 0.02;//0.05;
		/**X方向地图滚动阈值*/
		private var x_limen:int = 200;
		/**Y方向地图滚动阈值*/
		private var y_limen:int = 116;
		/**地图缓动参数（范围大于0小于等于1，值越大缓动越快）*/
		private var tweenSpeed:Number = 0.1;
		
		private static const MIN_DIS:int = -5;
		private static const MAX_DIS:int = 5;
		
		public var posX:Number;
		public var posY:Number;
		
		private var _scale:Number = 1.0;
		private var _lens:CameraOrthographicLens;
		/**
		 * @private
		 * 场景
		 */
		private var _scene:Scene;
		private var _followTarget:com.game.engine3D.scene.render.vo.ISceneCameraTarget;
		

		/**
		 * 镜头是否锁定
		 */
		private var _isLocked:Boolean = false;

		/**
		 * @private
		 * 镜头跟随的角色
		 */
		public function get followTarget():com.game.engine3D.scene.render.vo.ISceneCameraTarget
		{
			return _followTarget;
		}
		
		public function get scale():Number
		{
			return _scale;
		}
		
		public function get lens():CameraOrthographicLens
		{
			return _lens;
		}

		/**
		 * 锁定镜头
		 */
		public function lock():void
		{
			_isLocked = true;
		}
		/**
		 * 解锁镜头
		 */
		public function unlock():void
		{
			_isLocked = false;
		}

		public var tile_x:uint;
		public var tile_y:uint;
		
		private var _tileRangeXY:Point;

		/**
		 * @private
		 * 镜头可视tile级别范围的半个xy值
		 */
		public function get tileRangeXY():Point
		{
			return _tileRangeXY;
		}

		private var _sceneX:Number;
		private var _sceneY:Number;
		
		private function set sceneX(value:Number) : void
		{
			_sceneX = value;
			_scene.x = (value >> 0);
		}
		
		private function set sceneY(value:Number) : void
		{
			_sceneY = value;
			_scene.y = (value >> 0);	
		}
		
		/**
		 * @private
		 * 镜头可视zone级别范围的半个xy值
		 */
		public var zoneRangeXY:Point;
		
		private var _speed:Number = 1;
		//屏幕移动的矩形范围,在分层剧情中锁定场景区域
		private var _lockAreaStartX:int;
		private var _lockAreaEndX:int;
		private var _lockAreaStartY:int;
		private var _lockAreaEndY:int;
		
		public function SceneCamera($scene:Scene, $lens:CameraOrthographicLens)
		{
			_scene = $scene;
			_lens = $lens;
			_sceneX = _scene.x;
			_sceneY = _scene.y;
			
			//更新镜头可视范围的格子数
			updateRangeXY();
		}
		
		public function updateScale($scale:Number):void
		{
			if (_scale != $scale && $scale > 0)
			{
				_scale = $scale;
				_lens.viewportScale = $scale;
				_scene.reSize(_lens.viewportWidth, _lens.viewportHeight);
				if (this.hasEventListener(SceneCameraEvent.CAMERA_SCALE_UPDATE))
					this.dispatchEventWith(SceneCameraEvent.CAMERA_SCALE_UPDATE);
			}
		}
		
		/**
		 * @private
		 * 更新镜头可视范围的格子数
		 */
		public function updateRangeXY():void
		{
			updateCanSeeRange();
			updateLimen();
		}
		
		private function updateCanSeeRange():void
		{
			//更新镜头可视范围的格子数
			_tileRangeXY = SceneUtil.getViewTileRangeXY(_scene);
		}
		
		private function updateLimen():void
		{
			zoneRangeXY = SceneUtil.getViewZoneRangeXY(_scene);
			//更新地图滚动阈值
			x_limen = _scene.sceneConfig.width * LIMEN_RATIO;
			y_limen = _scene.sceneConfig.height * LIMEN_RATIO;
		}
		
		/**
		 * @private
		 * 检查角色是否在摄像机视野范围内
		 * @param $lookAtCharacter
		 * 
		 */	
		public function canSee($bo:BaseObj):Boolean
		{
			var tileX:uint = $bo.x/SceneConfig.TILE_WIDTH;
			var tileY:uint = $bo.y/SceneConfig.TILE_HEIGHT;
			
			return(
				tileX > tile_x - _tileRangeXY.x 
				&& 
				tileX < tile_x + _tileRangeXY.x 
				&& 
				tileY > tile_y - _tileRangeXY.y 
				&& 
				tileY < tile_y + _tileRangeXY.y 
			);
		}
		/**
		 *  @private
		 * 指定镜头跟随目标 
		 * @param $lookAtCharacter
		 * 
		 */	
		public function lookAt($lookAtTarget:com.game.engine3D.scene.render.vo.ISceneCameraTarget,$useTween:Boolean=false):void
		{
			_followTarget = $lookAtTarget;
			
			var frame:int = $useTween?0:-1;
			//立即更新一下摄像机位置
			run(frame);
		}
		
		/**
		 * 锁定镜头在一个矩形区域内，参数单位为像素，设置0为不锁定
		 * @param startX
		 * @param startY
		 * @param endX
		 * @param endY
		 * 
		 */
		public function lockArea(startX:int,startY:int,endX:int,endY:int):void
		{
			_lockAreaStartX = startX;
			_lockAreaEndX = endX;
			_lockAreaStartY = startY;
			_lockAreaEndY = endY;
			run();
		}
		
		/**
		 * @private
		 * 运行
		 * @param $useTween 是否启用缓动
		 */	
		final public function run($frame:int=-1):void
		{
			if(_isLocked)return;
			if(_followTarget==null)return;
			if(_scene.sceneConfig==null || _scene.mapConfig==null)return;
			
			var stageWidth:int = _scene.sceneConfig.width;
			var stageHeight:int = _scene.sceneConfig.height;
			var mapWidth:int = _scene.mapConfig.width;
			var mapHeight:int = _scene.mapConfig.height;
			
			_scP.copyFrom(_followTarget.pos);
			_speed = _followTarget.speed;
			//
			var useTween:Boolean = Boolean($frame!=-1);
			//
			lookAtPos(_scP,stageWidth,stageHeight,mapWidth,mapHeight,useTween);
		}
		
		private static var _scP:Point = new Point();
		private static var _preTime:int = 0;
		private static var _preX:Number = 0;
		private static var _preY:Number = 0;
		
		private static const FIX_DIS_MAX:int = 150;			// 摄像机跟踪最大距离
		private static const FIX_DIS_MIN:int = 80;			// 摄像机跟踪最小距离
		private static const FOLLOW_TIME:int = 400;		// 摄像机跟踪延迟时间
		
		final public function lookAtPos($pos:Point, $stageWidth:int, $stageHeight:int, $mapWidth:int=0, $mapHeight:int=0,$useTween:Boolean=false):void
		{
			var pX:Number = Math.max(Math.min($pos.x, _lockAreaEndX==0?int.MAX_VALUE:_lockAreaEndX), _lockAreaStartX);
			var pY:Number = Math.max(Math.min($pos.y, _lockAreaEndY==0?int.MAX_VALUE:_lockAreaEndY), _lockAreaStartY);


			var diffX:Number = pX - _preX;
			var diffY:Number = pY - _preY;
			var showWidth:int = Math.min($stageWidth, $mapWidth);
			var halfShowWidth:int = showWidth >> 1;
			var showHeight:int = Math.min($stageHeight, $mapHeight);
			var halfShowHeight:int = showHeight >> 1;
			if (!$useTween)
			{
				posX = Math.min(Math.max(pX, halfShowWidth), $mapWidth-halfShowWidth) >> 0;
				sceneX = Math.max(Math.min(0, halfShowWidth - pX), showWidth-$mapWidth);
				tile_x = posX/SceneConfig.TILE_WIDTH;
				_preX = pX;
				posY = Math.min(Math.max(pY, halfShowHeight), $mapHeight-halfShowHeight) >> 0;
				sceneY = Math.max(Math.min(0, halfShowHeight - pY), showHeight-$mapHeight);
				tile_y = posY/SceneConfig.TILE_HEIGHT;
				_preY = pY;
				return;
			}
			
			var len:Number = Math.sqrt(diffX*diffX*2 + diffY*diffY*4);
			var diffTime:Number = GlobalConfig2D.nowTime - _preTime;

			if ($mapWidth < $stageWidth)
			{
				sceneX = ($stageWidth - $mapWidth) >> 1;
				posX = $mapWidth >> 1;
				tile_x = posX/SceneConfig.TILE_WIDTH;
			} else if (0 != _preX)
			{
				if (len > FIX_DIS_MAX)
				{
					pX -= (FIX_DIS_MAX * ((pX - _preX) / len)) >> 0;
				}
				else if (len > FIX_DIS_MIN)
				{
					pX = _preX + ((diffX * diffTime/ FOLLOW_TIME) >> 0);
				} 
				else
				{
					pX = _preX;
				}
				
				sceneX = Math.max(Math.min(0, halfShowWidth - pX), showWidth-$mapWidth);
				posX = Math.min(Math.max(pX, halfShowWidth), $mapWidth-halfShowWidth) >> 0;
				tile_x = posX/SceneConfig.TILE_WIDTH;
			}

			if ($mapHeight < $stageHeight)
			{
				sceneY = ($stageHeight - $mapHeight) >> 1;
				posY = $mapHeight >> 1;
				tile_y = posY/SceneConfig.TILE_HEIGHT;
			} else if (0 != _preY)
			{
				if (len > FIX_DIS_MAX)
				{
					pY -= (FIX_DIS_MAX * ((pY - _preY) / len)) >> 0;
				}
				else if (len > FIX_DIS_MIN)
				{
					pY = _preY + ((diffY * diffTime/ FOLLOW_TIME) >> 0);
				} 
				else
				{
					pY = _preY;
				}
				sceneY = Math.max(Math.min(0, halfShowHeight - pY), showHeight-$mapHeight);
				posY = Math.min(Math.max(pY, halfShowHeight), $mapHeight-halfShowHeight) >> 0;
				tile_y = posY/SceneConfig.TILE_HEIGHT;
			}

			_preTime = GlobalConfig2D.nowTime;
			_preX = pX;
			_preY = pY;
		}
	}
}
