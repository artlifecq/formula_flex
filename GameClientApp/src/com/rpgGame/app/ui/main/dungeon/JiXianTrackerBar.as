package com.rpgGame.app.ui.main.dungeon
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.shop.ShopManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.netData.zone.message.SCLimitTrackInfoMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.activety.jixiantiaozhan.JiXianTiaoZhan_ZhuiZong;
	
	import starling.animation.IAnimatable;
	import starling.display.DisplayObject;
	
	import utils.TimerServer;
	
	public class JiXianTrackerBar extends DungeonTrackerUI implements IAnimatable
	{
		private const BUFF_LOCATION1:int=1;
		private const BUFF_LOCATION2:int=2;
		private const SHOPID:int=3;
		
		private var _skin:JiXianTiaoZhan_ZhuiZong;
		private var _item:IconCDFace;
		
		private var _shopIco1:BgIcon;
		private var _shopIco2:BgIcon;
		
		private var _shopItem1:ShopItemVo;
		private var _shopItem2:ShopItemVo;
		
		private var _remainTime:int=0;
		public function JiXianTrackerBar()
		{
			_skin=new JiXianTiaoZhan_ZhuiZong();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.uiJiSha.visible=false;
			_item=new IconCDFace(IcoSizeEnum.ICON_42);		
			_item.selectImgVisible=false;
			_item.x= _skin.sec_ico1_2.x+3;
			_item.y= _skin.sec_ico1_2.y+3;
			_skin.scroll_box.addChild(_item);
			
			var reward:Array=JSONUtil.decode(ActivetyDataManager.jixianVo.qmod.q_kill_rewards);
			var clientItemInfo:ClientItemInfo=new ClientItemInfo(reward[0].mod);
			FaceUtil.SetItemGrid(_item,clientItemInfo);
			
			_shopIco1=new BgIcon(IcoSizeEnum.ICON_48);
			_shopIco1.setBg(GridBGType.GRID_SIZE_48);
			_skin.scroll_box.addChild(_shopIco1);
			_shopIco1.x=_skin.sec_ico1_0.x;
			_shopIco1.y=_skin.sec_ico1_0.y;
			_shopIco2=new BgIcon(IcoSizeEnum.ICON_48);
			_shopIco2.setBg(GridBGType.GRID_SIZE_48);
			_skin.scroll_box.addChild(_shopIco2);
			_shopIco2.x=_skin.sec_ico1_1.x;
			_shopIco2.y=_skin.sec_ico1_1.y;	
		}
		
		override protected function onShow():void
		{
			AppManager.hideApp(AppConstant.ACTIVETY_PANL);
			EventManager.addEvent(DungeonEvent.ZONE_JIXIAN_TIME,updateZoneTime);
			EventManager.addEvent(ItemEvent.ITEM_ADD,updateshow);
			updateshow(null);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(DungeonEvent.ZONE_JIXIAN_TIME,updateZoneTime);
			EventManager.removeEvent(ItemEvent.ITEM_ADD,updateshow);
			TimerServer.remove(updateTime);
		}
		
		private function updateshow(info:ClientItemInfo):void
		{
			_shopItem1=ShopManager.ins.getJiXianItemShopVo(BUFF_LOCATION1,SHOPID);
			if(_shopItem1!=null)
			{
				_shopIco1.setIconResName(ClientConfig.getItemIcon(_shopItem1.getItemConfig().q_icon.toString(),IcoSizeEnum.ICON_48));
				TipTargetManager.show( _shopIco1, TargetTipsMaker.makeTips( TipType.ACTIVITY_JIXIAN_PANEL_TIP, _shopItem1));
				_skin.lbInfo1.text="增益:×"+getBffNum(_shopItem1.getItemConfig().q_buff);
			}
			_shopItem2=ShopManager.ins.getJiXianItemShopVo(BUFF_LOCATION2,SHOPID);
			if(_shopItem2!=null)
			{
				_shopIco2.setIconResName(ClientConfig.getItemIcon(_shopItem2.getItemConfig().q_icon.toString(),IcoSizeEnum.ICON_48));
				TipTargetManager.show( _shopIco2, TargetTipsMaker.makeTips( TipType.ACTIVITY_JIXIAN_PANEL_TIP, _shopItem2));
				_skin.lbInfo2.text="增益:×"+getBffNum(_shopItem2.getItemConfig().q_buff);
			}
		}
		
		private function updateZoneTime(msg:SCLimitTrackInfoMessage):void
		{
			_remainTime=msg.remainTime;
			_skin.lb_time.text="活动结束倒计时:"+TimeUtil.format3TimeType(_remainTime);
			TimerServer.addLoop(updateTime,1000);
			_skin.icons.visible=msg.bossState==1;
			var monsterName:String=MonsterDataManager.getMonsterName(msg.monsterModelId);
			_skin.lbName.text=monsterName;
		}
		
		private function updateTime():void
		{
			_remainTime--;
			_skin.lb_time.text="活动结束倒计时:"+TimeUtil.format3TimeType(_remainTime);
			if(_remainTime==0){
				TimerServer.remove(updateTime);
			}
		}
		
		private function getBffNum(buffid:String):int
		{
			var buffNum:int=0;
			var buff:BuffData;
			var buffList:Vector.<BuffData>= (MainRoleManager.actor.data as RoleData).buffList;
			if(buffList==null||buffList.length==0) return 0;
			for(var i:int=0;i<buffList.length;i++)
			{
				if(buffList[i]._data.q_buff_id.toString()==buffid)
				{
					return buffList[i].buffInfo.overlay;
				}
			}
			return 0;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.sec_Exit:
					DungeonSender.reqQuitDungeon();
					break;
				case _skin.sec_subbut1:
					btnbuyHandler(_shopItem1);
					break;
				case _skin.sec_subbut2:
					btnbuyHandler(_shopItem2);
					break;
				case _skin.icons:
					doFindMonsterWork();
					break;
			}
		}
		
		private function btnbuyHandler(shopVo:ShopItemVo):void
		{
			if(shopVo==null)
			{
				NoticeManager.showNotifyById(21006);
				return;
			}
			var arr:Array=[];
			arr.push(shopVo);
			if(!ShopManager.ins.isCanBuy(arr,1))
			{
				if(shopVo.data.priceType==CharAttributeType.RES_GOLD)
					NoticeManager.showNotifyById(2008);
				else if(shopVo.data.priceType==CharAttributeType.RES_BIND_GOLD)
					NoticeManager.showNotifyById(2013);				
				return;
			}	
			Mgr.shopMgr.buyShopItem(shopVo,1);
		}
		
		private function doFindMonsterWork():void
		{
			MainRoleSearchPathManager.walkToScene(MainRoleManager.actorInfo.mapID, ActivetyDataManager.jixianVo.qmod.q_x, ActivetyDataManager.jixianVo.qmod.q_y,null, 100,null,null);
		}
		
		public function advanceTime(time:Number):void
		{
		}
	}
}