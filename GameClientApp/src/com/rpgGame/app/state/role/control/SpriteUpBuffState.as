package com.rpgGame.app.state.role.control
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.utils.getQualifiedClassName;

	public class SpriteUpBuffState extends BuffState
	{
		private var timer:GameTimer;
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
			//super.execute();
			if (!timer) 
			{
				timer=new GameTimer("SpriteUpBuffState",60);
				timer.onUpdate=onTimer;
			}
			timer.start();
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var role:SceneRole=_ref.owner as SceneRole;
			if (role) 
			{
				id++;
				SpellAnimationHelper.createSceneEffect(EffectUrl.EFFECT_SPRITE,id,SceneCharType.SPRITE_EFFECT+"_"+id,role.x,role.z);
			}
		}
		override public function leave():void
		{
			super.leave();
			if (timer) 
			{
				timer.destroy();
				timer=null;
			}
		}
		override public function get tribe():String
		{
			return getQualifiedClassName(SpriteUpBuffState);
		}
	}
}