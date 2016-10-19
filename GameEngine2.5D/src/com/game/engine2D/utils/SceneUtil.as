package com.game.engine2D.utils
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine2D.scene.map.vo.MapTile;
	import com.game.engine2D.vo.BaseCharacter;
	import com.game.engine3D.config.GlobalConfig;
	import com.game.mainCore.libCore.utils.ZMath;
	
	import flash.geom.Point;

	/**
	 * 场景通用函数
	 * @author Carver
	 */	
	public class SceneUtil
	{
		public function SceneUtil()
		{
		}
		
		static public function transformCoord_2d_3d(value:Number):Number
		{
			return GlobalConfig.transformCoord_2d_3d(value);
		}
		
		/**
		 * 由格子坐标X,得到格子对应的像素坐标点
		 * @param tileX
		 */	
		public static function getTileXPixel(tileX:uint):uint
		{
			return (tileX+0.5)*SceneConfig.TILE_WIDTH;
		}
		
		/**
		 * 由格子坐标Y,得到格子对应的像素坐标点
		 * @param tileY
		 */	
		public static function getTileYPixel(tileY:uint):uint
		{
			return (tileY+0.5)*SceneConfig.TILE_HEIGHT;
		}
		
		/**
		 * 由格子,得到格子对应的像素坐标点
		 * @param tileX
		 * @param tileY
		 * 
		 */		
		public static function getTileXY(tileX:uint,tileY:uint):Point
		{
			var p:Point = new Point((tileX+0.5)*SceneConfig.TILE_WIDTH,(tileY+0.5)*SceneConfig.TILE_HEIGHT);
			return p;
		}
		
		/**
		 * 由像素坐标点,得到格子对应的坐标点
		 * @param x
		 * @param y
		 * 
		 */		
		public static function getXYTile(x:Number,y:Number):Point
		{
			var p:Point = new Point(uint(x/SceneConfig.TILE_WIDTH),uint(y/SceneConfig.TILE_HEIGHT));
			return p;
		}
		
		public static function getXTile(x:Number):uint
		{
			return uint(x/SceneConfig.TILE_WIDTH);
		}
		
		public static function getYTile(y:Number):uint
		{
			return uint(y/SceneConfig.TILE_HEIGHT);
		}
		
		/**
		 * @private
		 * 得到可视tile级别范围的半个XY
		 * 比理论上的多加了1
		 * @param $scene
		 * @return 
		 * 
		 */	
		public static function getViewTileRangeXY($scene:Scene):Point
		{
			var rangeXY:Point = new Point();
			rangeXY.x = Math.ceil(($scene.sceneConfig.width/SceneConfig.TILE_WIDTH-1)/2)+1;
			rangeXY.y = Math.ceil(($scene.sceneConfig.height/SceneConfig.TILE_HEIGHT-1)/2)+1;
			return rangeXY;
		}
		/**
		 * @private
		 * 得到可视zone级别范围的半个XY
		 * 比理论上的多加了1
		 * @param $scene
		 * @return 
		 * 
		 */	
		public static function getViewZoneRangeXY($scene:Scene):Point
		{
			var rangeXY:Point = new Point();
			rangeXY.x = Math.ceil(($scene.sceneConfig.width/SceneConfig.ZONE_WIDTH-1)/2)+1;
			rangeXY.y = Math.ceil(($scene.sceneConfig.height/SceneConfig.ZONE_HEIGHT-1)/2)+1;
			return rangeXY;
		}
		/**
		 * @private
		 * 得到可视zone级别范围的点，需要指定距离目标点的x方向距离和y方向距离
		 * 说明：这里不验证边界
		 * @param $target
		 * @param $rangeX
		 * @param $rangeY
		 * @return 
		 * 
		 */
		public static function findViewZonePoints($targetX:int,$targetY:int, $rangeX:int, $rangeY:int):Array
		{
			var arr:Array = [];
			//检测数据合法性
			if($rangeX<0 || $rangeY<0)return [new Point($targetX,$targetY)];
			var h:int;
			var v:int;
			var hMin:int = $targetX - $rangeX;
			var hMax:int = $targetX + $rangeX;
			var vMin:int = $targetY - $rangeY;
			var vMax:int = $targetY + $rangeY;
			for(h=hMin; h<=hMax; h++)//注意是小于等于
			{
				for(v=vMin; v<=vMax; v++)//注意是小于等于
				{
					arr.push(new Point(h,v));
				}
			}
			return arr;
		}
		/**
		 * 得到指定mapTile
		 * 请不要改变MapTile的障碍和遮挡信息，如需改变，请使用setSolid方法、setIsland方法或setMask方法
		 * @param $tileX
		 * @param $tileY
		 * @return 
		 * 
		 */	
		public static function getMapTile($tileX:int, $tileY:int):MapTile
		{
			if(Scene.scene.mapConfig==null)
			{
				return null;
			}
			var vecX:Vector.<Vector.<MapTile>> = Scene.scene.mapConfig.mapTiles;
			var vecY:Vector.<MapTile>;
			if($tileX > 0 && vecX && vecX.length > $tileX)
			{
				vecY = vecX[$tileX];
				if($tileY > 0 && vecY.length > $tileY)
				{
					return vecY[$tileY];
				}
			}
			return null;
		}
		/**
		 * 设置障碍信息
		 * @param $tileX
		 * @param $tileY
		 * @param $value
		 * @return 
		 * 
		 * 
		 */	
		public static function setSolid($tileX:int, $tileY:int, $value:Boolean):MapTile
		{
			var mt:MapTile = getMapTile($tileX, $tileY);
			if(mt!=null)
			{
				mt.isSolid = $value;
				
				//注意同时更新AStar用的快速字典
//				Scene.scene.mapConfig.mapSolids[$tileX+"_"+$tileY] = ($value?1:0);
				Scene.scene.mapConfig.mapSolids[$tileX][$tileY] = ($value?1:0);
			}
			return mt;
		}
		/**
		 * 得到指定逻辑坐标是否是障碍（出界亦算障碍）
		 * @param $tileX
		 * @param $tileY
		 * @return 
		 * 
		 */	
		public static function isSolid($tileX:int, $tileY:int):Boolean
		{
			var mt:MapTile = getMapTile($tileX, $tileY);
			if(mt==null || mt.isSolid)
			{
				return true;
			}
			return false;
		}
		/**
		 * 设置孤岛信息
		 * @param $tileX
		 * @param $tileY
		 * @param $value
		 * @return 
		 * 
		 * 
		 */	
		public static function setIsland($tileX:int, $tileY:int, $value:Boolean):MapTile
		{
			var mt:MapTile = getMapTile($tileX, $tileY);
			if(mt!=null)
			{
				mt.isIsland = $value;
			}
			return mt;
		}
		/**
		 * 是否是孤岛（出界不算孤岛）
		 * @param $tileX
		 * @param $tileY
		 * @return 
		 * 
		 */	
		public static function isIsland($tileX:int, $tileY:int):Boolean
		{
			var mt:MapTile = getMapTile($tileX, $tileY);
			if(mt!=null && mt.isIsland)
			{
				return true;
			}
			return false;
		}
		/**
		 * 设置遮挡信息
		 * @param $tileX
		 * @param $tileY
		 * @param $value
		 * @return 
		 * 
		 * 
		 */	
		public static function setMask($tileX:int, $tileY:int, $value:Boolean):MapTile
		{
			var mt:MapTile = getMapTile($tileX, $tileY);
			if(mt!=null)
			{
				mt.isMask = $value;
			}
			return mt;
		}
		/**
		 * 得到指定逻辑坐标是否是遮罩（出界不算遮罩）
		 * @param $tileX
		 * @param $tileY
		 * @return 
		 * 
		 */	
		public static function isMaskXY($x:int, $y:int):Boolean
		{
			var tileX:uint = $x / SceneConfig.TILE_WIDTH;
			var tileY:uint = $y / SceneConfig.TILE_HEIGHT;
			var mt:MapTile = getMapTile(tileX, tileY);
			if(mt!=null && mt.isMask)
			{
				return true;
			}
			return false;
		}
		
		/**
		 * 得到指定逻辑坐标是否是遮罩（出界不算遮罩）
		 * @param $tileX
		 * @param $tileY
		 * @return 
		 * 
		 */	
		public static function isMask($tileX:int, $tileY:int):Boolean
		{
			var mt:MapTile = getMapTile($tileX, $tileY);
			if(mt!=null && mt.isMask)
			{
				return true;
			}
			return false;
		}
		/**
		 * 获取方向上的从$fromMT到$toMT的直线内是否有障碍点
		 * @param $fromMT 开始的MapTile
		 * @param $toMT 目标的MapTile
		 */		
		public static function hasSolidBetween2MapTile($fromMT:MapTile, $toMT:MapTile):Boolean {
			//获取方向
			var p0:Point = new Point($fromMT.x, $fromMT.y);
			var p1:Point = new Point($toMT.x, $toMT.y);
			var angle:Number = ZMath.getTowPointsAngle(p0,p1);
			var angleRad:Number = angle * Math.PI/180;
			var cosV:Number = Math.cos(angleRad);
			var sinV:Number = Math.sin(angleRad);
			//获取目标距离
			var distance:Number = Point.distance(p0, p1);
			//获取理想状态最远点
			var maxP:Point = new Point(); 
			maxP.x = p1.x;
			maxP.y = p1.y;
			
			//弄一个虚拟目标
			var target:BaseCharacter = new BaseCharacter();
			target.x = maxP.x;
			target.y = maxP.y;
			//循环递减
			while(true)
			{
				//如果连点距离小于一个跨度，已经连通，没有找到障碍
				if(Math.abs($fromMT.tile_x-target.tile_x)<=1 && Math.abs($fromMT.tile_y-target.tile_y)<=1) {
					return false;
				}
				//如果新位置是障碍则返回找到障碍
				var mt:MapTile = getMapTile(target.tile_x, target.tile_y);
				if(mt.isSolid)
				{
					return true;
				}
				//递减
				target.x -= SceneConfig.TILE_WIDTH*cosV;
				target.y -= SceneConfig.TILE_HEIGHT*sinV;
			}
			return false;
		}
		/**
		 * 获取方向上的从$fromMT到$toMT的在距离$maxDis以内的最远的一个非障碍逻辑格
		 * @param $fromMT 开始的MapTile
		 * @param $toMT 目标的MapTile
		 * @param $maxDis 最大距离(像素距离)，为0则不限制
		 */		
		public static function getLineMapTile($fromMT:MapTile, $toMT:MapTile, $maxDis:Number=0):MapTile {
			//获取方向
			var p0:Point = new Point($fromMT.x, $fromMT.y);
			var p1:Point = new Point($toMT.x, $toMT.y);
			var angle:Number = ZMath.getTowPointsAngle(p0,p1);
			var angleRad:Number = angle * Math.PI/180;
			var cosV:Number = Math.cos(angleRad);
			var sinV:Number = Math.sin(angleRad);
			//获取目标距离
			var distance:Number = Point.distance(p0, p1);
			//获取理想状态最远点
			var maxP:Point = new Point(); 
			if($maxDis>0 && $maxDis<distance)
			{
				maxP.x = $fromMT.x + $maxDis*cosV;
				maxP.y = $fromMT.y + $maxDis*sinV;
			}
			else
			{
				maxP.x = p1.x;
				maxP.y = p1.y;
			}
			//弄一个虚拟目标
			var target:BaseCharacter = new BaseCharacter();
			target.x = maxP.x;
			target.y = maxP.y;
			//循环递减
			while(true)
			{
				//如果连点距离小于一个跨度，则认定为同一点,直接返回起始点
				if(($fromMT.tile_x-target.tile_x)*($fromMT.tile_x-target.tile_x)+ ($fromMT.tile_y-target.tile_y)*($fromMT.tile_y-target.tile_y)<2) 
				//if(Math.abs($fromMT.tile_x-target.tile_x)<1 && Math.abs($fromMT.tile_y-target.tile_y)<1) 
				{
					return $fromMT;
				}
				//如果新位置不是障碍则返回该位置
				var mt:MapTile = getMapTile(target.tile_x, target.tile_y);
				if(!mt.isSolid)
				{
					return mt;
				}
				//递减
				target.x -= SceneConfig.TILE_WIDTH*cosV;
				target.y -= SceneConfig.TILE_HEIGHT*sinV;
			}
			return $fromMT;
		}
		/**
		 * 获取距$toMT最近的一个非障碍逻辑点（如果$toMT自身不是障碍则返回自身）
		 * @param $fromMT 开始的MapTile
		 * @param $toMT 目标的MapTile
		 */		
		public static function getRoundMapTile($fromMT:MapTile, $toMT:MapTile):MapTile {
			if(!$toMT.isSolid)return $toMT;
			
			var toPiexlP:Point = new Point($toMT.x, $toMT.y);
			var toTileP:Point = new Point($toMT.tile_x, $toMT.tile_y);
			var leftRight:Point = new Point(toTileP.x, toTileP.x);
			var topBottom:Point = new Point(toTileP.y, toTileP.y);
			//循环递减
			while(true)
			{
				//向外扩展一圈
				leftRight.x -= 1;
				leftRight.y += 1;
				topBottom.x -= 1;
				topBottom.y += 1;
				
				//遍历该圈
				var tileP:Point;
				var piexlP:Point;
				var mapTile:MapTile;
				var i:int;
				var tilePArr:Array = [];
				//上下两行
				for(i=leftRight.x; i<=leftRight.y; i++)
				{
					tilePArr.push(new Point(i, topBottom.x),new Point(i, topBottom.y));
				}
				//左右两行
				for(i=topBottom.x+1; i<topBottom.y-1; i++)
				{
					tilePArr.push(new Point(leftRight.x, i),new Point(leftRight.y, i));	
				}
				//检测
				var num:int = tilePArr.length;
				for(i=0; i<num; i++)
				{
					tileP = tilePArr[i];
					//判断同一性
					piexlP = Transformer.transTilePoint2PixelPoint(tileP); 
					if($fromMT==null || $fromMT.tile_x==tileP.x && $fromMT.tile_y==tileP.y)
					{
						return $fromMT;
					}
					//注意应该用判断同一性，而不能用距离判断
//					//判断距离
//					piexlP = Transformer.transTilePoint2PixelPoint(tileP); 
//					if(Point.distance(toPiexlP, piexlP)>=$maxDis)
//					{
//						return null;//注意这里是跳出循环
//					}
					//查看存在性
					mapTile = getMapTile(tileP.x, tileP.y);
					if(mapTile==null)
					{
						continue;
					}
					//判断障碍
					if(!mapTile.isSolid)
					{
						return mapTile;
					}
				}
			}
			return null;
		}
		/**
		 * 获取距$mt最近的一个非障碍逻辑点（如果$mt自身不是障碍则返回自身）
		 * @param $mt 开始的MapTile
		 * @param $maxDis 最大距离(像素距离)，为0则不限制
		 */		
		public static function getRoundMapTile2($mt:MapTile, $maxDis:Number=0):MapTile {
			if(!$mt.isSolid)return $mt;
			
			var piexlP:Point = new Point($mt.x, $mt.y);
			var tileP:Point = new Point($mt.tile_x, $mt.tile_y);
			var leftRight:Point = new Point(tileP.x, tileP.x);
			var topBottom:Point = new Point(tileP.y, tileP.y);
			//循环递减
			while(true)
			{
				//向外扩展一圈
				leftRight.x -= 1;
				leftRight.y += 1;
				topBottom.x -= 1;
				topBottom.y += 1;
				
				//遍历该圈
				var tileP2:Point;
				var piexlP2:Point;
				var mapTile:MapTile;
				var i:int;
				var tilePArr:Array = [];
				//上下两行
				for(i=leftRight.x; i<=leftRight.y; i++)
				{
					tilePArr.push(new Point(i, topBottom.x),new Point(i, topBottom.y));
				}
				//左右两行
				for(i=topBottom.x+1; i<topBottom.y-1; i++)
				{
					tilePArr.push(new Point(leftRight.x, i),new Point(leftRight.y, i));	
				}
				//检测
				var num:int = tilePArr.length;
				for(i=0; i<num; i++)
				{
					tileP2 = tilePArr[i];
					//判断距离
					piexlP2 = Transformer.transTilePoint2PixelPoint(tileP2); 
					if(Point.distance(piexlP, piexlP2)>=$maxDis)
					{
						return null;//注意这里是跳出循环
					}
					//查看存在性
					mapTile =  getMapTile(tileP2.x, tileP2.y);
					if(mapTile==null)
					{
						continue;
					}
					//判断障碍
					if(!mapTile.isSolid)
					{
						return mapTile;
					}
				}
			}
			return null;
		}
	}
}