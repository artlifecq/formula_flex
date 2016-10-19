package com.rpgGame.coreData.info.collect
{
	public class CollectObjcetInfo
	{
		public var type : int; //类型ID
		public var name : String; //名字
		public var resource : String; //资源名称
		public var isReverse : Boolean; //资源左右倒转，true为倒转，默认提供右向资源，左向资源由程序进行倒转
		public var sceneID : int; //所属场景ID
		public var objectID : int; //采集物品的ID，这个ID全局唯一（跟怪物和NPC的ID都不同）
		public var scale : int; //缩放
		public var direction : int; //方向
		public var tileX : int; //位置X
		public var tileY : int; //位置Y
		public var action : String; //动作名称
		/**
		 * 是否动态创建
		 */
		public var isDynamicCreate : Boolean;
		/**
		 * 采集条显示文字
		 */
		public var collectShow : String;

		public function CollectObjcetInfo()
		{
		}
	}
}
