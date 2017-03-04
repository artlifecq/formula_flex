package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.type.AvatarUrl;
	import com.rpgGame.netData.map.bean.DropGoodsInfo;
	import com.rpgGame.netData.map.message.ResRoundGoodsExtraMessage;
	import com.rpgGame.netData.map.message.ResRoundGoodsMessage;
	
	import org.game.netCore.data.long;

	/**
	 *
	 * 场景掉落物数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-14 上午11:32:15
	 *
	 */
	public class SceneDropGoodsData extends RoleData
	{
		public var isDroped:Boolean;
		
		public var goodsDatas:DropGoodsInfo;
		public var droptype:int;
		public var droptargetId:long;
		
		public var avatarRes:String;
		
		public var farDistance:int=200;
		
		private var isBaoXiang:Boolean=true;
		
		public function SceneDropGoodsData()
		{
			super(RoleType.TYPE_DROP_GOODS);
			this.name = "";
		}

		/**
		 *掉落数据源 
		 * @param msg
		 * 
		 */
		public function setGoodsExtraMsg(msg:ResRoundGoodsExtraMessage):void
		{
			droptype=msg.droptype;
			droptargetId=msg.droptargetId;
			updateWithGoodsData(msg.goods);
		}
		
		public function setGoodsMsg(msg:ResRoundGoodsMessage):void
		{
			updateWithGoodsData(msg.goods);
		}
		
		public function updateWithGoodsData(goods:DropGoodsInfo):void
		{
			goodsDatas=goods;
			id=goodsDatas.dropGoodsId.ToGID();
			avatarRes="goods/"+goodsDatas.itemModelId+"/"+goodsDatas.itemModelId;
			if(isBaoXiang){
				avatarRes=AvatarUrl.BAO_XIANG;
			}
			x=goodsDatas.x;
			y=-1*goodsDatas.y;
		}
	}
}
