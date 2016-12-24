package com.rpgGame.app.sender
{
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.coreData.info.stall.StallData;
	import com.rpgGame.coreData.info.stall.StallItemData;
	
	import app.cmd.StallModuleMessages;
	import app.message.ChangeToBuyGoodsType;
	import app.message.ChangeToSellGoodsType;

	public class StallSender extends BaseSender
	{
		public function StallSender()
		{
			super();
		}
		/**
		 * 请求摆摊,两次摆摊请求之间相隔10S
		 *
		 * varint32 摊位id
		 * varint32 摊位类型
		 * utf 摊位名字
		 *
		 * varint32 收购物品数量
		 * varint32 出售物品数量
		 *
		 * for(i->收购物品数量){
		 *      varint32 收购物品的id
		 *      varint32 收购物品的数量
		 *      varint32 收购物品的单价(银两)
		 * }
		 *
		 *
		 * for(i->出售物品数量){
		 *      varint32 出售物品在背包中得位置
		 *      varint32 出售物品的数量
		 *      varint32 出售物品的id,防止出错
		 *      varint32 出售物品的单价(银两)
		 * }
		 */
		public static function stall(stallData:StallData):void
		{
			_bytes.clear();
			_bytes.writeVarint32(stallData.stallId);
			_bytes.writeVarint32(stallData.stallType);
			_bytes.writeUTF(stallData.stallName);
			_bytes.writeVarint32(stallData.buyGoodsCount);
			_bytes.writeVarint32(stallData.sellGoodsCount);
			var stallItem : StallItemData;
			var i : int;
			for(i = 0 ; i < stallData.stallBuyList.length;i++)
			{
				stallItem = stallData.stallBuyList[i];
				if(!stallItem||!stallItem.itemId||!stallItem.num)
					continue;
				_bytes.writeVarint32(stallItem.itemId);
				_bytes.writeVarint32(stallItem.num);
				_bytes.writeVarint32(stallItem.price);
			}
			
			for(i = 0; i < stallData.stallSellList.length;i++)
			{
				stallItem = stallData.stallSellList[i];
				if(!stallItem||!stallItem.itemId||!stallItem.num)
					continue;
				_bytes.writeVarint32(stallItem.bagIndex);
				_bytes.writeVarint32(stallItem.num);
				_bytes.writeVarint32(stallItem.itemId);
				_bytes.writeVarint32(stallItem.price);
			}
			send(StallModuleMessages.C2S_STALL,_bytes);
		}
		/**
		 * 请求撤摊
		 */
		public static function cancelStall():void
		{
			_bytes.clear();
			send(StallModuleMessages.C2S_CANCEL_STALL,_bytes);
		}
		/**
		 * 请求修改我要出售的物品,本次操作在收到返回之前,都清锁定
		 *
		 * varint32 出售物品的槽位
		 *
		 * varint32 ChangeToSellGoodsType
		 *
		 * if(下架){
		 *      // 什么都不带
		 * } else if(修改价格或者修改出售数量) {
		 *      varint32 新的价格
		 *      bool 增加物品,只改价格就发送减少物品,减少物品的数量为0
		 *      if(增加物品的数量){
		 *          varint32 新的出售物品在背包中的位置
		 *          varint32 新的出售物品的数量,如果必须跟原来出售的物品是可以叠加的,不可以超出叠加上限
		 *          varint32 新的出售物品的id,防止出错
		 *      } else {
		 *          varint32 减少的数量,减少的物品会加回背包,新的数量不能够为0
		 *      }
		 * } else if(上架新产品){
		 *      varint32 出售物品在背包中的位置
		 *      varint32 出售物品的数量
		 *      varint32 出售物品的id,防止出错
		 *      varint32 出售物品的单价(银两)
		 * } else if(领取银两){
		 * } else {
		 *     错误类型,直接断线
		 * }
		 */
		public static function changeSellGoods(index:int,type:int,stallItem : StallItemData):void
		{
//			if(ReqLockUtil.isReqLocked(StallModuleMessages.C2S_CHANGE_TO_SELL_GOODS,true))
//				return;
//			ReqLockUtil.lockReq(StallModuleMessages.C2S_CHANGE_TO_SELL_GOODS,500);
			_bytes.clear();
			_bytes.writeVarint32(index);
			_bytes.writeVarint32(type);
			if(type==ChangeToSellGoodsType.SELL_GOODS_DOWN)
			{
				send(StallModuleMessages.C2S_CHANGE_TO_SELL_GOODS,_bytes);
			}
			if(!stallItem)
				return;
			if(type == ChangeToSellGoodsType.SELL_GOODS_CHANGE_COUNT_OR_PRICE)
			{
				_bytes.writeVarint32(stallItem.price);
				if(stallItem.changeItem)
				{
					_bytes.writeBoolean(stallItem.changeItem.count>0);
					if(stallItem.changeItem.count>0)
					{
						_bytes.writeVarint32(stallItem.changeItem.index);
						_bytes.writeVarint32(stallItem.changeItem.count);
						_bytes.writeVarint32(stallItem.changeItem.cfgId);
					}else
					{
						_bytes.writeVarint32((0-stallItem.changeItem.count));
					}
				}else
				{
					_bytes.writeBoolean(false);
					_bytes.writeVarint32(0);
				}
			}else if(type == ChangeToSellGoodsType.SELL_GOODS_UP_NEW)
			{
				_bytes.writeVarint32(stallItem.bagIndex);
				_bytes.writeVarint32(stallItem.num);
				_bytes.writeVarint32(stallItem.itemId);
				_bytes.writeVarint32(stallItem.price);
			}else{
				trace("错误类型，不能发过去");
				return;
			}
			send(StallModuleMessages.C2S_CHANGE_TO_SELL_GOODS,_bytes);
		}
		
		/**
		 * 修改收购物品,上锁
		 *
		 * varint32 收购物品的槽位
		 *
		 * varint32 收购物品的类型 ChangeToBuyGoodsType
		 *
		 * if(下架){
		 *      // 啥都不带
		 * } else if(修改收购价格或者修改收购数量){
		 *      varint32 新的价格
		 *      varint32 新的收购数量,这个收购数量只能最大变成物品叠加上限
		 *      varint32 收购物品的id
		 * } else if(收购新的产品){
		 *      varint32 收购物品的id
		 *      varint32 收购物品的数量
		 *      varint32 收购物品的单价(银两)
		 * } else if(把收购的物品领取回去){
		 *      // 啥都不带
		 * } else {
		 *      错误的修改收购类型
		 * }
		 */
		public static function changeBuyGoods(index:int,type:int,stallItem : StallItemData):void
		{
//			if(ReqLockUtil.isReqLocked(StallModuleMessages.C2S_CHANGE_TO_BUY_GOODS,true))
//				return;
//			ReqLockUtil.lockReq(StallModuleMessages.C2S_CHANGE_TO_BUY_GOODS,500);
			_bytes.clear();
			_bytes.writeVarint32(index);
			_bytes.writeVarint32(type);
			if(type==ChangeToBuyGoodsType.BUY_GOODS_DOWN)
			{
				send(StallModuleMessages.C2S_CHANGE_TO_BUY_GOODS,_bytes);
				return;
			}
			if(!stallItem)
				return;
			if(type == ChangeToBuyGoodsType.BUY_GOODS_CHANGE_COUNT_OR_PRICE_OR_GOODS)
			{
				_bytes.writeVarint32(stallItem.price);
				_bytes.writeVarint32(stallItem.num);
				_bytes.writeVarint32(stallItem.itemId);
			}else if(type == ChangeToBuyGoodsType.BUY_GOODS_UP_NEW)
			{
				_bytes.writeVarint32(stallItem.itemId);
				_bytes.writeVarint32(stallItem.num);
				_bytes.writeVarint32(stallItem.price);
			}else{
				trace("错误类型，不能发过去");
				return;
			}
			send(StallModuleMessages.C2S_CHANGE_TO_BUY_GOODS,_bytes);
		}
		/**
		 * 修改摊位类型,不可以修改成出售或者寄售的物品数量减少的摊位类型
		 *
		 * varint32 新的摊位类型(发送摊位类型id)
		 */
		public static function changeStallType(type:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(type);
			send(StallModuleMessages.C2S_CHANGE_STALL_TYPE,_bytes);
		}
		/**
		 * 购买摊位时长
		 *
		 * varint32 摊位类型(发送摊位类型id)
		 * varint32 购买摊位时长,单位小时
		 */
		public static function buyStallType(type:int,hour:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(type);
			_bytes.writeVarint32(hour);
			send(StallModuleMessages.C2S_BUY_STALL_TYPE,_bytes);
		}
		/**
		 * 修改摊位的名字，修改成功通过 S2C_STALL_BROADCAST 修改,该操作写死3秒钟才可以操作一次
		 *
		 * bytes 摊位的名字
		 */
		public static function changeStallName(name:String):void
		{
			_bytes.writeUTFBytes(name);
			send(StallModuleMessages.C2S_CHANGE_STALL_NAME,_bytes);
		}
		
		/**
		 * 请求店铺的详细信息,每次重新请求都会有返回,如果玩家当前打开了该店铺面板,可以每3S来请求一次,防止有数据变动
		 *      如果玩家确切的指导了该商铺的物品变更了,可以无视cd,直接来请求,比如服务器提示你卖出去了一个,或者收购到了一个
		 *
		 *      如果玩家视野里面没有这个摊位或者这个摊位上面没有人,清空掉所有这个摊位的详细信息
		 *      如果玩家视野里面有这个这个玩家以及这个摊位,如果玩家当前有缓存,拿缓存的数据
		 *
		 * varint32 摊位id
		 * varint32 上次该摊位数据的版本号,默认为0
		 */
		public static  function getStallDetail(id:Number,version:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(id);
			_bytes.writeVarint32(version);
			send(StallModuleMessages.C2S_GET_STALL_DETAIL,_bytes);
		}
		/**
		 * 购买摊位里面的东西
		 *
		 * varint32 摊位id
		 * varint32 摊位出售物品的槽位
		 * varint32 摊位出售物品的槽位的flag,看proto
		 *
		 * varint32 购买数量
		 * varint32 购买的物品id,防止这一瞬间卖家改了出售的物品
		 * varint32 购买的物品的单价,防止这一瞬间卖家改了出售价格
		 */
		public static function buyStallGoods(stallId: int,index:int,flag:int,num:int,item:int,price:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(stallId);
			_bytes.writeVarint32(index);
			_bytes.writeVarint32(flag);
			
			_bytes.writeVarint32(num);
			_bytes.writeVarint32(item);
			_bytes.writeVarint32(price);
			send(StallModuleMessages.C2S_BUY_STALL_GOODS,_bytes);
		}
		/**
		 * 出售物品给收购摊位
		 *
		 * varint32 摊位id
		 * varint32 摊位收购物品的槽位
		 * varint32 摊位收购物品的槽位的flag,看proto
		 *
		 * varint32 出售的物品id,防止这一瞬间卖家改了物品
		 * varint32 出售的物品的单价,防止这一瞬间卖家改了价格
		 *
		 * varint32 出售的物品的位置的数量
		 *
		 * for(i->出售的物品的位置的数量){
		 *      varint32 物品在背包中的位置(不可以重复)
		 *      varint32 出售的数量
		 * }
		 */
		public static function sellGoodsToStall(stallId : int ,index:int,flag:int,itemId:int,price:int,bagIndexs:Array):void
		{
			if(!bagIndexs || bagIndexs.length == 0)
				return;
			_bytes.clear();
			
			_bytes.writeVarint32(stallId);
			_bytes.writeVarint32(index);
			_bytes.writeVarint32(flag);
			
			_bytes.writeVarint32(itemId);
			_bytes.writeVarint32(price);
			
			_bytes.writeVarint32(bagIndexs.length);
			
			for(var i : int = 0 ; i < bagIndexs.length; i++)
			{
				_bytes.writeVarint32(bagIndexs[i][0]);
				_bytes.writeVarint32(bagIndexs[i][1]);
			}
			send(StallModuleMessages.C2S_SELL_GOODS_TO_STALL,_bytes);
		}
		/**
		 * 发广告，没有返回
		 *
		 * bytes 广告内容
		 */
		public static function setAutoAd(isOpen : Boolean,str:String = null):void
		{
			_bytes.clear();
			_bytes.writeBoolean(isOpen);
			if(isOpen)
				_bytes.writeUTFBytes(str);
			send(StallModuleMessages.C2S_SET_AD,_bytes);
		}
	}
}