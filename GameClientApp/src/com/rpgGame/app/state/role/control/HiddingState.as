package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;
	import flash.utils.getTimer;

	/**
	 * 隐身状态处理 
	 * @author NEIL
	 * 
	 */	
	public class HiddingState extends BuffState
	{
		private var _enterTime:int;
		public function HiddingState()
		{
			super(RoleStateType.CONTROL_HIDDING);
		}
		
		override public function execute() : void
		{
			_enterTime=getTimer();
			if (_machine && !_machine.isInPool)
			{
				super.execute();
				if (_stateReference)
				{
					if (_stateReference is HiddingStateReference)
					{
						var role : SceneRole = _machine.owner as SceneRole;
						role.forEachRenderUnit(eachUnVisible);
						if (role.headFace) 
						{
							role.headFace.headVisible=false;
						}
					}
					else
						throw new Error("场景隐身状态引用必须是HiddingStateReference类型！");
				}
			}
		}
		
		override public function get tribe():String
		{
			return getQualifiedClassName(HiddingState);
		}
		
		private function eachVisible(role : BaseRole, render : RenderUnit3D) : void
		{
			role.isHiding = false;
			render.castsShadows = true;
			switch(render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.WEAPON_EFFECT:
				case RenderUnitType.DEPUTY_WEAPON_EFFECT:
				case RenderUnitType.ZHANQI:
				case RenderUnitType.EFFECT:
				case RenderUnitType.HURT:
					render.isHiding = false;
					break;
			}
		}
		
		override public function leavePass(nextState:IState, force:Boolean=false):Boolean
		{
			return super.leavePass(nextState, force);
		}
		
		
		private function eachUnVisible(role : BaseRole, render : RenderUnit3D) : void
		{
			role.isHiding = true;
			render.castsShadows = false;
			switch(render.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.WEAPON_EFFECT:
				case RenderUnitType.DEPUTY_WEAPON_EFFECT:
				case RenderUnitType.ZHANQI:
				case RenderUnitType.EFFECT:
				case RenderUnitType.HURT:
					render.isHiding = true;
					break;
			}
		}
		
		override public function afterLeave() : void
		{
			super.afterLeave();
			if (_machine && !_machine.isInPool)
			{
				var role : SceneRole = _machine.owner as SceneRole;
				role.forEachRenderUnit(eachVisible);
				if (role.headFace) 
				{
					role.headFace.headVisible=true;
				}
			}
			trace("time diff:"+(getTimer()-_enterTime));
		}
	}
}