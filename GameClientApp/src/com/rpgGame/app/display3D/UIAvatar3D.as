package com.rpgGame.app.display3D
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.AvatarInfo;
	import com.rpgGame.coreData.cfg.ZhanQiConfigData;
	import com.rpgGame.coreData.cfg.model.AvatarClothesResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarDeputyWeaponResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarHairResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarWeapontResCfgData;
	import com.rpgGame.coreData.cfg.model.HeroModelCfgData;
	import com.rpgGame.coreData.clientConfig.AvatarClothesRes;
	import com.rpgGame.coreData.clientConfig.AvatarDeputyWeaponRes;
	import com.rpgGame.coreData.clientConfig.AvatarHairRes;
	import com.rpgGame.coreData.clientConfig.AvatarWeaponRes;
	import com.rpgGame.coreData.clientConfig.HeroModel;
	import com.rpgGame.coreData.clientConfig.Q_warflag;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
	import com.rpgGame.netData.player.bean.PlayerBriefInfo;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import feathers.controls.UIAsset;
	import feathers.core.FeathersControl;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 *用于UI上的带动作的3d模型展示
	 * 模型位置默认和容器底部居中对齐
	 * @author dik
	 * 
	 */
	public class UIAvatar3D extends Inter3DContainer
	{
		private static const HELPER_POINT : Point = new Point();
		private var avatar3d:InterObject3D;
		private var role:SceneRole;
		private var touchZone:UIAsset;
		private var _touchID:int=-1;
		private var startX:Number;
		private var defaultRotationY:int;
		private var _roleData:RoleData;
		
		/**
		 * 
		 * @param container avatar显示的父容器,交互区域有多大，在编辑器里面就拉多大,方便布局
		 * 
		 */
		public function UIAvatar3D(container:DisplayObjectContainer=null,scale:Number=1.0)
		{
			super();
			avatar3d=new InterObject3D();
			_roleData= new RoleData(0);
			this.role = SceneRole.create(SceneCharType.DUMMY, _roleData.id);
			role.rotationX = 45;
			this.role.data = _roleData;
			avatar3d.setRenderUnit(role);
			role.setScale(scale);
			
			role.avatar.shareMaterials = false;
			role.avatar.lightPicker = Stage3DLayerManager.screenLightPicker;
			this.addChild3D(avatar3d);
			bindContainer(container);
			
			transition(RoleStateType.ACTION_IDLE); //切换到“站立状态”
			transition(RoleStateType.ACTION_SHOW); //切换到“站立状态”
		}
		
		/**
		 *获取换装信息  
		 * @return 
		 * 
		 */
		public function get avatarInfo():AvatarInfo
		{
			return _roleData.avatarInfo;
		}

		/**
		 *绑定到对应的容器 
		 * 默认和容器底部居中对齐
		 * @param container
		 * 
		 */
		public function bindContainer(container:DisplayObjectContainer):void
		{
			if(container){
				container.addChild(this);
				this.x=container.width>>1;
				this.y=container.height;
				updateTouchZone();
			}
		}
		
		private function updateTouchZone():void
		{
			if(touchable&&parent){
				if(!touchZone){
					this.touchZone=new UIAsset();
					touchZone.styleName="ui/common/hover/xuanqukuang2_alpha.png";//一张透明九宫作为交互背景图
					touchZone.addEventListener(TouchEvent.TOUCH,onTouch);
				}
				touchZone.width=parent.width;
				touchZone.height=parent.height;
				parent.addChild(touchZone);
			}
		}
		
		private function onTouch(e : TouchEvent) : void
		{
			if(!this.touchable){
				return;
			}
			
			var touch : Touch;
			if(_touchID!=-1){
				touch = e.getTouch(touchZone,null,this._touchID);
				if (!touch)
					return;
				if (touch.phase == TouchPhase.MOVED)
				{
					var movex:Number=touch.globalX-startX;
					avatar3d.rotationY = avatar3d.rotationY+movex;
				}else if (touch.phase == TouchPhase.ENDED)	{
					this._touchID = -1;
					avatar3d.rotationY = defaultRotationY;
				}
			}else{
				touch = e.getTouch(this.touchZone, TouchPhase.BEGAN);
				if(touch){
					this._touchID=touch.id;
					startX=touch.globalX;
				}
			}
			
			var t : Touch = e.getTouch(this.touchZone, TouchPhase.ENDED);
			if (t != null && t.target != null && this.stage != null)
			{
				t.getLocation(this.stage, HELPER_POINT);
				var isInBounds : Boolean = true;
				if (t.target is DisplayObjectContainer)
				{
					isInBounds = DisplayObjectContainer(t.target).contains(this.stage.hitTest(HELPER_POINT));
				}
				var isEnabled : Boolean = true;
				if (t.target is FeathersControl)
				{
					isEnabled = FeathersControl(t.target).isEnabled;
				}
				if (isInBounds && isEnabled)
					onTouchTarget(t.target);
			}
		}
		
		private function onTouchTarget(target : DisplayObject) : void
		{
			if(touchZone==target&&this.role){
				this.role.stateMachine.transition(RoleStateType.ACTION_SHOW);
			}
		}
		
		/**
		 *转换动作 
		 * @param actionType
		 * 
		 */
		public function transition(actionType : int) : void
		{
			if (role != null)
				role.stateMachine.transition(actionType);
		}
		
		/**
		 *设置可见性 
		 * @param value
		 * 
		 */
		override public function set visible(value : Boolean) : void
		{
			super.visible = value;
			role.visible = value;
		}
		
		override public function dispose() : void
		{
			if (role)
			{
				SceneRole.recycle(role);
				role = null;
			}
			if(avatar3d){
				avatar3d.dispose();
				avatar3d=null;
			}
			if(touchZone){
				touchZone.removeEventListener(TouchEvent.TOUCH,onTouch);
				touchZone=null;
			}
			super.dispose();
		}
		
		/**
		 *缩放 
		 * @param num
		 * 
		 */
		public function setScale(num:Number):void
		{
			role.setScale(num);
		}
		
		/**
		 *设置旋转
		 * @param value
		 * 
		 */
		public function setRotationY(value:int):void
		{
			defaultRotationY=value;
			avatar3d.rotationY=defaultRotationY;
		}
		
		/**
		 *更新主体 
		 * @param res
		 * 
		 */
		public function updateBodyWithRes(res:String,animat:String=null):void
		{
			avatarInfo.setBodyResID(res,null);
			AvatarManager.updateBody(role);
		}
		
		/**
		 *根据AvatarInfo更新
		 * 
		 */
		public function updateWithAvatarInfo(info:AvatarInfo):void
		{
			avatarInfo.setBodyResID(info.bodyResID, info.bodyAnimatResID);
			avatarInfo.hairResID = info.hairResID;
			avatarInfo.weaponResID = info.weaponResID;
			avatarInfo.weaponEffectID = info.weaponEffectID;
			avatarInfo.weaponEffectScale = info.weaponEffectScale;
			avatarInfo.deputyWeaponResID = info.deputyWeaponResID;
			avatarInfo.deputyWeaponEffectID=info.deputyWeaponEffectID;
			avatarInfo.deputyWeaponEffectScale=info.deputyWeaponEffectScale;
			avatarInfo.zhanqiResID=info.zhanqiResID;
			AvatarManager.updateAllPart(role);			//执行主换装更新
		}
		
		
		public function updateWithPlayerAppearanceInfo(info:PlayerAppearanceInfo):void
		{
			var animatResID : String = null;
			
			var clothesRes : AvatarClothesRes = AvatarClothesResCfgData.getInfo(info.cloths);
			if (!clothesRes)
			{
				clothesRes = AvatarClothesResCfgData.getInfo(info.job);
			}
			
			var bodyResID:String = clothesRes.bodyRes;
			var bodyEffectResID:String = clothesRes.effectRes;
			
			var hairRes : AvatarHairRes = AvatarHairResCfgData.getInfo(info.hair);
			if (!hairRes)
			{
				hairRes = AvatarHairResCfgData.getInfo(clothesRes.hairResId);
			}
			var hairResID:String = hairRes.hairRes;
			var heroModel : HeroModel = HeroModelCfgData.getInfo(info.body);
			switch (info.job)
			{
				case 1:
					animatResID = heroModel.animatRes_bingjia;	
					break;
				case 2:
					if(info.sex)
					{
						animatResID = heroModel.animatRes_mojia_man;
					}
					else
					{
						animatResID = heroModel.animatRes_mojia_woman;
					}
					break;
				case 3:
					if(info.sex)
					{
						animatResID = heroModel.animatRes_mojia_man;
					}
					else
					{
						animatResID = heroModel.animatRes_mojia_woman;
					}
					break;
				case 4:
					animatResID = heroModel.animatRes_yijia;
					break;
				case 5:
					animatResID = heroModel.animatRes_waibao;
					break;
			}
			
			
			var weaponResID : String = null;
			var weaponEffectResID : String = "";
			var weaponEffectScale : int = 0;
			var weaponEffectOffset : Vector3D = null;
			var deputyWeaponResID : String = null;
			var deputyWeaponEffectResID : String = "";
			var deputyWeaponEffectScale : int = 0;
			var deputyWeaponEffectOffset : Vector3D = null;
			var weaponRes : AvatarWeaponRes = AvatarWeapontResCfgData.getInfo(info.weapon);
			if (weaponRes)
			{
				weaponResID = weaponRes.res;
				weaponEffectResID = weaponRes.effectRes;
				weaponEffectScale = weaponRes.effectScale;
				weaponEffectOffset = new Vector3D(weaponRes.effectOffsetX, weaponRes.effectOffsetY, weaponRes.effectOffsetZ);
			}
			var deputyWeaponRes : AvatarDeputyWeaponRes = AvatarDeputyWeaponResCfgData.getInfo(info.second_weapon);
			if (deputyWeaponRes)
			{
				deputyWeaponResID = deputyWeaponRes.res;
				deputyWeaponEffectResID = deputyWeaponRes.effectRes;
				deputyWeaponEffectScale = deputyWeaponRes.effectScale;
				deputyWeaponEffectOffset = new Vector3D(deputyWeaponRes.effectOffsetX, deputyWeaponRes.effectOffsetY, deputyWeaponRes.effectOffsetZ);
			}
			
			//战旗暂时没给
			/*var zhanqiResID:String = "";
			var zhanqiInfo:Q_warflag = ZhanQiConfigData.getZhanQiDataById(info.warFlagModelId);
			if(zhanqiInfo)
			{
				zhanqiResID=zhanqiInfo.q_panel_show_id;
			}*/
			
			avatarInfo.setBodyResID(bodyResID, animatResID);
			avatarInfo.hairResID = hairResID;
			avatarInfo.bodyEffectID = bodyEffectResID;
			avatarInfo.weaponResID = weaponResID;
			avatarInfo.weaponEffectID = weaponEffectResID;
			avatarInfo.weaponEffectScale = weaponEffectScale;
			avatarInfo.weaponEffectOffset = weaponEffectOffset;
			avatarInfo.deputyWeaponResID = deputyWeaponResID;
			avatarInfo.deputyWeaponEffectID = deputyWeaponEffectResID;
			avatarInfo.deputyWeaponEffectScale = deputyWeaponEffectScale;
			avatarInfo.deputyWeaponEffectOffset = deputyWeaponEffectOffset;
//			avatarInfo.zhanqiResID = zhanqiResID;
			
			AvatarManager.updateAllPart(role);			//执行主换装更新
		}
		
		/**
		 *根据PlayerBriefInfo更新 
		 * @param info
		 * 
		 */
		public function updateWithPlayerBriefInfo(info:PlayerBriefInfo):void
		{
			var animatResID : String = null;
			
			var clothesRes : AvatarClothesRes = AvatarClothesResCfgData.getInfo(info.cloths);
			if (!clothesRes)
			{
				clothesRes = AvatarClothesResCfgData.getInfo(info.job);
			}
			
			var bodyResID:String = clothesRes.bodyRes;
			var bodyEffectResID:String = clothesRes.effectRes;
			
			var hairRes : AvatarHairRes = AvatarHairResCfgData.getInfo(info.hair);
			if (!hairRes)
			{
				hairRes = AvatarHairResCfgData.getInfo(clothesRes.hairResId);
			}
			var hairResID:String = hairRes.hairRes;
			var heroModel : HeroModel = HeroModelCfgData.getInfo(info.body);
			var zhanqiInfo:Q_warflag = ZhanQiConfigData.getZhanQiDataById(info.warFlagModelId);
			switch (info.job)
			{
				case 1:
					animatResID = heroModel.animatRes_bingjia;	
					break;
				case 2:
					if(info.sex)
					{
						animatResID = heroModel.animatRes_mojia_man;
					}
					else
					{
						animatResID = heroModel.animatRes_mojia_woman;
					}
					break;
				case 3:
					if(info.sex)
					{
						animatResID = heroModel.animatRes_mojia_man;
					}
					else
					{
						animatResID = heroModel.animatRes_mojia_woman;
					}
					break;
				case 4:
					animatResID = heroModel.animatRes_yijia;
					break;
				case 5:
					animatResID = heroModel.animatRes_waibao;
					break;
			}
			
			
			var weaponResID : String = null;
			var weaponEffectResID : String = "";
			var weaponEffectScale : int = 0;
			var weaponEffectOffset : Vector3D = null;
			var deputyWeaponResID : String = null;
			var deputyWeaponEffectResID : String = "";
			var deputyWeaponEffectScale : int = 0;
			var deputyWeaponEffectOffset : Vector3D = null;
			var weaponRes : AvatarWeaponRes = AvatarWeapontResCfgData.getInfo(info.weapon);
			if (weaponRes)
			{
				weaponResID = weaponRes.res;
				weaponEffectResID = weaponRes.effectRes;
				weaponEffectScale = weaponRes.effectScale;
				weaponEffectOffset = new Vector3D(weaponRes.effectOffsetX, weaponRes.effectOffsetY, weaponRes.effectOffsetZ);
			}
			var deputyWeaponRes : AvatarDeputyWeaponRes = AvatarDeputyWeaponResCfgData.getInfo(info.second_weapon);
			if (deputyWeaponRes)
			{
				deputyWeaponResID = deputyWeaponRes.res;
				deputyWeaponEffectResID = deputyWeaponRes.effectRes;
				deputyWeaponEffectScale = deputyWeaponRes.effectScale;
				deputyWeaponEffectOffset = new Vector3D(deputyWeaponRes.effectOffsetX, deputyWeaponRes.effectOffsetY, deputyWeaponRes.effectOffsetZ);
			}
			
			var zhanqiResID:String = "";
			if(zhanqiInfo)
			{
				zhanqiResID=zhanqiInfo.q_panel_show_id;
			}
			
			avatarInfo.setBodyResID(bodyResID, animatResID);
			avatarInfo.hairResID = hairResID;
			avatarInfo.bodyEffectID = bodyEffectResID;
			avatarInfo.weaponResID = weaponResID;
			avatarInfo.weaponEffectID = weaponEffectResID;
			avatarInfo.weaponEffectScale = weaponEffectScale;
			avatarInfo.weaponEffectOffset = weaponEffectOffset;
			avatarInfo.deputyWeaponResID = deputyWeaponResID;
			avatarInfo.deputyWeaponEffectID = deputyWeaponEffectResID;
			avatarInfo.deputyWeaponEffectScale = deputyWeaponEffectScale;
			avatarInfo.deputyWeaponEffectOffset = deputyWeaponEffectOffset;
			avatarInfo.zhanqiResID = zhanqiResID;
			
			AvatarManager.updateAllPart(role);			//执行主换装更新
		}
	
		
		/**
		 *根据部位和信息更新
		 * @param ID
		 * @param data
		 * 
		 */
		public function updateWithRenderUnitID(ID:int,data:AvatarInfo):void
		{
			role.updateWithRenderUnitID(ID,data);
		}
	}
}