package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.TaskType;

	public class AITaskWalk extends AIState
	{
		public function AITaskWalk()
		{
			super(AIStateType.TASK_WALK);
		}
		
		override public function execute() : void
		{
			super.execute();
			
			//transition(AIStateType.AI_NONE);
			
			/*if(TaskMissionManager.getMainTaskIsFinish())
			{
				if(TaskMissionManager.getMainTaskHaveNpc())
				{
					TaskUtil.npcTaskWalk(TaskMissionManager.getMainTaskNpcAreaId(),finishWalk,finishWalk);
				}
				else
				{
					//showLeadPanel();
				}
			}
			else
			{
				
			}*/
			//releaseSpell();
		}
		private function finishWalk(re : *):void
		{
			
			showLeadPanel();
		}
		private function showLeadPanel():void
		{
			AppManager.showApp(AppConstant.TASK_LEAD_PANEL);
		}
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if (nextState.type == AIStateType.AI_NONE)
				return true;
			return false;
		}
		
	}
}