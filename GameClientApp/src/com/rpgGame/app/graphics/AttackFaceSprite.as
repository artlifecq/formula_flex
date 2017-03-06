package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.scene.display.BindableSprite;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseObj3D;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.role.HeroData;
	
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	
	/**
	 *攻击冒泡容器 
	 * @author dik
	 * 
	 */
	public class AttackFaceSprite extends BindableSprite  implements IInstancePoolClass
	{
		private static var pool :  InstancePool = new InstancePool("AttackFaceSpritePool", 300);
		
		private static var manMountBindOffset : Vector3D = new Vector3D(0, 40);
		private static var womanMountBindOffset : Vector3D = new Vector3D(0, 30);
		private static var bodyBindOffset : Vector3D = new Vector3D(0, 10);
		
		/**
		 * 生成一个HeadFace
		 */
		public static function create(owner : BaseObj3D) : AttackFaceSprite
		{
			return pool.createObj(AttackFaceSprite, owner) as AttackFaceSprite;
		}
		
		public static function recycle(face : AttackFaceSprite) : void
		{
			pool.disposeObj(face);
		}
		
		private var _owner : BaseObj3D;
		
		
		public function AttackFaceSprite(owner : BaseObj3D)
		{
			super();
			reSet([owner]);
		}
		
		public function reSet($parameters : Array) : void
		{
			_owner = $parameters[0] as BaseObj3D;
			
			setTemporary();
		}
		
		private function setTemporary() : void
		{
			bind(_owner.graphicDis, null);
			
			updatePosition();
			updateTranform();
		}
		
		public function show() : void
		{
			StarlingLayerManager.headFaceLayer.addChild(this);
		}
		
		public function hide() : void
		{
			if (this.parent)
			{
				this.parent.removeChild(this);
			}
		}
		
		public function instanceDestroy() : void
		{
			instanceDispose();
			dispose();
		}
		
		public function instanceDispose() : void
		{
			removeBodyRender();
			_owner = null;
			if (parent)
			{
				parent.removeChild(this);
			}
		}
		
		private function removeBodyRender() : void
		{
			
		}
		
		public function recycleSelf() : void
		{
			recycle(this);
		}
		
		public function addWordFrame(renderUnitType : String, renderUnitId : int, message : String, delay : Number = 5000, boneName : String = BoneNameEnum.c_0_name_01, autoRecycle : Boolean = false) : void
		{
			if (_owner)
			{
				if (_owner is SceneRole)
				{
					var camouflage : SceneRole = (_owner as SceneRole).getCamouflageEntity() as SceneRole;
					if (camouflage)
					{
						var camouflageDialogFace : BubbleDialogFace = camouflage.dialogFace as BubbleDialogFace;
						if (camouflageDialogFace)
						{
							camouflageDialogFace.addWordFrame(renderUnitType, renderUnitId, message, delay);
						}
						return;
					}
				}
				var ru : RenderUnit3D = null;
				if (_owner is SceneRole)
				{
					ru = (_owner as SceneRole).avatar.getRenderUnitByID(renderUnitType, renderUnitId);
				}
				else if (_owner is RenderUnit3D)
				{
					ru = _owner as RenderUnit3D;
				}
				if (ru)
				{
					if (ru.resReady)
					{
						setBodyRender(ru, boneName);
					}
					else
					{
						setTemporary();
					}
				}
				else
				{
					setTemporary();
				}
			}
		}
		
		public function setBodyRender(ru : RenderUnit3D, boneName : String = BoneNameEnum.c_0_name_01) : void
		{
			var nameBindTarget : ObjectContainer3D = ru.getChildByName(boneName);
			if (nameBindTarget == null)
				return;
			
			
			if (_owner is SceneRole)
			{
				if (SceneRole(_owner).stateMachine.isShowRiding)
				{
					if (SceneRole(_owner).data is HeroData)
					{
						if (HeroData(SceneRole(_owner).data).sex)
						{
							bindOffset = manMountBindOffset;
						}
						else
						{
							bindOffset = womanMountBindOffset;
						}
					}
					else
					{
						bindOffset = manMountBindOffset;
					}
				}
				else
				{
					bindOffset = bodyBindOffset;
				}
			}
			
			bind(nameBindTarget, null);
			
			updatePosition();
			updateTranform();
		}
		
		public function hideWordFrame(recycle : Boolean = false) : void
		{
			updatePosition();
			if (recycle)
			{
				recycleSelf();
			}
		}
		
		private function updatePosition() : void
		{
			
		}
	}
}