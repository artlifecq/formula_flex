package com.rpgGame.app.graphics
{
	import com.game.engine3D.scene.display.BindableSprite;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.type.AttachDisplayType;
	
	import away3d.containers.ObjectContainer3D;
	
	import starling.display.DisplayObject;

	public class BaseHeadFace extends BindableSprite
	{
		public function BaseHeadFace()
		{
		}
		/**是否临时资源**/
		protected var isTemporary : Boolean;
		protected var _isCamouflage : Boolean;
		protected var _isSelected : Boolean;
		protected var _role : SceneRole;
		protected var _nameBar : HeadNameBar;
		
		public function displayVisible(attachType : String, visible : Boolean) : void
		{
			switch (attachType)
			{
				case AttachDisplayType.ROLE_HEAD_NAME:
					updateShowAndHide();
					break;
			}
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
			
			bindTarget = nameBindTarget;
			
			if (container)
				StarlingLayerManager.headFaceLayer.addChild(container);
			
			addAllBar();
			isTemporary = false;
			updateAllBarPosition();
			
			updateTranform();
		}
		
		public function removeBodyRender() : void
		{
			_isSelected = false;
			_isCamouflage = false;
		}
		
		/**
		 * 添加临时点血条
		 *
		 */
		public function addTemporaryBar() : void
		{
			bindTarget = _role.avatar.graphicDis;
			
			if (container)
				StarlingLayerManager.headFaceLayer.addChild(container);
			
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
			
			container.addChild(element);
		}
		
		final protected function removeElement(element : DisplayObject) : void
		{
			if (element == null)
				return;
			
			container.removeChild(element);
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
		public function show() : void
		{
			
		}
		
		public function hide():void
		{
			
		}
		/**
		 * 销毁自身，需要重写 
		 * 
		 */		
		public function recycleSelf():void
		{
			
		}
		
	}
}