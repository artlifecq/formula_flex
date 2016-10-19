package com.game.engine2D.scene.render.vo.img
{
	import com.game.engine2D.core.ATFSubTexture;
	import com.game.engine2D.scene.render.RenderUnit;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * 换装资源数据原型（主要用来存储玩家爱当前换装数据，用于在外部获取）
	 * @author Carver
	 */	
	public class RenderFaceData
	{
		/**
		 * 换装ID
		 * */
		public var id:int;
		/**
		 * 换装类型
		 * */
		public var type:String;
		
		/**
		 * 该片段在场景中的 的 剪切矩形
		 */	
		public var cutRect:Rectangle;
		
		/**
		 * 本换装部件位图在资源位图上的起始坐标
		 */	
		public var sourcePoint:Point;
		
		/**
		 * 资源的BitmapData
		 */
		public var sourceBitmapData:BitmapData;
		public var sourceTexture:ATFSubTexture;
		
		public var showX:Number = 0;
		public var showY:Number = 0;
		
		public var logicAngle:uint = 0;
		
		public function RenderFaceData($cutRect:Rectangle=null, $sourcePoint:Point=null, $sourceBitmapData:BitmapData=null, $ap:RenderUnit=null)
		{
			cutRect = $cutRect;
			sourcePoint = $sourcePoint;
			sourceBitmapData = $sourceBitmapData;
		}
		/**判断是否合法*/
		public function isGood():Boolean
		{
			return cutRect!=null
				&& 
				sourcePoint!=null
				&& 
				sourceBitmapData!=null
		}
		
		public function isGoodTexture():Boolean
		{
			return cutRect!=null
				&& 
				sourcePoint!=null
				&& 
				sourceTexture!=null
		}
	}
}