package com.rpgGame.app.graphics
{
	import com.game.engine3D.scene.display.BindableSprite;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	
	import away3d.containers.ObjectContainer3D;
	
	/**
	 *攻击冒泡容器 
	 * @author dik
	 * 
	 */
	public class AttackFaceSprite extends BindableSprite implements IPoolClass
	{
		private static var pool : Pool = new Pool("AttackFaceSpritePool", 300);
		
		/**
		 * 生成一个HeadFace
		 */
		public static function create(role : SceneRole) : AttackFaceSprite
		{
			return pool.createObj(AttackFaceSprite, role) as AttackFaceSprite;
		}
		
		public static function recycle(face : AttackFaceSprite) : void
		{
			pool.disposeObj(face);
		}
		
		
		public function AttackFaceSprite(role : SceneRole)
		{
			super();
			reSet([role]);
		}
		
		public function reSet($parameters : Array) : void
		{
			
		}
		
		public function setBodyRender(ru : RenderUnit3D) : void
		{
			var nameBindTarget : ObjectContainer3D = ru.getChildByName(BoneNameEnum.c_0_name_01);
			if (nameBindTarget == null)
				return;
			
			bindTarget = nameBindTarget;
			
			if (container)
				StarlingLayerManager.headFaceLayer.addChild(container);
			
			updateTranform();
		}
	}
}