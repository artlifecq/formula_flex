package com.rpgGame.app.ui.main.team
{
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.main.shortcut.BuffListBar;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MouseListenerUtil;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.RaceCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.info.team.TeamUnit;
	import com.rpgGame.coreData.lang.LangTeam;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import feathers.controls.UIAsset;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.teamlist.TeamListItemSkin;
	
	import starling.core.Starling;
	import starling.display.Shape;

	/**
	 * 队伍头像列表
	 * @author 陈鹉光
	 *
	 */
	public class TeamListItem extends SkinUI
	{
		/** 当前界面 **/
		private var _skin : TeamListItemSkin;
		/** 玩家id **/
		public var _playerId : Number = 0;
		/** 血条宽度 **/
		private var _imgHpWidth : Number = 0;
		/** 魔法条宽度 **/
		private var _imgMpWidth : Number = 0;
		/** 血条遮罩 **/
		private var _imgHpMask : Shape;
		/** 魔法条遮罩 **/
		private var _imgMpMask : Shape;
		/** 点击范围 **/
		private var _shape : Shape;
		/** Buff列表栏 **/
		private var _buffListBar : BuffListBar;
		/** 玩家数据 **/
		private var _roleData : HeroData;

		public function TeamListItem()
		{
			_skin = new TeamListItemSkin();
			super(_skin);
			init();
		}

		/**
		 * 初始化
		 *
		 */
		private function init() : void
		{
			_imgHpWidth = _skin.imgHp.width;
			_imgMpWidth = _skin.imgMp.width;
			_imgHpMask = addMask(_skin.imgHp);
			_imgMpMask = addMask(_skin.imgMp);

			//点击范围
			_shape = new Shape();
			_shape.graphics.clear();
			_shape.graphics.beginFill(StaticValue.COLOR_CODE_1, 0);
			_shape.graphics.drawRect(_skin.labLevel.x + 2, _skin.labLevel.y +  _skin.labLevel.height - 3, 120, 20);
			_shape.graphics.endFill();
			addChild(_shape);
			
			MouseListenerUtil.addEventListener(_shape, onMouseClick);
			MouseListenerUtil.addEventListener(_skin.imgIcon, onMouseClick);
			MouseListenerUtil.addEventListener(_skin.imgHp, onMouseClick);
			MouseListenerUtil.addEventListener(_skin.imgMp, onMouseClick);
			MouseListenerUtil.addEventListener(_skin.labLevel, onMouseClick);
			MouseListenerUtil.addEventListener(_skin.labName, onMouseClick);

			_buffListBar = new BuffListBar(null, IcoSizeEnum.SIZE_16, GridBGType.GRID_SIZE_16, 18, 18, 10, 10, false);
			_buffListBar.x = 4;
			_buffListBar.y = 46;
			addChild(_buffListBar);
			
			_skin.btnJun.visible = false;
			_skin.btnShang.visible = false;
			_skin.btnLun.visible = false;
			_skin.btnLie.visible = false;
			_skin.btnZi.visible = false;
			_skin.duiZhang.visible = false;

			updateLevel();
			initTips();
		}

		/**
		 * 初始化tips
		 *
		 */
		private function initTips() : void
		{
			TipTargetManager.show(_skin.btnJun, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangTeam.TEAM_MODE_TIPS_1)));
			TipTargetManager.show(_skin.btnShang, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangTeam.TEAM_MODE_TIPS_2)));
			TipTargetManager.show(_skin.btnLun, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangTeam.TEAM_MODE_TIPS_3)));
			TipTargetManager.show(_skin.btnLie, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangTeam.TEAM_MODE_TIPS_5)));
			TipTargetManager.show(_skin.btnZi, TargetTipsMaker.makeSimpleTextTips(LanguageConfig.getText(LangTeam.TEAM_MODE_TIPS_4)));
		}

		public function show() : void
		{
			_buffListBar.show();
		}

		public function hide() : void
		{
			_buffListBar.hide();
		}

		/**
		 *当面板显示时,给子类处理自身逻辑
		 */
		override protected function onShow() : void
		{
			EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE, updateLevel);
			EventManager.addEvent(MainPlayerEvent.NOWHP_CHANGE, updateHp);
			EventManager.addEvent(MainPlayerEvent.NOWMP_CHANGE, updateMp);
			MouseListenerUtil.addEventListener(_skin.btnShang, onExpModeMouseClick);
			MouseListenerUtil.addEventListener(_skin.btnJun, onExpModeMouseClick);
			MouseListenerUtil.addEventListener(_skin.btnLie, onItemsModeMouseClick);
			MouseListenerUtil.addEventListener(_skin.btnLun, onItemsModeMouseClick);
			MouseListenerUtil.addEventListener(_skin.btnZi, onItemsModeMouseClick);
			MouseListenerUtil.addEventListener(_skin.hpOrMpTips, onItemsModeMouseClick);
		}

		/**
		 *当面板隐藏时,给子类处理自身逻辑
		 */
		override protected function onHide() : void
		{
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE, updateLevel);
			EventManager.removeEvent(MainPlayerEvent.NOWHP_CHANGE, updateHp);
			EventManager.removeEvent(MainPlayerEvent.NOWMP_CHANGE, updateMp);
			MouseListenerUtil.removeEventListener(_skin.btnShang);
			MouseListenerUtil.removeEventListener(_skin.btnJun);
			MouseListenerUtil.removeEventListener(_skin.btnLie);
			MouseListenerUtil.removeEventListener(_skin.btnLun);
			MouseListenerUtil.removeEventListener(_skin.btnZi);
			MouseListenerUtil.removeEventListener(_skin.hpOrMpTips);
		}

		/**
		 * 经验模式切换
		 *
		 */
		private function onExpModeMouseClick() : void
		{
			if (TeamManager.isTeamLeader(MainRoleManager.actorID)) //自己是队长
			{
				if (_playerId == MainRoleManager.actorID) //自己
				{
					MenuManager.showMenu(TeamManager.MENUS_EXP_MODE, [_playerId,MainRoleManager.actorInfo.name], int(Starling.current.nativeStage.mouseX + 5), int(Starling.current.nativeStage.mouseY + 5), 100);
				}
			}
		}

		/**
		 * 拾取模式切换
		 *
		 */
		private function onItemsModeMouseClick() : void
		{
			if (TeamManager.isTeamLeader(MainRoleManager.actorID)) //自己是队长
			{
				if (_playerId == MainRoleManager.actorID) //自己
				{
					MenuManager.showMenu(TeamManager.MENUS_PICK_UP_MODE, [_playerId,MainRoleManager.actorInfo.name], int(Starling.current.nativeStage.mouseX + 5), int(Starling.current.nativeStage.mouseY + 5), 100);
				}
			}
		}

		/**
		 * 弹出菜单栏 检测
		 *
		 */
		private function onMouseClick() : void
		{
			if ( TeamManager.isTeamLeader( MainRoleManager.actorID ) ) //自己是队长
				MenuManager.showMenu(TeamManager.MENUS_HAVE_TEAM_WE_ARE_LEADER1, [_playerId,MainRoleManager.actorInfo.name], int(Starling.current.nativeStage.mouseX + 5), int(Starling.current.nativeStage.mouseY + 5), 100);
			else
				MenuManager.showMenu(TeamManager.MENUS_HAVE_TEAM_NOT_LEADER1, [_playerId,_roleData.name], int(Starling.current.nativeStage.mouseX + 5), int(Starling.current.nativeStage.mouseY + 5), 100);
		}

		/**
		 * 更新队伍成员数据
		 * @param data
		 *
		 */
		public function updateTeamPlayerData( data:TeamUnit ):void
		{
			if (data == null)
			{
				this.visible = false;
				return;
			}
			_playerId = data.id;
			this.visible = true;
			_skin.labName.text = data.name;
			_skin.labLevel.number = data.level;
			onCheckIcon();
			
			var selfData:HeroData = MainRoleManager.actorInfo;
			_roleData = TeamManager.getHeroDataById( data.id );
			if( _roleData == null )
				return;
			
			updateHp(_roleData);
			updateMp(_roleData);
			updateTeamTips( _roleData, data );
			_buffListBar.updateOwnerRoleData( _roleData );
			if ( !data.isOnline || data.mapCountryId != selfData.sceneSequence || data.sceneId != selfData.mapID )//远离、死亡、离线，都变灰色
				GrayFilter.gray(_skin.group);
			else
				GrayFilter.unGray(_skin.group);
			
			_skin.imgIcon.styleName = TeamManager.updateJobIcon( _roleData.job );
		}

		/**
		 * 检测队伍经验、拾取模式
		 *
		 */
		private function onCheckIcon() : void
		{
			if ( TeamManager.isTeamLeader(_playerId) )
			{
				switch (TeamManager.expIndex)
				{
					case 0:
						_skin.btnJun.visible = true;
						_skin.btnShang.visible = false;
						break;
					case 1:
						_skin.btnJun.visible = false;
						_skin.btnShang.visible = true;
						break;
					default:
						break;
				}

				switch (TeamManager.pickupIndex)
				{
					case 0:
						_skin.btnLie.visible = false;
						_skin.btnLun.visible = true;
						_skin.btnZi.visible = false;
						break;
					case 1:
						_skin.btnLie.visible = true;
						_skin.btnLun.visible = false;
						_skin.btnZi.visible = false;
						break;
					case 2:
						_skin.btnLie.visible = false;
						_skin.btnLun.visible = false;
						_skin.btnZi.visible = true;
						break;
					default:
						break;
				}
				_skin.duiZhang.visible = true;
			}
			else
			{
				_skin.duiZhang.visible = false;
				_skin.btnJun.visible = false;
				_skin.btnShang.visible = false;
				_skin.btnLie.visible = false;
				_skin.btnLun.visible = false;
				_skin.btnZi.visible = false;
			}
		}
		
		/**
		 * 更新队伍头像tips 
		 * @param roleData
		 * @param unitData
		 * 
		 */		
		private function updateTeamTips( roleData:HeroData, unitData:TeamUnit ):void
		{
			var tipsStr:String = "";
			
			//名字
			var tipsName:String = "";
			var actor:HeroData = MainRoleManager.actorInfo;
			if ( unitData.mapCountryId != actor.sceneSequence || unitData.sceneId != actor.mapID )//远离  跟自己不再同一个场景，或者跟自己不再同一个国家
			{
				if( unitData.isOnline )//在线
					tipsName = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_1, unitData.name ) + HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, "（" + LanguageConfig.getText( LangTeam.TEAM_TIP_9 ) + "）" );
				else
					tipsName = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_1, unitData.name ) + HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, "（" + LanguageConfig.getText( LangTeam.TEAM_TIP_10 ) + "）" );
			}
			else
			{
				tipsName = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_1, unitData.name );
			}
			
			//职业
			var raceStr:String = "";
			var raceName:String = RaceCfgData.getRaceName( roleData.job );
			if (!raceName)
				raceName = "无";
			
			raceStr = HtmlTextUtil.getTextColor( StaticValue.WHITE_PURE_COLOR, LanguageConfig.getText( LangTeam.TEAM_TIP_11 ) + raceName );
			
			//等级
			var levelStr:String = HtmlTextUtil.getTextColor( StaticValue.WHITE_PURE_COLOR, LanguageConfig.getText( LangTeam.TEAM_TIP_12 ) + actor.totalStat.level );
			//位置
			var pos:String = "";
			var countryName:String = CountryNameCfgData.getCountryNameById( unitData.mapCountryId );
			if (!countryName)
				countryName = LanguageConfig.getText( LangTeam.TEAM_TIP_6 );
			
			var mapInfo:SceneData = MapDataManager.getMapInfo( unitData.sceneId );
			if (mapInfo != null)
				pos = HtmlTextUtil.getTextColor( StaticValue.WHITE_PURE_COLOR, LanguageConfig.getText( LangTeam.TEAM_TIP_13 ) + "【" + countryName + "】" + mapInfo.name );
			else
				pos = HtmlTextUtil.getTextColor( StaticValue.WHITE_PURE_COLOR, LanguageConfig.getText( LangTeam.TEAM_TIP_13 ) );
			
			tipsStr = tipsName + "<br/>" + raceStr + "<br/>" + levelStr + "<br/>" + pos;
			
			if( TipTargetManager.hasTipsEventListener( _skin.imgIcon ) )
				TipTargetManager.remove( _skin.imgIcon );
			
			if( TipTargetManager.hasTipsEventListener( _skin.labLevel ) )
				TipTargetManager.remove( _skin.labLevel );
			
			if( TipTargetManager.hasTipsEventListener( _skin.labName ) )
				TipTargetManager.remove( _skin.labName );
			
			TipTargetManager.show( _skin.imgIcon, TargetTipsMaker.makeSimpleTextTips( tipsStr ) );
			TipTargetManager.show( _skin.labLevel, TargetTipsMaker.makeSimpleTextTips( tipsStr ) );
			TipTargetManager.show( _skin.labName, TargetTipsMaker.makeSimpleTextTips( tipsStr ) );
		}
		
		/**
		 * 血量、魔法tips 
		 * @param roleData
		 * 
		 */		
		private function updateHPOrMPTips( roleData:HeroData ):void
		{
			var tipsStr:String = "";
			var hpMax:Number = roleData.totalStat.life;
			var mpMax:Number = roleData.totalStat.mana;
			var hpStr:String = LanguageConfig.getText( LangTeam.TEAM_TIP_14 ) + roleData.totalStat.hp + "/" + hpMax;
			var mpStr:String = LanguageConfig.getText( LangTeam.TEAM_TIP_15 ) + roleData.totalStat.mp + "/" + mpMax;
			
			tipsStr = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_1, hpStr + "<br/>" + mpStr );
			if( TipTargetManager.hasTipsEventListener( _shape ) )
				TipTargetManager.remove( _shape );
			TipTargetManager.show( _shape, TargetTipsMaker.makeSimpleTextTips( tipsStr ) );
		}
		
		/**
		 *  属性变化
		 *
		 */
		private function updateLevel() : void
		{
			var actor : SceneRole = SceneManager.getSceneObjByID(_playerId) as SceneRole;
			if (actor == null)
				return;

			var actorData : HeroData = actor.data as HeroData;
			if (actorData == null)
				return;

			_skin.labLevel.number = actorData.totalStat.level;
		}

		/**
		 * 当前血量变化
		 *
		 */
		private function updateHp( roleData:RoleData = null ) : void
		{
			if (roleData.id != _playerId)
				return;

			var actor : SceneRole = SceneManager.getSceneObjByID(roleData.id) as SceneRole;
			if (actor == null)
				return;

			var actorData : HeroData = actor.data as HeroData;
			var value : Number = actorData.totalStat.hp / actorData.totalStat.life;
			if (value > 1)
				value = 1;

			_imgHpMask.width = _imgHpWidth * value;
			updateHPOrMPTips( actorData );
			
			if ( actorData.totalStat.hp <= 0 )//远离、死亡、离线，都变灰色
				GrayFilter.gray(_skin.group);
			else
				GrayFilter.unGray(_skin.group);
		}

		/**
		 * 当前魔法变化
		 *
		 */
		private function updateMp(roleData : HeroData) : void
		{
			if (roleData.id != _playerId)
				return;

			var actor : SceneRole = SceneManager.getSceneObjByID(roleData.id) as SceneRole;
			if (actor == null)
				return;

			var actorData : HeroData = actor.data as HeroData;
			var value : Number = actorData.totalStat.mp / actorData.totalStat.mana;
			if (value > 1)
				value = 1;

			_imgMpMask.width = _imgMpWidth * value;
			updateHPOrMPTips( actorData );
		}

		/**
		 * add一个遮罩
		 * @param target
		 * @return mask
		 *
		 */
		private function addMask(target : UIAsset) : Shape
		{
			var mask : Shape = new Shape();
			addChild(mask);
			mask.x = target.x;
			mask.y = target.y;
			mask.graphics.beginFill(0xf00ff0);
			mask.graphics.drawRect(0, 0, target.width, target.height);
			mask.graphics.endFill();
			target.mask = mask;
			return mask;
		}

		/**
		 * 清除队伍成员数据
		 *
		 */
		public function clearTeamMembData() : void
		{
			_playerId = 0;
			this.visible = false;
		}
	}
}
