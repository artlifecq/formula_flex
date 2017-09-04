package com.rpgGame.appModule.guild
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.common.NumSelectUICtrl;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.common.PageSelectUICtrl;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.TanKuang_JuanXian;
	import org.mokylin.skin.common.Flip_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class GuildDonatePanle extends SkinUIPanel
	{
		private var _skin:TanKuang_JuanXian;
	
		private var _itemPage1:NumSelectUICtrl;
		private var _itemPage2:NumSelectUICtrl;
		private var _item1:ClientItemInfo;
		private var _item2:ClientItemInfo;
		private var _opaque:int;
		private var _DonateMax:int;
		
		private var _pageCtrl:PageSelectUICtrl;
		private var maxCount:int=8;
		private var cellList:Vector.<GuildDonateCell>=new Vector.<GuildDonateCell>();
		private var _memList:Vector.<GuildMemberInfo>;
		public function GuildDonatePanle():void
		{
			_skin = new TanKuang_JuanXian();
			super(_skin);
			initView();
		}
		private function showPageData(data:*):void
		{
			// TODO Auto Generated method stub
			var list:Vector.<GuildMemberInfo>=data;
			var len:int=list.length;
			var tmp:GuildMemberInfo;
			var index:int;
			for (var i:int = 0; i < maxCount; i++) 
			{
				tmp=null;
				index=-1;
				if (i<len) 
				{
					tmp=list[i];
					index=_memList.indexOf(tmp);
				}
				cellList[i].setData(tmp,index);
			}
		}
		private function initView():void
		{
		
			_pageCtrl=new PageSelectUICtrl(_skin.btnPrev,_skin.btnNext,_skin.lbNum,showPageData);
			var tmp:GuildDonateCell;
			var startX:int=14;
			var startY:int=70;
			for (var i:int = 0; i < maxCount; i++) 
			{
				tmp=new GuildDonateCell(i);
				tmp.x=startX;
				tmp.y=startY+i*tmp.height;
				_skin.container.addChild(tmp);
				cellList.push(tmp);
				tmp.setData(null,-1);
			}
			MCUtil.BringToTop(_skin.grpFlip);
			//=================
			var iteminfo:Object = JSONUtil.decode( GlobalSheetData.getSettingInfo(822).q_string_value);
			
			var itemModeId:int = iteminfo["itemid"];
			var item:ItemInfo ;
			var icon:IconCDFace;
			if(ItemConfig.getQItemByID(itemModeId)!=null)
			{
				item= new ItemInfo();
				item.itemModelId = itemModeId;
				_item1 = ItemUtil.convertClientItemInfo(item);
				icon = FaceUtil.creatIconCDFaceByUIAsset(_skin.icon1,IcoSizeEnum.ICON_48,1,5,5);
				FaceUtil.SetItemGrid(icon,_item1, true);
			}
			
			iteminfo = JSONUtil.decode( GlobalSheetData.getSettingInfo(823).q_string_value);
		
			itemModeId = iteminfo["itemid"];
			if(ItemConfig.getQItemByID(itemModeId)!=null)
			{
				item = new ItemInfo();
				item.itemModelId = itemModeId;
				_item2 = ItemUtil.convertClientItemInfo(item);
				icon= FaceUtil.creatIconCDFaceByUIAsset(_skin.icon2,IcoSizeEnum.ICON_48,1,5,5);
				FaceUtil.SetItemGrid(icon,_item2, true);
			}
			
			_DonateMax = GlobalSheetData.getSettingInfo(824).q_int_value;
			
			var skincontet:Flip_Skin = _skin.skinSelect1.skin as Flip_Skin;
			_itemPage1 = new NumSelectUICtrl(skincontet.btnAdd,skincontet.btnDec,null,null,skincontet.lbBuyNum,1,int.MAX_VALUE,null);
			skincontet= _skin.skinSelect2.skin as Flip_Skin;
			_itemPage2 = new NumSelectUICtrl(skincontet.btnAdd,skincontet.btnDec,null,null,skincontet.lbBuyNum,1,int.MAX_VALUE,null);
			var tmpStr:String="1{0}={1}帮派活跃+{2}帮贡";
			var obj:Object=JSONUtil.decode(GlobalSheetData.getStrValue(822));
			_skin.labToken.text=LanguageConfig.replaceStr(tmpStr,[ItemConfig.getItemName(obj.itemid),obj.num1,obj.num2]);
			obj=JSONUtil.decode(GlobalSheetData.getStrValue(823));
			_skin.labGold.text=LanguageConfig.replaceStr(tmpStr,[ItemConfig.getItemName(obj.itemid),obj.num1,obj.num2]);
		}
		
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			EventManager.addEvent(GuildEvent.GUILD_DATA_INIT,refeashList);
			EventManager.addEvent(GuildEvent.GUILD_OPERATERESULT,opaqueChangeList);
			refeashList();
		}
		
		private function opaqueChangeList(msg:ResGuildOperateResultMessage):void
		{
			if(_opaque<=0)
				return ;
			if(msg.opaque == _opaque)
			{
				_opaque = 0;
				GuildSender.requestGuildInfo();
			}
		}
		
		private function refeashView():void
		{
			
			var count:int = BackPackManager.instance.getBagItemsCountById(_item1.cfgId)
			_itemPage1.updateMax(count ,count);
			_skin.lbNum1.text = count.toString();
			var haveGold:int = MainRoleManager.actorInfo.totalStat.getResData(_item2.cfgId);
			var last:int =GuildManager.instance().selfMemberInfo.goldContribution;
			_itemPage2.updateMax(haveGold,last);
			_skin.lbNum2.text = haveGold.toString();
			_skin.lbLast.htmlText = LanguageConfig.replaceStr("今日还可捐献$元宝",HtmlTextUtil.getTextColor(0x5DBD37,last.toString()));
			_skin.lbBanggong.text=GuildManager.instance().selfMemberInfo.contribution+"";
			_skin.lbHuoyue.text=GuildManager.instance().selfMemberInfo.allActive+"";
		}
		private function refeashList():void
		{
			_memList = GuildManager.instance().getSortMemberListByProp("curActive");
			if(_memList == null)
				return ;
			this._pageCtrl.setData(_memList,maxCount);
			refeashView();
		}
		
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target == _skin.btnJuan1)
			{
				var count:int = BackPackManager.instance.getBagItemsCountById(_item1.cfgId)
				guildDonate(1,Math.min(count,_itemPage1.getValue()));
			}else if(target == _skin.btnJuan2){
				var haveGold:int = MainRoleManager.actorInfo.totalStat.getResData(_item2.cfgId);
				guildDonate(2,Math.min(haveGold,_itemPage2.getValue()));
			}
		}
		
		private function guildDonate(type:int,num:int):void
		{
			if(num<=0)
			{
				if(type == 1)
				{
					NoticeManager.showNotifyById(60036);
				}else if(type == 2){
					NoticeManager.showNotifyById(60037);
				}
				return ;
			}
			if(_opaque>0)
				return ;
			_opaque = GuildManager.opaque;
			GuildSender.guildDonate(type,num,_opaque);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(GuildEvent.GUILD_DATA_INIT,refeashList);
			EventManager.removeEvent(GuildEvent.GUILD_OPERATERESULT,opaqueChangeList);
		}
	}
}