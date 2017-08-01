package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.ItemCDManager;
	import com.rpgGame.app.manager.SystemSetManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.AIStateType;
	
	import flash.utils.setTimeout;

	public class AIUseItem extends AIState
	{
		public function AIUseItem()
		{
			super(AIStateType.USE_ITEM);
		}
		
		override public function execute() : void
		{
			super.execute();
			if(isUseDead())
			{
				
				var deaditem:ClientItemInfo=BackPackManager.instance.getResurgenceItem();
				if(deaditem!=null&&!ItemCDManager.getInstance().getSkillHasCDTime(deaditem.qItem))//做CD判断
				{
					usedealsure=true;
					var timeID:uint = setTimeout(function():void{
						if(MainRoleManager.actor&&MainRoleManager.actor.stateMachine.isDeadState)
						{
							SceneSender.reqReviveLocalRole(deaditem.qItem.q_id,1);
						}
					},3000);
				}
			}
			
			if(isUseHp())
			{
				//Lyt.a("使用回血药")
				var item:ClientItemInfo=BackPackManager.instance.searchHPSuitDrugItem();
				if(item!=null)//搜索物品的时候已经做了CD判断
				{//Lyt.a("发送回血药")
					BackPackManager.instance.useItem(item.cfgId, item.qItem.q_bind);
				}
				
			}
			
		}
		
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			return true;
		}
		private var usedealsure:Boolean=false;
		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if(isUseHp())
			{
				return true;
			}
			if(isUseDead())
			{
				if(usedealsure) 
					return false;
				return true;
			}
			else
			{
				usedealsure=false;
			}
			return false;
		}
		private function isUseHp():Boolean
		{
			if(!MainRoleManager.actor.usable||MainRoleManager.actor.stateMachine.isDeadState)
				return false;
			if(!SystemSetManager.getinstance().getBooleanByIndex(SystemSetManager.SYSTEMSET_LIFE))
				return false;
			var hppercent:int=int(MainRoleManager.actorInfo.totalStat.hp/MainRoleManager.actorInfo.totalStat.life*100);
			if(hppercent>0&&hppercent<SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_HP_PERCENT))
				return true;
			return false;
		}
		private function isUseDead():Boolean
		{
			if(!TrusteeshipManager.getInstance().isAutoFightRunning)
				return false;
			if(!SystemSetManager.getinstance().getBooleanByIndex(SystemSetManager.SYSTEMSET_AUOT_USE_ITEM_ISDEAD))
				return false;
			if(MainRoleManager.actor.stateMachine.isDeadState)
				return true;
			return false;
		}
		
		private function isUseItem():Boolean
		{
			if(isUseHp())
			{
				return true;
			}
			if(isUseDead())
			{
				return true;
			}
			return false;
		}
	}
}