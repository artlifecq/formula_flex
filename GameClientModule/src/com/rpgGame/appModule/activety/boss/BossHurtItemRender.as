package com.rpgGame.appModule.activety.boss
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.active.BossActInfo;
	import com.rpgGame.coreData.info.tip.BossHurtTipsData;
	import com.rpgGame.coreData.type.TipType;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.activety.shijieboss.ShangHai_Item;
	
	/**
	 *伤害渲染元素 
	 * @author dik
	 * 
	 */
	public class BossHurtItemRender extends DefaultListItemRenderer
	{
		private var _skin:ShangHai_Item;
		private var _tipsData:DynamicTipData;
		private var _tipsSetInfo:BossHurtTipsData;
		
		public function BossHurtItemRender()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin=new ShangHai_Item();
			_skin.toSprite(this);
			_tipsData=new DynamicTipData();
			_tipsSetInfo=new BossHurtTipsData();
			_tipsData.data=_tipsSetInfo;
			TipTargetManager.show( _skin.uiBaoxiang, TargetTipsMaker.makeTips( TipType.SHIJIEBOSS_REWAD_TIP, _tipsData));
		}
		
		override public function dispose():void
		{
			super.dispose();
			TipTargetManager.remove( _skin.uiBaoxiang);
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
		
		override protected function commitData():void
		{
			if(_skin&&this.owner){
				var info:BossHurtInfo=_data as BossHurtInfo;
				var actId:int=this.owner.customData[0];
				var actInfo:BossActInfo=ActivetyDataManager.getActInfoById(actId) as BossActInfo;
				_tipsSetInfo.rewads=getRewardInfo(actInfo,info.rank);
				_tipsSetInfo.title="排行奖励";
				_skin.lbNo.text=info.rank.toString();
				_skin.lbName.text=info.bossDamageInfo.playerName;
				_skin.lbKillNum.text=info.bossDamageInfo.damage+"("+info.perDamage+"%)";
			}
		}
		
		private function getRewardInfo(actInfo:BossActInfo,rank:int):Array
		{
			var list:Array=JSONUtil.decode(actInfo.worldBossCfg.q_rank_rewards);
			var num:int=list.length-1;
			var reward:Array;
			for(var i:int=num;i>0;i--){
				if(rank>list[i].rank){
					break;
				}
				reward=list[i];
			}
			return reward;
		}
	}
}