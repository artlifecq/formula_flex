package com.rpgGame.app.scene
{
	import com.game.engine3D.core.poolObject.InstancePool;
	import com.game.engine3D.vo.BaseRole;
	import com.rpgGame.app.graphics.BaseHeadFace;
	import com.rpgGame.app.graphics.BubbleDialogFace;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.state.role.RoleStateMachine;
	import com.rpgGame.coreData.cfg.EvilConfig;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.model.AvatarClothesResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarDeputyWeaponResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarHairResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarWeapontResCfgData;
	import com.rpgGame.coreData.clientConfig.AvatarClothesRes;
	import com.rpgGame.coreData.clientConfig.AvatarDeputyWeaponRes;
	import com.rpgGame.coreData.clientConfig.AvatarHairRes;
	import com.rpgGame.coreData.clientConfig.AvatarWeaponRes;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Vector3D;
	
	import starling.display.Sprite;
	
	
	/**
	 *
	 * 场景角色
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 上午11:12:28
	 *
	 */
	public class SceneRole extends BaseRole
	{
		/** 半径 **/
		protected var _radius : int = EvilConfig.ELE_DEFAULT_RADIUS;
		//---------------------------对象池---------------------------
		private static var _pool : InstancePool = new InstancePool("SceneRole", 600);
		
		private static var _cnt : int = 0;
		
		/**
		 * 生成一个RenderUnit
		 * @param $type
		 * @param $value
		 */
		public static function create(type : String, id : Number) : SceneRole
		{
			_cnt++;
			return _pool.createObj(SceneRole, type, id) as SceneRole;
		}
		
		public static function recycle(role : SceneRole) : void
		{
			if (!role)
				return;
			_cnt--;
			_pool.recycleObj(role);
		}
		
		public static function get cnt() : int
		{
			return _cnt;
		}
		
		private var _stateMachine : RoleStateMachine;
		private var _buffSet : BuffSet;
		private var _headFace : BaseHeadFace;
		private var _dialogFace : BubbleDialogFace;
		protected var _fightChange : Boolean = false;
		public var mapAreaTypes : Array = [];
		public var isWheel : Boolean = false;
		public var isSwimming:Boolean = false;
		
		public function SceneRole(type : String, id : Number)
		{
			super(type, id);
		}
		
		public function get stateMachine() : RoleStateMachine
		{
			return _stateMachine;
		}
		
		public function get buffSet() : BuffSet
		{
			return _buffSet;
		}
		
		override public function reSet($parameters : Array) : void
		{
			super.reSet($parameters);
			_stateMachine = RoleStateMachine.create(this);
			_buffSet = BuffSet.create(this);
			mapAreaTypes.length = 0;
			isWheel = false;
			
			
		}
		
		public function get headFace() : BaseHeadFace
		{
			return _headFace;
		}
		
		public function set headFace(value : BaseHeadFace) : void
		{
			_headFace = value;
		}
		
		public function get dialogFace() : BubbleDialogFace
		{
			return _dialogFace;
		}
		
		public function set dialogFace(value : BubbleDialogFace) : void
		{
			_dialogFace = value;
		}
		
		
		public function get boneNameContainer() : Sprite
		{
			if (_headFace == null)
				return null;
			
			return _headFace;
		}
		
		/**销毁对象 */
		override public function destroy() : void
		{
			recycle(this);
		}
		
		override protected function addToGraphic() : void
		{
			super.addToGraphic();
			if (_headFace)
				_headFace.show();
			if (_dialogFace)
				_dialogFace.show();
		}
		
		override protected function removeFromGraphic() : void
		{
			super.removeFromGraphic();
			if (_headFace)
				_headFace.hide();
			if (_dialogFace)
				_dialogFace.hide();
		}
		
		override public function setAttachVisible(attachType : String, visible : Boolean) : void
		{
			super.setAttachVisible(attachType, visible);
			if (_headFace)
				_headFace.displayVisible(attachType, visible);
		}
		
		override protected function onAddCamouflageEntity() : void
		{
			super.onAddCamouflageEntity();
			if (_headFace)
				_headFace.isCamouflage = true;
			
			//设置成伪装者的时候需要隐藏血纹场景模型
			setFightSoulRoleVisible(false);
		}
		
		override protected function onRemoveCamouflageEntity() : void
		{
			super.onRemoveCamouflageEntity();
			if (_headFace)
				_headFace.isCamouflage = false;
			setFightSoulRoleVisible(true);
		}
		
		override public function dispose() : void
		{
			if (_stateMachine)
			{
				RoleStateMachine.recycle(_stateMachine);
				_stateMachine = null;
			}
			if (_buffSet)
			{
				BuffSet.recycle(_buffSet);
				_buffSet = null;
			}
			if (_headFace)
			{
				_headFace.recycleSelf();
				_headFace = null;
			}
			if (_dialogFace)
			{
				_dialogFace.recycleSelf();
				_dialogFace = null;
			}
			mapAreaTypes.length = 0;
			isWheel = false;
			super.dispose();
		}
		
		public function get fightChange() : Boolean
		{
			return _fightChange;
		}
		
		public function set fightChange(value : Boolean) : void
		{
			_fightChange = value;
		}
		
		private function setFightSoulRoleVisible(flag : Boolean) : void
		{
			if (this.data is HeroData && (this.data as HeroData).fightSoulLevel > 0)
			{
				var role : SceneRole = SceneManager.getScene().getSceneObjByID(this.id, SceneCharType.FIGHT_SOUL) as SceneRole;
				if (role)
				{
					role.visible = flag;
				}
			}
		}
		
		private function get roleData():RoleData
		{
			return this.data as RoleData;
		}
		
		
		//换装逻辑
		/**
		 *衣服换装 
		 * @param body
		 * @param animat
		 * 
		 */
		public function updateBody(cloths : int):void
		{
			if(!roleData){
				return;
			}
			
			var clothesRes : AvatarClothesRes = AvatarClothesResCfgData.getInfo(cloths);
			var heroData:HeroData=data as HeroData;
			if(heroData){
				heroData.cloths=cloths;
			}
			if (!clothesRes&&heroData)
			{
				clothesRes = AvatarClothesResCfgData.getInfo(heroData.job);
			}
			if(clothesRes){
				if(clothesRes.bodyRes!=roleData.avatarInfo.bodyResID){
					roleData.avatarInfo.setBodyResID(clothesRes.bodyRes, roleData.avatarInfo.bodyAnimatResID);
					AvatarManager.updateBody(this);
				}
				if(roleData.avatarInfo.bodyEffectID!=clothesRes.effectRes){
					roleData.avatarInfo.bodyEffectID = clothesRes.effectRes;
					AvatarManager.updateBodyEft(this);
				}
			}
		}
		
		/**
		 * 穿“效果方法类型特效”
		 * @param bodyMethodTypeEffectResID
		 * 
		 */
		public function updateBodyMethodType(bodyMethodTypeEffectResID:String):void
		{
			if(!roleData){
				return;
			}
			if(roleData.avatarInfo.bodyMethodTypeEffectResID==bodyMethodTypeEffectResID){
				return;
			}
			roleData.avatarInfo.bodyMethodTypeEffectResID=bodyMethodTypeEffectResID;
			AvatarManager.updateBodyMethodType(this);
		}
		
		/**
		 *衣服特效 
		 * @param bodyEffectResID
		 * 
		 */
		public function updateBodyEft(bodyEffectResID : String):void
		{
			if(!roleData){
				return;
			}
			if(roleData.avatarInfo.bodyEffectID==bodyEffectResID){
				return;
			}
			roleData.avatarInfo.bodyEffectID = bodyEffectResID;
			AvatarManager.updateBodyEft(this);
		}
		
		/**
		 *更新头发 
		 * @param hairResID
		 * 
		 */
		public function updateHair(hair : int):void
		{
			if(!roleData){
				return;
			}
			
			var hairRes : AvatarHairRes = AvatarHairResCfgData.getInfo(hair);
			if(roleData.avatarInfo.hairResID==hairRes.hairRes){
				return;
			}
			
			var heroData:HeroData=data as HeroData;
			if(heroData){
				heroData.hair=hair;
			}
			roleData.avatarInfo.hairResID=hairRes.hairRes;
			AvatarManager.updateHair(this);
		}
		
		/**
		 *更新武器 
		 * 
		 */
		public function updateWeapon(weapon:int):void
		{
			var heroData:HeroData=data as HeroData;
			if(!heroData||heroData.weapon==weapon){
				return;
			}
			var weaponRes : AvatarWeaponRes = AvatarWeapontResCfgData.getInfo(weapon);
			if (weaponRes)
			{
				roleData.avatarInfo.weaponResID = weaponRes.res;
				roleData.avatarInfo.weaponEffectID = weaponRes.effectRes;
				roleData.avatarInfo.weaponEffectScale = weaponRes.effectScale;
				roleData.avatarInfo.weaponEffectOffset = new Vector3D(weaponRes.effectOffsetX, weaponRes.effectOffsetY, weaponRes.effectOffsetZ);
			}else{
				roleData.avatarInfo.weaponResID = null;
				roleData.avatarInfo.weaponEffectID = null;
			}
			AvatarManager.updateWeapon(this);
		}
		
		/**
		 *更新副武器 
		 * @param deputyWeapon
		 * 
		 */
		public function updateDeputyWeapon(deputyWeapon:int):void
		{
			var heroData:HeroData=data as HeroData;
			if(!heroData||heroData.deputyWeapon==deputyWeapon){
				return;
			}
			var deputyWeaponRes : AvatarDeputyWeaponRes = AvatarDeputyWeaponResCfgData.getInfo(deputyWeapon);
			if (deputyWeaponRes)
			{
				roleData.avatarInfo.deputyWeaponResID = deputyWeaponRes.res;
				roleData.avatarInfo.deputyWeaponEffectID = deputyWeaponRes.effectRes;
				roleData.avatarInfo.deputyWeaponEffectScale = deputyWeaponRes.effectScale;
				roleData.avatarInfo.deputyWeaponEffectOffset =new Vector3D(deputyWeaponRes.effectOffsetX, deputyWeaponRes.effectOffsetY, deputyWeaponRes.effectOffsetZ);
			}else{
				roleData.avatarInfo.deputyWeaponResID = null;
				roleData.avatarInfo.deputyWeaponEffectID = null;
			}
			AvatarManager.updateDeputyWeapon(this);
		}
		
		/**
		 *更新战旗 
		 * @param zhanqiResID
		 * 
		 */
		public function updateFlag(zhanqiResID:String):void
		{
			if(!roleData){
				return;
			}
			if(roleData.avatarInfo.zhanqiResID==zhanqiResID){
				return;
			}
			roleData.avatarInfo.zhanqiResID=zhanqiResID;
			AvatarManager.updateFlag(this);
		}
		
		/**
		 * 更新战魂
		 * @param fightsoulResID
		 * @param eftResID
		 * 
		 */
		public function updateFightSoul(fightsoulResID:String,eftResID:String):void
		{
			if(!roleData){
				return;
			}
			if(roleData.avatarInfo.fightsoulResID==fightsoulResID&&roleData.avatarInfo.fightsoulEffectResID==eftResID){
				return;
			}
			roleData.avatarInfo.fightsoulResID=fightsoulResID;
			roleData.avatarInfo.fightsoulEffectResID=eftResID;
			AvatarManager.updateFightSoul(this);
		}
		
		/**
		 *更新坐骑 
		 * @param mount
		 * 
		 */
		public function updateMount(mount:int):void
		{
			var heroData:HeroData=data as HeroData;
			if(!heroData){
				return;
			}
			
			var mountModel :Q_horse = HorseConfigData.getMountDataById(mount);
			if (!mountModel)
			{
				return;
			}
			
			heroData.mount=mount;
			
			var mountResID:String = mountModel.q_skinResID;
			var mountAnimatResID:String = mountModel.q_animatResID;			
			if(roleData.avatarInfo.mountResID==mountResID&&roleData.avatarInfo.mountAnimatResID==mountAnimatResID){
				return;
			}
			roleData.avatarInfo.setMountResID(mountResID,mountAnimatResID);
			AvatarManager.updateMount(this);
		}
		
		/**
		 *更新特效 
		 * @param effectResID
		 * 
		 */
		public function updateEffect(effectResID:String):void
		{
			if(!roleData){
				return;
			}
			if(roleData.avatarInfo.effectResID==effectResID){
				return;
			}
			roleData.avatarInfo.effectResID=effectResID;
			AvatarManager.updateMount(this);
		}
	}
}
