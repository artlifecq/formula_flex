package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.IState;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.type.RoleStateType;

	public class SkillCDResetState extends BuffState
	{
		public function SkillCDResetState()
		{
			super(RoleStateType.CONTROL_BUFF_RESET_SKILLCD);
		}
		override public function execute():void
		{
			super.execute();
			if (_machine && !_machine.isInPool)
			{
				_stateReference = null;
				if (_ref)
				{
					if (_ref is SkillCDResetStateReference)
					{
						_stateReference = _ref as SkillCDResetStateReference;
					
						var qBuff:Q_buff=_stateReference.buffData._data;
						if (qBuff) 
						{
							var skillArr:Array=JSONUtil.decode(qBuff.q_Bonus_skill);
							var cdArr:Array=JSONUtil.decode(qBuff.q_effect_value);
							if (skillArr==null||cdArr==null||skillArr.length!=cdArr.length) 
							{
								GameLog.addError(qBuff.q_buff_name+"配置错误减少cd");
								return;
							}
							var len:int=skillArr.length;
							var tmpCd:int=0;
							var tmpSkill:int;
							for (var i:int = 0; i < len; i++) 
							{
								tmpSkill=skillArr[i];
								tmpCd=cdArr[i]+SkillCDManager.getInstance().getSkillCDLastTime(SpellDataManager.getSpellData(tmpSkill));
								SkillCDManager.getInstance().resetSkillCD(tmpSkill,Math.max(0,tmpCd));
							}
							
						}
					}
					else
						throw new Error("重置CD状态引用必须是SkillCDResetStateReference类型！");
				}
			}
			
		}
		override public function enterPass(prevState:IState, force:Boolean=false):Boolean
		{
			var role:SceneRole=_machine.owner as SceneRole;
			if (role&&role.usable&&role.isMainChar) 
			{
				return true;
			}
			return false;
		}
	}
}