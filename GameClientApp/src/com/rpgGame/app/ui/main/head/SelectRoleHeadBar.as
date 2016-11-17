package com.rpgGame.app.ui.main.head
{
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.main.shortcut.BuffListBar;
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.app.utils.RoleFaceMaskEffectUtil;
	import com.rpgGame.core.events.SceneCharacterEvent;
	import com.rpgGame.core.events.SceneInteractiveEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.GlobalSettingCfgData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
	import com.rpgGame.coreData.clientConfig.AvatarResConfig;
	import com.rpgGame.coreData.clientConfig.GlobalSetting;
	import com.rpgGame.coreData.configEnum.EnumGlobalSetting;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.lang.LangYunBiao;
	import com.rpgGame.coreData.role.BiaoCheData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import flash.geom.Point;
	
	import app.message.MonsterDataProto.MonsterType;
	
	import feathers.controls.StateSkin;
	import feathers.controls.UINumber;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.head.MonsterBossHeadBarSkin;
	import org.mokylin.skin.mainui.head.MonsterMiddleHeadBarSkin;
	import org.mokylin.skin.mainui.head.MonsterSmallHeadBarSkin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.display.Sprite;

	public class SelectRoleHeadBar extends SkinUI
	{
		private var skin : StateSkin;
		private var _defaultParent : Sprite;
		private var bloodClip : Quad;
		/** 血量 **/
		private var bloodWidth : int;
		/** 血条最大序号 **/
		private var lefterMax : int;
		/** 场景角色 **/
		private var _role : SceneRole;
		/** Buff列表栏 **/
		private var _buffListBar : BuffListBar;
		/** NPC模型 **/
		private var _avatar3D : InterAvatar3D;
		/** 普通怪物血条 **/
		private var skin_monster_small : MonsterSmallHeadBarSkin;
		/** 精英怪物血条 **/
		private var skin_monster_middle : MonsterMiddleHeadBarSkin;
		/** BOOS怪物血条 **/
		private var skin_monster_boss : MonsterBossHeadBarSkin;

		public function SelectRoleHeadBar()
		{
			bloodClip = new Quad(100, 20);
			EventManager.addEvent(SceneInteractiveEvent.SELECTED_SCENE_ROLE, changRole);
			EventManager.addEvent(SceneCharacterEvent.SCENE_CHAR_DATA_UPDATE, updateRoleData);
			initPanel();
		}

		/**
		 * 初始化
		 *
		 */
		private function initPanel() : void
		{
			_buffListBar = new BuffListBar(null, IcoSizeEnum.SIZE_22, GridBGType.GRID_SIZE_22, 25, 25, 10, 10, false);

			_avatar3D = new InterAvatar3D();
		}

		public function set defaultParent(sprite : Sprite) : void
		{
			_defaultParent = sprite;
		}

		/**
		 * 布局
		 * @param sWidth
		 * @param sHeight
		 *
		 */
		public function resize(sWidth : int, sHeight : int) : void
		{
			x = skin != null ? (sWidth - skin.width) / 2 : 420;
			y = 0;
		}

		override protected function onTouchTarget(target : DisplayObject) : void
		{
//			switch(target.name){
//				case "btnMenu":
			if (_role == null)
				return;

			if (_role.type == SceneCharType.PLAYER)
			{
				var pos : Point = target.localToGlobal(new Point());

				/**场景里的人物 人物选中框**/
				var heroID : Number = (_role.data as HeroData).id;
				var menus : Array = MenuUtil.getPlayerTargetMenu(heroID);
				MenuManager.showMenu(menus, [heroID, (_role.data as HeroData).name], pos.x, pos.y + target.height, 100);
			}

			//					break;
//			}
		}

		/**
		 * 重置面板数据
		 * @param role
		 *
		 */
		private function resetPanel(role : SceneRole) : void
		{
			//清空
			removeChild3D(_avatar3D);
			while (this.numChildren)
			{
				this.removeChildAt(0);
			}

			_buffListBar.x = 70;
			_buffListBar.y = 60;
			_avatar3D.x = -100;
			_avatar3D.y = -143;

			var bg : Sprite;
			var setting : GlobalSetting = GlobalSettingCfgData.getSettingInfo(EnumGlobalSetting.DEFAULT_SETTING);
			var isBoss : Boolean = false;
			//切换显示
			switch (role.type)
			{
				case SceneCharType.MONSTER:
				case SceneCharType.PROTECT_NPC:
				case SceneCharType.LIANG_CANG:
					var md : MonsterData = role.data as MonsterData;
					var mt : int = MonsterDataManager.getMonsterType(md.modelID);
					switch (mt)
					{
						case MonsterType.NORMAL:
							if (skin_monster_small == null)
							{
								skin_monster_small = new MonsterSmallHeadBarSkin();
								skin_monster_small.icon.visible = false;
							}
							lefterMax = 0;
							skin = skin_monster_small;
							bg = skin_monster_small.bg;
							if (setting)
							{
								_avatar3D.x = RoleFaceMaskEffectUtil.getFaceOffsetX(setting.headFaceOffset) + bg.x;
								_avatar3D.y = RoleFaceMaskEffectUtil.getFaceOffsetY(setting.headFaceOffset) + bg.y;
							}
							break;
						case MonsterType.ELITE:
							if (skin_monster_middle == null)
							{
								skin_monster_middle = new MonsterMiddleHeadBarSkin();
								skin_monster_middle.icon.visible = false;
							}
							lefterMax = 3;
							skin = skin_monster_middle;
							bg = skin_monster_middle.bg;
							if (setting)
							{
								_avatar3D.x = RoleFaceMaskEffectUtil.getFaceOffsetX(setting.headFaceOffset) + bg.x;
								_avatar3D.y = RoleFaceMaskEffectUtil.getFaceOffsetY(setting.headFaceOffset) + bg.y;
							}
							_buffListBar.x = 100;
							_buffListBar.y = 96;
							break;
						case MonsterType.BOSS:
							if (skin_monster_boss == null)
							{
								skin_monster_boss = new MonsterBossHeadBarSkin();
								skin_monster_boss.icon.visible = false;
							}
							lefterMax = 6;
							skin = skin_monster_boss;
							bg = skin_monster_boss.bg;
							if (setting)
							{
								_avatar3D.x = RoleFaceMaskEffectUtil.getFaceOffsetX(setting.bossHeadFaceOffset) + bg.x;
								_avatar3D.y = RoleFaceMaskEffectUtil.getFaceOffsetY(setting.bossHeadFaceOffset) + bg.y;
							}
							else
							{
								_avatar3D.x = -80;
								_avatar3D.y = -83;
							}
							_buffListBar.x = 130;
							_buffListBar.y = 110;
							isBoss = true;
							break;
					}
					var flag : DisplayObject = skin["flag"];
					if (flag != null)
						flag.visible = false;
					break;
				case SceneCharType.MOUNT:
					if (skin_monster_small == null)
					{
						skin_monster_small = new MonsterSmallHeadBarSkin();
						skin_monster_small.icon.visible = false;
					}
					skin = skin_monster_small;
					bg = skin_monster_small.bg;
					if (setting)
					{
						_avatar3D.x = RoleFaceMaskEffectUtil.getFaceOffsetX(setting.headFaceOffset) + bg.x;
						_avatar3D.y = RoleFaceMaskEffectUtil.getFaceOffsetY(setting.headFaceOffset) + bg.y;
					}
					lefterMax = 0;
					break;
				default:
					if (skin_monster_small == null)
					{
						skin_monster_small = new MonsterSmallHeadBarSkin();
						skin_monster_small.icon.visible = false;
					}
					skin = skin_monster_small;
					bg = skin_monster_small.bg;
					if (setting)
					{
						_avatar3D.x = RoleFaceMaskEffectUtil.getFaceOffsetX(setting.headFaceOffset) + bg.x;
						_avatar3D.y = RoleFaceMaskEffectUtil.getFaceOffsetY(setting.headFaceOffset) + bg.y;
					}
					lefterMax = 0;
					break;
			}
			var bar : Sprite = skin["imgLife"];
			bloodClip.width = bloodWidth = bar.width;
//			bar.mask = bloodClip;
			/*			var flag:DisplayObject = skin["flag"];
						TimerServer.addTick(updateFlag, [flag]);*/

			if (lefterMax > 0)
			{
				updateLefter(lefterMax);
			}
			updateAvatar(role, isBoss);
			skin.toSprite(this);
			addChild(_buffListBar);
			addChild3D(_avatar3D);
			setChildIndex(_avatar3D, getChildIndex(bg) + 1);

			resize(Starling.current.nativeStage.width, Starling.current.nativeStage.height);
		}

		/**
		 * 更新NPC模型
		 * @param role
		 *
		 */
		private function updateAvatar(role : SceneRole, isBoss : Boolean) : void
		{
			var roleData : RoleData = new RoleData(0);
			roleData.avatarInfo.setBodyResID((role.data as RoleData).avatarInfo.bodyResID, (role.data as RoleData).avatarInfo.bodyAnimatResID);
			roleData.avatarInfo.hairResID = (role.data as RoleData).avatarInfo.hairResID;
			_avatar3D.setRoleData(roleData);
			AvatarManager.updateAvatar(_avatar3D.curRole);

			var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(roleData.avatarInfo.bodyResID);
			if (avatarResConfig)
			{
				if (isBoss)
					RoleFaceMaskEffectUtil.addBossHeadFaceMaskEffect(_avatar3D.curRole);
				else
					RoleFaceMaskEffectUtil.addHeadFaceMaskEffect(_avatar3D.curRole);
				_avatar3D.curRole.setScale(RoleFaceMaskEffectUtil.getFaceMaskScale(avatarResConfig.headFaceMask));
				_avatar3D.curRole.rotationY = RoleFaceMaskEffectUtil.getFaceMaskRotation(avatarResConfig.headFaceMask);
			}
			else
			{
				_avatar3D.curRole.setScale(1);
				_avatar3D.curRole.rotationY = 0;
				RoleFaceMaskEffectUtil.removeFaceMaskEffect(_avatar3D.curRole);
			}
			updateFadeAlphaRectPos();
		}

		override protected function onUpdateFadeAlphaRectPos(sr3D : InterObject3D, x : int, y : int) : void
		{
			super.onUpdateFadeAlphaRectPos(sr3D, x, y);
			var avatar3D : InterAvatar3D = sr3D as InterAvatar3D;
			if (avatar3D && avatar3D.curRole)
			{
				var roleData : RoleData = avatar3D.curRole.data as RoleData;
				var avatarResConfig : AvatarResConfig = AvatarResConfigSetData.getInfo(roleData.avatarInfo.bodyResID);
				if (avatarResConfig)
				{
					var fadeX : int = RoleFaceMaskEffectUtil.getFaceMaskX(avatarResConfig.headFaceMask);
					var fadeY : int = RoleFaceMaskEffectUtil.getFaceMaskY(avatarResConfig.headFaceMask);
					avatar3D.curRole.x = fadeX;
					avatar3D.curRole.y = fadeY;
					RoleFaceMaskEffectUtil.updateFadeAlphaRectPos(avatar3D.curRole, x + avatar3D.x, y + avatar3D.y);
				}
			}
		}

		/*		private var flagAlpha:Number;
				private function updateFlag(flag:DisplayObject):void
				{
					if(flag)
					{
						if(flag.alpha>=1)
						{
							flagAlpha = -0.02;
						}else if(flag.alpha <= 0){
							flagAlpha = 0.02;
						}
						flag.alpha += flagAlpha;
					}
				}*/

		/**
		 * 更新血条最大序号
		 * @param num
		 *
		 */
		private function updateLefter(num : int) : void
		{
			if (num < 0 || num > lefterMax)
				return;

			var lefter : UINumber = skin["lefter"];
			if (lefter != null)
				lefter.label = "x" + (num + 1);

			var bar : Sprite;
			for (var i : int = 0; i <= lefterMax; i++)
			{
				bar = skin["imgLife_" + i];
				if (i == num)
				{
					bar.visible = true;
					bar.mask = bloodClip;
				}
				else if (i == num - 1)
				{
					bar.visible = true;
					bar.mask = null;
				}
				else
				{
					bar.visible = false;
				}
			}

		/*			var startX:int = skin["imgLife"].x;
					var flag:DisplayObject = skin["flag"];
					flag.x = startX + bloodClip.width - 36;*/
		}

		/**
		 * 更新血量
		 * @param cur
		 * @param max
		 *
		 */
		private function updateLife(cur : int, max : int) : void
		{
			var p : Number = cur / max;
			if (p > 1)
				p = 1;

			skin["labHP"].text = cur + "/" + max;

			if (cur <= 0)
			{
				onDead();
			}

			var bar : Sprite = skin["imgLife"];
			var w : int;
			if (lefterMax > 0)
			{
				var maxSlice : int = lefterMax + 1;
				var sliceHp : Number = max / maxSlice;
				var sliceIndex : int;
				var pp : Number;
				sliceIndex = Math.ceil(cur / sliceHp);
				if (sliceIndex > maxSlice)
					sliceIndex = maxSlice;
				var usedCurrentBarHp : int = cur % sliceHp;
				if (usedCurrentBarHp <= 0)
				{
					pp = 0;
				}
				else
				{
					pp = (sliceHp - usedCurrentBarHp) / sliceHp;
				}
				bar.mask = null;
				w = bloodWidth * (1 - pp);
				updateLefter(sliceIndex - 1);
			}
			else
			{
				w = bloodWidth * p;
				bloodClip.width = w;
				bar.mask = bloodClip;
			}
			bloodClip.width = w;
//			TweenLite.to(bloodClip, 0.5, {width:w});
		}

		/**
		 * 死亡
		 *
		 */
		private function onDead() : void
		{
			
		}

		/**
		 * 更新等级
		 * @param lv
		 *
		 */
		private function updateLevel(lv : int) : void
		{
			skin["labLevel"].number = lv;
		}

		/**
		 * 更新名字
		 * @param name
		 *
		 */
		private function updateName(name : String) : void
		{
			skin["labName"].htmlText = name;
		}

		/**
		 *当面板显示时,给子类处理自身逻辑
		 */
		override protected function onShow() : void
		{
			EventManager.addEvent(SceneCharacterEvent.SCENE_CHAR_DEATH, onCharDeath);
			EventManager.addEvent(SceneCharacterEvent.LEAVE_EYE, onRoleLeaveEye);
			_buffListBar.show();
		}

		/**
		 *当面板隐藏时,给子类处理自身逻辑
		 */
		override protected function onHide() : void
		{
			EventManager.removeEvent(SceneCharacterEvent.SCENE_CHAR_DEATH, onCharDeath);
			EventManager.removeEvent(SceneCharacterEvent.LEAVE_EYE, onRoleLeaveEye);
			_role = null;
			_buffListBar.hide();

//			TimerServer.remove(updateFlag);
		}

		/**
		 * 更新角色数据
		 * @param role
		 *
		 */
		private function updateRoleData(role : SceneRole) : void
		{
			if (_role != role)
			{
				resetPanel(role);
			}

			_role = role;
			if (this.stage == null)
			{
				changRole(role);
			}
			setData(role.type, role.data);
		}

		/**
		 * 选择场景角色
		 * @param role
		 *
		 */
		private function changRole(role : SceneRole) : void
		{
			if (!role)
			{
				hide();
				return;
			}
			if (role.type == SceneCharType.COLLECT || role.type == SceneCharType.TRANS || role.type == SceneCharType.DROP_GOODS || role.type == SceneCharType.STALL)
			{
				hide();
				return;
			}

			if (this.stage == null && _defaultParent != null)
			{
				this._defaultParent.addChild(this);
			}
			updateRoleData(role);
		}

		/**
		 * 场景角色死亡，携带死亡者的BaseCharacterInfo和攻击者SceneChar
		 * @param role
		 *
		 */
		private function onCharDeath(role : SceneRole) : void
		{
			updateRoleData(role);
			hide();
		}

		/**
		 * 场景对象离开了视野
		 * @param role
		 *
		 */
		private function onRoleLeaveEye(role : SceneRole) : void
		{
			hide();
		}

		/**
		 * 移除面板
		 *
		 */
		private function hide() : void
		{
			this.removeFromParent();
		}

		/**
		 * 设置数据
		 * @param type
		 * @param data
		 *
		 */
		private function setData(type : String, data : *) : void
		{
			var roleData : RoleData = data as RoleData;
			switch (type)
			{
				case SceneCharType.NPC:
					//var npc:NpcProto = data as NpcProto;
					updateLife(100, 100);
					updateLevel(100);
					updateName(_role.name);
					break;
//				case SceneCharType.MONSTER:
//				case SceneCharType.MOUNT:
//				case SceneCharType.PLAYER:
//					var roleData : RoleData = data as RoleData;
//					updateLife(roleData.hp, roleData.totalStat.life);
//					updateLevel(roleData.level);
//					return;
				case SceneCharType.BIAO_CHE: //镖车名字特殊处理，策划需求  运镖list3.0优化里面的，2016-05-18
					var biaoCheData : BiaoCheData = data as BiaoCheData;
					updateLife(biaoCheData.hp, biaoCheData.totalStat.life);
					updateLevel(biaoCheData.level);
					
					var stateString:String = "";
					if( biaoCheData.isBroken )//破损的镖车
						stateString = biaoCheData.name + LanguageConfig.getText( LangYunBiao.YUN_BIAO_PO_SUN_RATE, LanguageConfig.getText( LangYunBiao.YUN_BIAO_PO_SUN_RATE_VALUE ) );
					else
						stateString = biaoCheData.name;
					
					updateName( stateString );
					_buffListBar.updateOwnerRole(_role);
					break;
				default:
					updateLife(roleData.hp, roleData.totalStat.life);
					updateLevel(roleData.level);
					updateName(_role.name);
					_buffListBar.updateOwnerRole(_role);
					break;
			}
		}

	}
}
