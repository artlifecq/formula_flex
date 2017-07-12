package com.rpgGame.app.state.role.control
{
	import com.rpgGame.coreData.type.RoleStateType;

	public class SpriteUpBuffState extends BuffState
	{
		/**
		 *冲刺buff 
		 * @param type
		 * 
		 */		
		public function SpriteUpBuffState()
		{
			super(RoleStateType.CONTROL_BUFF_SPRITEUP);
		}
		override public function execute():void
		{
			super.execute();
		}
		override public function leave():void
		{
			super.leave();
		}
	}
}