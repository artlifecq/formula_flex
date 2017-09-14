package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getQualifiedClassName;

	public class SpriteUpBuffState extends BuffState
	{
	
		public static var EFFECT_ID:int=221;
		private static var id:int=0;
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
			if (_ref) 
			{
				
				var role:SceneRole=_ref.owner as SceneRole;
				if (role.isMainChar) 
				{
					var animatData : Q_SpellAnimation =AnimationDataManager.getData(EFFECT_ID);
					if (animatData)
					{
						var ru:RenderUnit3D=SpellAnimationHelper.addBuffEffect(role, 0, RenderUnitType.BUFF +EFFECT_ID, animatData.role_res, animatData.bind_bone, 0);
						if (ru) 
						{
							ru.rotationY=role.rotationY;
						}
					}
				}
			}
		}
		
		
		override public function leave():void
		{
			super.leave();
			var role:SceneRole=_ref.owner as SceneRole;
			if (role&&role.isMainChar) 
			{
				role.avatar.removeRenderUnitsByType(RenderUnitType.BUFF + EFFECT_ID);
			}
		}
		override public function get tribe():String
		{
			return getQualifiedClassName(SpriteUpBuffState);
		}
	}
}