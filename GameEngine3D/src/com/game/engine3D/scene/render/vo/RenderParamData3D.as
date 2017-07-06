package com.game.engine3D.scene.render.vo
{
	import away3d.utils.GCObject;

	/**
	 *
	 * 渲染参数数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 下午6:08:33
	 *
	 */
	public class RenderParamData3D extends GCObject
	{
		/**
		 * ID 某角色换装的唯一标识,注意该ID必须唯一
		 */
		public var id : int = 0;
		/**部件类型*/
		public var type : String = null;
		/**部件加载列表里的优先级*/
		public var priority : int = 100;
		public var sourcePath : String = null;
		public var animatorSourchPath : String = null;
		public var sourceName : String = null;
		/**
		 * 是否清空同种类型的换装
		 */
		public var clearSameType : Boolean = false;
		/** 使用二套动作 **/
		public var useSecondStatus : Boolean = false;
		public var forceLoad : Boolean = false;
		public var mouseEnable : Boolean = false;
		/** 是否效果方法类型，该类型会将模型中的EffectMethod应用到目标单元上 */
		public var isEffectMethodType : Boolean = false;
		/** 效果方法作用于材质名称集合 */
		public var effectMethodMaterialNames : Array = null;
		/**是否唯一实例存在*/
		public var isOnlyInstance : Boolean = false;
		public var is2DParam : Boolean = false;

		public function RenderParamData3D(id : int = 0, type : String = null, sourcePath : String = "", sourceName : String = "")
		{
			this.id = id;
			this.type = type;
			this.sourcePath = sourcePath;
			this.sourceName = sourceName;
		}

		/**
		 * 检测是否相等
		 * 注意：不检测回调
		 */
		public function equals($toCompare : RenderParamData3D) : Boolean
		{
			return id == $toCompare.id //
				&& type == $toCompare.type //
				&& forceLoad == $toCompare.forceLoad //
				&& useSecondStatus == $toCompare.useSecondStatus //
				&& sourcePath == $toCompare.sourcePath //
				&& sourceName == $toCompare.sourceName //
				&& animatorSourchPath == $toCompare.animatorSourchPath //
				&& priority == $toCompare.priority;
		}
	}
}
