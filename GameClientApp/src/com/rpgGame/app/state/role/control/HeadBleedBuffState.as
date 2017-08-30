package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;
	
	import gs.TweenLite;

	/**
	 * 流血buff状态
	 * @author YT
	 * 创建时间：2017-8-28 下午3:51:27
	 */
	public class HeadBleedBuffState extends BuffState
	{
		public function HeadBleedBuffState()
		{
			super(RoleStateType.CONTROL_BUFF_BLEED);
		}
		override public function execute():void
		{
			super.execute();
			if (_machine && !_machine.isInPool)
			{
				_stateReference = null;
				if (_ref)
				{
					if (_ref is HeadBleedStateReference)
					{
						_stateReference = _ref as HeadBleedStateReference;
						TweenLite.killDelayedCallsTo(addHeadEffct);
						TweenLite.delayedCall(0.05,addHeadEffct);
					}
					else
						throw new Error("流血BUFF状态引用必须是HeadBleedStateReference类型！");
				}
			}
			
		}
		private function addHeadEffct():void
		{
			Lyt.a("流血buff状态:"+_stateReference.buffData.curtStackCount);
			var buffData:BuffData=_stateReference.buffData;
			var role:SceneRole=(_machine as RoleStateMachine).owner as SceneRole;
			//role.avatar.removeRenderUnitsByType(RenderUnitType.BUFF + buffData.cfgId);
			var render:RenderUnit3D=SpellAnimationHelper.addBuffEffect(role, 100, RenderUnitType.BUFF + buffData.cfgId, ClientConfig.getEffect("tx_shuzi_bai"), "c_0_name_01", 0);
			render.stop(getNum(buffData.curtStackCount));
			
		}
		private function getNum(num:int):int
		{
			var reNum:int=1100+num*1000;
			if(reNum>10100||reNum<2100)reNum=100;
			return reNum;
		}
		override public function get tribe():String
		{
			return getQualifiedClassName(HeadBleedBuffState);
		}
	}
}