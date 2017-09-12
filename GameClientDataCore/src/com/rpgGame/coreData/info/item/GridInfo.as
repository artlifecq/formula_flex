package com.rpgGame.coreData.info.item
{
	import com.rpgGame.coreData.info.face.IBaseFaceInfo;
	
	/**
	 * 可拖拽格子信息
	 * @author wewell@163.com
	 * 
	 */	
	public class GridInfo
	{
		//格子容器ID,见 ItemContainerID
		private var _containerID:int = -1;
		//格子下标
		private var _index:int;
		
		/**
		 *是否灰度 
		 */
		public var isGray:Boolean;
		
		/**
		 *是否选中(针对装备模块)
		 */
		public var isSelsce:Boolean;
		
		/**
		 * 格子信息 
		 * @param containerID
		 * @param index
		 * 
		 */		
		public function GridInfo(containerID:int, index:int)
		{
			_containerID = containerID;
			_index = index;
		}
		
		/**
		 *格子容器ID,见ItemContainerID 
		 * 
		 */		
		public function get containerID():int
		{
			return _containerID;
		}
		
		/**
		 *格子下标 
		 * 
		 */		
		public function get index():int
		{
			return _index;
		}
		
		//是否需要提示
		public var isTips:Boolean = true;
		
		//放在格子里的数据对象
		public var data:IBaseFaceInfo;
		
		//是否为待解锁
		public var isUnlock:Boolean;
		//是否为可解锁
		public var isCanlock:Boolean;
		//是否为禁用
		public var isEnabled:Boolean = true;
		
		/** 是否显示锁定图片(不是背包的锁定图片) **/
		public var isShowLockAsset : Boolean = false;
		
		//格子待解锁数据
		public var unlockInfo:ItemGridUnlockInfo;
		
		//容器格子(显示对象)的真实下标
		public var realIndex:int = -1;
		
		public function reset(containerID:int, index:int):void
		{
			this._containerID = containerID;
			this._index = index;
		}
	}
}