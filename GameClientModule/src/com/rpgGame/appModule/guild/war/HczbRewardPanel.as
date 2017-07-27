package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.QSinglecitybaseCfgData;
	import com.rpgGame.coreData.clientConfig.Q_singlecitybase;
	import com.rpgGame.coreData.enum.EnumCity;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import gs.TweenLite;
	import gs.easing.Back;
	
	import org.mokylin.skin.app.banghui.huangcheng.HuangChengJiangLi;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 皇城争霸奖励一览
	 * @author dik
	 * 2017-7-26
	 */
	public class HczbRewardPanel extends SkinUIPanel
	{
		private var guanRe:RewardGroup;
		private var bangRe:RewardGroup;
		private var jinRe:RewardGroup;
		private var allServerRe:RewardGroup;
		
		private var _skin:HuangChengJiangLi;
		private var tween:TweenLite;
		
		public function HczbRewardPanel()
		{
			_skin=new HuangChengJiangLi();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			guanRe=new RewardGroup(IcoSizeEnum.ICON_48,_skin.gid1_1,RewardGroup.ALIN_LEFT,5);
			bangRe=new RewardGroup(IcoSizeEnum.ICON_48,_skin.gid1_6,RewardGroup.ALIN_LEFT,5);
			jinRe=new RewardGroup(IcoSizeEnum.ICON_48,_skin.gid2_1,RewardGroup.ALIN_LEFT,5);
			allServerRe=new RewardGroup(IcoSizeEnum.ICON_48,_skin.gid3_1,RewardGroup.ALIN_LEFT,5);			
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			this.x=0;
			this.y=0;
			super.show(data,openTable,parentContiner);
		}
		
		override protected function onShow():void
		{
			var cfg:Q_singlecitybase=QSinglecitybaseCfgData.getCityCfg(EnumCity.HUANG_CHENG);
			var str:String=cfg.q_rewards2;
			guanRe.setRewardByJsonStr(str);
			str=cfg.q_rewards1;
			bangRe.setRewardByJsonStr(str);
			str=cfg.q_reward4;
			jinRe.setRewardByJsonStr(str);
			str=cfg.q_reward4;
			allServerRe.setRewardByJsonStr(str);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if(target==_skin.btnClose1){
				tween=TweenLite.to(this,0.5,{scaleY:0,alpha:0,y:500,onComplete:tweenCom,ease: Back.easeInOut});
			}
		}
		
		private function tweenCom():void
		{
			if(tween){
				tween.kill();
				tween=null;
			}
			this.hide();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			guanRe.clear();
			bangRe.clear();
			jinRe.clear();
			allServerRe.clear();
		}
	}
}