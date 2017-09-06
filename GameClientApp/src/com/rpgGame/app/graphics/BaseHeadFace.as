package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.PoolContainer3D;
	import com.game.engine3D.scene.display.BindableSprite;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseObjSyncInfo;
	import com.rpgGame.app.graphics.decor.DecorCtrl;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.AttachDisplayType;
	import com.rpgGame.coreData.type.SexType;
	
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	
	import feathers.controls.UIAsset;
	
	import starling.display.DisplayObject;

	public class BaseHeadFace extends BindableSprite  implements IInstancePoolClass
	{
		private static var bodyBindOffset : Vector3D = new Vector3D(0, 10);
		private static var manMountBindOffset : Vector3D = new Vector3D(0, 40);
		private static var womanMountBindOffset : Vector3D = new Vector3D(0, 30);
		
		/**是否临时资源**/
		protected var isTemporary : Boolean;
		protected var _isCamouflage : Boolean;
		protected var _isSelected : Boolean;
		protected var _role : SceneRole;
		//		protected var _nameBar : HeadNameBar;
		private var _bodyRu:RenderUnit3D;
		private var _bindDis:PoolContainer3D;
		
		private var _isDestroyed : Boolean;
		private var _isDisposed : Boolean;
		
		protected var deCtrl:DecorCtrl;
		public function BaseHeadFace()
		{
			super();
//			this.graphics.beginFill(0);
//			this.graphics.drawRect(0,0,30,30);
//			this.graphics.endFill();
			_isDestroyed = false;
			deCtrl=new DecorCtrl(this);
		}
		public function set headVisible(value:Boolean):void
		{
			_visible = value;
			this.visible=value;
		}
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function get isInPool():Boolean
		{
			return _isDisposed;
		}
		
		public function reSet(parameters : Array) : void
		{
			_isDisposed = false;
			_bodyRu = null;
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
		
		public function updateBind():void
		{
			var nameBindTarget : ObjectContainer3D = null;
			if (!_role.parent)
			{
				return;
			}
			if (_bodyRu && _role.isInScene())
			{
				removeBindDis();
				nameBindTarget = _bodyRu.getChildByName(BoneNameEnum.c_0_name_01);
				if (nameBindTarget)
				{
					if (_role.stateMachine.isShowRiding)
					{
						if (_role.data is HeroData)
						{
							if (HeroData(_role.data).sex==SexType.MALE)
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
					isTemporary = false;
				}
				else
				{
					bindOffset = null;
					bind(_role.graphicDis, null);
					isTemporary = false;
				}
			}
			else
			{
				if (!_bindDis)
				{
					_bindDis = PoolContainer3D.create();
					_role.parent.addChild(_bindDis);
					_role.addSyncInfo(new BaseObjSyncInfo(_bindDis, true));
				}
				bindOffset = null;
				bind(_bindDis, null);
				isTemporary = true;
			}
			addAllBar();
			updateAllBarPosition();
			updateTranform();
		}
		
		private function removeBindDis():void
		{
			if (_bindDis)
			{
				if (_role) 
				{
					_role.removeSyncInfo(_bindDis);
				}
				
				PoolContainer3D.recycle(_bindDis);
				_bindDis = null;
			}
		}
		
		public function setBodyRender(ru : RenderUnit3D) : void
		{
			_bodyRu = ru;
			updateBind();
//			var nameBindTarget : ObjectContainer3D = ru.getChildByName(BoneNameEnum.c_0_name_01);
//			if (nameBindTarget == null)
//				return;
//			
//			if (_role.stateMachine.isShowRiding)
//			{
//				if (_role.data is HeroData)
//				{
//					if (HeroData(_role.data).sex)
//					{
//						bindOffset = manMountBindOffset;
//					}
//					else
//					{
//						bindOffset = womanMountBindOffset;
//					}
//				}
//				else
//				{
//					bindOffset = manMountBindOffset;
//				}
//			}
//			else
//			{
//				bindOffset = bodyBindOffset;
//			}
//			
//			bind(nameBindTarget, null);
//			
//			addAllBar();
//			isTemporary = false;
//			updateAllBarPosition();
//			
//			updateTranform();
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
//		public function setTemporary() : void
//		{
//			bind(_role.graphicDis, null);
//			
//			initAddBar();
//			
//			addAllBar();
//			isTemporary = true;
//			updateAllBarPosition();
//			
//			updateTranform();
//		}
		
		final protected function addElement(element : DisplayObject,sortLevel:int=-1) : void
		{
			if (element == null)
				return;
			if (element is UIAsset)
			{
				trace("!!!!!!!!addElement", (element as UIAsset).styleName);
			}
			deCtrl.addTop(element,sortLevel);
			//this.addChild(element);
		}
		
		final protected function removeElement(element : DisplayObject) : void
		{
			if (element == null)
				return;
			if (element is UIAsset)
			{
				trace("!!!!!!!!removeElement", (element as UIAsset).styleName);
			}
			deCtrl.removeTop(element);
			//
			//this.removeChild(element);
		}
		
		//-----------------------------------------------------
		/**
		 * 显示隐藏某元素
		 * @param element
		 * @param isShow
		 *
		 */
		protected function showAndHideElement(element : DisplayObject, isShow : Boolean,sortLevel:int=-1) : void
		{
			if (element == null)
				return;
			
			//			element.visible = isShow;
			isShow ? addElement(element,sortLevel) : removeElement(element)
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
			putInPool();
			dispose();
			_isDestroyed = true;
		}
		
		public function putInPool() : void
		{
			removeBindDis();
			if (parent)
			{
				parent.removeChild(this);
			}
			_bodyRu = null;
			_role = null;
			_isDisposed = true;
			deCtrl.removeAll();
		}
		/**
		 * 销毁自身，需要重写 
		 * 
		 */		
		public function recycleSelf():void
		{
			
		}
		public function checkBloodState():void
		{
			
		}
	}
}