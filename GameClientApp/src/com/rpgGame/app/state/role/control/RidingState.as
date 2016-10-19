package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.state.role.control.ControlState;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;

	/**
	 *
	 * 场景角色骑乘状态
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-9 下午5:25:12
	 *
	 */
	public class RidingState extends ControlState
	{
		private var _stateReference : RidingStateReference;

		public function RidingState()
		{
			super(RoleStateType.CONTROL_RIDING);
		}

		override public function execute() : void
		{
			super.execute();
			if (_machine && !_machine.isDisposed)
			{
				_stateReference = null;
				if (_ref)
				{
					if (_ref is RidingStateReference)
					{
						_stateReference = _ref as RidingStateReference;
						((_machine.owner as SceneRole).data as RoleData).avatarInfo.setMountResID(_stateReference.mountResID, _stateReference.mountAnimatResID);
						AvatarManager.updateAvatar(_machine.owner as SceneRole);
					}
					else
						throw new Error("角色骑乘状态引用必须是RidingStateReference类型！");
				}
			}
		}

		override public function afterLeave() : void
		{
			super.afterLeave();
			((_machine.owner as SceneRole).data as RoleData).avatarInfo.setMountResID(null, null);
			AvatarManager.updateAvatar(_machine.owner as SceneRole);
		}

		override public function dispose() : void
		{
			_stateReference = null;
			super.dispose();
		}
	}
}
