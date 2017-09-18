package com.rpgGame.app.manager
{
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.engine3D.vo.BaseRole;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.HeroMiscSender;
	import com.rpgGame.core.events.GameSettingEvent;
	import com.rpgGame.core.events.MenuEvent;
	import com.rpgGame.coreData.enum.EnumCustomTagType;
	import com.rpgGame.coreData.lang.LangShieldingMenu;
	import com.rpgGame.coreData.role.GirlPetData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.EnumMonsterType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import org.client.mainCore.manager.EventManager;
	
	public class GameSettingManager 
	{
		private static var gameSetObj:Object;
		
		/**
		 * 一键屏蔽
		 */		
		private static var _aKeyBlock:Boolean = false;
		/**
		 * 怪物 
		 */		
		private static var _checkFiltrateGuaiWu:Boolean = false;
		/**
		 * 队伍 
		 */		
		private static var _checkFiltrateDuiWu:Boolean = false;

		/**
		 * 帮会 
		 */		
		private static var _checkFiltrateBangHui:Boolean = false;
		private static var _checkOtherEffect:Boolean = false;
		private static var _checktOherGirlPet:Boolean = false;
		
		/**
		 * 他人美人,true是屏蔽
		 */
		public static function get checktOherGirlPet():Boolean
		{
			return _checktOherGirlPet;
		}

		/**
		 * @private
		 */
		public static function set checktOherGirlPet(value:Boolean):void
		{
			_checktOherGirlPet = value;
			if(!_checktOherGirlPet&&aKeyBlock){
				_aKeyBlock=false;
				EventManager.dispatchEvent(MenuEvent.CANCEL_LOCK);
			}
			EventManager.dispatchEvent(GameSettingEvent.FILTRATE_UPDATE);
		}

		/**
		 * 他人特效
		 */
		public static function get checkOtherEffect():Boolean
		{
			return _checkOtherEffect;
		}

		/**
		 * @private
		 */
		public static function set checkOtherEffect(value:Boolean):void
		{
			_checkOtherEffect = value;
			if(!_checkOtherEffect&&aKeyBlock){
				_aKeyBlock=false;
				EventManager.dispatchEvent(MenuEvent.CANCEL_LOCK);
			}
			EventManager.dispatchEvent(GameSettingEvent.FILTRATE_UPDATE);
		}

		public static function initData(dataStr:String):void
		{
			gameSetObj  = JSONUtil.decode(dataStr)[0];
			if(gameSetObj!=null)
			{
				aKeyBlock=gameSetObj.gameSet.aKeyBlock;
				checkFiltrateGuaiWu=gameSetObj.gameSet.checkFiltrateGuaiWu;
				checkFiltrateDuiWu=gameSetObj.gameSet.checkFiltrateDuiWu;
				checkFiltrateBangHui=gameSetObj.gameSet.checkFiltrateBangHui;
				checkOtherEffect=gameSetObj.gameSet.checkOtherEffect;
				checktOherGirlPet=gameSetObj.gameSet.checktOherGirlPet;		
			}
		}
		
		public static function set aKeyBlock(value:Boolean):void
		{
			_aKeyBlock=value;
			filtrateAll(_aKeyBlock);
		}
		
		public static function get aKeyBlock():Boolean
		{
			return _aKeyBlock;
		}
		
		public static function set checkFiltrateGuaiWu(value:Boolean):void
		{
			_checkFiltrateGuaiWu=value;
			if(!_checkFiltrateGuaiWu&&aKeyBlock){
				_aKeyBlock=false;
				EventManager.dispatchEvent(MenuEvent.CANCEL_LOCK);
			}
			EventManager.dispatchEvent(GameSettingEvent.FILTRATE_UPDATE);
			var list : Vector.<SceneRole> = SceneManager.getSceneRoleList();
			for each (var role : SceneRole in list)
			{
				if(role.type== SceneCharType.MONSTER)
				{
					AvatarManager.updateBody(role);
				}
			}
		}
		
		public static function get checkFiltrateGuaiWu():Boolean
		{
			return _checkFiltrateGuaiWu;
		}
		
		public static function set checkFiltrateDuiWu(value:Boolean):void
		{
			_checkFiltrateDuiWu=value;
			if(!_checkFiltrateDuiWu&&aKeyBlock){
				_aKeyBlock=false;
				EventManager.dispatchEvent(MenuEvent.CANCEL_LOCK);
			}
			EventManager.dispatchEvent(GameSettingEvent.FILTRATE_UPDATE);
		}
		
		public static function get checkFiltrateDuiWu():Boolean
		{
			return _checkFiltrateDuiWu;
		}
		
		
		public static function set checkFiltrateBangHui(value:Boolean):void
		{
			_checkFiltrateBangHui=value;
			if(!_checkFiltrateBangHui&&aKeyBlock){
				_aKeyBlock=false;
				EventManager.dispatchEvent(MenuEvent.CANCEL_LOCK);
			}
			EventManager.dispatchEvent(GameSettingEvent.FILTRATE_UPDATE);
		}
		
		public static function get checkFiltrateBangHui():Boolean
		{
			return _checkFiltrateBangHui;
		}
	
		/**
		 * 保存数据到服务器上去 
		 * @param map
		 */		
		public static function savaMainToServer():void
		{
			var nowValue:String = getAllValueToString();
			HeroMiscSender.reqSetClientCustomTag(EnumCustomTagType.SYSTEM_PINHBI_SET , nowValue);
		}
		
		private static function getAllValueToString():String
		{
			var value:String;		
			var data:Array=[];
			data.push({gameSet:{aKeyBlock:aKeyBlock,checkFiltrateGuaiWu:checkFiltrateGuaiWu,checkFiltrateDuiWu:checkFiltrateDuiWu,
				checkFiltrateBangHui:checkFiltrateBangHui,checkOtherEffect:checkOtherEffect,checktOherGirlPet:checktOherGirlPet}});
			value=JSONUtil.encode(data);
			return value;
		}
		
		public static function filtrateAll(bool:Boolean):void
		{
			checkFiltrateGuaiWu = bool;
			checkFiltrateDuiWu = bool;
			checkFiltrateBangHui = bool;
			checkOtherEffect = bool;
			checktOherGirlPet = bool;
			EventManager.dispatchEvent( MenuEvent.SAKEYBLOCK, bool );
		}
		//		
		//		public static function unfiltrateAll():void
		//		{
		//			checkFiltrateGuaiWu = false;
		//			checkFiltrateDuiWu = false;
		//			checkFiltrateJiaZu = false;
		//			checkFiltrateBangHui = false;
		//			checkFiltrateBiaoChe = false;
		//			checkFiltrateBenGuo = false;
		//		}
		
		/**是否有屏蔽选择*/
		public static function isHavePingBi():Boolean
		{
			if(checkFiltrateGuaiWu||checkFiltrateDuiWu||checkFiltrateBangHui||checkOtherEffect||checktOherGirlPet)
				return true;
			else return false;
		}
		private static function canSeePlayer(role:SceneRole):Boolean
		{
			if (role.isMainChar) 
			{
				return true;
			}
			//屏蔽非队友
			if (checkFiltrateDuiWu && Mgr.teamMgr.hasTeam&&Mgr.teamMgr.isInMyTeam(HeroData(role.data).serverID)==false)
			{
				return false;
			}
			//屏蔽同帮会
			if (checkFiltrateBangHui &&MainRoleManager.actorInfo.guildId.IsZero()==false&& HeroData(role.data).guildId.EqualTo(MainRoleManager.actorInfo.guildId))
			{
				return false;
			}
			return true;
		}
		private static function canSeeMonster(role:SceneRole):Boolean
		{
			//精英，boss不屏蔽
			var monster:MonsterData=BaseRole(role).data as MonsterData;
			if (EnumMonsterType.testType(monster,[EnumMonsterType.ELITE,EnumMonsterType.BOSS])) 
			{
				return true;
			}
			//我的召唤物
			if (monster.ownerId==MainRoleManager.actorID) 
			{
				return true;
			}
			return !checkFiltrateGuaiWu;
		}
		private static function canSeeGirlPet(role:SceneRole):Boolean
		{
			var pet:GirlPetData=role.data as GirlPetData
			if (pet.ownerId==MainRoleManager.actorID) 
			{
				return true;
			}
			return !checktOherGirlPet;
		}
		/**屏蔽设置*/
		public static function viewFilter(baseObj:BaseObj3D):Boolean
		{
			if (baseObj is BaseRole)
			{
				if (!BaseRole(baseObj).isMainChar && !BaseRole(baseObj).isMainCamouflage)
				{
					
					if (baseObj.type == SceneCharType.PLAYER)
					{
						return canSeePlayer(baseObj as SceneRole);
					}
					else if (baseObj.type == SceneCharType.MONSTER)
					{
						return canSeeMonster(baseObj as SceneRole);
					}
					else if (baseObj.type==SceneCharType.GIRL_PET) 
					{
						return canSeeGirlPet(baseObj as SceneRole);
					}
				}
			}
			return true;
		}
		
		public static function getBtnStateByType(type:String):Boolean
		{
			switch(type)
			{
				case LangShieldingMenu.SYSTEMSET_AKEY_BLOCK:
					return aKeyBlock;
				case LangShieldingMenu.SYSTEMSET_MONSTER:
					return checkFiltrateGuaiWu;
				case LangShieldingMenu.SYSTEMSET_HIDE_GANG_PLAYERS:
					return checkFiltrateBangHui;
			}
			return false;
		}
		
		public static function setState(type:String,state:Boolean):void
		{
			switch(type)
			{
				case LangShieldingMenu.SYSTEMSET_AKEY_BLOCK:
					aKeyBlock=state;
					break;
				case LangShieldingMenu.SYSTEMSET_MONSTER:
					checkFiltrateGuaiWu=state;
					break;
				case LangShieldingMenu.SYSTEMSET_HIDE_PLAYERS:
					
					break;				
				case LangShieldingMenu.SYSTEMSET_HIDE_GANG_PLAYERS:
					checkFiltrateBangHui=state;
					break;
				case LangShieldingMenu.SYSTEMSET_HIDE_DOTHER_EFFECTS:
					break;
				case LangShieldingMenu.SYSTEMSET_HIDE_OTHER_GIRL:
					break;			
			}
		}
		
		public static function showEffect(role:SceneRole):Boolean
		{
			if (!role) 
			{
				return false;
			}
			if (role.isMainChar) 
			{
				return true
			}
			//
			if (SceneCharType.MONSTER==role.type) 
			{
				return canSeeMonster(role);
			}
			else if (SceneCharType.PLAYER==role.type) 
			{
				var see:Boolean= canSeePlayer(role);
				if (see) 
				{
					return checkOtherEffect;
				}
				return false
			}
			else if (SceneCharType.GIRL_PET==role.type) 
			{
				return canSeeGirlPet(role);
			}
			return true;
		}
	}
}