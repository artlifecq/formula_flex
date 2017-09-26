package com.rpgGame.appModule.guild.war
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.common.ExitScenePanel;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.QSinglecitybaseCfgData;
	import com.rpgGame.coreData.clientConfig.Q_singlecitybase;
	import com.rpgGame.coreData.enum.EnumCity;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.guildWar.message.ResGuildWarResultMessage;
	
	import org.mokylin.skin.app.banghui.huangcheng.HuangChengJieSuan;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 皇城争霸结算面板
	 * @author dik
	 * 2017-8-2
	 */
	public class HczbResultPanel extends ExitScenePanel
	{
		private var _skin:HuangChengJieSuan;
		private var rewardGrp:RewardGroup;
		private var timer:GameTimer;
		private var leftTime:int=10;
		
		
		public function HczbResultPanel()
		{
			_skin=new HuangChengJieSuan();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			rewardGrp=new RewardGroup(IcoSizeEnum.ICON_64,_skin.icon1);
			timer=new GameTimer("HczbResultPanel",1000,0,onUpdate);
			
			var cfg:Q_singlecitybase=QSinglecitybaseCfgData.getCityCfg(EnumCity.HUANG_CHENG);
			rewardGrp.setRewardByJsonStr(cfg.q_rewards3);
		}
		
		private function onUpdate():void
		{
			leftTime--;
			_skin.lbTime.text=leftTime+"秒后自动退出";
			if(leftTime<=0){
				timer.stop();
				AppManager.hideApp(AppConstant.GUILD_HCZB_RESULT);
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			timer.stop();
			rewardGrp.clear();
			(MainRoleManager.actor.headFace as HeadFace).updateGuildWarInfoBar(null);
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			leftTime=10;
			timer.start();
			_skin.lbBangName.text=(data as ResGuildWarResultMessage).winCampName;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.getRewardBtn){
				this.hide();
				DungeonSender.reqQuitDungeon(sceneId);
			}
		}
	}
}