package com.rpgGame.app.manager
{
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.coreData.enum.ShortcutsTypeEnum;
	import com.rpgGame.coreData.info.shortcuts.ShortcutsData;
	
	import app.message.SpellProto;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	/**
	 * 快捷栏数据
	 * @author luguozheng
	 *
	 */
	public class ShortcutsManger
	{
		public static const SHORTCUTS_LEN : uint = 10;
		private var shortcutsDataMap : HashMap;
		private var _tempSpells:HashMap;

		public function ShortcutsManger()
		{
			shortcutsDataMap = new HashMap();
		}

		private static var _instance : ShortcutsManger;

		public static function getInstance() : ShortcutsManger
		{
			if (!_instance)
			{
				_instance = new ShortcutsManger();
			}
			return _instance;
		}

		/**
		 * 学习新技能后如果快捷栏还有空格就自动向快捷栏添加一个技能
		 * @param spellProto
		 *
		 */
		public function updateNewSpell(spellProto : SpellProto, saveToServer:Boolean = true) : void
		{
			if (!spellProto.activeSpell)
				return;
			if (shortcutsHasValue(ShortcutsTypeEnum.SKILL_TYPE, spellProto.spellType))
			{
				trace("快捷栏中已经存在这个技能", spellProto.name);
				return;
			}
			var i : int = 0;
			var shortcuts : ShortcutsData;
			while (i < SHORTCUTS_LEN)
			{
				shortcuts = getShortcutsDataByPos(i);
				if (!shortcuts)
				{
					setShortData(i, ShortcutsTypeEnum.SKILL_TYPE, spellProto.spellType,saveToServer);
					EventManager.dispatchEvent(SpellEvent.SPELL_UPDATE_SHORTCUTS);
					return;
				}
				else
				{
					i++;
				}
			}

		}

		/**
		 * 验证快捷栏中是否存在指定类型指定ID的物品或技能
		 * @param type spell or item
		 * @param id
		 * @return
		 *
		 */
		public function shortcutsHasValue(type : int, id : int) : Boolean
		{
			var values : Array = shortcutsDataMap.getValues();
			var len : uint = values.length;
			var i : int = 0;
			var data : ShortcutsData;
			for (; i < len; i++)
			{
				data = values[i];
				if (data.id == id && type == data.type)
					return true;
			}
			return false;
		}

		///-----------------------------------------------------
		/**
		 * 初始化数据
		 *
		 */
		public function setup() : void
		{
			initShortcutData();
		}

		private function initShortcutData() : void
		{
			var shortData : ShortcutsData;
			var shorts : int;
			var changeData : Array;
			for (var i : int = 0; i < SHORTCUTS_LEN; i++)
			{
				shorts = ClientSettingOldManager.getClientOnlyIntConfig(i);

				if (shorts <= -1)
					continue;
				shortData = new ShortcutsData();
				if (shorts > 0)
				{
					changeData = changeConfig(String(shorts));

					shortData.type = changeData[0];
					shortData.shortcutPos = changeData[1];
					shortData.id = changeData[2];
				}

				shortcutsDataMap.add(shortData.shortcutPos, shortData);
			}
		}

		//-------------------------------------------------------
		/**
		 * 设置新的快捷栏数据
		 * @param gridPos
		 * @param type
		 * @param id
		 *
		 */
		public function setShortData(gridPos : int, type : int, id : int, saveToServer:Boolean = true) : void
		{
			var shortcutsData : ShortcutsData = new ShortcutsData();

			shortcutsData.shortcutPos = gridPos;
			shortcutsData.type = type;
			shortcutsData.id = id;

			//把这个快捷数据保存下来
			addShortcutsData(shortcutsData,saveToServer);
		}

		/**
		 * 设置数据
		 * @param shortData
		 *
		 */
		private function addShortcutsData(shortData : ShortcutsData, saveToServer:Boolean = true) : void
		{
			shortcutsDataMap.add(shortData.shortcutPos, shortData);
			if(saveToServer)
			{
				sendShortMsg(shortData.shortcutPos, shortData.type, shortData.id);
			}
		}

		/**
		 * 得到指定指定格子位置的数据
		 * @param shortcutPos
		 * @return
		 *
		 */
		public function getShortcutsDataByPos(shortcutPos : uint) : ShortcutsData
		{
			return shortcutsDataMap.getValue(shortcutPos);
		}

		/**
		 * 删除某个快捷栏数据
		 * @param shortcutPos
		 *
		 */
		public function removeShortchtsDataByPos(shortcutPos : uint) : void
		{
			shortcutsDataMap.remove(shortcutPos);

			ClientSettingOldManager.reqSetClientOnlyIntConfig(shortcutPos, -1);
		}

		/**
		 * 得到某个物品或者技能的快捷数据
		 * @param type
		 * @param id
		 * @return
		 *
		 */
		public function getShortchtDataByTypeId(type : int, id : int) : ShortcutsData
		{
			var datas : Array = shortcutsDataMap.getValues();
			var len : int = datas.length;
			var shortcut : ShortcutsData;
			for (var i : int = 0; i < len; i++)
			{
				shortcut = datas[i];
				if (shortcut.id == id && shortcut.type == type)
				{
					return shortcut;
				}
			}
			return null;
		}


		public function getAllShortcutsDatas() : Array
		{
			return this.shortcutsDataMap.getValues();
		}

		public function getAllKeys() : Array
		{
			return this.shortcutsDataMap.keys();
		}

		//------------------------------------------
		/**
		 * 清空快捷栏上的技能
		 * 自动释放的设置
		 *
		 */
		public function clearSpell() : void
		{
			var datas : Array = shortcutsDataMap.getValues();
			var len : int = datas.length;
			var shortcut : ShortcutsData;
			for (var i : int = 0; i < len; i++)
			{
				shortcut = datas[i];
				if (shortcut.type == ShortcutsTypeEnum.SKILL_TYPE)
				{
					removeShortchtsDataByPos(shortcut.shortcutPos);
				}
			}
		}

		//-------------------------------------------------------
		/**
		 * 使用这个快捷栏设置的技能与物品
		 * @param shortcutPos
		 * @return
		 *
		 */
		public function useShortcuts(shortcutPos : uint) : Boolean
		{
			var shortData : ShortcutsData = getShortcutsDataByPos(shortcutPos);
			if (shortData == null)
				return false; //这个快捷键没有设置数据

			switch (shortData.type)
			{
				case ShortcutsTypeEnum.SKILL_TYPE:
					//使用这个技能，走释放技能的流程
					CastSpellHelper.shortcutsTryCaseSpell(shortData.id);
					return true;

				case ShortcutsTypeEnum.ITEM_TYPE:
					//使用这个物品，走物品流程
					BackPackManager.instance.useItem(shortData.id, 1);
					return true;
			}
			
			/*var spellInfo:ReleaseSpellInfo=new ReleaseSpellInfo();
			
			RoleStateUtil.blinkToPos(MainRoleManager.actor,RoleActionType.BLINK,//
				new Point(MainRoleManager.actor.x,MainRoleManager.actor.z),new Point(MainRoleManager.actor.x+200,MainRoleManager.actor.z),//
			1000,300,0,10,10,spellInfo);*/
			
			//没有这个类型
			return true;
		}

		//-------------------------------------------------------
		//----------------------消息相关
		private function sendShortMsg(gridIndex : int, type : int, id : int) : void
		{
			var gridID : String = gridIndex >= 10 ? gridIndex + "" : "0" + gridIndex;

			ClientSettingOldManager.reqSetClientOnlyIntConfig(gridIndex, int(id + "" + gridID + "" + type));
		}

		private function changeConfig(shorts : String) : Array
		{
			return [shorts.charAt(shorts.length - 1), shorts.substring(shorts.length - 3, shorts.length - 1), shorts.substring(0, shorts.length - 3)];
		}

		/**
		 * 替换快捷栏为临时技能列表，不保存到服务器
		 * @param spells
		 * 
		 */
		public function replaceToTempSpells(spells:Array):void
		{
			shortcutsDataMap.clear();
			if(spells != null)
			{
				if(_tempSpells == null)
				{
					_tempSpells = new HashMap();
				}
				var len:int = spells.length;
				var i:int;
				for(i = 0; i < len; i++)
				{
					var spellProto:SpellProto = spells[i];
					_tempSpells.add(spellProto.spellType,spellProto);
					updateNewSpell(spellProto,false);
				}
			}
			EventManager.dispatchEvent(SpellEvent.SPELL_UPDATE_SHORTCUTS);
		}
		
		/**
		 * 是否是临时技能条
		 * @return 
		 * 
		 */
		public function get isTempSpellBar():Boolean
		{
			return (_tempSpells != null);
		}
		
		/**
		 * 获取临时技能数据
		 * @param spellType
		 * @return 
		 * 
		 */
		public function getTempSellProto(spellType:int):SpellProto
		{
			if(_tempSpells)
			{
				return _tempSpells.getValue(spellType);
			}
			return null;
		}
		
		/**
		 * 用服务器存储的数据重置技能列表
		 * 
		 */
		public function reset():void
		{
			if(_tempSpells)
			{
				_tempSpells.clear();
				_tempSpells = null;
			}
			shortcutsDataMap.clear();
			initShortcutData();
			EventManager.dispatchEvent(SpellEvent.SPELL_UPDATE_SHORTCUTS);
		}
		
	}
}
