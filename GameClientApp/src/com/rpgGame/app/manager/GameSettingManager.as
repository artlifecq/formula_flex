package com.rpgGame.app.manager
{
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.engine3D.vo.BaseRole;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.HeroMiscSender;
	import com.rpgGame.core.events.GameSettingEvent;
	import com.rpgGame.core.events.MenuEvent;
	import com.rpgGame.coreData.enum.EnumCustomTagType;
	import com.rpgGame.coreData.lang.LangShieldingMenu;
	import com.rpgGame.coreData.role.BiaoCheData;
	import com.rpgGame.coreData.role.HeroData;
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
		 * 家族
		 */		
		private static var _checkFiltrateJiaZu:Boolean = false;
		/**
		 * 帮会 
		 */		
		private static var _checkFiltrateBangHui:Boolean = false;
		/**
		 * 镖车 
		 */		
		private static var _checkFiltrateBiaoChe:Boolean = false;
		/**
		 * 本国
		 */		
		private static var _checkFiltrateBenGuo:Boolean = false;
		
		public static function initData(dataStr:String):void
		{
			gameSetObj  = JSONUtil.decode(dataStr)[0];
			if(gameSetObj!=null)
			{
				aKeyBlock=gameSetObj.gameSet.aKeyBlock;
				checkFiltrateGuaiWu=gameSetObj.gameSet.checkFiltrateGuaiWu;
				checkFiltrateDuiWu=gameSetObj.gameSet.checkFiltrateDuiWu;
				checkFiltrateJiaZu=gameSetObj.gameSet.checkFiltrateJiaZu;
				checkFiltrateBangHui=gameSetObj.gameSet.checkFiltrateBangHui;
				checkFiltrateBiaoChe=gameSetObj.gameSet.checkFiltrateBiaoChe;
				checkFiltrateBenGuo=gameSetObj.gameSet.checkFiltrateBenGuo;		
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
		
		public static function set checkFiltrateJiaZu(value:Boolean):void
		{
			_checkFiltrateJiaZu=value;
			if(!_checkFiltrateJiaZu&&aKeyBlock){
				_aKeyBlock=false;
				EventManager.dispatchEvent(MenuEvent.CANCEL_LOCK);
			}
			EventManager.dispatchEvent(GameSettingEvent.FILTRATE_UPDATE);
		}
		
		public static function get checkFiltrateJiaZu():Boolean
		{
			return _checkFiltrateJiaZu;
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
		
		public static function set checkFiltrateBiaoChe(value:Boolean):void
		{
			_checkFiltrateBiaoChe=value;
			if(!_checkFiltrateBiaoChe&&aKeyBlock){
				_aKeyBlock=false;
				EventManager.dispatchEvent(MenuEvent.CANCEL_LOCK);
			}
			EventManager.dispatchEvent(GameSettingEvent.FILTRATE_UPDATE);
		}
		
		public static function get checkFiltrateBiaoChe():Boolean
		{
			return _checkFiltrateBiaoChe;
		}
		
		public static function set checkFiltrateBenGuo(value:Boolean):void
		{
			_checkFiltrateBenGuo=value;
			if(!_checkFiltrateBenGuo&&aKeyBlock){
				_aKeyBlock=false;
				EventManager.dispatchEvent(MenuEvent.CANCEL_LOCK);
			}
			EventManager.dispatchEvent(GameSettingEvent.FILTRATE_UPDATE);
		}
		
		public static function get checkFiltrateBenGuo():Boolean
		{
			return _checkFiltrateBenGuo;
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
			data.push({gameSet:{aKeyBlock:aKeyBlock,checkFiltrateGuaiWu:checkFiltrateGuaiWu,checkFiltrateDuiWu:checkFiltrateDuiWu,checkFiltrateJiaZu:checkFiltrateJiaZu,
				checkFiltrateBangHui:checkFiltrateBangHui,checkFiltrateBiaoChe:checkFiltrateBiaoChe,checkFiltrateBenGuo:checkFiltrateBenGuo}});
			value=JSONUtil.encode(data);
			return value;
		}
		
		public static function filtrateAll(bool:Boolean):void
		{
			checkFiltrateGuaiWu = bool;
			checkFiltrateDuiWu = bool;
			checkFiltrateJiaZu = bool;
			checkFiltrateBangHui = bool;
			checkFiltrateBiaoChe = bool;
			checkFiltrateBenGuo = bool;
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
			if(checkFiltrateGuaiWu||checkFiltrateDuiWu||checkFiltrateJiaZu||checkFiltrateBangHui||checkFiltrateBiaoChe||checkFiltrateBenGuo)
				return true;
			else return false;
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
						if (checkFiltrateBenGuo && HeroData(baseObj.data).countryId == MainRoleManager.actorInfo.countryId)
						{
							return false;
						}
						if (checkFiltrateDuiWu && Mgr.teamMgr.isInMyTeam(HeroData(baseObj.data).serverID))
						{
							return false;
						}
						if (checkFiltrateJiaZu && HeroData(baseObj.data).societyName == MainRoleManager.actorInfo.societyName)
						{
							return false;
						}
						if (checkFiltrateBangHui && HeroData(baseObj.data).guildName == MainRoleManager.actorInfo.guildName)
						{
							return false;
						}
					}
					else if (baseObj.type == SceneCharType.BIAO_CHE)
					{
						if (checkFiltrateBiaoChe && BiaoCheData(baseObj.data).countryId == MainRoleManager.actorInfo.countryId)
						{
							return false;
						}
					}
					else if (baseObj.type == SceneCharType.MONSTER)
					{
						return !checkFiltrateGuaiWu;
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
	}
}