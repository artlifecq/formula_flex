package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.IState;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.type.RoleStateType;

	/**
	 * 拥有buff后的对应技能减少cd时间
	 * @author jsj
	 * 
	 */
	public class SkillCDReduceState extends BuffState
	{
		public function SkillCDReduceState()
		{
			super(RoleStateType.CONTROL_BUFF_SKILLCD2);
		}
		
		override public function afterExecute():void
		{
			super.afterExecute();
			var ref:BuffStateReference=_ref as BuffStateReference;
			var qBuff:Q_buff=ref.buffData._data;
			if (qBuff) 
			{
				var skillArr:Array=JSONUtil.decode(qBuff.q_Bonus_skill);
				if (skillArr==null||skillArr.length==0) 
				{
					GameLog.addError(qBuff.q_buff_name+"配置错误减少cd");
					return;
				}
				var resTime:Number= ref.buffData.buffInfo.value;
				var len:int=skillArr.length;
				var tmpSkill:int;
				for (var i:int = 0; i < len; i++) 
				{
					tmpSkill=skillArr[i];
					SkillCDManager.getInstance().reduceCDTime(tmpSkill,resTime);
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
		override public function beforeLeave():void
		{
			super.beforeLeave();
			var ref:BuffStateReference=_ref as BuffStateReference;
			var qBuff:Q_buff=ref.buffData._data;
			if (qBuff) 
			{
				var skillArr:Array=JSONUtil.decode(qBuff.q_Bonus_skill);
				if (skillArr==null||skillArr.length==0) 
				{
					GameLog.addError(qBuff.q_buff_name+"配置错误减少cd");
					return;
				}
				var len:int=skillArr.length;
				var tmpSkill:int;
				for (var i:int = 0; i < len; i++) 
				{
					tmpSkill=skillArr[i];
					SkillCDManager.getInstance().removeCDTime(tmpSkill);
				}
				
			}
			
		}
	}
}