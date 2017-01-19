package com.rpgGame.app.ui.main.chat.laba
{
	import com.rpgGame.coreData.info.chat.ChatInfo;
	
	import starling.display.Sprite;
	
	/**
	 * VIP会员聊天的频道 
	 * @author fly.liuyang
	 * 
	 */	
	public class VipChatCanvas extends Sprite
	{
		private static const MAX_DIS_NUM:int = 5;
		
		private var _chuanyinPool:Array = [];
		private var cIndex:int = 0;
		private var chuanyinCup:Sprite;
		private var maxShowNum:int;
		private var chuanyinList:Array = [];
		
		public function VipChatCanvas()
		{
			init();
		}
		
		private function init():void
		{
			chuanyinCup = new Sprite();
			chuanyinCup.name = "chuanyinCup";
			addChild(chuanyinCup);
		}
		
		public function show():void
		{
		}
		
		public function addOneChuanYin(info:ChatInfo):void
		{
			var vipChatInfoItem:VipChatInfoItem;
			var len:int = chuanyinList.length;
			if(len >= MAX_DIS_NUM)
			{
				vipChatInfoItem = chuanyinList.shift();
				vipChatInfoItem.clear();
				if( vipChatInfoItem != null && vipChatInfoItem.parent != null )
					vipChatInfoItem.parent.removeChild( vipChatInfoItem );
			}else
			{
				vipChatInfoItem = getOneChuanYinItem(info);
			}
			vipChatInfoItem.setData(info);
			vipChatInfoItem.y = -vipChatInfoItem.height;
			vipChatInfoItem.x = 0;
			vipChatInfoItem.show();
			toOffsetPos(vipChatInfoItem.y);
			chuanyinList.push(vipChatInfoItem);
			chuanyinCup.addChild(vipChatInfoItem);
		}
		
		private function toOffsetPos(offsetY:int):void
		{
			var vipChatInfoItem:VipChatInfoItem;
			var len:int = chuanyinList.length;
			//向上推移
			if (len > 0)
			{
				for (cIndex = 0; cIndex < len; cIndex++)
				{
					vipChatInfoItem = chuanyinList[cIndex];
					vipChatInfoItem.toOffsetPos(offsetY);
				}
			}
		}
		
		private function getOneChuanYinItem(info:ChatInfo):VipChatInfoItem
		{
			var item:VipChatInfoItem;
			if (_chuanyinPool.length > 0)
			{
				item = _chuanyinPool.pop();
			}
			else
			{
				item = new VipChatInfoItem(deleteOneChuanYin);
			}
			return item;
		}
		
		public function deleteOneChuanYin(item:VipChatInfoItem):Boolean
		{
			var index:int = chuanyinList.indexOf(item);
			if (index > -1)
			{
				chuanyinCup.removeChild(item);
				chuanyinList.splice(index, 1);
				_chuanyinPool.push(item);
				return true;
			}
			return false
		}
	}
}