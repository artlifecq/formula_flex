package com.rpgGame.app.utils
{
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.utils.PKModeUtil;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.role.SceneCollectData;
	import com.rpgGame.coreData.type.HeadBloodStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import org.client.mainCore.ds.HashMap;

	public class HeadBloodUtil
	{
		private static var typeDataMap : HashMap = new HashMap();


		/**
		 * 获得血量状态数据
		 * @param state
		 * @return
		 *
		 */
		public static function getTypeData(state : uint) : Array
		{
			var data : Array = typeDataMap.getValue(state);
			if (data != null)
				return data;

			var color : uint = StaticValue.RED_TEXT;
			var info : String = "";
			switch (state)
			{
				case HeadBloodStateType.MAIN_CHAR:
					color = StaticValue.GREEN_TEXT;
					break;
				case HeadBloodStateType.ENEMY:
					color = StaticValue.RED_TEXT;
					break;
				case HeadBloodStateType.TEAM:
					color = StaticValue.BLUE_TEXT;
					break;
				case HeadBloodStateType.COUNTRY_WAR_ATTACK_MONSTER:
					color = StaticValue.RED_TEXT;
					info = "攻方占领中";
					break;
				case HeadBloodStateType.COUNTRY_WAR_DEFENSE_MONSTER:
					color = StaticValue.BLUE_TEXT;
					info = "守方占领中";
					break;
			}

			data = [color, info];

			typeDataMap.add(state, data);

			return data;
		}

		public static function getBarStyleName(state:uint):String
		{
			switch (state)
			{
				case HeadBloodStateType.MAIN_CHAR:
					return "ui/mainui/head/juese/juesexuetiao.png";
				case HeadBloodStateType.ENEMY:
					return "ui/mainui/head/juese/juesexuetiao3.png";
				case HeadBloodStateType.TEAM:
				case HeadBloodStateType.NPC:
					return "ui/mainui/head/juese/juesexuetiao2.png";
			}
			return "ui/mainui/head/juese/juesexuetiao.png";
		}
		public static function getHPIconStyleName(state:uint):String
		{
			switch (state)
			{
				case HeadBloodStateType.MAIN_CHAR:
					return "ui/mainui/head/juese/q_lv.png";
				case HeadBloodStateType.ENEMY:
					return "ui/mainui/head/juese/q_hong.png";
				case HeadBloodStateType.TEAM:
				case HeadBloodStateType.NPC:
					return "ui/mainui/head/juese/q_lan.png";
			}
			return "ui/mainui/head/juese/q_lv.png";
		}
		

		public static function getRoleBloodBarState(_role : SceneRole):int
		{
			if(_role)
			{
				if (_role.isMainChar) 
				{
					return HeadBloodStateType.MAIN_CHAR;
				}
				else if (SceneCharType.MONSTER==_role.type ) 
				{
					if (FightManager.getFightRoleState(_role)==FightManager.FIGHT_ROLE_STATE_CAN_NOT_FIGHT) 
					{
						return HeadBloodStateType.TEAM;
					}
					return HeadBloodStateType.ENEMY;
				}
				else if (SceneCharType.NPC==_role.type) 
				{
					return HeadBloodStateType.NPC;
				}
				else if (SceneCharType.PLAYER==_role.type) 
				{
					if (FightManager.getFightRoleState(_role)!=FightManager.FIGHT_ROLE_STATE_CAN_NOT_FIGHT) 
					{
						return HeadBloodStateType.ENEMY;
					}
					else
					{
						return HeadBloodStateType.TEAM;
					}
				}
				
			}
			
			return HeadBloodStateType.TEAM;
		}

		public static function getRoleNameColor(_role : SceneRole) : uint
		{
			if (_role == null)
				return StaticValue.RED_TEXT;

			if (_role.type == SceneCharType.NPC)
				return StaticValue.YELLOW_TEXT;
			if (_role.type == SceneCharType.GIRL_PET)
				return StaticValue.BLUE_TEXT;
			if (_role.type == SceneCharType.PROTECT_NPC)
				return StaticValue.YELLOW_TEXT;

			if (_role.type == SceneCharType.MONSTER)
			{
				if(FightManager.getFightRoleState(_role) == FightManager.FIGHT_ROLE_STATE_CAN_NOT_FIGHT)
				{
					return StaticValue.BEIGE_TEXT;
				}
				else
				{
					return StaticValue.RED_TEXT;
				}
			}
			if (_role.type == SceneCharType.LIANG_CANG)
				return 0XDA3C4E;
//				return StaticValue.RED;
			if(_role.type == SceneCharType.ZHAN_CHE)
			{
				if(FightManager.getFightRoleState(_role) == FightManager.FIGHT_ROLE_STATE_CAN_NOT_FIGHT)
				{
					return StaticValue.BEIGE_TEXT;
				}
				else
				{
					return StaticValue.RED_TEXT;
				}
			}
			if (SceneCharType.DROP_GOODS==_role.type) 
			{
				return ItemConfig.getItemQualityColor(int(_role.data.qitem.q_id));
			}
			if (_role.type != SceneCharType.PLAYER)
				return StaticValue.BEIGE_TEXT;

			var heroData : HeroData = _role.data as HeroData;
			if (heroData == null)
				return StaticValue.RED_TEXT;

//			if (CountryManager.isMyEnemyCountry(heroData.countryId))
//				return StaticValue.RED_TEXT; //不是我国与盟国的都是红名

			return PKModeUtil.getPKAmountColor(heroData.nameColor);
		}


		public static function getRoleName(_role : SceneRole) : String
		{
			if (_role == null)
				return "";
			if (_role.type == SceneCharType.MONSTER)
			{
				var monster : MonsterData = _role.data as MonsterData;
				if (monster)
					return _role.name + "[" + monster.totalStat.level + "级]";
//					return "id:"+monster.serverID.fValue+"("+_role.pos.x+","+_role.pos.y+")";
			}
			if (_role.type == SceneCharType.COLLECT)
			{
				var myRe:int=MainRoleManager.actorInfo.faction;
				var roleFac:int=(_role.data as SceneCollectData).faction;
				if(roleFac!=myRe&&roleFac!=0){//不是自己阵营
					return HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,"敌方矿物");
				}
				return _role.name;
			}
			if (_role.type != SceneCharType.PLAYER)
				return _role.name;
			if(_role.type == SceneCharType.SCULPTURE)
				return _role.name;
			
			var heroData : HeroData = _role.data as HeroData;
			if (heroData == null)
				return _role.name;

			if (MainRoleManager.actorInfo.countryId == heroData.countryId)
				return _role.name; //本国不显国家



			return "[" + CountryNameCfgData.getCountryNameById(heroData.countryId) + "]" + _role.name;
		}
		
		public static function getStallNameColor(_role : SceneRole):uint
		{
			return StaticValue.BEIGE_TEXT;
		}
	}
}
