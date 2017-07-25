package com.rpgGame.app.manager
{
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.ShortcutsTypeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.info.shortcuts.ShortcutsData;
	import com.rpgGame.coreData.lang.LangQ_NoticeInfo;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	/**
	 * 主控面板快捷栏管理器 
	 * @author NEIL
	 * 
	 */	
	public class ShortcutsManger
	{
		public static const SHORTCUTS_LEN : uint = 10;
		private var shortcutsDataMap : HashMap;
		private var _tempSpells:HashMap;
		private var _isUsed : Boolean = false;

		public function ShortcutsManger()
		{
			shortcutsDataMap = new HashMap();
            EventManager.addEvent(BuffEvent.REMOVE_BUFF, onRemoveBuffEventHandler);
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
		public function updateNewSpell(spellProto : Q_skill_model, saveToServer:Boolean = true) : void
		{
			if (spellProto.q_trigger_type != 1)
				return;
			if (shortcutsHasValue(ShortcutsTypeEnum.SKILL_TYPE, spellProto.q_skillID))
			{
				return;
			}
			var i : int = 0;
			var shortcuts : ShortcutsData;
			while (i < SHORTCUTS_LEN)
			{
				shortcuts = getShortcutsDataByPos(i);
				if (!shortcuts)
				{
					setShortData(i, ShortcutsTypeEnum.SKILL_TYPE, spellProto.q_skillID,saveToServer);
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
			EventManager.dispatchEvent(SpellEvent.SPELL_UPDATE_SHORTCUTS);
		}

		/**
		 *格式如下： 
		 * {t :vo.type , mid :vo.id , k :vo.shortcutPos}
		 */		
		private function initShortcutData() : void
		{
			shortcutsDataMap.clear();
			var shortData : ShortcutsData;
			var shorts : Object;
			for (var i : int = 0; i < SHORTCUTS_LEN; i++)
			{
				shorts = ClientSettingManager.getShortCutDataByKey(i);

				if (shorts == null)
				{
					//这段注释里写的是测试代码，为了方便调试技能，所以先这么写，后面系统成熟了，再去掉这段代码
//					setShortData(i,ShortcutsTypeEnum.SKILL_TYPE,(1001 + i));
					//
					continue;
				}
				shortData = new ShortcutsData();
				
				shortData.type = shorts.t;
				shortData.shortcutPos = shorts.k;
				shortData.id = shorts.mid;
				shortData.itemBind=shorts.bind;
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
		public function setShortData(gridPos : int, type : int, id : int, saveToServer:Boolean = true,itemBind:int=0) : void
		{
			var shortcutsData : ShortcutsData = new ShortcutsData();

			shortcutsData.shortcutPos = gridPos;
			shortcutsData.type = type;
			shortcutsData.id = id;
			shortcutsData.itemBind=itemBind;
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
				sendShortMsg();
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

			ClientSettingManager.savaClientShortCutsToServer(shortcutsDataMap);
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
		public function useShortcuts(shortcutPos : uint, isKeyboard : Boolean = false) : Boolean
		{
			var shortData : ShortcutsData = getShortcutsDataByPos(shortcutPos);
			if (shortData == null)
			{
                NoticeManager.showNotify(LangQ_NoticeInfo.CastSpellByBinding); //"没有穿戴武器不能释放技能"
				return false; //这个快捷键没有设置数据
			}

			switch (shortData.type)
			{
				case ShortcutsTypeEnum.SKILL_TYPE:
					//使用这个技能，走释放技能的流程
                    var config : Q_skill_model = CastSpellHelper.getSpellData(shortData.id);
                    if (isKeyboard && null != config && 1 == config.q_skill_state) {//技能持续状态
                        SpellSender.reqSkillContiState(shortData.id, this._isUsed ? 0 : 1);
						this._isUsed = !this._isUsed;
                        return true;
                    }
					CastSpellHelper.shortcutsTryCaseSpell(shortData.id);
					return true;

				case ShortcutsTypeEnum.ITEM_TYPE:
					//使用这个物品，走物品流程
					BackPackManager.instance.useItem(shortData.id, shortData.itemBind);
					return true;
			}
			
			//没有这个类型
			return true;
		}
        
        private function onRemoveBuffEventHandler(buffData:BuffData) : void {
            if (buffData.roleId != MainRoleManager.actor.id) {
                return;
            }
            if (2003 == buffData.cfgId) {
                // 疯狂连弩技能产生的buff
                this._isUsed = false;
            }
        }

		//-------------------------------------------------------
		//----------------------消息相关
		private function sendShortMsg() : void
		{
			ClientSettingManager.savaClientShortCutsToServer(shortcutsDataMap);
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
					var spellProto:Q_skill_model = spells[i];
					_tempSpells.add(spellProto.q_skillID,spellProto);
					updateNewSpell(spellProto,false);
				}
			}
			EventManager.dispatchEvent(SpellEvent.SPELL_UPDATE_SHORTCUTS);
		}
        
        public function replaceToTempSpellByVector(spells:Vector.<Q_skill_model>):void
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
                    var spellProto:Q_skill_model = spells[i];
                    _tempSpells.add(spellProto.q_skillID,spellProto);
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
		public function getTempSellProto(spellID:int):Q_skill_model
		{
			if(_tempSpells)
			{
				return _tempSpells.getValue(spellID);
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
