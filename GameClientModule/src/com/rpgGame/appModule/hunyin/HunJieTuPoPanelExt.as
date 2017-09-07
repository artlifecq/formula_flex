package com.rpgGame.appModule.hunyin
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.shop.ShopManager;
	import com.rpgGame.app.sender.HunYinSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.HunYinEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.SourceGetCfg;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.hunyin.JieHunJieZiData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_advance_wedding;
	import com.rpgGame.coreData.clientConfig.Q_source;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hunyin.AlertJieZhiTuPo;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class HunJieTuPoPanelExt extends SkinUIPanel
	{
		private var _skin:AlertJieZhiTuPo;
		private var _info:Q_advance_wedding;
		private var _needNum:int=0;
		
		private var _cailiaoMod:int=0;
		private var _needcailiaoNum:int=0;
		private var _isAutoBuy:int=0;
		
		private var isAuto:Boolean=false;
		
		public function HunJieTuPoPanelExt()
		{
			_skin=new AlertJieZhiTuPo();
			super(_skin);
//			_skin.cboxCailiao.x=
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,StarlingLayerManager.topUILayer);
		}
		private function initView():void
		{
			_info=JieHunJieZiData.getModByLv(Mgr.hunyinMgr.JieZiLv);		
			_needNum=_info.q_max;
			var cailiao:Array= JSONUtil.decode(_info.q_item);
			_cailiaoMod=cailiao[0].mod;
			_needcailiaoNum=cailiao[0].num;
			_skin.cboxCailiao.isSelected=false;
			_isAutoBuy=0;		
			isAuto=false;
			updateshow();
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			switch (target)
			{
				case _skin.btn_ok:  //进阶
					iscanTuPo();
					break;
				case _skin.btn_cancel://自动进阶
					setisAutoing(iscanTuPo());
					break;
				case _skin.btnClose:
					this.hide();
					break;
			}
		}
		
		override protected function onShow():void
		{
			super.onShow();
			initView();
			EventManager.addEvent(HunYinEvent.HUNYIN_TUPO,updateshow);
			EventManager.addEvent(HunYinEvent.HUNYIN_JINJIE,chenggongHandler);
			EventManager.addEvent(HunYinEvent.HUNYIN_JINJIE_CHENGGONG,chenggongHandler);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(HunYinEvent.HUNYIN_TUPO,updateshow);
			EventManager.removeEvent(HunYinEvent.HUNYIN_JINJIE,chenggongHandler);
			EventManager.removeEvent(HunYinEvent.HUNYIN_JINJIE_CHENGGONG,chenggongHandler);
		}
		
		public static function showTuPoPanel():HunJieTuPoPanelExt
		{
			var panel:HunJieTuPoPanelExt=new HunJieTuPoPanelExt();
			if(panel) panel.show();
			return panel;
		}
		
		private function updateshow():void
		{
			var bagNum:int=BackPackManager.instance.getBagItemsCountById(_cailiaoMod);
			_skin.lbDanyao.text=ItemConfig.getItemName(_cailiaoMod)+"*"+_needcailiaoNum+"("+bagNum+")";
			if(_needcailiaoNum>bagNum) _skin.lbDanyao.color=StaticValue.RED_TEXT;
			else _skin.lbDanyao.color=StaticValue.GREEN_TEXT;
			
			_skin.lbJindu.text=Mgr.hunyinMgr.marriageInfos.wishValue.toString()+"/"+_needNum;
			if(Mgr.hunyinMgr.marriageInfos.wishValue>_needNum) _skin.lbJindu.color=StaticValue.RED_TEXT;
			else _skin.lbJindu.color=StaticValue.GREEN_TEXT;
			
			_skin.barJindu.maximum=_needNum;
			_skin.barJindu.value=Mgr.hunyinMgr.marriageInfos.wishValue;
			if(isAuto){
				setisAutoing(iscanTuPo());
			}
		}
		
		private function chenggongHandler():void
		{
			setisAutoing(false);
			this.hide();
		}
		
		private function iscanTuPo():Boolean
		{
			var bagNum:int=BackPackManager.instance.getBagItemsCountById(_cailiaoMod);	
			if(_needcailiaoNum>bagNum&&!_skin.cboxCailiao.isSelected) 
			{
				NoticeManager.showNotifyById(9002,null,ItemConfig.getItemName(_cailiaoMod));
				return false;
			}
			else if(_needcailiaoNum>bagNum&&_skin.cboxCailiao.isSelected)
			{
				var qSource:Q_source=SourceGetCfg.getSource(_cailiaoMod);
				if (!qSource) 
				{
					NoticeManager.mouseFollowNotify("商城未上架");
					return false;
				}	
				var shopItems:Array=Mgr.shopMgr.getMallItemShopVo(_cailiaoMod,qSource.q_shoptype,JSONUtil.decode(qSource.q_sub_shop_type));
				var needNum:int=_needcailiaoNum-bagNum;
				if(!ShopManager.ins.isCanBuy(shopItems,needNum))
				{
					NoticeManager.showNotifyById(9002,null,"元宝");
					return false;
				}
			}
			_isAutoBuy=_skin.cboxCailiao.isSelected?1:0;
			HunYinSender.upCSUpGradeMessage(2,_isAutoBuy);
			return true;	
		}
		
		private function setisAutoing(value:Boolean):void
		{
			if(value)
			{
				_skin.btn_ok.visible=false;
				_skin.btn_cancel.visible=true;
				_skin.btn_cancel.x=119;
			}
			else
			{
				_skin.btn_ok.visible=true;
				_skin.btn_cancel.visible=true;
				_skin.btn_cancel.x=181;
			}
			isAuto=value;
		}
	}
}