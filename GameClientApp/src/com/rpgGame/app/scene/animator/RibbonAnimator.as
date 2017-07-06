package com.rpgGame.app.scene.animator
{
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.IRenderAnimator;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.display.BlendMode;
	import flash.display3D.Context3DCompareMode;
	
	import away3d.animators.CPUSpriteSheetAnimator;
	import away3d.containers.ObjectContainer3D;
	import away3d.materials.TextureMaterial;
	import away3d.ribbon.LightningRibbon;
	import away3d.textures.AsyncTexture2D;
	
	/**
	 * 条带动画 
	 * @author NEIL
	 * 
	 */	
	public class RibbonAnimator implements IRenderAnimator
	{
		private var _from:SceneRole;
		private var _to:SceneRole;
		private var _aktor:SceneRole;
		
		//自动追踪最多5个目标
		private var _targetList:Vector.<SceneRole>;
		private static const MAX_COUNT:int = 5;
		private var _lightList:Vector.<LightningRibbon>;
		
		private static var LightMaterial:TextureMaterial;
		
		protected var _renderSet : RenderSet3D;
		private var _isAttachUnit:Boolean;
		
		public function RibbonAnimator()
		{
			_lightList = new Vector.<LightningRibbon>();
		}
		
		public function setOwner(owner:BaseObj3D):void
		{
			_renderSet = owner as RenderSet3D;
		}
		
		private static const excuteInterval:int = 200;
		private var _excuteDelay:int = excuteInterval;
		private var _recycleDelay:int = 500;
		public function update(gapTm:uint):void
		{
			_excuteDelay -= gapTm;
			_recycleDelay -= gapTm;
			
			if(_excuteDelay <= 0)
			{
				_excuteDelay = excuteInterval;
				if(_targetList.length == 0)
				{
					dispose();
				}
				else
				{
					_from = _to;
					_to = _targetList.shift();
					light(_from,_to);
				}
				
			}
			
			if(_recycleDelay <= 0)
			{
				_recycleDelay = excuteInterval;
				var ribbon:LightningRibbon = _lightList.shift();
				if(ribbon)
				{
					ribbon.stop();
					ribbon.dispose();
					//					SceneManager.scene.gameScene3d.removeChild(ribbon);
				}
			}
		}
		
		public function dispose():void
		{
			SceneManager.removeSceneObjFromScene(_renderSet);
			for each(var ribbon:LightningRibbon in _lightList)
			{
				ribbon.stop();
				ribbon.dispose();
				//				SceneManager.scene.gameScene3d.removeChild(ribbon);
			}
			_lightList.length = 0;
			_excuteDelay = excuteInterval;
			_recycleDelay = 1000;
			_from = _to = _aktor = null;
			_renderSet = null;
		}
		
		public function initRibbonData(imgUrl:String,targetList:Vector.<SceneRole>,aktor:SceneRole,isAttachUnit:Boolean=false):void
		{
			if(LightMaterial == null)
			{
				var tex:AsyncTexture2D = new AsyncTexture2D(true, true, false);
				tex.load(ClientConfig.getDynTexture(imgUrl));
				
				LightMaterial = new TextureMaterial(tex);
				LightMaterial.bothSides = true;
				LightMaterial.blendMode = BlendMode.ADD;
				LightMaterial.depthCompareMode = Context3DCompareMode.LESS;
			}
			
			_isAttachUnit = isAttachUnit;
			
			_targetList = targetList;
			_targetList.sort(onSortNearestRole);
			
			_to = _targetList.shift();
			_from = _aktor = aktor;
			
			//			addTimeHandlerAt(4000, on4000Ms);
			
			light(_from,_to);
		}
		
		//		private function on4000Ms():void
		//		{
		//			recycleEnable = true;
		//		}
		
		private function light(from:SceneRole, to:SceneRole):void
		{
			if(_from && _to&&_from.avatar && _to.avatar)
			{
				var fromObj : ObjectContainer3D;
				if(_isAttachUnit)
				{
					var fightSoulRole:SceneRole = (SceneManager.getScene().getSceneObjByID(from.id, SceneCharType.FIGHT_SOUL) as SceneRole);
					if(fightSoulRole!=null)
					{
						var fightsoul:RenderUnit3D = fightSoulRole.avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY);
						fromObj = fightsoul.getChildByName(BoneNameEnum.b_l_wq_01);
					}	
				}
				else
				{
					fromObj = from.avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY).getChildByName(BoneNameEnum.c_0_body_01);
				}
				var toObj:ObjectContainer3D = to.avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY).getChildByName(BoneNameEnum.c_0_body_01);
				if (null == fromObj || null == toObj) {
					return;
				}
				trace(fromObj.position);
				trace(toObj.position);
				
				var ribbon:LightningRibbon = new LightningRibbon(fromObj, toObj, 16, 64, LightMaterial);
				ribbon.shakeTimer = 100;
				ribbon.shakeAmp=50;
				ribbon.animator = new CPUSpriteSheetAnimator(8, 1, 15, 8);
				ribbon.start();
				
				_lightList.push(ribbon);
				
				SceneManager.scene.gameScene3d.addChild(ribbon);
			}
		}
		
		/**
		 * 比较两个角色里主角的距离
		 * @param charA
		 * @param charB
		 * @return
		 */
		private static function onSortNearestRole(roleA : SceneRole, roleB : SceneRole) : int
		{
            if (null == roleA) {
                return 1;
            }
            if (null == roleB) {
                return -1;
            }
			if (roleA.type != roleB.type) {
				return parseInt(roleA.type) - parseInt(roleB.type);
			}
			var disA : Number = MathUtil.getDistanceNoSqrt(MainRoleManager.actor.x, MainRoleManager.actor.z, roleA.x, roleA.z);
			var disB : Number = MathUtil.getDistanceNoSqrt(MainRoleManager.actor.x, MainRoleManager.actor.z, roleB.x, roleB.z);
			if (disA > disB)
			{
				return 1;
			}
			else
			{
				return -1;
			}
			return 0;
		}
	}
}