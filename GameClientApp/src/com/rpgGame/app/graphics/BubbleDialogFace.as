package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.core.poolObject.PoolContainer3D;
	import com.game.engine3D.scene.display.BindableSprite;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.engine3D.vo.BaseObjSyncInfo;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.main.chat.ChatFramOnRole;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	
	import gs.TweenLite;
	
	public class BubbleDialogFace extends BindableSprite implements IInstancePoolClass 
	{
		
		private static var bubbleDialogFacePool:InstancePool = new InstancePool("bubbleDialogFacePool", 300);
		private static var bodyBindOffset:Vector3D = new Vector3D(0, 10);
		private static var manMountBindOffset:Vector3D = new Vector3D(0, 40);
		private static var womanMountBindOffset:Vector3D = new Vector3D(0, 30);
		
		private var _owner:BaseObj3D;
		/**头顶说话*/
		private var _wordFrame:ChatFramOnRole;
		private var _wordTween:TweenLite;
		private var _bodyRu:RenderUnit3D;
		private var _boneName:String;
		private var _isDestroyed:Boolean;
		private var _isDisposed:Boolean;
		private var _bindDis:PoolContainer3D;
		
		public function BubbleDialogFace(owner:BaseObj3D)
		{
			_isDestroyed = false;
			reSet([owner]);
		}
		
		public static function create(owner:BaseObj3D):BubbleDialogFace
		{
			return bubbleDialogFacePool.createObj(BubbleDialogFace, owner) as BubbleDialogFace;
		}
		
		public static function recycle(dialogFace:BubbleDialogFace):void
		{
			bubbleDialogFacePool.disposeObj(dialogFace);
		}
		
		
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function get isDisposed():Boolean
		{
			return _isDisposed;
		}
		
		public function reSet($parameters:Array):void
		{
			_isDisposed = false;
			_owner = ($parameters[0] as BaseObj3D);
			_bodyRu = null;
			_boneName = null;
		}
		
		public function updateBind():void
		{
			var nameBindTarget:ObjectContainer3D = null;
			if (!_owner.parent)
			{
				return;
			}
			if (_bodyRu && _owner.isInScene())
			{
				removeBindDis();
				nameBindTarget = _bodyRu.getChildByName(_boneName);
				if (nameBindTarget)
				{
					if (_owner is SceneRole)
					{
						if (SceneRole(_owner).stateMachine.isShowRiding)
						{
//							if (SceneRole(_owner).data is HeroData)
//							{
//								if (HeroData(SceneRole(_owner).data).sex)
//								{
//									bindOffset = manMountBindOffset;
//								}
//								else
//								{
//									bindOffset = womanMountBindOffset;
//								}
//							}
//							else
//							{
								bindOffset = manMountBindOffset;
//							}
						}
						else
						{
							bindOffset = bodyBindOffset;
						}
					}
					else
					{
						bindOffset = null;
					}
					bind(nameBindTarget, null);
				}
				else
				{
					bindOffset = null;
					bind(_owner.graphicDis, null);
				}
			}
			else
			{
				if (!_bindDis)
				{
					_bindDis = PoolContainer3D.create();
					_owner.parent.addChild(_bindDis);
					_owner.addSyncInfo(new BaseObjSyncInfo(_bindDis, true));
				}
				bindOffset = null;
				bind(_owner.graphicDis, null);
			}
			updatePosition();
			updateTranform();
		}
		
		private function removeBindDis():void
		{
			if (_bindDis)
			{
				_owner.removeSyncInfo(_bindDis);
				PoolContainer3D.recycle(_bindDis);
				_bindDis = null;
			}
		}
		
		private function setBodyRender(ru:RenderUnit3D, boneName:String=BoneNameEnum.c_0_name_01):void
		{
			_bodyRu = ru;
			_boneName = boneName;
			updateBind();
		}
		
		public function show():void
		{
			StarlingLayerManager.headFaceLayer.addChild(this);
		}
		
		public function hide():void
		{
			if (this.parent)
			{
				this.parent.removeChild(this);
			}
		}
		
		public function instanceDestroy():void
		{
			instanceDispose();
			dispose();
			_isDestroyed = true;
		}
		
		public function instanceDispose():void
		{
			removeBindDis();
			removeBodyRender();
			if (parent)
			{
				parent.removeChild(this);
			}
			_bodyRu = null;
			_boneName = null;
			_owner = null;
			_isDisposed = true;
		}
		
		private function removeBodyRender():void
		{
			TweenLite.killDelayedCallsTo(hideWordFrame);
			if (_wordFrame)
			{
				_wordFrame.dispose();
				_wordFrame = null;
			}
			if (_wordTween)
			{
				_wordTween.kill();
				_wordTween = null;
			}
		}
		
		public function recycleSelf():void
		{
			recycle(this);
		}
		
		public function addWordFrame(renderUnitType:String, renderUnitId:int, message:String, delay:Number=5000, boneName:String=BoneNameEnum.c_0_name_01, autoRecycle:Boolean=false):void
		{
			var camouflage : SceneRole = null;
			var camouflageDialogFace : BubbleDialogFace;
			var ru : RenderUnit3D = null;
			if (_owner)
			{
				if (_owner is SceneRole)
				{
					camouflage = (_owner as SceneRole).getCamouflageEntity() as SceneRole;
					if (camouflage)
					{
						camouflageDialogFace = camouflage.dialogFace as BubbleDialogFace;
						if (camouflageDialogFace)
						{
							camouflageDialogFace.addWordFrame(renderUnitType, renderUnitId, message, delay);
						}
						return;
					}
				}
				ru = null;
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
						setBodyRender(null, null);
					}
				}
				else
				{
					setBodyRender(null, null);
				}
				TweenLite.killDelayedCallsTo(hideWordFrame);
				if (_wordFrame == null)
				{
					_wordFrame = new ChatFramOnRole();
				}
				_wordFrame.show(message);
				this.addChild(_wordFrame);
				updatePosition();
				if (_wordTween)
				{
					_wordTween.kill();
					_wordTween = null;
				}
				_wordTween = TweenLite.delayedCall((delay * 0.001), hideWordFrame, [autoRecycle]);
			}
		}
		
		public function hideWordFrame(recycle:Boolean=false):void
		{
			if (_wordFrame)
			{
				_wordFrame.removeFromParent();
			}
			updatePosition();
			if (recycle)
			{
				recycleSelf();
			}
		}
		
		private function updatePosition():void
		{
			if (_wordFrame && _wordFrame.parent)
			{
				_wordFrame.x = -_wordFrame.width / 2;
				_wordFrame.y = -_wordFrame.height;
			}
		}
	}
}