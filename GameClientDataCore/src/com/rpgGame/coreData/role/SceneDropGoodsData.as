package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.type.AvatarUrl;
	
	import org.game.netCore.net.ByteBuffer;

	/**
	 *
	 * 场景掉落物数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-14 上午11:32:15
	 *
	 */
	public class SceneDropGoodsData extends RoleData
	{
		/** 外观 **/
		public var avatarRes : String = null;
		/** 保护结束时间(这个时间以后就可以采集了) **/
		public var pickCd : Number = 0;
		/** 是否能自动拾取 **/
		public var canAutoPick : Boolean = false;
		/** 距离 **/
		public var farDistance : int = 0;
		/** 是不是掉落物 **/
		public var isDroped : Boolean = false;
		/** 采集物是不是坐骑幼崽 **/
		public var isMount:Boolean = false;
		/** 场景掉落物项数据 **/
		public var goodsDatas : Vector.<SceneDropGoodsItem> = null;

		public function SceneDropGoodsData()
		{
			super(RoleType.TYPE_DROP_GOODS);
			this.name = "";
		}

		public function readFrom(buffer : ByteBuffer) : void
		{
			id = buffer.readVarint64();
			x = buffer.readVarint32();
			y = buffer.readVarint32();
			pickCd = buffer.readVarint64();
			canAutoPick = buffer.readBoolean();
			avatarRes = AvatarUrl.BAO_XIANG;
			farDistance = 200;
		}
		
		/**
		 * 坐骑掉落落物 
		 * @param buffer
		 * 
		 */		
		public function readFromIsMountCollect(buffer : ByteBuffer) : void
		{
			id = buffer.readVarint64();
			x = buffer.readVarint32();
			y = buffer.readVarint32();
			pickCd = buffer.readVarint64();
			avatarRes = AvatarUrl.BAO_XIANG;
			farDistance = 200;
		}
	}
}
