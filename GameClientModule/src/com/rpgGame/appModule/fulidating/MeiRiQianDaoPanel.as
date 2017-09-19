package com.rpgGame.appModule.fulidating
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.FuliDaTingSender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.events.ServerActiveEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.fulidating.SignCfg;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.clientConfig.Q_sign_accumulate;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.fulidating.SignVO;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.TipType;
	
	import app.message.GoodsType;
	
	import away3d.events.Event;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fulidating.FLDT_Meiriqiandao;
	
	import starling.display.DisplayObject;
	
	public class MeiRiQianDaoPanel extends ViewUI
	{
		private var _skin:FLDT_Meiriqiandao;
		/** 日历 显示列		 */		
		public const DATE_COL:int = 7;
		/** 日历 显示行		 */		
		public const DATE_ROW:int = 6;
		
		private var itemList:Vector.<DaysItem>;
		
		private var _shouQianIco:BgIcon;
		private var _vipIco:BgIcon;
		private var _icosList:Vector.<BgIcon>;
		private var _icosBgList:Vector.<UIAsset>;
		public function MeiRiQianDaoPanel()
		{
			_skin=new FLDT_Meiriqiandao();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			itemList=new Vector.<DaysItem>();
			_icosList=new Vector.<BgIcon>();
			_icosBgList=new Vector.<UIAsset>();
			var item:DaysItem;
			var offX:int = 7;
			var offY:int = 7;
			for (var i:int = 0; i < DATE_ROW; i++) 
			{
				for (var j:int = 0; j < DATE_COL; j++) 
				{
					item = new DaysItem();
					item.x = (j * (item.width-6)-offX);
					item.y = (i * (item.height -7)-offY);
					_skin.days_container.addChild( item );
					itemList.push( item );
				}
			}
			
			offX=34;
			offY=393;
			var ico:BgIcon;
			for(i=0;i<6;i++){
				var obj:Object=_skin.container.getChildByName("icon"+(i+1));
				if(obj) _icosBgList.push(obj as UIAsset);
				ico=new BgIcon(IcoSizeEnum.ICON_48);
				_skin.container.addChild(ico);
				_icosList.push(ico);
				ico.x=offX;
				ico.y=offY;
				offX+=82;
			}
			
			_shouQianIco=new BgIcon(IcoSizeEnum.ICON_48);
			_skin.container.addChild(_shouQianIco);
			_skin.container.addChild(_skin.uiLq1);
			_shouQianIco.x=631;
			_shouQianIco.y=89;
			_vipIco=new BgIcon(IcoSizeEnum.ICON_48);
			_skin.container.addChild(_vipIco);
			_skin.container.addChild(_skin.uiLq2);
			_vipIco.x=631;
			_vipIco.y=237;
			var globalCfg:Q_global=GlobalSheetData.getSettingInfo(905);
			var arr:Array=JSONUtil.decode(globalCfg.q_string_value);
			var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(arr[0].mod,arr[0].num,arr[0].bind);
			setIco(_shouQianIco,itemInfo);
			itemInfo=ItemUtil.convertClientItemInfoById(arr[1].mod,arr[1].num,arr[1].bind);
			setIco(_vipIco,itemInfo);
		}
		
		private function setIco(traget:BgIcon,info:ClientItemInfo):void
		{
			if(!traget)
				return;		
			traget.clear();			
			if(!info)
			{
				TipTargetManager.remove( traget );
				traget.selectImgVisible = false;
				return;
			}
			traget.selectImgVisible=false;
			traget.setIconResName( ClientConfig.getItemIcon(info.icoName, IcoSizeEnum.ICON_48 ) );
			traget.count = info.count;
			traget.showQuality( info.qItem);
			traget.setIsBind(info.binded);
			switch( info.type )
			{
				case GoodsType.EQUIPMENT://装备
				case GoodsType.EQUIPMENT1://装备
				case GoodsType.EQUIPMENT2://装备
					TipTargetManager.show( traget, TargetTipsMaker.makeTips( TipType.EQUIP_TIP, info ) );
					break;
				default:
					TipTargetManager.show( traget, TargetTipsMaker.makeTips( TipType.ITEM_TIP, info ) );
					break;
			}
		}
		
		override protected function onShow():void
		{
			super.onShow();
			if(Mgr.signMgr.signVO.openServerTime==null) return;
			EventManager.addEvent(ServerActiveEvent.SERVERACTIVE_SIGN_GETINFOS,updateDay);
			this._skin.tab_pack.addEventListener(Event.CHANGE,onTab);
			updateDay();		
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnQiandao:
					onReceiveprize(0);
					break;
				case _skin.btnLingqu:	
					onReceiveprize(1);
					break;
				case _skin.btnLingjiang:
					onReceiveLeiJi();
					break;
				case _skin.btnVIP:
					FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_VIP);
					break;
			}
		}
		
		private function updateDay():void
		{
			updatePanel();	
			onShowSignReward();
			updatefristPrizeBtn();
			updatevipPrizeBtn();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(ServerActiveEvent.SERVERACTIVE_SIGN_GETINFOS,updateDay);
			this._skin.tab_pack.removeEventListener(Event.CHANGE,onTab);
		}
		
		private function onTab(eve:Event):void
		{
			showCumulativeSignPrize(_skin.tab_pack.selectedIndex);
		}
		
		private function showCumulativeSignPrize(index:int):void
		{
			var cfg:Q_sign_accumulate=SignCfg.getCfgByIndex(index);
			var arr:Array=JSONUtil.decode(cfg.q_reward);
			for(var i:int=0;i<_icosList.length;i++)
			{
				if(i<arr.length){
					var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(arr[i].mod,arr[i].num,arr[i].bind);
					setIco(_icosList[i],itemInfo);	
					_icosList[i].visible=true;
					_icosBgList[i].visible=true;
				}else{
					_icosList[i].visible=false;
					_icosBgList[i].visible=false;
				}
			}
			if(Mgr.signMgr.isHaveSignDay(cfg.q_day)) _skin.btnLingjiang.visible=false;
			else if(Mgr.signMgr.signVO.signNum>=cfg.q_day){
				_skin.btnLingjiang.filter=null;
				_skin.btnLingjiang.visible=true;
			}else{
				GrayFilter.gray(_skin.btnLingjiang);
				_skin.btnLingjiang.visible=true;
			}
		}
		
		public function updatePanel():void
		{
			var signVO:SignVO = Mgr.signMgr.signVO;
			var nowDate:Date = SystemTimeManager.sysDateTime	;
			var startDate:Date = new Date( nowDate.fullYear , nowDate.month , 1 , 12 );
			startDate.date -= startDate.day;
			setTodayWeek(nowDate.day);
			var len:int = DATE_ROW * DATE_COL;
			var item:DaysItem;
			for (var i:int = 0; i < len; i++) 
			{
				item = itemList[i];
				item.setDate( startDate.date );
				//				item.visible=startDate.month==nowDate.month;
				if(startDate.date == nowDate.date&&startDate.month==nowDate.month)
				{
					item.currentDate = true;
				}else
				{
					item.currentDate = false;
				}
				if(nowDate.month == startDate.month)
				{
					item.sign = signVO.dayIsSign( startDate.date );
					item.filter=null;
				}else{
					GrayFilter.gray(item);
				}
				startDate.date += 1;
			}
			_skin.lbDate.text=nowDate.fullYear+"年"+(nowDate.month+1)+"月";
			_skin.num.number=signVO.signNum;
//			var index:int =SignCfg.getsignDayIndex(signVO.signNum);
		}
		
		/**设置星期几*/
		private function setTodayWeek(week:int):void
		{
			for(var i:int=0;i<7;i++)
			{
				var lab:Label=_skin.grpDate.getChildAt(i) as Label;
				if(i==week) lab.color=StaticValue.YELLOW_TEXT;
				else lab.color=StaticValue.GRAY_TEXT_WEEK;
			}
		}
		
		/**更新首签领取按钮状态*/
		private function updatefristPrizeBtn():void
		{
			_skin.btnQiandao.visible=Mgr.signMgr.signVO.firstAward==0;
			_skin.uiLq1.visible=Mgr.signMgr.signVO.firstAward!=0;
		}
		
		/**更新VIP额外领取按钮状态*/
		private function updatevipPrizeBtn():void
		{
			_skin.btnLingqu.visible=Mgr.signMgr.signVO.vipAward==0;
			_skin.uiLq2.visible=Mgr.signMgr.signVO.vipAward!=0;
		}
		
		/**初始化累积签到的奖励展示*/
		private function onShowSignReward():void
		{
			var index:int=SignCfg.getsignDayIndex(Mgr.signMgr.signVO.signNum);
			this._skin.tab_pack.selectedIndex=index;
			onTab(null);
		}
		
		/**领取奖励 1:VIP 0 首签*/
		private function onReceiveprize(type:int):void
		{
			FuliDaTingSender.reqSignObtainAwardMessage(type);
		}
		
		/**领取累积签到奖励*/
		private function onReceiveLeiJi():void
		{
			var day:int=SignCfg.getCfgByIndex(this._skin.tab_pack.selectedIndex).q_day;
			FuliDaTingSender.reqSignSumAwardToGameMessage(day);
		}
	}
}