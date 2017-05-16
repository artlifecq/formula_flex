package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.scene.display.BindableSprite;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.AttachDisplayType;
	
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	
	import feathers.controls.UIAsset;
	
	import starling.display.DisplayObject;

	public class BaseHeadFace extends BindableSprite  implements IInstancePoolClass
	{
		private static var bodyBindOffset : Vector3D = new Vector3D(0, 10);
		private static var manMountBindOffset : Vector3D = new Vector3D(0, 40);
		private static var womanMountBindOffset : Vector3D = new Vector3D(0, 30);
		public function BaseHeadFace()
		{
			super();
			_isDestroyed = false;
		}
		/**是否临时资源**/
		protected var isTemporary : Boolean;
		protected var _isCamouflage : Boolean;
		protected var _isSelected : Boolean;
		protected var _role : SceneRole;
//		protected var _nameBar : HeadNameBar;
		
		private var _isDestroyed : Boolean;
		private var _isDisposed : Boolean;
		
		public function reSet(parameters : Array) : void
		{
			_isDisposed = false;
		}
		
		public function displayVisible(attachType : String, visible : Boolean) : void
		{
			switch (attachType)
			{
				case AttachDisplayType.ROLE_HEAD_NAME:
					updateShowAndHide();
					break;
			}
		}
		
		/**
		 * 更新角色名字
		 * @param color
		 *
		 */
		public function updateName() : void
		{
		}
		
		public function set isCamouflage(value : Boolean) : void
		{
			if (_isCamouflage == value)
				return;
			_isCamouflage = value;
			updateShowAndHide();
		}
		
		public function setBodyRender(ru : RenderUnit3D) : void
		{
			var nameBindTarget : ObjectContainer3D = ru.getChildByName(BoneNameEnum.c_0_name_01);
			if (nameBindTarget == null)
				return;
			
			if (_role.stateMachine.isShowRiding)
			{
				if (_role.data is HeroData)
				{
					if (HeroData(_role.data).sex)
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
			
			bind(nameBindTarget, null);
			
			addAllBar();
			isTemporary = false;
			updateAllBarPosition();
			
			updateTranform();
		}
		
		protected function removeBodyRender() : void
		{
			_isSelected = false;
			_isCamouflage = false;
		}
		
		/**
		 * 添加临时点血条
		 *
		 */
		public function setTemporary() : void
		{
			bind(_role.graphicDis, null);
			
			initAddBar();
			
			addAllBar();
			isTemporary = true;
			updateAllBarPosition();
			
			updateTranform();
		}
		
		final protected function addElement(element : DisplayObject) : void
		{
			if (element == null)
				return;
			if (element is UIAsset)
			{
				trace("!!!!!!!!addElement", (element as UIAsset).styleName);
			}
			this.addChild(element);
		}
		
		final protected function removeElement(element : DisplayObject) : void
		{
			if (element == null)
				return;
			if (element is UIAsset)
			{
				trace("!!!!!!!!removeElement", (element as UIAsset).styleName);
			}
			this.removeChild(element);
		}
		
		//-----------------------------------------------------
		/**
		 * 显示隐藏某元素
		 * @param element
		 * @param isShow
		 *
		 */
		final protected function showAndHideElement(element : DisplayObject, isShow : Boolean) : void
		{
			if (element == null)
				return;
			
			//			element.visible = isShow;
			isShow ? addElement(element) : removeElement(element)
		}
		
		/**
		 * 初始化添加的元素
		 *
		 */
		protected function initAddBar() : void
		{
			
		}
		
		/**
		 * 更新血条等位置
		 * @param isTemporary		是否是临时的模型未加载时 需要重写
		 *
		 */
		protected function updateAllBarPosition() : void
		{
			
		}
		/**
		 * 由于模型未加载之前是在别的容器中，所以加载完成后要重新更新一下加到真正的容器之中
		 * 需要重写
		 */
		protected function addAllBar() : void
		{
			
		}
		/**
		 * 更新显示，需要重写 
		 * 
		 */		
		protected function updateShowAndHide():void
		{
			
		}
		public function showHead() : void
		{
		}
		
		public function hideHead() : void
		{
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
			_isDestroyed = true;
		}
		
		public function instanceDispose() : void
		{
			if (parent)
			{
				parent.removeChild(this);
			}
			_isDisposed = true;
		}
		/**
		 * 销毁自身，需要重写 
		 * 
		 */		
		public function recycleSelf():void
		{
			
		}
		
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function get isDisposed():Boolean
		{
			return _isDisposed;
		}
		
	}
}