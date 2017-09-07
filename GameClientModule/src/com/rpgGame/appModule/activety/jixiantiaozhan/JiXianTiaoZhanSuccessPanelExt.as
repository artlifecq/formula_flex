package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
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
		
		private var _gridList:Vector.<IconCDFace>;
		private var _reward:Array;
		
		public function JiXianTiaoZhanSuccessPanelExt()
		{
			_skin=new JiXianTiaoZhan_OK();
			super(_skin);
			_gridList=new Vector.<IconCDFace>();		
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
			var icon:IconCDFace;
			for(var i:int=0;i<reward.length;i++){			
				icon=IconCDFace.create(IcoSizeEnum.ICON_48);
				_gridList.push(icon);
				_skin.grpIcon.addChild(icon);
				icon.x=i*60;
				var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(reward[i].mod,1,reward[i].bind);
				FaceUtil.SetItemGrid(icon,itemInfo);
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
			var icon:IconCDFace;
			while(_gridList.length>0){
				icon=_gridList.pop();
				icon.destroy();
			}
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
