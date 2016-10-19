package com.rpgGame.app.manager
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.CharAttributeUpdateEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.SceneCharacterEvent;
	import com.rpgGame.core.events.TaoNiEvent;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.type.CharAttributeType;

	import flash.events.EventDispatcher;

	import app.message.StatType;

	import org.client.mainCore.manager.EventManager;

	/**
	 * 场景所有角色属性变更的管理...
	 * @author Carver
	 *
	 */
	public class CharAttributeManager
	{
		public function CharAttributeManager()
		{
		}

		/**
		 * 通过对应的属性ID,和属性值value,设置对应的数据对象值(BaseCharacterInfo) 场景精灵通用
		 * @param attributeID
		 * @param attributeValue
		 * @param info
		 *
		 */
		public static function setAttributeValue(info : RoleData, attributeType : int, attributeValue : *) : void
		{
			if (info)
			{
				switch (attributeType)
				{
					case CharAttributeType.HP:
						info.hp = attributeValue;
						break;
					case CharAttributeType.MAX_LIFE:
						info.totalStat.life = attributeValue;
						break;
					case CharAttributeType.MP:
						info.mp = attributeValue;
						break;
//					case CharAttributeType.MAX_MP:
//						info.mpMax = attributeValue;
//						break;
//					case CharAttributeType.PH:
//						info.ph = attributeValue;
//						break;
//					case CharAttributeType.MAX_PH:
//						info.phMax = attributeValue;
//						break;
//					case CharAttributeType.ATTACK:
//						info.ap = attributeValue;
//						break;
//					case CharAttributeType.PHYSICAL_DEFENCE:
//						info.dp = attributeValue;
//						break;
//					case CharAttributeType.MAGICAL_DEFENCE:
//						info.magicDef = attributeValue;
//						break;
//					case CharAttributeType.CRIT:
//						info.cp = attributeValue;
//						break;
//					case CharAttributeType.PHYSICAL_DODGE:
//						info.phyDodge = attributeValue;
//						break;
//					case CharAttributeType.MAGICAL_DODGE:
//						info.magicDodge = attributeValue;
//						break;
//					case CharAttributeType.HIT:
//						info.hit = attributeValue;
//						break;
//					case CharAttributeType.ADX:
//						info.adx = attributeValue;
//						break;
//					case CharAttributeType.LV:
//						info.lv = attributeValue;
//						break;
//					case CharAttributeType.EXP:
//						info.expNow = attributeValue;
//						break;
//					case CharAttributeType.MAX_EXP:
//						info.expMax = attributeValue;
//						break;
					case CharAttributeType.PK_MODE:
						//HeroData(info).pkMode = attributeValue;
						break;
					case CharAttributeType.PK:
						HeroData(info).pkMode = attributeValue;
						break;
				}
				dispatchEvent(info.id, attributeType, attributeValue);
			}
		}

		public static function setCharHp(info : RoleData, hpValue : int) : void
		{
			setAttributeValue(info, CharAttributeType.HP, hpValue);
			updateBloodBar(info);

//			if( info.id == MainRoleManager.actorID )
			EventManager.dispatchEvent(MainPlayerEvent.NOWHP_CHANGE, info);
			if (info.type == RoleType.TYPE_LIANG_CANG)
			{
				EventManager.dispatchEvent(TaoNiEvent.TAO_NI_LIANG_CANG_STATE_CHANGE, info, CharAttributeType.HP);
			}
		}



		public static function setCharMp(roleData : RoleData, finalValue : int) : void
		{
			setAttributeValue(roleData, CharAttributeType.MP, finalValue);
			updateMpBar(roleData);
//			if(roleData.id == MainRoleManager.actorID)
			EventManager.dispatchEvent(MainPlayerEvent.NOWMP_CHANGE, roleData);
		}

		private static function updateMpBar(info : RoleData) : void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(info.id) as SceneRole;
			if (role)
			{
				if (role == SceneRoleSelectManager.selectedRole)
				{
					EventManager.dispatchEvent(SceneCharacterEvent.SCENE_CHAR_DATA_UPDATE, role);
				}
			}
		}

		private static function updateBloodBar(info : RoleData) : void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(info.id) as SceneRole;
			if (role)
			{
				if (role.headFace is HeadFace)
					(role.headFace as HeadFace).bloodPercent = (info.hp / info.totalStat.life);
				if (role == SceneRoleSelectManager.selectedRole)
				{
					EventManager.dispatchEvent(SceneCharacterEvent.SCENE_CHAR_DATA_UPDATE, role);
				}
			}
		}

		public static function setCharMaxLife(info : RoleData, value : int) : void
		{
			setAttributeValue(info, StatType.MAX_LIFE, value);
			updateBloodBar(info);

			//-----------------这个地方派发MAXHP_CHANGE事件意义不大，当时实际属性并没有开始改变-------
//			if( info.id == MainRoleManager.actorID )
//				EventManager.dispatchEvent(MainPlayerEvent.MAXHP_CHANGE);
		}

		private static var _ed : EventDispatcher;

		public static function addListEvent(charID : Number, attributeTypeList : Vector.<int>, event : Function) : void
		{
			for each (var type : int in attributeTypeList)
			{
				addEvent(charID, type, event);
			}
		}

		public static function removeListEvent(charID : Number, attributeTypeList : Vector.<int>, event : Function) : void
		{
			for each (var type : int in attributeTypeList)
			{
				removeEvent(charID, type, event);
			}
		}

		public static function addAllEvent(charID : Number, event : Function) : void
		{
			for (var type : int = 0; type < CharAttributeType.ALL; type++)
			{
				addEvent(charID, type, event);
			}
		}

		public static function removeAllEvent(charID : Number, event : Function) : void
		{
			for (var type : int = 0; type < CharAttributeType.ALL; type++)
			{
				removeEvent(charID, type, event);
			}
		}

		public static function addEvent(charID : Number, attributeType : int, event : Function) : void
		{
			if (_ed == null)
			{
				_ed = new EventDispatcher();
			}
			var key : String = CharAttributeUpdateEvent.getAttriUpdateEvtType(charID, attributeType);
			_ed.addEventListener(key, event);
		}

		public static function removeEvent(charID : Number, attributeType : int, event : Function) : void
		{
			if (_ed != null)
			{
				var key : String = CharAttributeUpdateEvent.getAttriUpdateEvtType(charID, attributeType);
				_ed.removeEventListener(key, event);
			}
		}

		public static function dispatchEvent(charID : Number, attributeType : int, value : *) : void
		{
			if (_ed != null)
			{
				_ed.dispatchEvent(new CharAttributeUpdateEvent(charID, attributeType, value));
			}
		}

	}
}
