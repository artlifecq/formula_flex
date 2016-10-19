package com.rpgGame.app.graphics
{
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData;
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
		private static const OFFSETY : int = 150;
		/** 去重之後的数组 **/
		private var _effectMap : HashMap = new HashMap();
		private var _owner:SceneRole;
		
		public function HeadFaceEffectGroup(owner:SceneRole)
		{
			_owner=owner;
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
		public function addEffect( unitID : int, unitType : String, effectUrl : String, repeat : int = 1 ) : void
		{
			var effectRu : RenderUnit3D=_effectMap.getValue(unitID+"_"+unitType);
			if( effectRu == null )
			{
				var rud : RenderParamData = new RenderParamData(unitID, unitType, ClientConfig.getEffect(effectUrl));
				rud.clearSameType=false;
				effectRu = _owner.avatar.addRenderUnitToChild(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_name_01, rud);
				if( effectRu != null )
				{
					effectRu.repeat = repeat;
					effectRu.rotationY = 0;
					_effectMap.add(unitID+"_"+unitType,effectRu);
				}
			}
			layout();
			
		}
		
		/**
		 * 刷新布局 
		 * 
		 */		
		private function layout():void
		{
			var sortArr:Array=_effectMap.getValues().slice();
			sortArr.sort(onSort); //策划要求固定排序，从下到上 鸡毛信→经书
			//坐标Y  
			for (var i : int = 0; i < sortArr.length; i++)
			{
				var effRu : RenderUnit3D=sortArr[i];
				effRu.y = SPACE * i + OFFSETY;
				effRu.setPlayCompleteCallBack(avatarRuPlayComplete, _owner.avatar);
				effRu.play(0);
			}
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
		public function removeEffect(ru : RenderUnit3D):void
		{
			if(_owner)
			{
				_effectMap.remove(ru.id +"_"+ ru.type);
				_owner.avatar.removeRenderUnit(ru);
				layout();
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
		public function removeEffectById(id:Number,unitType : String) : void
		{
			var effRu : RenderUnit3D=_effectMap.getValue(id+"_"+unitType);
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
			if(_owner)
			{
				var keys:Array=_effectMap.keys();
				for each(var key:String in keys)
				{
					var effRu : RenderUnit3D=_effectMap.getValue(key);
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
			if(_effectMap)
			{
				removeAllEffects();
				_effectMap=null;
			}
			_owner=null;
		}
	}
}