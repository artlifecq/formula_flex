package com.rpgGame.app.state.role.action
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.state.role.action.ActionState;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleActionType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import gs.TweenLite;

	/**
	 *展示状态 
	 * @author dik
	 * 
	 */
	public class ShowState extends ActionState
	{
		private var _showType:String;
		private var _totalFrameTween:TweenLite;
		private var _repeatNum:int;
		private var nextShowTween:TweenLite;
		private var showCD:Number=10;//每次展示的时间间隔
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
				case RenderUnitType.ZHANQI:
					render.visible = true;
					render.repeat = _repeatNum;
					render.setStatus(statusType, _useCrossfadeTransition ? 0.2 : null, time);
					
					if (isFreeze)
						render.stop(time);
					break;
				case RenderUnitType.MOUNT:
					render.visible = true;
					render.repeat = _repeatNum;
					render.setStatus(statusType, _useCrossfadeTransition ? 0.2 : null, time);
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
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				setShowAction();
			}
		}
		
		private function setShowAction():void
		{
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
			if(nextShowTween){
				nextShowTween.kill();
				nextShowTween=null;
			}
			
			var role:SceneRole=_machine.owner as SceneRole;
			if(role.data is MonsterData){//怪物
				_showType=RoleActionType.ATTACK;
			}else{
				_showType=RoleActionType.SHOW_IDLE;
//				_showType=RoleActionType.IDLE;
			}
			_repeatNum=1;			
		}
		
		override public function afterExecute() : void
		{
			if (_machine && !_machine.isInPool)
			{
				syncAnimation();
				super.afterExecute();
				showComplete();
			}
		}
		
		private function showComplete():void
		{
			var bodyAp : RenderUnit3D = (_machine.owner as SceneRole).avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY, true);
			var totalFrameTm:uint = bodyAp ? bodyAp.totalDuration:200;
			if(totalFrameTm>0){
				_totalFrameTween = TweenLite.delayedCall(totalFrameTm * 0.001, onTotalFrameCmp);
			}else{
				onTotalFrameCmp();
			}			
		}
		
		private function onTotalFrameCmp() : void
		{
			if (_machine && !_machine.isInPool)
			{
				if (_totalFrameTween)
				{
					_totalFrameTween.kill();
					_totalFrameTween = null;
				}
				
				_showType=RoleActionType.SHOW_STAND;
//				_showType=RoleActionType.STAND;
				_repeatNum=0;
				syncAnimation();
				nextShowTween= TweenLite.delayedCall(showCD,onShowNext);
			}
		}
		
		private function onShowNext():void
		{
			var role:SceneRole=_machine.owner as SceneRole;
			
			if(role.parent.parent.rotationY!=0){//不在展示角度不做下次展示
				nextShowTween= TweenLite.delayedCall(showCD,onShowNext);
				return;
			}
			setShowAction();
			syncAnimation();
			showComplete();
		}
		
		/**
		 *结束展示之后 
		 * 
		 */
		override public function afterLeave():void
		{
			super.afterLeave();
			_showType=null;
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
			if(nextShowTween){
				nextShowTween.kill();
				nextShowTween=null;
			}
		}
		
		override public function dispose() : void
		{
			_showType=null;
			if (_totalFrameTween)
			{
				_totalFrameTween.kill();
				_totalFrameTween = null;
			}
			if(nextShowTween){
				nextShowTween.kill();
				nextShowTween=null;
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
			if(!prevState){
				return false;
			}
			
			return true;
		}
	}
}