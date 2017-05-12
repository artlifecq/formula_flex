package com.rpgGame.coreData.info.mail
{
	import com.rpgGame.coreData.cfg.MailCfgData;
	import com.rpgGame.coreData.utils.MoneyUtil;
	
	import app.message.AmountType;
	import app.message.MailCollectProto;
	import app.message.MailProto;
	import app.message.MailProto.MailGoodsProto;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 *邮件Vo
	 * @author lpp
	 */
	public class MailInfo
	{
		/** 邮件ID **/
		public var mailId:int;
		/** 发送者的id，为0表示是系统邮件，就不需要读取下面的sender_name了 */
		public var senderId:Number = 0;
		/** 邮件正文 */
		public var content:String;
		/** 邮件标题 */
		public var mailTitle:String;
		/** 邮件发送时间 */
		public var startTime:Number=0;
		/** 发送者的名字 **/
		public var senderName:String = "系统";
		/**数值附件*/
		public var valueMap:HashMap;
		/** 邮件里附带的物品 **/
		public var itemMap:HashMap;
		/**
		 * true为已领取，false或空为未领取
		 */
		private var _itemStatusMap:HashMap = new HashMap();
		private var _moneyStatusMap:HashMap = new HashMap();
		
		//--------------------------------------
		/** 邮件剩余时间 */
		public var endTime:Number=0;
		/** 邮件是否阅读 */
		public var isRead:Boolean;
		
		
		public function MailInfo( id:int, mailProto:MailProto )
		{
			mailId = id;
			
			itemMap = new HashMap(); 
			valueMap = new HashMap();
			if(mailProto.hasSendTime)
			{
				startTime = mailProto.sendTime.toNumber();
			}
			
			if(mailProto.hasTitle)
			{
				mailTitle = mailProto.title.toString();
			}
			
			if(mailProto.hasContent)
			{
				content = mailProto.content.toString();
			}
			
			if(mailProto.hasSenderName)
			{
				senderName = mailProto.senderName.toString();
			}
			
			if( mailProto.senderId != null)
				senderId = mailProto.senderId.toNumber();
			if(mailProto.amountValue)
			{
				var len:int = mailProto.amountValue.length;
				for(var i:int = 0; i < len; i++)
				{
					var value:int = mailProto.amountValue[i];
					valueMap.add(i,value);
				}
			}
			createItemList( mailProto.goods );
			
		}
		
		/**
		 * 生成邮件中的物品列表 
		 * @param mailProto
		 * 
		 */		
		private function createItemList( goods:Array ):void
		{
			if( goods == null )
				return;
			
			var len:int = goods.length;
			var mailGoodsProto:MailGoodsProto;
			for( var i:int = 0; i < len; i++ )
			{
				mailGoodsProto = goods[i];
//				itemMap.add( mailGoodsProto.pos, ItemUtil.convertGoodsProtoToItemInfo( mailGoodsProto.goods ) );
			}
		}
		
		/**
		 * 某位置上是否有物品 （这个无关是否被领取）
		 * @param pos
		 * 
		 */		
		public function hasItemByPos( pos:int ):Boolean
		{
			return itemMap.getValue( pos ) != null ;
		}
		
		public function get isSystem():Boolean
		{
			return senderId == 0;
		}
		
		public function setFuJianStatus(collectProto:MailCollectProto):void
		{
			if(collectProto)
			{
				isRead = collectProto.isRead;
				var i:int;
				for(i = 0; i < MailCfgData.MAX_FU_JIAN_COUNT; i++)
				{
					value = collectProto.collectGoods & (1<<i);
					_itemStatusMap.add(i,value != 0);
				}
				
				
				
				var keys:Array = valueMap.keys();
				if(keys)
				{
					var len:int = keys.length;
					for(i = 0; i < len; i++)
					{
						var key:int = keys[i];
						var value:int = valueMap.getValue(key);
						if(value)
						{
							var isGot:Boolean = (collectProto.isCollectAmount & (1<<AmountType.BAND_MONEY)) != 0;
							_moneyStatusMap.add(key,isGot);
						}
					}
				}
			}
		}
		
		public function setValueCellected():void
		{
			var keys:Array = valueMap.keys();
			if(keys)
			{
				var len:int = keys.length;
				for(var i:int = 0; i < len; i++)
				{
					var key:int = keys[i];
					var value:int = valueMap.getValue(key);
					if(value)
					{
						_moneyStatusMap.add(key,true);
					}
				}
			}
		}
		
		public function setItemCellected(index:int = -1):void
		{
			if(index < 0)
			{
				for(var i:int = 0; i < MailCfgData.MAX_FU_JIAN_COUNT; i++)
				{
					_itemStatusMap.add(i,true);
				}
			}
			else
			{
				_itemStatusMap.add(index,true);
			}
		}
		
		/**
		 * 是否没有被领取
		 * @return 
		 * 
		 */		
		public function get hasValueNoGet():Boolean
		{
			var keys:Array = valueMap.keys();
			if(keys)
			{
				var len:int = keys.length;
				for(var i:int = 0; i < len; i++)
				{
					var key:int = keys[i];
					var value:int = valueMap.getValue(key);
					if(value)
					{
						var isGot:Boolean = _moneyStatusMap.getValue(key);
						if(!isGot)
						{
							return true;
						}
					}
				}
			}
			return false;
		}
		
		public function getValueTipsStr():String
		{
			var tipsStr:String = "";
			var keys:Array = valueMap.keys();
			if(keys)
			{
				var len:int = keys.length;
				for(var i:int = 0; i < len; i++)
				{
					var key:int = keys[i];
					var value:int = valueMap.getValue(key);
					if(value)
					{
						var isGot:Boolean = _moneyStatusMap.getValue(key);
						if(!isGot)
						{
							if(tipsStr != "")
							{
								tipsStr += "\n";
							}
							switch(key)
							{
								case AmountType.EXP:
									tipsStr += "经验：" + value;
									break;
								case AmountType.BAND_MONEY:
									tipsStr += "绑银：" + MoneyUtil.getHtmlMoneyString(value);
									break;
								case AmountType.MONEY:
									tipsStr += "银子：" + value;
									break;
								case AmountType.BAND_JINZI:
									tipsStr += "绑金：" + value;
									break;
								case AmountType.JINZI:
									tipsStr += "金子：" + value;
									break;
								case AmountType.HONOR:
									tipsStr += "荣誉值：" + value;
									break;
								case AmountType.GONGXUN:
									tipsStr += "功勋：" + value;
									break;
								case AmountType.FAMILY_LILIAN:
									tipsStr += "历练：" + value;
									break;
								case AmountType.WUXUN:
									tipsStr += "武勋：" + value;
									break;
							}
						}
					}
				}
			}
			return tipsStr;
		}
		
		/**
		 * 是否没有被领取
		 * @param index
		 * @return 
		 * 
		 */		
		public function hasItemNoGet( index:int ):Boolean
		{
			return hasItemByPos(index) && !_itemStatusMap.getValue(index);
		}
		
		/**
		 * 是否还有物品没有被领取
		 * @return 
		 * 
		 */		
		public function hasFuJianNoGet():Boolean
		{
			var keys:Array = itemMap.keys();
			var pos:int;
			var len:int = keys.length;
			for( var i:int = 0; i < len; i++ )
			{
				pos = keys[i];
				if( hasItemNoGet( pos ) )
					return true;
			}
			return hasValueNoGet;
		}
		
	}
}