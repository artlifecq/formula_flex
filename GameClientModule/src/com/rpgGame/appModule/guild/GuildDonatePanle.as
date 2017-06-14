package com.rpgGame.appModule.guild
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.SkinUIPanel;
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
		private var _itemPage1:PageContent;
		private var _itemPage2:PageContent;
		private var _item1:ClientItemInfo;
		private var _item2:ClientItemInfo;
		private var _opaque:int;
		public function GuildDonatePanle():void
		{
			_skin = new TanKuang_JuanXian();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.list.snapToPages = true;
			_skin.list.itemRendererType =GuildPlayerInfoCell;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 15;
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
			
			var skincontet:Flip_Skin = _skin.skinSelect1.skin as Flip_Skin;
			skincontet.textInput.textAlign = "center";
			_itemPage1 = new PageContent(skincontet.btnDec,skincontet.btnAdd,itemPageUPdate);
			_itemPage1.ishide = false;
			skincontet= _skin.skinSelect2.skin as Flip_Skin;
			skincontet.textInput.textAlign = "center";
			_itemPage2 = new PageContent(skincontet.btnDec,skincontet.btnAdd,itemPageUPdate1);
			_itemPage2.ishide = false;
		}
		
		private function itemPageUPdate(page:int,maxPage:int):void
		{
			var skincontet:Flip_Skin = _skin.skinSelect1.skin as Flip_Skin;
			skincontet.textInput.text = page.toString();
		}
		private function itemPageUPdate1(page:int,maxPage:int):void
		{
			var skincontet:Flip_Skin = _skin.skinSelect2.skin as Flip_Skin;
			skincontet.textInput.text = page.toString();
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
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
				refeashView();
			}
		}
		
		private function refeashView():void
		{
			_listPage.maxPage = _skin.list.maxVerticalPageIndex;
			_itemPage1.maxPage = BackPackManager.instance.getBagItemsCountById(_item1.cfgId);
			_skin.lbNum1.text = _itemPage1.maxPage.toString();
			_itemPage2.maxPage = BackPackManager.instance.getBagItemsCountById(_item2.cfgId);
			_skin.lbNum2.text = _itemPage2.maxPage.toString();
			var last:int = GuildManager.instance().selfMemberInfo.goldContribution;
			_skin.lbLast.htmlText = LanguageConfig.replaceStr("今日还可捐献$元宝",HtmlTextUtil.getTextColor(0x5DBD37,last.toString()));
		}
		private function refeashList():void
		{
			var list:Vector.<GuildMemberInfo> = GuildManager.instance().getSortMemberListByProp("curActive");
			if(list == null)
				return ;
			_skin.list.dataProvider.removeAll();
			list.sort(sortHander);
			for each(var info:GuildMemberInfo in list)
			{
				_skin.list.dataProvider.push(info);
			}
		}
		
		private function sortHander():void
		{
			
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
				guildDonate(1,_itemPage1.currentPage);
			}else if(target == _skin.btnJuan2){
				guildDonate(2,_itemPage2.currentPage);
			}
		}
		
		private function guildDonate(type:int,num:int):void
		{
			if(_opaque<=0)
				return ;
			_opaque = GuildManager.opaque;
			GuildManager.instance().guildDonate(type,num,_opaque);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(GuildEvent.GUILD_OPERATERESULT,opaqueChangeList);
		}
	}
}