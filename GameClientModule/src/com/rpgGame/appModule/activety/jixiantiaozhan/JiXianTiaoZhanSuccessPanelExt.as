package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.coreData.cfg.FaceCfgData;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.monster.message.SCLimitChallengeBossResultMessage;
	
	import org.mokylin.skin.app.activety.jixiantiaozhan.JiXianTiaoZhan_OK;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 极限挑战结算
	 * */
	public class JiXianTiaoZhanSuccessPanelExt extends SkinUIPanel
	{
		private var _skin:JiXianTiaoZhan_OK;
		
		private var _rewardG:RewardGroup;
		private var _reward:Array;
		public function JiXianTiaoZhanSuccessPanelExt()
		{
			_skin=new JiXianTiaoZhan_OK();
			super(_skin);
			_rewardG=new RewardGroup(IcoSizeEnum.ICON_64,_skin.icon1,1);
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var msg:SCLimitChallengeBossResultMessage=data;
			if(msg.success==0)
				_skin.imgWin.styleName = "ui/app/activety/tianzhanshibai.png";
			else
				_skin.imgWin.styleName = "ui/app/activety/tianzhanshengli.png";		
			var rank:int=msg.rank;
			_reward = JSONUtil.decode(ActivetyDataManager.jixianVo.qmod.q_rank_rewards);
			var reward:Array=getRankReward(rank);
			if(reward.length==0||reward==null)
			{
				reward=JSONUtil.decode(ActivetyDataManager.jixianVo.qmod.q_join_rewards);
			}
			_skin.numPaiming.label=rank.toString();
			_skin.lb_player_damage.text="累计伤害:"+msg.damage;
			var nu:Number=Math.min(msg.damage/msg.totalDamage,1);
			_skin.lb_damagethan.text="占总伤害:"+(nu*100).toFixed(1)+"%";
		
			var len:int=reward.length;
			if (len>0) 
			{
				_rewardG.visible=true;
				_skin.uiWei.visible=false;
				var shows:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
				for(var i:int=0;i<len;i++)
				{			
					var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(reward[i].mod,1,reward[i].bind);
					shows.push(itemInfo);
				}
				_rewardG.setReward(shows);
			}
			else
			{
				_rewardG.visible=false;
				_skin.uiWei.visible=true;
			}
			//胜利
			if (msg.success==1) 
			{
				_skin.lbMsg.color=GameColorUtil.COLOR_GREEN;
				_skin.lbMsg.text="成功击杀BOSS，可按排名获得奖励";
			}
			else
			{
				_skin.lbMsg.color=GameColorUtil.COLOR_RED;
				if (msg.damage==0) 
				{
					_skin.lbMsg.text="必须对BOSS造成伤害才能获得奖励";
				}
				else
				{
					_skin.lbMsg.text="未能击杀BOSS，只能获得安慰奖";
				}
			}
		}
		
		/**
		 *获取排行奖励 
		 * @return 
		 * 
		 */
		public function getRankReward(rank:int):Array
		{
			var result:Array=[];
			var num:int=_reward.length;
			var rankSeat:int=getRewardRank(rank);
			if(rankSeat==-1){
				num=0;
			}
			for(var i:int=0;i<num;i++){
				if(_reward[i].paras.rank==rank){
					result.push(_reward[i]);
				}
			}
			return result;
		}
		
		/**
		 *获取所在的排行段 
		 * @param rank
		 * @return 
		 * 
		 */
		private function getRewardRank(rank:int):int
		{
			var num:int=_reward.length-1;
			var result:int=-1;
			for(var i:int=num;i>=0;i--){
				if(_reward[i].paras.rank<rank){
					break;
				}
				result=_reward[i].paras.rank;
			}
			return result;
		}
		
		override public function hide():void
		{
			super.hide();
			_rewardG.clear();
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
