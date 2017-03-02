package com.rpgGame.app.graphics
{
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	
	import org.client.mainCore.ds.HashMap;
	
	public class HeadFaceEffectGroup
	{
		/** 头顶每个图标之间的间距 **/
		private static const SPACE : int = 100;
		/** Y偏移值 **/
		public var offsetY : int = 0;
		private var _effectMap : HashMap = new HashMap();
		private var _owner : SceneRole;
		
		public function HeadFaceEffectGroup(owner : SceneRole)
		{
			_owner = owner;
		}
		
		/** 存放特效的hashMap **/
		public function get effectMap() : HashMap
		{
			return _effectMap;
		}
		
		/**
		 * 夺经、鸡毛信头顶特效显示
		 * @param UnitID 换装ID
		 * @param unitType 换装部件类型
		 * @param effectUrl 特效资源地址
		 * @param repeat 播放次数
		 * @param posx 偏移值X
		 * @param posy 偏移值Y
		 * @param posz 偏移值Z
		 *
		 */
		public function addEffect(unitID : int, unitType : String, effectUrl : String, repeat : int = 1) : void
		{
			var effectRu : RenderUnit3D = _effectMap.getValue(unitID + "_" + unitType);
			if (effectRu == null)
			{
				var rud : RenderParamData3D = new RenderParamData3D(unitID, unitType, ClientConfig.getEffect(effectUrl));
				rud.clearSameType = false;
				if (_owner.stateMachine.isShowRiding)
					effectRu = _owner.avatar.addRenderUnitToChild(RenderUnitType.MOUNT, RenderUnitID.MOUNT, BoneNameEnum.c_0_name_01, rud);
				else
					effectRu = _owner.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_name_01, rud);
				if (effectRu != null)
				{
					effectRu.repeat = repeat;
					effectRu.rotationY = 0;
					_effectMap.add(unitID + "_" + unitType, effectRu);
				}
			}
			(_owner.headFace as HeadFace).updateAllPosition();
		}
		
		/**
		 * 刷新布局
		 *
		 */
		public function layout() : int
		{
			if (!_owner.headFace)
				return 0;
			var posY : int = 0;
			var sortArr : Array = _effectMap.getValues().slice();
			sortArr.sort(onSort); //策划要求固定排序，从下到上 鸡毛信→经书
			offsetY = -(_owner.headFace as HeadFace).offsetY + SPACE + 60;
			//坐标Y  
			for (var i : int = 0; i < sortArr.length; i++)
			{
				var effRu : RenderUnit3D = sortArr[i];
				effRu.y = SPACE * i + offsetY;
				effRu.setPlayCompleteCallBack(avatarRuPlayComplete, _owner.avatar);
				effRu.play(0);
				
				posY = effRu.y;
			}
			if (i > 0)
			{
				posY += 60;
			}
			else
			{
				posY = -(_owner.headFace as HeadFace).offsetY + 65;
			}
			return posY;
		}
		
		/**
		 * 播放完成回调
		 * @param avatar
		 * @param ru
		 *
		 */
		private function avatarRuPlayComplete(avatar : RenderSet3D, ru : RenderUnit3D) : void
		{
			//			removeEffect(ru);
		}
		
		/**
		 * 删除特效
		 * @param ru
		 *
		 */
		public function removeEffect(ru : RenderUnit3D) : void
		{
			if (_owner)
			{
				_effectMap.remove(ru.id + "_" + ru.type);
				_owner.avatar.removeRenderUnit(ru);
				(_owner.headFace as HeadFace).updateAllPosition();
			}
		}
		
		/**
		 * 排序
		 * @param effectRuA
		 * @param effectRuB
		 * @return
		 *
		 */
		private static function onSort(effectRuA : RenderUnit3D, effectRuB : RenderUnit3D) : int
		{
			if (effectRuA.id < effectRuB.id)
				return 1;
			else if (effectRuA.id > effectRuB.id)
				return -1;
			return 0;
		}
		
		/**
		 * 移除特效
		 * @param atkor 场景角色
		 * @param type 换装部件类型
		 * @param id 换装ID
		 *
		 */
		public function removeEffectById(id : Number, unitType : String) : void
		{
			var effRu : RenderUnit3D = _effectMap.getValue(id + "_" + unitType);
			if (effRu == null)
				return;
			removeEffect(effRu);
		}
		
		/**
		 * 移除所有特效
		 *
		 */
		public function removeAllEffects() : void
		{
			if (_owner)
			{
				var keys : Array = _effectMap.keys();
				for each (var key : String in keys)
				{
					var effRu : RenderUnit3D = _effectMap.getValue(key);
					_owner.avatar.removeRenderUnit(effRu);
				}
				_effectMap.clear();
			}
		}
		
		/**
		 *销毁
		 *
		 */
		public function dispose() : void
		{
			if (_effectMap != null && _effectMap.length > 0)
			{
				removeAllEffects();
			}
			_effectMap = null;
			_owner = null;
		}
	}
}
