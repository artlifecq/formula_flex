package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.action.PlayActionStateReference;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.SpellEffectDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.type.RoleStateType;

	public class SyncSpellActionState extends BuffState
	{
		private var role : SceneRole;
		public function SyncSpellActionState(type:uint)
		{
			super(RoleStateType.CONTROL_SYNC_SPELLACTION);
		}
		
		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
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
			var spellEffectData:Q_SpellEffect = SpellDataManager.getSpellEffectData(buffData.buffInfo);
			
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams();
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref, true); //切换到“播放状态”
		}
		
		override public function dispose():void
		{
			super.dispose();
		}
		
		override public function leave():void
		{
			super.leave();
			
		}
	}
}