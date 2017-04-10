package com.rpgGame.app.state.role.control
{
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;
	
	import org.client.mainCore.manager.EventManager;

	public class ShortcutGridState extends BuffState
	{
		public function ShortcutGridState()
		{
			super(RoleStateType.CONTROL_SHORTCUTGRID);
		}
		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				if (_stateReference)
				{
					EventManager.dispatchEvent(BuffEvent.CHANGE_GRID_BUFF,true);
				}
			}
		}
		
		
		override public function dispose():void
		{
			
			super.dispose();
		}
		
		override public function leave():void
		{
			EventManager.dispatchEvent(BuffEvent.CHANGE_GRID_BUFF,false);
			super.leave();
			
		}
		
		override public function get tribe():String
		{
			return getQualifiedClassName(ShortcutGridState);
		}
	}
}