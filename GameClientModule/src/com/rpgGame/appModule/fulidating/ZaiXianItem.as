package com.rpgGame.appModule.fulidating
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.sender.FuliDaTingSender;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.core.events.ServerActiveEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.fulidating.ZaiXianCfg;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_online;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.gameactivities.bean.onlineInfo;
	import com.rpgGame.netData.gameactivities.message.SCOnlineRewardMessage;
	
	import app.message.GoodsType;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fulidating.Item_Zaixian;
	
	import starling.display.DisplayObject;
	
	public class ZaiXianItem extends SkinUI
	{
		private var _skin:Item_Zaixian;
		private var _online:int;	
		private var _ico:BgIcon;
		private var _prizes:Array;
		private var _showItemId:int;
		private var _prizeEffect:InterObject3D
		
		private const interval:int=10*1000;
		private var _gameTimer:GameTimer;
		public function ZaiXianItem()
		{
			_skin=new Item_Zaixian();
			super(_skin);
			_ico=new BgIcon(IcoSizeEnum.ICON_48);
			_gameTimer=new GameTimer("ZaiXianItem",interval,0,updateShow);
			_gameTimer.stop();
			_ico.selectImgVisible=false;
			_skin.container.addChild(_ico);
			_ico.x=68;
			_ico.y=180;
		}
		
		public function setData(online:int):void
		{
			_online=online;
			_skin.uiName.styleName="ui/app/fulidating/word/"+online+"fen.png";
			_skin.lb_name.text="???";
			var cfg:Q_online=ZaiXianCfg.getCfgById(online);
			_prizes=JSONUtil.decode(cfg.q_show);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnOK:
					reqRaffleReward();
					break;
			}
		}
		
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(ServerActiveEvent.SERVERACTIVE_ONLINE_PICKUP,updateItem);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(ServerActiveEvent.SERVERACTIVE_ONLINE_PICKUP,updateItem);
		}
		
		public function updateBtnState():void
		{
			var info:onlineInfo=Mgr.zaiXianMgr.getonlineInfoByTime(_online);
			if(!info||info.state==2){
				GrayFilter.gray(_skin.btnOK);
				_gameTimer.stop();
			}else if(info.state==0){
				GrayFilter.gray(_skin.btnOK);
				_gameTimer.start();
			}else if(info.state==1){
				_skin.btnOK.filter=null;
				_gameTimer.start();
			}
		}
		
		private function updateItem(msg:SCOnlineRewardMessage):void
		{
			if(msg.time==_online){
				_showItemId=msg.itemId;
				showPrizeEff();
			}
		}
		
		private function showPrizeEff():void
		{
			_ico.visible=false;
			_gameTimer.stop();
			if(_prizeEffect&&_prizeEffect.isStarted) return;
			_prizeEffect=this.playInter3DAt(ClientConfig.getEffect("ui_zhanhun_da"),_ico.x+_ico.width/2,_ico.y+_ico.height/2,1,completeHandle);
		}
		
		private function completeHandle(sr3D : InterObject3D):void
		{
			setIco(_showItemId);
			_ico.visible=true;
			_prizeEffect = null;
		}
		
		private var _index:int=0;
		private function updateShow():void
		{
			if(_index>=_prizes.length) _index=0;
			setIco(_prizes[_index]);
		}
		
		private function setIco(id:int):void
		{
			var arr:Array=getArrById(id);
			if(arr){
				var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(arr.mod,arr.num,arr.bind);
				var url:String=ClientConfig.getItemIcon(arr.mod, IcoSizeEnum.ICON_48 )
				_ico.setIconResName(url,false);
				_ico.count=arr.num;
				_ico.setIsBind(arr.bind==1?true:false);
				_ico.showQuality(itemInfo.qItem);
				switch( itemInfo.type )
				{
					case GoodsType.EQUIPMENT://装备
					case GoodsType.EQUIPMENT1://装备
					case GoodsType.EQUIPMENT2://装备
						TipTargetManager.show( _ico, TargetTipsMaker.makeTips( TipType.EQUIP_TIP, itemInfo ) );
						break;
					default:
						TipTargetManager.show( _ico, TargetTipsMaker.makeTips( TipType.ITEM_TIP, itemInfo ) );
						break;
				}
			}
		}
		
		private function getArrById(id:int):Array
		{
			if(!_prizes) return null;
			for(var i:int=0;i<_prizes.length;i++)
			{
				if(_prizes[i].mod==id) return _prizes[i];
			}
			return null;
		}
		
		private function reqRaffleReward():void
		{
			if(_skin.btnOK.filter!=null) return;
			FuliDaTingSender.onCSGetOnlineRewardMessage(_online);
		}
	}
}