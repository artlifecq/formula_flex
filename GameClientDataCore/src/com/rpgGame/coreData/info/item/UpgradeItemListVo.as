package com.rpgGame.coreData.info.item
{
	import com.rpgGame.coreData.type.CostItemType;
	
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	
	/**
	 * 升级物品列表的数据 
	 * @author fly.liuyang
	 * 
	 */
	public class UpgradeItemListVo
	{
		private var _byte:ByteBuffer; 
		/** 统计出来的物品列表 */
		public var upgradeItemList:Vector.<UpgradeItemData>;
		
		public function UpgradeItemListVo()
		{
			upgradeItemList = new Vector.<UpgradeItemData>;
		}
		
		public function init():void
		{
			upgradeItemList.length = 0;
		}
		
		
		/**
		 * 添加消耗数据
		 * @param index
		 * @param configData
		 * 
		 */		
		public function addUpgradeInfo( upgradeItemData:UpgradeItemData ):void
		{
			if( upgradeItemData == null )
				return;
			
			upgradeItemList.push( upgradeItemData );
		}
		
		
		public function getByte():ByteBuffer
		{
			if(_byte == null)
			{
				_byte = new ByteBuffer();
				
				//见协议文档，物品消耗
				//varint32 '购买类型'，1-绑金购买(客户端需要验证绑金是否足够)，2-金子购买(客户端需要验证金子是否足够)，0-全物品(意味着玩家有足够的物品，不需要购买或者不能够购买)
				_byte.writeBoolean(false);
				_byte.writeVarint32(CostItemType.ALL_ITEM);
				var writeLen : Boolean = false;
				for each (var itemData:UpgradeItemData in upgradeItemList) 
				{
					for each (var vec:* in itemData.itemVec ) 
					{
						if(vec is Vector.<UpgradeItemInfo> && vec.length > 0)
						{
							_byte.writeVarint32(vec.length);
							for each (var upgradeItemInfo:UpgradeItemInfo in vec) 
							{
								_byte.writeVarint32(upgradeItemInfo.index);
								_byte.writeVarint32(upgradeItemInfo.costCount);
							}
						}else if (itemData.itemVec.length != 1 && vec is UpgradeItemInfo)
						{
							//一组数据
							if(!writeLen)
							{
								_byte.writeVarint32(itemData.itemVec.length);
								writeLen = true;
							}
							upgradeItemInfo = vec as UpgradeItemInfo;
							_byte.writeVarint32(upgradeItemInfo.index);
							_byte.writeVarint32(upgradeItemInfo.costCount);
						}
						else if(vec is UpgradeItemInfo)//单个
						{
							upgradeItemInfo = vec as UpgradeItemInfo;
							_byte.writeVarint32(1);
							_byte.writeVarint32(upgradeItemInfo.index);
							_byte.writeVarint32(upgradeItemInfo.costCount);
						}
					}
				}
			}
			return _byte;
		}
		
		public function getUpgradeCountByIndex( index:int ):int
		{
			var len:int = upgradeItemList.length;
			
			if( index >= len )
				index = len - 1;
			
			if( index < 0 )
				index = 0;
			
			if( len <= 0 )
				return 0;
			
			return upgradeItemList[index].itemTotalCount;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get isItemEnough():Boolean
		{
			for each (var itemData:UpgradeItemData in upgradeItemList) 
			{
				if( itemData.needItemCount > itemData.itemTotalCount )
					return false;
			}
			return true;
		}
		
		
		public function getAllItemDatas():Vector.<UpgradeItemData>
		{
			return upgradeItemList.concat();
		}
		
	}
}