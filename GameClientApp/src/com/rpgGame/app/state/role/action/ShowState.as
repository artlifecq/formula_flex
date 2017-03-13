package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import away3d.animators.transitions.CrossfadeTransition;
	
	import gs.TweenLite;

	public class ShowState extends ActionState
	{
		private var _showType:String;
		private var _totalFrameTween:TweenLite;
		private var _repeatNum:int;
		public function ShowState()
		{
			super(RoleStateType.ACTION_SHOW);
		}
		
		override public function playAnimation(role : BaseRole, render : RenderUnit3D, isFreeze : Boolean = false, time : int = -1, speedRatio : Number = 1) : void
		{
			var statusType : String = RoleActionType.getActionType(_showType, (_machine as RoleStateMachine).isRiding);
			switch (render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
					render.visible = true;
					render.repeat = _repeatNum;
					render.setStatus(statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.visible = true;
					render.repeat = _repeatNum;
					render.setStatus(ref.data.type, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.EFFECT:
					render.visible = true;
					render.repeat = _repeatNum;
					render.setStatus(ref.data.type, null, time);
					break;
				case RenderUnitType.WEAPON_EFFECT:
					render.visible = true;
					break;
				case RenderUnitType.KNIFE_LIGHT:
					break;
				case RenderUnitType.HURT:
					break;
			}
		}
		
		override public function execute():void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				_showType=RoleActionType.SHOW2;
				_repeatNum=1;
			}
		}
		
		override public function afterExecute() : void
		{
			if (_machine && !_machine.isDisposed&&!_totalFrameTween)
			{
				super.afterExecute();
				
				var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
				var totalFrameTm:uint = bodyAp ? bodyAp.totalDuration:200;
				if(totalFrameTm>0){
					_totalFrameTween = TweenLite.delayedCall(totalFrameTm * 0.001, onTotalFrameCmp);
				}else{
					onTotalFrameCmp();
				}
				syncAnimation();
			}
		}
		
		private function onTotalFrameCmp() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				if (_totalFrameTween)
				{
					_totalFrameTween.kill();
					_totalFrameTween = null;
				}
				_showType=RoleActionType.SHOW1;
				_repeatNum=0;
				_machine.removeState(RoleStateType.ACTION_SHOW);
				syncAnimation();
			}
		}
		
/*		override public function leavePass(nextState : IState, force : Boolean = false) : Boolean
		{
			trace("leavePass",_totalFrameTween==null);
			if(_totalFrameTween){
				return false;
			}
			return true;
		}
		
		override public function enterPass(prevState : IState, force : Boolean = false) : Boolean
		{
			trace("enterPass",_totalFrameTween==null);
			if(_totalFrameTween){
				return false;
			}
			return true;
		}*/
		
		override public function dispose() : void
		{
			_showType=null;
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
			super.dispose();
		}
	}
}