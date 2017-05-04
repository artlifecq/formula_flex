package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.SystemSetManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.AIStateType;

	public class AIUseItem extends AIState
	{
		public function AIUseItem()
		{
			super(AIStateType.USE_ITEM);
		}
		
		override public function execute() : void
		{
			super.execute();
			//L.l("AIUseItem");
			if(isUseHp())
			{
				var item:ClientItemInfo=BackPackManager.instance.searchHPSuitDrugItem();
				if(item!=null)
				{
					BackPackManager.instance.useItem(item.cfgId, 0);
				}
				
			}
			transition(AIStateType.AI_NONE);
		}
		
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (nextState.type == AIStateType.AI_NONE)
				return true;
			return false;
		}
		
		private static function isUseHp():Boolean
		{
			if(SystemSetManager.getinstance().getBooleanByIndex(SystemSetManager.SYSTEMSET_LIFE))
			{
				var hppercent:int=int(MainRoleManager.actorInfo.totalStat.hp/MainRoleManager.actorInfo.totalStat.life*100);
				if(hppercent<SystemSetManager.getinstance().getValueByIndex(SystemSetManager.SYSTEMSET_HP_PERCENT))
				{
					return true;
				}
			}
			
			
			return false;
		}
		
		
		public static function isUseItem():Boolean
		{
			if(isUseHp())
			{
				return true;
			}
			return false;
		}
	}
}