package com.rpgGame.app.state.ai
{
	import com.game.engine3D.state.IState;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.manager.TrusteeshipFightSoulManager;
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.type.AIStateType;
	
	import gs.TweenLite;
	
	import org.game.netCore.data.long;
	/**
	 *战魂自动攻击状态 
	 * @author YT
	 * 
	 * 
	 */	
	public class AIFightSoulAttack extends AIState
	{
		private var skill:Q_skill_model;
		private var soulFightId:int;
		private var soulBroken:Boolean=true
		public function AIFightSoulAttack()
		{
			super(AIStateType.FIGHTSOUL_ATTACE);
		}
		override public function execute() : void
		{
			super.execute();
			if(skill&&soulFightId&&soulBroken)
			{
				SpellSender.releaseSpellAtTarget(skill.q_skillID,360*Math.random(),soulFightId);
				SkillCDManager.getInstance().addSkillCDTime(skill);
				soulBroken=false;
				TweenLite.delayedCall(skill.q_cd*0.001, soulFightBroken);
			}
			
		
		}
		private function soulFightBroken():void
		{
			soulBroken=true;
		}
		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			if(!soulBroken)
				return  false;
			return true;
		}
		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			if(FightSoulManager.instance().fightSoulInfo==null)
				return  false;
			skill = FightSoulManager.instance().getSpellData();
			if(skill==null||SkillCDManager.getInstance().getSkillHasCDTime(skill))//技能冷却中不能释放技能里
				return false;
			soulFightId=TrusteeshipFightSoulManager.getInstance().soulFightId;
			var targetState : int = FightManager.getFightRoleState( SceneManager.getSceneObjByID(soulFightId) as SceneRole);//攻击类型
			if(targetState==FightManager.FIGHT_ROLE_STATE_CAN_NOT_FIGHT)//不能攻击
				return false;
			return true;
		}
	}
}