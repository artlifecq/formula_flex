package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.FuliDaTingSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.fulidating.DengJiCfg;
	import com.rpgGame.coreData.clientConfig.Q_upgrade;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import org.mokylin.skin.app.uptips.Up_Tips;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class LevelUpTiShiPanel extends SkinUIPanel
	{
		private var _skin:Up_Tips;
		
		private var _groupList:RewardGroup;
		private var _lv:int;
		public function LevelUpTiShiPanel()
		{
			_skin=new Up_Tips();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_groupList=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon1,RewardGroup.ALIN_CENTER,6,6,0,true,6,false,false);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnOk:
					reqReceiveReward();
					this.hide();
					break;
			}
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data);
			_lv=data as int;
			_skin.uiLevel.styleName="ui/app/uptips/sz/"+_lv+".png";
			_skin.lbMsg.text=_lv+"级礼包";
			var cfg:Q_upgrade=DengJiCfg.getCfgByLv(_lv);
			if(!cfg) return;
			_groupList.setRewardByJsonStr(cfg.q_reward);
		}
		
		private function reqReceiveReward():void
		{
			var id:int=DengJiCfg.getIdByLv(_lv);
			FuliDaTingSender.reqGotGrownGiftMessage(id);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			_groupList.clear();
		}
	}
}