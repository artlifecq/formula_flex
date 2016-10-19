package com.rpgGame.coreData.info.face
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	
	

	/**
	 * face对象的基础根类 
	 * @author carver
	 * 
	 */	
	public class BaseFaceInfo implements IBaseFaceInfo
	{
		/**所有容器信息,在需要拖曳的容器中(如背包,仓库中才有意义)**/
		private var _containerID:int = -1;
		/** 索引 **/
		private var _index:int = -1;
		/** ID————可物品ID、技能ID **/
		protected var _cfgId:int;
		/** FaceTypeEnum **/
		protected var _faceType:String;
		protected var _type:int;
		/** 名字 **/
		protected var _name:String = "";
		/**数量--为0则显示灰色图标  为1以上显示彩色图标  不可叠加物品不显示数量*/		
		public var count:int = 0;
		/** 最大堆叠数**/	
		public var _maxCount:int;
		/**ico名称 用以加载图标资源*/		
		protected var _icoName:String;
		/** 品质 **/
		protected var _quality:int;
		/** 快捷键**/		
		public var shortcut:String = "";
		
		public var data:*;
		
		
		/**
		 * 
		 * @param id		id
		 * @param type		FaceTypeEnum
		 * 
		 */		
		public function BaseFaceInfo( cfgId:int, type:int, faceType:String)
		{
			_cfgId = cfgId;
			_type = type;
			_faceType = faceType;
		}
		
		public function setContainerId(containerID:int):void
		{
			if(containerID<0 || containerID == _containerID)
				return;
			if(containerID != -1)
			{
//				GameLog.addShow(_name+" containerID changed: from "+ _containerID +" to " + containerID);
				_containerID = containerID;
			}
		}
		
		public function get containerID():int
		{
			return _containerID;
		}
		
		public function setIndex(index:int):void
		{
			if(index < 0 || index == _index)
			{
				GameLog.addShow("正在为一个装备格子添加index：",index,"居然是小于0的？");
				return;
			}
			
//			if(_index != -1)
//			{
//				GameLog.addShow(_name+" index changed: from "+ _index +" to " + index);
//			}
			_index = index;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		/** 类型  */
		public function get type():int
		{
			return _type;
		}
		
		public function set type(value:int):void
		{
			_type = value;
		}
		
		public function set icoName(value:String):void
		{
			_icoName = value;
		}
		
		public function get icoName():String
		{
			return _icoName;
		}
		
		/** 冷却id **/
		public function get coolID():String
		{
			return _faceType + "_" + _cfgId;
		}

		/**
		 * ID————可物品ID、技能ID
		 * @return 
		 * 
		 */		
		public function get cfgId():int
		{
			return _cfgId;
		}

		public function set cfgId(value:int):void
		{
			_cfgId = value;
		}

		/** 名字  */
		public function get name():String
		{
			return _name;
		}

		/**
		 * @private
		 */
		public function set name(value:String):void
		{
			_name = value;
		}

		/**品质*/
		public function get quality():int
		{
			return _quality;
		}

		/**
		 * @private
		 */
		public function set quality(value:int):void
		{
			_quality = value;
		}
		
		
		public function get maxCount():int
		{
			if(!_maxCount)_maxCount = ItemCfgData.getItemMaxCount(_cfgId);
			return _maxCount;
		}

	}
}