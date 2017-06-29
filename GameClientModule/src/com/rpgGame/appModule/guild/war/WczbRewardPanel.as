package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.QSinglecitybaseCfgData;
	import com.rpgGame.coreData.clientConfig.Q_singlecitybase;
	import com.rpgGame.coreData.enum.EnumCity;
	
	import gs.TweenMax;
	import gs.easing.Back;
	
	import org.mokylin.skin.app.banghui.wangcheng.WangChengJiangLi;
	
	import starling.display.DisplayObject;
	
	/**
	 *王城争霸奖励一览 
	 * @author dik
	 * 
	 */
	public class WczbRewardPanel extends SkinUIPanel
	{
		private var _skin:WangChengJiangLi;
		private var tween:TweenMax;
		
		private var wangGRe:RewardGroup;
		private var wangBRe:RewardGroup;
		private var weiGRe:RewardGroup;
		private var weiBRe:RewardGroup;
		private var canyuRe:RewardGroup;
		
		public function WczbRewardPanel()
		{
			_skin=new WangChengJiangLi();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			wangGRe=new RewardGroup(_skin.gid1_1,RewardGroup.ALIN_LEFT,5);
			wangBRe=new RewardGroup(_skin.gid1_6,RewardGroup.ALIN_LEFT,5);
			weiGRe=new RewardGroup(_skin.gid2_1,RewardGroup.ALIN_LEFT,5);
			weiBRe=new RewardGroup(_skin.gid2_6,RewardGroup.ALIN_LEFT,5);
			canyuRe=new RewardGroup(_skin.gid3_1,RewardGroup.ALIN_LEFT,5);
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			
		}
		
		override protected function onShow():void
		{
			this.y=0;
			var cfg:Q_singlecitybase=QSinglecitybaseCfgData.getCityCfg(EnumCity.DONG_WEI);
			var str:String=cfg.q_rewards2;
			weiGRe.setRewardByJsonStr(str);
			str=cfg.q_rewards1;
			weiBRe.setRewardByJsonStr(str);
			cfg=QSinglecitybaseCfgData.getCityCfg(EnumCity.WANG_CHENG);
			str=cfg.q_rewards2;
			wangGRe.setRewardByJsonStr(str);
			str=cfg.q_rewards1;
			wangBRe.setRewardByJsonStr(str);
			str=cfg.q_reward4;
			canyuRe.setRewardByJsonStr(str);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if(target==_skin.btnClose1){
				tween=TweenMax.to(this,0.5,{scaleY:0,alpha:0,y:500,onComplete:tweenCom,ease: Back.easeInOut});
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
			TweenMax.killTweensOf(this);
			tween=null;
			
			wangGRe.clear();
			wangBRe.clear();
			weiGRe.clear();
			weiBRe.clear();
			canyuRe.clear();
		}
	}
}