package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.FuliDaTingSender;
	import com.rpgGame.core.events.ServerActiveEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.fulidating.DengJiCfg;
	import com.rpgGame.coreData.clientConfig.Q_upgrade;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.gameactivities.bean.GrownInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fulidating.Item_Libao;
	
	import starling.display.DisplayObject;
	
	public class LiBaoItem extends SkinUI
	{
		private var _skin:Item_Libao;
		private var _lv:int;
		private var _groupList:RewardGroup;
		public function LiBaoItem()
		{
			_skin=new Item_Libao();
			super(_skin);
			_groupList=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon1,RewardGroup.ALIN_LEFT,6,6,0,true,6,false,false);
		}
		
		public function setDate(data:*):void
		{
			_lv=data as int;
			_skin.uiName.styleName="ui/app/fulidating/word/"+_lv+"ji.png";
			var cfg:Q_upgrade=DengJiCfg.getCfgByLv(_lv);
			if(!cfg) return;
			_groupList.setRewardByJsonStr(cfg.q_reward);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnLingqu:
					reqReceiveReward();
					break;
			}
		}
		
		override protected function onShow():void
		{
			super.onShow();
			initEvent();
			updateBtnState();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			closeEvent();
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(ServerActiveEvent.SERVERACTIVE_DENGJI_UPDATE,updateBtnState);
		}
		
		private function closeEvent():void
		{
			EventManager.removeEvent(ServerActiveEvent.SERVERACTIVE_DENGJI_UPDATE,updateBtnState);
		}
		
		public function updateBtnState():void
		{
			var info:GrownInfo=Mgr.dengjiMgr.getGrownInfoByLv(_lv);
			if(!info){
				GrayFilter.gray(_skin.btnLingqu);
				_skin.uiLingqu.visible=false;
			}else{
				if(info.state==0){
					GrayFilter.gray(_skin.btnLingqu);
					_skin.uiLingqu.visible=false;
				}else if(info.state==1){
					_skin.btnLingqu.filter=null;
					_skin.uiLingqu.visible=false;
				}else{
					GrayFilter.gray(_skin.btnLingqu);
					_skin.uiLingqu.visible=true;
				}
			}
		}
		
		public function get level():int
		{
			return _lv;
		}
		
		private function reqReceiveReward():void
		{
			if(_skin.btnLingqu.filter!=null) return;
			var id:int=DengJiCfg.getIdByLv(_lv);
			FuliDaTingSender.reqGotGrownGiftMessage(id);
		}
	}
}