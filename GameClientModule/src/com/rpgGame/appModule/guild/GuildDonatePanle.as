package com.rpgGame.appModule.guild
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.common.NumSelectUICtrl;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.common.PageContent;
	import com.rpgGame.core.events.GuildEvent;
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
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.TanKuang_JuanXian;
	import org.mokylin.skin.common.Flip_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class GuildDonatePanle extends SkinUIPanel
	{
		private var _skin:TanKuang_JuanXian;
		private var _listPage:PageContent;
		private var _itemPage1:NumSelectUICtrl;
		private var _itemPage2:NumSelectUICtrl;
		private var _item1:ClientItemInfo;
		private var _item2:ClientItemInfo;
		private var _opaque:int;
		private var _DonateMax:int;
		public function GuildDonatePanle():void
		{
			_skin = new TanKuang_JuanXian();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.list.snapToPages = true;
			_skin.list.itemRendererType =GuildDonateCell;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 0;
			_skin.list.layout = layout;
			_skin.list.dataProvider = new ListCollection();
			
			_listPage = new PageContent(_skin.btnPrev,_skin.btnNext,requestPage);
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
		}
		
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			EventManager.addEvent(GuildEvent.GUILD_DATA_INIT,refeashList);
			refeashList();
			
			EventManager.addEvent(GuildEvent.GUILD_OPERATERESULT,opaqueChangeList);
			refeashView();
		}
		
		private function opaqueChangeList(msg:ResGuildOperateResultMessage):void
		{
			if(_opaque<=0)
				return ;
			if(msg.opaque == _opaque)
			{
				_opaque = 0;
				GuildManager.instance().requestGuildInfo();
			}
		}
		
		private function refeashView():void
		{
			_listPage.maxPage = _skin.list.maxVerticalPageIndex;
			var count:int = BackPackManager.instance.getBagItemsCountById(_item1.cfgId)
			_itemPage1.updateMax(count ,count);
			_skin.lbNum1.text = count.toString();
			var haveGold:int = MainRoleManager.actorInfo.totalStat.getResData(_item2.cfgId);
			var last:int =GuildManager.instance().selfMemberInfo.goldContribution;
			_itemPage2.updateMax(haveGold,last);
			_skin.lbNum2.text = haveGold.toString();
			_skin.lbLast.htmlText = LanguageConfig.replaceStr("今日还可捐献$元宝",HtmlTextUtil.getTextColor(0x5DBD37,last.toString()));
		}
		private function refeashList():void
		{
			var list:Vector.<GuildMemberInfo> = GuildManager.instance().getSortMemberListByProp("curActive");
			if(list == null)
				return ;
			_skin.list.dataProvider.removeAll();
			for each(var info:GuildMemberInfo in list)
			{
				_skin.list.dataProvider.push(info);
			}
		}
		private function requestPage(page:int,maxPage:int):void
		{
			_skin.list.selectedIndex = page;
			_skin.lbNum.text = page.toString()+"/"+maxPage.toString();
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
			GuildManager.instance().guildDonate(type,num,_opaque);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(GuildEvent.GUILD_DATA_INIT,refeashList);
			EventManager.removeEvent(GuildEvent.GUILD_OPERATERESULT,opaqueChangeList);
		}
	}
}