package com.rpgGame.app.scene.animator
{
	import com.game.engine3D.scene.render.RenderSet3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.IRenderAnimator;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.MapEvent;
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
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	
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
		
		private static var LightMaterialMap:HashMap=new HashMap();
		private var _lightMaterial:TextureMaterial;
		protected var _renderSet : RenderSet3D;
		private var _isAttachUnit:Boolean;
		//现在只有一个目标了
		private var _targetId:long;
		public function RibbonAnimator()
		{
			_lightList = new Vector.<LightningRibbon>();
			EventManager.addEvent(MapEvent.ROLE_DIE,onMonsterDie);
			EventManager.addEvent(MapEvent.UPDATE_MAP_ROLE_REMOVE,onMonsterRemoved);
		}
		
		private function onMonsterRemoved(...arg):void
		{
			// TODO Auto Generated method stub
			if (arg[0]==SceneCharType.MONSTER&&_targetId.ToGID()==arg[1]) 
			{
				dispose();
			}
		}
		
		private function onMonsterDie(monsterId:long):void
		{
			// TODO Auto Generated method stub
			if (monsterId.EqualTo(_targetId)) 
			{
				dispose();
			}
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
					//dispose();
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
				//一次销毁两个
				ribbon = _lightList.shift();
				if(ribbon)
				{
					ribbon.stop();
					ribbon.dispose();
					//					SceneManager.scene.gameScene3d.removeChild(ribbon);
				}
				if (_lightList.length==0) 
				{
					dispose();
				}
			}
		}
		
		public function dispose():void
		{
			EventManager.removeEvent(MapEvent.ROLE_DIE,onMonsterDie);
			EventManager.removeEvent(MapEvent.UPDATE_MAP_ROLE_REMOVE,onMonsterRemoved);
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
			_targetId=null;
			_lightMaterial=null;
		}
		
		public function initRibbonData(imgUrl:String,targetList:Vector.<SceneRole>,aktor:SceneRole,isAttachUnit:Boolean=false):void
		{
			_lightMaterial=LightMaterialMap.getValue(imgUrl);
			if(_lightMaterial == null)
			{
				var tex:AsyncTexture2D = new AsyncTexture2D(true, true, false);
				tex.load(ClientConfig.getDynTexture(imgUrl));
				
				_lightMaterial = new TextureMaterial(tex);
				_lightMaterial.bothSides = true;
				_lightMaterial.blendMode = BlendMode.ADD;
				_lightMaterial.depthCompareMode = Context3DCompareMode.LESS;
				LightMaterialMap.put(imgUrl,_lightMaterial);
			}
			
			_isAttachUnit = isAttachUnit;
			
			_targetList = targetList;
			_targetList.sort(onSortNearestRole);
			
			_to = _targetList.shift();
			_from = _aktor = aktor;
			_targetId=_to.data.serverID;
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
				var seg:int=10;
				var h:int=64;
				var ribbon:LightningRibbon = new LightningRibbon(fromObj, toObj, seg, h, _lightMaterial);
				ribbon.shakeTimer = 100;
				ribbon.shakeAmp=60;
				var fps:int=12;
				ribbon.animator = new CPUSpriteSheetAnimator(8, 1, fps, 8);
				ribbon.start();
				
				_lightList.push(ribbon);
				
				SceneManager.scene.gameScene3d.addChild(ribbon);
				
				ribbon = new LightningRibbon(toObj,fromObj , seg, h, _lightMaterial);
				ribbon.shakeTimer = 100;
				ribbon.shakeAmp=60;
				
				ribbon.animator = new CPUSpriteSheetAnimator(8, 1, fps, 8);
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