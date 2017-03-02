package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.scene.display.BindableSprite;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseObj3D;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.main.chat.ChatFramOnRole;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.role.HeroData;
	
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	
	import gs.TweenLite;

	/**
	 *
	 * 冒泡对话表现
	 * @author L.L.M.Sunny
	 * 创建时间：2016-12-15 上午11:12:28
	 *
	 */
	public class BubbleDialogFace extends BindableSprite implements IInstancePoolClass
	{
		private static var bubbleDialogFacePool : InstancePool = new InstancePool("bubbleDialogFacePool", 300);

		/**
		 * 生成一个BubbleDialogFace
		 */
		public static function create(owner : BaseObj3D) : BubbleDialogFace
		{
			//利用池生成BubbleDialogFace
			return bubbleDialogFacePool.createObj(BubbleDialogFace, owner) as BubbleDialogFace;
		}

		/**
		 * @private
		 * 回收一个BubbleDialogFace
		 * @param dialogFace
		 */
		public static function recycle(dialogFace : BubbleDialogFace) : void
		{
			//利用池回收BubbleDialogFace
			bubbleDialogFacePool.disposeObj(dialogFace);
		}

		private var _owner : BaseObj3D;
		/**头顶说话*/
		private var _wordFrame : ChatFramOnRole;
		private var _wordTween : TweenLite;

		private static var bodyBindOffset : Vector3D = new Vector3D(0, 10);
		private static var manMountBindOffset : Vector3D = new Vector3D(0, 40);
		private static var womanMountBindOffset : Vector3D = new Vector3D(0, 30);

		public function BubbleDialogFace(owner : BaseObj3D)
		{
			super();
			reSet([owner]);
		}

		public function reSet($parameters : Array) : void
		{
			_owner = $parameters[0] as BaseObj3D;
			setTemporary();
		}

		private function setBodyRender(ru : RenderUnit3D, boneName : String = BoneNameEnum.c_0_name_01) : void
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

		/**
		 * 添加临时点血条
		 *
		 */
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
				_wordTween = TweenLite.delayedCall(delay * 0.001, hideWordFrame, [autoRecycle]);
			}
		}

		public function hideWordFrame(recycle : Boolean = false) : void
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

		private function updatePosition() : void
		{
			if (_wordFrame && _wordFrame.parent)
			{
				_wordFrame.x = -_wordFrame.width / 2;
				_wordFrame.y = -_wordFrame.height;
			}
		}
	}
}
