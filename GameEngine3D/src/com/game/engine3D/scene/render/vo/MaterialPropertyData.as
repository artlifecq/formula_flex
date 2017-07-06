package com.game.engine3D.scene.render.vo
{
	import away3d.utils.GCObject;

	/**
	 *
	 * 材质属性数据
	 * @author guoqing.wen
	 * 创建时间：2017-1-6 下午1:26:38
	 *
	 */
	
	public class MaterialPropertyData extends GCObject
	{
		public var materialName:String;
		public var propertyName:String;
		public var propertyValue:*;
		public var propertyOldValue:*;
		
		public function MaterialPropertyData()
		{
		}
	}
}