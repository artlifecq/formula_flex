package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.action.PlayActionStateReference;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

	public class SyncSpellActionState extends BuffState
	{
		private var role : SceneRole;
		public function SyncSpellActionState()
		{
			super(RoleStateType.CONTROL_SYNC_SPELLACTION);
		}
		
		override public function execute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				if (_stateReference)
				{
					role = (_machine.owner as SceneRole);
					if (_stateReference is SyncSpellActionStateReference)
					{
						playSpell(_stateReference.buffData);
					}
					else
						throw new Error("同步场景角色技能状态引用必须是SyncSpellActionStateReference类型！");
				}
			}
		}
		
		private function playSpell(buffData:BuffData):void
		{
			var spellEffectData:Q_SpellEffect = SpellDataManager.getSpellEffectData(buffData.clientData.skill);
			var actionType:String = spellEffectData.attack_motion;
			
			var startTime:Number = buffData.totalTime - buffData.disappearTime;
			
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(actionType,1,startTime);
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_SPELL, ref, true);
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
			return getQualifiedClassName(SyncSpellActionState);
		}
		
	}
}