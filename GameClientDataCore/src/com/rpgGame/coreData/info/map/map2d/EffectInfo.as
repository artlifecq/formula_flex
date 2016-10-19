package com.rpgGame.coreData.info.map.map2d
{
	import com.game.engine2D.utils.SceneUtil;
	

	/**
	 *
	 * 场景特效信息
	 * @author fly.liuyang
	 * 创建时间：2015-6-10 下午10:08:47
	 * 
	 */
	public class EffectInfo
	{
		public var fileName:String;
		public var centerX:int;
		public var centerY:int;
		/**所有帧里最左上角的点*/
		public var leftMostX:int;
		/** */
		public var topMostY:int;
		/** 所有帧最大的范围*/
		public var mostWideWidth:int;
		/** */
		public var mostLongHeight:int;
		/** 缩放*/
		public var scale:int;
		/**旋转角度 */
		public var rotateDegree:int;
		/** 编号*/
		public var id:int;
		/** 是否反转*/
		public var filp:Boolean;
		public var effectKey:String;
		public var tileY:uint;
		public var tileX:uint;
		
		public function EffectInfo()
		{
		}
		
		public function setEffectProto(effect:Object):void
		{
			fileName = effect.fileName;
			centerX = effect.centerX;
			centerY = effect.centerY;
			leftMostX = effect.leftMostX;
			topMostY = effect.topMostY;
			mostWideWidth = effect.mostWideWidth;
			mostLongHeight = effect.mostLongHeight;
			scale = effect.scale;
			rotateDegree = effect.rotateDegree;
			id = effect.id;
			filp = effect.filp;
//			effectKey = SceneCharType.DUMMY+"_"+centerX + "_" + centerY;
			tileX = SceneUtil.getXTile(centerX);
			tileY = SceneUtil.getXTile(centerY);
		}
	}
}