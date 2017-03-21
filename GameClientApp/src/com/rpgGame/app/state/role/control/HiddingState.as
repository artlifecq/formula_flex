package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.display.BlendMode;
	import flash.utils.getQualifiedClassName;

	/**
	 * 隐身状态处理 
	 * @author NEIL
	 * 
	 */	
	public class HiddingState extends BuffState
	{
		public function HiddingState()
		{
			super(RoleStateType.CONTROL_HIDDING);
		}
		
		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
//				transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
				if (_stateReference)
				{
					if (_stateReference is HiddingStateReference)
					{
						var role : SceneRole = _machine.owner as SceneRole;
						role.forEachRenderUnit(eachUnVisible);
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
			render.blendMode = BlendMode.NORMAL;
			render.alpha = 1;
			render.castsShadows = true;
			switch(render.type)
			{
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON_EFFECT:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.DEPUTY_WEAPON_EFFECT:
					render.visible = true;
					break;
			}
		}
		
		private function eachUnVisible(role : BaseRole, render : RenderUnit3D) : void
		{
			role.isHiding = true;
			render.blendMode = BlendMode.LAYER;
			render.alpha = 0;
			render.castsShadows = false;
			switch(render.type)
			{
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON_EFFECT:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.DEPUTY_WEAPON_EFFECT:
					render.visible = false;
					break;
			}
		}
		
		override public function afterLeave() : void
		{
			super.afterLeave();
			if (_machine && !_machine.isDisposed)
			{
				var role : SceneRole = _machine.owner as SceneRole;
				role.forEachRenderUnit(eachVisible);
			}
		}
	}
}