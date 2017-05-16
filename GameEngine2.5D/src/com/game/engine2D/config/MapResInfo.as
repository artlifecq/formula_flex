package com.game.engine2D.config
{
	import flash.utils.ByteArray;

	/**
	 *
	 * 地图资源数据，跟资源对应
	 * @author zgd
	 * 创建时间：2014-11-27 下午10:05:19
	 * 
	 */
	public class MapResInfo
	{
//		public var mapPKAbleData:Vector.<Vector.<Boolean>>;//是否可PK数据(是否安全区)
//		public var mapMoveData:Vector.<Vector.<Boolean>>;//移动数据
		public var mapMoveDataByte:ByteArray;//移动数据
		
		
//		public var mapShadeData:Vector.<Vector.<Boolean>>;//遮挡数据
		public var mapShadeDataByte:ByteArray;//遮挡数据
		
		
		
//		public var safeData:Vector.<Vector.<Boolean>>;//安全区数据
		public var safeDataByte:ByteArray;//安全区数据
		
		
//		public var guildeData:Vector.<Vector.<Boolean>>;//盟会数据
		public var guildeDataByte:ByteArray;//盟会数据
		
		
//		public var islanData:Vector.<Vector.<Boolean>>;//孤岛数据
		public var islanDataByte:ByteArray;//孤岛数据
		
		
		
//		public var mapExp10XData:Vector.<Vector.<Boolean>>;//10倍经验区
		public var mapExp10XDataByte:ByteArray;//10倍经验区
		
//		public var mapExp20XData:Vector.<Vector.<Boolean>>;//20倍经验区
		public var mapExp20XDataByte:ByteArray;//20倍经验区
		
		
		public var mapEffects:Vector.<EffectInfo>;//场景特效数据
		
		
		
		public var numBlocksY:int;
		public var numBlocksX:int;
		
		public function isSolid(x:int,y:int):Boolean
		{
			if(mapMoveDataByte)
			{
				return isBitSet(x,y,mapMoveDataByte);
			}
			return false;
		}

		public function isIsland(x:int,y:int):Boolean
		{
			
			if(islanDataByte != null)
			{
				return isBitSet(x,y,islanDataByte);
			}
			return false;
		}
		
		public function isMask(x:int,y:int):Boolean
		{
			if(mapShadeDataByte != null)
			{
				return  isBitSet(x,y,mapShadeDataByte);
			}
			return false;
		}
		
		
		public function isGuide(x:int,y:int):Boolean
		{
			if(guildeDataByte != null)
			{
				return  isBitSet(x,y,guildeDataByte);
			}
			return false;
		}
		
		
		
		public function isSafe(x:int,y:int):Boolean
		{
			if(safeDataByte != null)
			{
				return  isBitSet(x,y,safeDataByte);
			}
			return false;
		}
		
	 
		/**------------------场景资源加载后数据(from SceneResMgr)------------------*/

		public function dispose():void
		{
			mapEffects = null;
		}
		
		
		
		private function isBitSet(x:int,y:int,data:ByteArray):Boolean
		{
			if(data == null)return false;
			var index:int = y * numBlocksX + x;
			var indexPos:int = int(index / 8);
			if(data.length > indexPos)
			{
				var b:int = data[indexPos];
				var pos:int = index % 8;
				return ((b >>> pos) & 1) == 1;
			}
			return false;
		}
		
	}
}
