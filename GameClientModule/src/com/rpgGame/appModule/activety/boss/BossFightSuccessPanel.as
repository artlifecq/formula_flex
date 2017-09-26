package com.rpgGame.appModule.activety.boss
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
	import com.rpgGame.coreData.cfg.active.BossActInfo;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.monster.message.SCWorldBossResultMessage;
	
	import org.mokylin.skin.app.activety.shijieboss.TiaoZhanShengLi;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *挑战世界boss成功 
	 * @author dik
	 * 
	 */
	public class BossFightSuccessPanel extends SkinUIPanel
	{
		private var _skin:TiaoZhanShengLi;
		private var rewardGrp:RewardGroup;
		private var timer:GameTimer;
		
		public function BossFightSuccessPanel()
		{
			_skin=new TiaoZhanShengLi();
			super(_skin);
			rewardGrp=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon1);
			timer=new GameTimer("BossFightSuccessPanel",1000,10,onUpdate,onComplete);
			timer.stop();
		}
		
		private function onUpdate():void
		{
			_skin.btnOk.label="领取奖励("+(10-timer.currentCount)+")";
		}
		
		private function onComplete():void
		{
			AppManager.hideApp(AppConstant.ACTIVETY_BOSS_RESULT);
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var msg:SCWorldBossResultMessage=data;
			var rank:int=msg.rank;
			var bossActInfo:BossActInfo=ActivetyCfgData.getActInfoById(msg.activityId) as BossActInfo;
			var rewards:Array=bossActInfo.getRankReward(rank);
			_skin.numPaiming.label=rank.toString();
			rewardGrp.clear();
			var list:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			for(var i:int=0;i<rewards.length;i++){			
				var itemInfo:ClientItemInfo=new ClientItemInfo(rewards[i].mod);
				itemInfo.itemInfo=new ItemInfo();
				itemInfo.itemInfo.isbind=rewards[i].bind;
				list.push(itemInfo);
			}
			rewardGrp.setReward(list);
			timer.reset();
			timer.start();
		}
		
		override protected function onHide() : void
		{
			super.onHide();
			rewardGrp.clear();
			timer.stop();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.btnOk){
				this.hide();
			}
		}
	}
}