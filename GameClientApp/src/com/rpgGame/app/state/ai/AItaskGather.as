package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.ItemCDManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.task.GatherAutoManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.ui.main.taskbar.TaskControl;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.TaskType;

	public class AItaskGather extends AIState
	{
		private var taskType:int
		public function AItaskGather()
		{
			super(AIStateType.TASK_GATHER);
		}
		override public function execute() : void
		{
			super.execute();
			taskType=GatherAutoManager.getInstance().otherType;
			var taskData:Q_mission_base=TaskMissionManager.getTaskDataByType(taskType);
			if(taskData==null)return;
			var missionType:int=taskData.q_mission_type;
			if(missionType==TaskType.SUB_GATHER)
			{
				TaskControl.startGather(GatherAutoManager.getInstance().gatherTarget);
			}
			else if(missionType==TaskType.SUB_USEITEM)
			{
				TaskControl.showBagPanel();
				var item:ClientItemInfo=BackPackManager.instance.getItemById(GatherAutoManager.getInstance().gatherTarget);
				if(item!=null)
				{
					if(!ItemCDManager.getInstance().getSkillHasCDTime(item.qItem))//做CD判断
					{
						BackPackManager.instance.useItem(item.cfgId, item.qItem.q_bind);
					}
					else
					{
						transition(AIStateType.AI_NONE);
					}
				}
				else
				{
					GatherAutoManager.getInstance().stopGatherAuto();
				}
				
			}
				
			
			
		}
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (nextState.type == AIStateType.AI_NONE)
				return true;
			return false;
		}
		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			return true;
		}
	}
}