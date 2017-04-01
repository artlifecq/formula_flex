package com.rpgGame.app.ui.main.shortcut
{
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.ShortcutsTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.shortcuts.ShortcutsData;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.Sprite;

	public class ShortcutSkillBar extends Sprite
	{
		private var _shortcutBar : ShortcutBar;
		private const GRID_COUNT : int = 8;

		private const SHORTCUTS_KEY : Array = ["1", "2", "3", "4","Q", "W", "E", "R"];

		private var _gridVect : Vector.<ShortcutGrid>;

		public function ShortcutSkillBar(shortcutBar : ShortcutBar)
		{
			_shortcutBar = shortcutBar;
			initBar();
		}

		override public function get height() : Number
		{
			return 100;
		}

		private function initBar() : void
		{
			createGrid();
			addEvent();
			updateAllGridData();
		}

		private function addEvent() : void
		{
			EventManager.addEvent(ItemEvent.ITEM_DROPED, onDragDrop);
			EventManager.addEvent(ItemEvent.ITEM_CHANG, onItemChang);
			EventManager.addEvent(ItemEvent.ITEM_DELETE, onItemChang);
			EventManager.addEvent(ItemEvent.ITEM_ADD, onItemChang);
			EventManager.addEvent(ItemEvent.ITEM_INPUT_SHORTCUT, autoInputItemToShortcutGrid);
			EventManager.addEvent(SpellEvent.SPELL_UPDATE_SHORTCUTS, onClearSpell);
			EventManager.addEvent(SpellEvent.SPELL_KEY_RELEASE, onKeySkill);
		}
		
		private function onKeySkill(index:int):void
		{
			_gridVect[index].tweenGrid();
		}
		
		/**
		 * 创建格子
		 *
		 */
		private function createGrid() : void
		{
			_gridVect = new Vector.<ShortcutGrid>();
			var size : int = IcoSizeEnum.ICON_48;
			var gridInfo : GridInfo;
			var bgWH:int=54;
			for (var i : int = 0; i < GRID_COUNT; i++)
			{
				var cd:ShortcutGrid = new ShortcutGrid(_shortcutBar, size);
				cd.width = cd.height = size;

				cd.dragAble = true;
				gridInfo = new GridInfo(ItemContainerID.Shortcut, i);
				cd.gridInfo = gridInfo;
				cd.onTouchEndCallBack = onTouchGrid;
				cd.rightMouseClickFun = onRightMouseClick;
				cd.x = 9 + bgWH * i;
				cd.y = 4;
				
				cd.setBg(GridBGType.GRID_SIZE_48);
				cd.setIconPoint(0, 0);
				addChild(cd);
				_gridVect.push(cd);
//				cd.showShortCutText(SHORTCUTS_KEY[i]);
			}
		}

		//---------------------------------------
		/**
		 * 设置数据
		 *
		 */
		private function updateAllGridData() : void
		{
			var len : int = _gridVect.length;
			for (var i : int = 0; i < len; i++)
			{
				updateGrid(i);
			}

		}

		/**
		 * 使用快捷栏上的东西
		 * @param cd
		 *
		 */
		private function onTouchGrid(cd : ShortcutGrid) : void
		{
			if (cd == null)
				return;
			if(ShortcutsManger.getInstance().useShortcuts(cd.index)){
				cd.tweenGrid();
			}
		}
		
		private function onRightMouseClick(cd : ShortcutGrid) : void
		{
			if (cd == null)
				return;

			var shortcutData : ShortcutsData = ShortcutsManger.getInstance().getShortcutsDataByPos(cd.index);
			if (shortcutData == null)
				return;

			switch (shortcutData.type)
			{
				case ShortcutsTypeEnum.SKILL_TYPE: //如果是技能那么把这个技能设置成或自动释放的状态
					var spellProto : Q_skill_model = MainRoleManager.actorInfo.spellList.getSpell(shortcutData.id);
					if (spellProto == null)
						return;

					if (MainRoleManager.actorInfo.spellList.isAutoSpellId(shortcutData.id))
					{
						//已经设置了那么就取消
						MainRoleManager.actorInfo.spellList.removeAutoSpell(shortcutData.id);

						if (spellProto && spellProto.q_is_allow_auto_combat)
							cd.showAutoImg(true);
						else
							cd.showAutoImg(false);
						cd.showAutoEff(false);
						return;
					}

					if (spellProto && spellProto.q_is_allow_auto_combat) //如果这个技能可以设置成自动释放技能就设置它
					{
						var reqSetted : Boolean = MainRoleManager.actorInfo.spellList.reqAutoSpellMsg(shortcutData.id);
						if (reqSetted)
						{
							cd.showAutoImg(false);
							cd.showAutoEff(true);
						}
					}
					break;

				case ShortcutsTypeEnum.ITEM_TYPE: //如果是物品那使用物品
					ShortcutsManger.getInstance().useShortcuts(cd.index);
					break;
			}

		}

		//--------------------------------------------------------------------
		/**
		 * 更新指定格子的数据
		 * @param gridIndex
		 *
		 */
		private function updateGrid(gridIndex : int) : void
		{
			var grid : ShortcutGrid = _gridVect[gridIndex];
			if (grid == null)
				return;

			var shortData : ShortcutsData = ShortcutsManger.getInstance().getShortcutsDataByPos(gridIndex);
			if (shortData == null)
			{
				grid.clear();
				return;
			}

			switch (shortData.type)
			{
				case ShortcutsTypeEnum.SKILL_TYPE:
					var skillData : Q_skill_model = ShortcutsManger.getInstance().getTempSellProto(shortData.id);
					if(skillData == null)
					{
						skillData = MainRoleManager.actorInfo.spellList.getSpell(shortData.id);
						if (skillData == null)
						{
							trace("为什么一个没有学习过的技能会保存在快捷栏里呢");
							return;
						}
					}

					FaceUtil.SetSkillGrid(grid, FaceUtil.chanceSpellToFaceInfo(skillData), false);//暂时不展示tips

					var isAutoSpell : Boolean = MainRoleManager.actorInfo.spellList.isAutoSpellId(skillData.q_skillID);
					if (isAutoSpell)
					{
						grid.showAutoImg(false);
						grid.showAutoEff(true);
					}
					else
					{
						if (skillData.q_is_allow_auto_combat)
							grid.showAutoImg(true);
						else
							grid.showAutoImg(false);
						grid.showAutoEff(false);
					}
					break;

				case ShortcutsTypeEnum.ITEM_TYPE:
					var itemInfo : ClientItemInfo = new ClientItemInfo( shortData.id);
					itemInfo.count = BackPackManager.instance.getItemCount(shortData.id);
					FaceUtil.SetItemGrid(grid, itemInfo);
					grid.isEnabled = itemInfo.count > 0;
					break;
			}
		}

		private function onClearSpell() : void
		{
			updateAllGridData();
		}

		//--------------------------------------------------------------------
		/**
		 *
		 *
		 */
		private function onDragDrop(dragSourceGridInfo : GridInfo, targetGridInfo : GridInfo) : void
		{
			if (dragSourceGridInfo != null && dragSourceGridInfo.containerID == ItemContainerID.Shortcut)
			{
				//拖动是从快捷栏开始的
				if (targetGridInfo == null)
				{
					trace("取消了当前快捷栏的设置");
					ShortcutsManger.getInstance().removeShortchtsDataByPos(dragSourceGridInfo.index);
					//---------------------------
					updateGrid(dragSourceGridInfo.index);
					return;
				}

				if (targetGridInfo.containerID != ItemContainerID.Shortcut)
				{
					trace("把快捷栏的东西拖背包或者别的地方去了，不用管，无效的操作")
					return;
				}

				var sourceData : ShortcutsData = ShortcutsManger.getInstance().getShortcutsDataByPos(dragSourceGridInfo.index);
				var targetData : ShortcutsData = ShortcutsManger.getInstance().getShortcutsDataByPos(targetGridInfo.index);
				if (targetData == null)
				{
					trace("把", dragSourceGridInfo.index, "移动到", targetGridInfo.index);
					//设置新的，删除旧的
					ShortcutsManger.getInstance().setShortData(targetGridInfo.index, sourceData.type, sourceData.id);
					ShortcutsManger.getInstance().removeShortchtsDataByPos(dragSourceGridInfo.index);
					//---------------------------
					updateGrid(targetGridInfo.index);
					updateGrid(sourceData.shortcutPos);
				}
				else
				{
					trace("把", dragSourceGridInfo.index, "交换到", targetGridInfo.index);

					ShortcutsManger.getInstance().setShortData(targetData.shortcutPos, sourceData.type, sourceData.id);
					ShortcutsManger.getInstance().setShortData(sourceData.shortcutPos, targetData.type, targetData.id);
					//---------------------------
					updateGrid(dragSourceGridInfo.index);
					updateGrid(targetGridInfo.index);
				}
				return;
			}

			if (targetGridInfo == null || targetGridInfo.containerID != ItemContainerID.Shortcut)
				return; //开始与结束都不是快捷栏

			//结束时在快捷栏上
			var realId : int = -1;
			var shortType : int = -1;

			switch (dragSourceGridInfo.containerID)
			{
				case ItemContainerID.BackPack:
					shortType = ShortcutsTypeEnum.ITEM_TYPE;
					realId = dragSourceGridInfo.data.cfgId;
					break;
				case ItemContainerID.Spell:
					shortType = ShortcutsTypeEnum.SKILL_TYPE;
					realId = dragSourceGridInfo.data.cfgId;
					break;

				default:
					trace("如果不是从背包与技能面板里拖动过来的都是无效操作")
					return;
			}

			trace("把这个位置", targetGridInfo.index, "替换成新的", realId);

			//----------------如果新拖来的物品或者技能原本就在快捷栏上，那么就要删除旧的
			var oldShort : ShortcutsData = ShortcutsManger.getInstance().getShortchtDataByTypeId(shortType, realId);
			if (oldShort != null)
			{
				ShortcutsManger.getInstance().removeShortchtsDataByPos(oldShort.shortcutPos);
				//---------------------------
				updateGrid(oldShort.shortcutPos);
			}

			ShortcutsManger.getInstance().setShortData(targetGridInfo.index, shortType, realId);
			//---------------------------
			updateGrid(targetGridInfo.index);
		}

		private function autoInputItemToShortcutGrid(shortCutGridIndex : int, itemCfgId : int) : void
		{
			ShortcutsManger.getInstance().setShortData(shortCutGridIndex, ShortcutsTypeEnum.ITEM_TYPE, itemCfgId);
			updateGrid(shortCutGridIndex);
		}

		private function onItemChang(itemInfo : ClientItemInfo) : void
		{
			if (!itemInfo)
				return;
			var oldShort : ShortcutsData = ShortcutsManger.getInstance().getShortchtDataByTypeId(ShortcutsTypeEnum.ITEM_TYPE, itemInfo.cfgId);
			if (oldShort != null)
			{
				updateGrid(oldShort.shortcutPos);
			}
		}
	}
}
