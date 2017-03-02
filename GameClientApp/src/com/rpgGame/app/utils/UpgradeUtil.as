package com.rpgGame.app.utils
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.item.UpgradeItemData;
	import com.rpgGame.coreData.info.item.UpgradeItemListVo;
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;
	
	import app.message.AmountType;
	
	public class UpgradeUtil
	{
		public function UpgradeUtil()
		{
		}
		
		
		/**
		 * 检测是否有足够的消耗物品
		 * @param upgradeProtoInfo		
		 * @param isHint				是否要提示
		 * @return 
		 * 
		 */		
		public static function isCanUpgrade( upgradeProtoInfo:UpgradeProtoInfo, isHint:Boolean = false ):Boolean
		{
			if( upgradeProtoInfo == null )
				return false;
			
			var typs:Array = upgradeProtoInfo.amountInfo.getAllTyps();
			var type:int;
			var len:int = typs.length;
			for( var i:int = 0; i < len; i++ )
			{
				type = typs[i];
				if( !isSomeMoneyEnough( type, upgradeProtoInfo.amountInfo.getAmountByType( type ), isHint ) )
				{
					//各种钱不够的都退出
					return false;
				}
			}
			
			//物品是否足够
			if( !isHasItemEnough( upgradeProtoInfo, isHint ) )
				return false;
			
			return true;
		}
		
		
		
		/**
		 * 判断身上的某种钱是否足够并且给予提示
		 * @param moneyType
		 * @param price
		 * @param isHint
		 * @return 
		 * 
		 */		
		public static function isSomeMoneyEnough( moneyType:int, price:int, isHint:Boolean = false ):Boolean
		{
			if( AmountType.EXP == moneyType )
			{
				if ( MainRoleManager.actorInfo.curExp >= price )
					return true;
				
				if(isHint)
					NoticeManager.showHint( EnumHintInfo.MONEY_FAIL8 );
				return false;
			}
			
			var isEnough:Boolean = MainRoleManager.actorInfo.amountInfo.getAmountByType( moneyType ) >= price;
			if( isEnough )
				return true;
			
			if( isHint )
			{
				switch( moneyType )
				{
					case AmountType.BAND_MONEY:
						NoticeManager.showHint( EnumHintInfo.MONEY_FAIL2 );
						break;
					case AmountType.MONEY:
						NoticeManager.showHint( EnumHintInfo.MONEY_FAIL1 );
						break;
					case AmountType.JINZI:
						NoticeManager.showHint( EnumHintInfo.MONEY_FAIL3 );
						break;
					case AmountType.HONOR:
						NoticeManager.showHint( EnumHintInfo.MONEY_FAIL5 );
						break;
					case AmountType.BAND_JINZI:
						NoticeManager.showHint( EnumHintInfo.MONEY_FAIL4 );
						break;
					case AmountType.GONGXUN:
						NoticeManager.showHint( EnumHintInfo.MONEY_FAIL6 );
						break;
					case AmountType.FAMILY_LILIAN:
						NoticeManager.showHint( EnumHintInfo.MONEY_FAIL7 );
						break;
					
				}
				
			}
			
			return false;
		}
		
		/**
		 * 是否有足够多的物品
		 * @param upgradeProtoInfo
		 * @return 
		 * 
		 */		
		public static function isHasItemEnough( upgradeProtoInfo:UpgradeProtoInfo, isHint:Boolean = false  ):Boolean
		{
			var itemListVo:UpgradeItemListVo = BackPackManager.instance.getUpgradeItemsByUpgradeProtoInfo( upgradeProtoInfo );
			if( itemListVo != null )//有消耗道具
			{
				if( itemListVo.isItemEnough ) 
					return true;
				
				if( !isHint )
					return false;
				
				var upgradeItemList:Vector.<UpgradeItemData> = itemListVo.getAllItemDatas();
				var len:int = upgradeItemList.length;
				var itemData:UpgradeItemData;
				var itemName:String = "";
				for( var i:int = 0; i < len; i++ )
				{
					itemData = upgradeItemList[i];
					if( !itemData.isHasItem )
					{
						itemName += ItemConfig.getItemName( itemData.itemId ) + " ";
					}
				}
				
				NoticeManager.showHint( EnumHintInfo.UPGRADE_ITEM_FAIL1, [ itemName ] );
				return false;
			}
			return true;//没有配置消耗道具那也是够
		}
		
		/**
		 * 得到消耗数据
		 * @param upgradeProtoInfo
		 * @return 
		 * 
		 */		
		public static function getUpgradeItemListVo( upgradeProtoInfo:UpgradeProtoInfo ):UpgradeItemListVo
		{
			var itemListVo:UpgradeItemListVo = BackPackManager.instance.getUpgradeItemsByUpgradeProtoInfo( upgradeProtoInfo );
			return itemListVo;
		}
		
	}
}