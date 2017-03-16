package game.rpgGame.login.state
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;
	
	import away3d.animators.transitions.CrossfadeTransition;
	
	import game.rpgGame.login.scene.RenderUnitID;
	import game.rpgGame.login.scene.RenderUnitType;
	import game.rpgGame.login.scene.RoleActionType;
	import game.rpgGame.login.scene.SceneRole;
	
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
			var statusType : String = RoleActionType.getActionType(_showType, false);
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
					render.setStatus(statusType, _useCrossfadeTransition ? new CrossfadeTransition(0.2) : null, time);
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.EFFECT:
					render.visible = true;
					render.repeat = _repeatNum;
					render.setStatus(statusType, null, time);
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
				transition(RoleStateType.ACTION_IDLE,null,true);
				_showType=RoleActionType.SHOW2;
				_repeatNum=1;
			}
		}
		
		override public function afterExecute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				syncAnimation();
				super.afterExecute();
				
				var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
				var totalFrameTm:uint = bodyAp ? bodyAp.totalDuration:200;
				if(totalFrameTm>0){
					_totalFrameTween = TweenLite.delayedCall(totalFrameTm * 0.001, onTotalFrameCmp);
				}else{
					onTotalFrameCmp();
				}
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
				syncAnimation();
			}
		}
		
		/**
		 *结束展示之后 
		 * 
		 */
		override public function afterLeave():void
		{
			super.afterLeave();
		}
		
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
		
		/**
		 *离开状态判定 
		 * @param nextState
		 * @param force
		 * @return 
		 * 
		 */
		override public function leavePass(nextState:IState, force:Boolean=false):Boolean
		{
			if(!nextState){
				return false;
			}
			
			if (_totalFrameTween)//还在播放动画
			{
				return false;				
			}
			
			return true;
		}
		
		override public function enterPass(prevState:IState, force:Boolean=false):Boolean
		{
			return true;
		}
	}
}