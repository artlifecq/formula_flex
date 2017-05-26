package com.rpgGame.app.ui.main.chat.laba
{
	import com.rpgGame.coreData.info.chat.ChatInfo;
	import com.rpgGame.netData.chat.message.ResChatMessage;
	
	import feathers.controls.Group;
	import feathers.controls.UIAsset;
	
	import starling.display.Sprite;
	
	/**
	 * VIP会员聊天的频道 
	 * @author fly.liuyang
	 * 
	 */	
	public class VipChatCanvas
	{
		private static const MAX_DIS_NUM:int = 5;
		
		private var _chuanyinPool:Array = [];
		private var cIndex:int = 0;
		private var chuanyinCup:Sprite;
		private var maxShowNum:int;
		private var chuanyinList:Array = [];
		
		private var _skin:Group;
		private var _bg:UIAsset; 
		
		public function VipChatCanvas(skin:Group,bg:UIAsset)
		{
			_skin=skin;
			_bg=bg;
			init();
		}
		
		private function init():void
		{
			chuanyinCup = new Sprite();
			chuanyinCup.name = "chuanyinCup";
			_skin.addChild(chuanyinCup);
		}
		
		public function displayVIPChat(display:Boolean):void
		{
			_skin.visible=display;
		}
		
		public function addOneChuanYin(info:ResChatMessage):void  // info:ChatInfo
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
			vipChatInfoItem.y = vipChatInfoItem.height;
			vipChatInfoItem.x = 0;
			vipChatInfoItem.show();
			chuanyinList.push(vipChatInfoItem);		
			chuanyinCup.addChild(vipChatInfoItem);
			toOffsetPos(vipChatInfoItem.y);		
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
					if(vipChatInfoItem)
					{
						vipChatInfoItem.toOffsetPos(offsetY);						
					}
				}
			}
			setbgWith();
		}
		
		private function getOneChuanYinItem(info:ResChatMessage):VipChatInfoItem  //info:ChatInfo
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
				setbgWith();
				return true;
			}
			displayVIPChat(false);
			return false
		}
		
		private function setbgWith():void
		{
			var hight:int=0;
			if(chuanyinList!=null&&chuanyinList.length>0)
			{
				for(var i:int=0;i<chuanyinList.length;i++)
				{
					hight+=(chuanyinList[i] as VipChatInfoItem).height;
				}
				hight=hight+(chuanyinList.length-1)*2;
				_bg.setSize(_bg.width,hight+5);
				_bg.y=-hight+11;
			}
			else
			{
				displayVIPChat(false);
			}
			
		}
		
	}
}