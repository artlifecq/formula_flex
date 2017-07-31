package com.rpgGame.app.manager
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.role.MainRoleManager;
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
	import com.rpgGame.coreData.type.EnumHurtType;
	
	import flash.events.EventDispatcher;
	
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
		 * 通过对应的属性ID,和属性值value,设置对应的数据对象值, 场景精灵通用
		 * @param data
		 * @param attributeType
		 * @param attributeValue
		 * @param showEffet
		 * 
		 */
		public static function setAttributeValue(data : RoleData, attributeType : int, attributeValue : *,showEffet:int=0) : void
		{
			if (data)
			{
				var offset : int = 0;
				var oldValue:Number=data.totalStat.getStatValue(attributeType);
				data.totalStat.setStatValue(attributeType,attributeValue);
				switch (attributeType)
				{
					case CharAttributeType.HP:
						updateBloodBar(data);
						EventManager.dispatchEvent(MainPlayerEvent.NOWHP_CHANGE, data);
						if (data.type == RoleType.TYPE_LIANG_CANG)
						{
							EventManager.dispatchEvent(TaoNiEvent.TAO_NI_LIANG_CANG_STATE_CHANGE, data, CharAttributeType.HP);
						}
						offset=data.totalStat.hp-oldValue;
						if (data.id == MainRoleManager.actorID && offset > 0&&showEffet>=1) //自己看到就好了
						{
							FightFaceHelper.showAttChange(EnumHurtType.ADDHP, offset,showEffet);
						}
						break;
					case CharAttributeType.MAX_HP:
						data.totalStat.life = attributeValue;
						EventManager.dispatchEvent(MainPlayerEvent.MAXHP_CHANGE,data);//通知最大血量改变
						break;
					case CharAttributeType.MP:
						offset = attributeValue - oldValue;
						updateMpBar(data);
						EventManager.dispatchEvent(MainPlayerEvent.NOWMP_CHANGE, data);
						break;
					case CharAttributeType.LV:
						updateBloodLV(data);
					default:
//						data.spriteStat.addStatValue();
						break;
				}
				dispatchEvent(data.id, attributeType, attributeValue);
			}
		}
		
		public static function setCharHp(data : RoleData, hpValue : int) : void
		{
			setAttributeValue(data, CharAttributeType.HP, hpValue);
		}



		public static function setCharMp(roleData : RoleData, finalValue : int) : void
		{
			setAttributeValue(roleData, CharAttributeType.MP, finalValue);
		}

		private static function updateMpBar(data : RoleData) : void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(data.id) as SceneRole;
			if (role)
			{
				if (role == SceneRoleSelectManager.selectedRole)
				{
					EventManager.dispatchEvent(SceneCharacterEvent.SCENE_CHAR_DATA_UPDATE, role);
				}
			}
		}

		private static function updateBloodBar(data : RoleData) : void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(data.id) as SceneRole;
			if (role)
			{
				if (role.headFace is HeadFace)
				{
					(role.headFace as HeadFace).bloodPercent = (data.totalStat.hp / data.totalStat.life);
					(role.headFace as HeadFace).showBloodStr(data.totalStat.hp +"/"+ data.totalStat.life);
				}
				if (role == SceneRoleSelectManager.selectedRole)
				{
					EventManager.dispatchEvent(SceneCharacterEvent.SCENE_CHAR_DATA_UPDATE, role);
				}
			}
		}
		private static function updateBloodLV(data : RoleData) : void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(data.id) as SceneRole;
			if (role)
			{
				if (role.headFace is HeadFace)
					(role.headFace as HeadFace).level = (data.totalStat.level);
			}
		}

		public static function setCharMaxLife(data : RoleData, value : int) : void
		{
			setAttributeValue(data, CharAttributeType.MAX_HP, value);
			updateBloodBar(data);
			//-----------------这个地方派发MAXHP_CHANGE事件意义不大，当时实际属性并没有开始改变-------
//			if( data.id == MainRoleManager.actorID )
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
