package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.info.collect.CollectObjcetInfo;

	/**
	 *
	 * 场景采集物数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-14 上午11:32:15
	 *
	 */
	public class SceneCollectData extends RoleData
	{
		public var collectType : int; //类型ID
		public var sceneID : int; //所属场景ID
		public var avatarRes : String;
		/**
		 * 是否动态创建
		 */
		public var isDynamicCreate : Boolean;

		public function SceneCollectData()
		{
			super(RoleType.TYPE_COLLECT);
		}

		public function setInfoData(data : CollectObjcetInfo) : void
		{
			this.id = data.objectID;
			this.collectType = data.type;
			this.sceneID = data.sceneID;
			this.name = data.name.toString();
			avatarRes = data.resource;
			this.sizeScale = data.scale > 0 ? (data.scale * 0.01) : 1;
			this.direction = data.direction;
			this.x = data.tileX;
			this.y = data.tileY;
			isDynamicCreate = data.isDynamicCreate;
		}
	}
}
