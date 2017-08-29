package com.rpgGame.app.state.role.control
{
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

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
						Lyt.a("流血buff状态");
						
						
						
					}
					else
						throw new Error("流血BUFF状态引用必须是HeadBleedStateReference类型！");
				}
			}
			
		}
		override public function get tribe():String
		{
			return getQualifiedClassName(HeadBleedBuffState);
		}
	}
}