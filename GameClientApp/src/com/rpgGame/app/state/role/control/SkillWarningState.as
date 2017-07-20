package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.action.PlayActionStateReference;
	import com.rpgGame.coreData.cfg.SpellEffectDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

	/**
	 * 预警状态处理 
	 * @author YT
	 * 
	 */	
	public class SkillWarningState extends BuffState
	{
		private var role : SceneRole;
		public function SkillWarningState()
		{
			super(RoleStateType.CONTROL_SKILL_WARNING);
		}
		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				if (_stateReference)
				{
					role = (_machine.owner as SceneRole);
					if (_stateReference is SkillWarningStateReference)
					{
						var buffData:BuffData=_stateReference.buffData;
						var spellEffectData:Q_SpellEffect = SpellEffectDataManager.getData(buffData.clientData.skill);
						var actionType:String = spellEffectData.attack_motion;
						
						var startTime:Number = buffData.totalTime - buffData.disappearTime;
						var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
						ref.setParams(actionType,1,0);
						role.stateMachine.transition(RoleStateType.ACTION_PLAY_SPELL, ref, true);
					
						/*var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
						ref.setParams(RoleActionType.STAND, 1, 0);
						role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref, true);*/ //切换到“播放状态”
					}
					else
						throw new Error("预警状态状态引用必须是SkillWarningState类型！");
				}
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
		}
		
		override public function leave():void
		{
			super.leave();
			
		}
		override public function get tribe():String
		{
			return getQualifiedClassName(SkillWarningState);
		}
	}
}