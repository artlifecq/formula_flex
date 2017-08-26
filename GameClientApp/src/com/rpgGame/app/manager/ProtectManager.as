package com.rpgGame.app.manager
{
    import com.game.mainCore.core.timer.GameTimer;
    import com.rpgGame.app.manager.goods.BackPackManager;
    import com.rpgGame.app.manager.goods.ItemManager;
    import com.rpgGame.app.manager.goods.ItemUseManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.sender.SceneSender;
    import com.rpgGame.core.events.MainPlayerEvent;
    import com.rpgGame.coreData.info.item.ClientItemInfo;
    
    import gs.TweenLite;
    
    import org.client.mainCore.manager.EventManager;
	
	/**
	 * 监听主角属性事件 
	 * @author NEIL
	 * 
	 */	
    public class ProtectManager 
    {
        private static var _gTimer:GameTimer;

        public static function setup():void
        {
            EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE, onMainRoleLevelUp);
			EventManager.addEvent(MainPlayerEvent.PLAYER_DIE,onMainRoleDeathHanlder);
			EventManager.addEvent(MainPlayerEvent.SELFHP_CHANGE,hpChange);
        }
		
        public static function tryStartTimer():void
        {
            var isHPLow:Boolean;
            var isMpLow:Boolean;
            var percent:int;
            if (ClientSettingProtectManager.toUseGoods)
            {
				isHPLow = false;
				isMpLow = false;
				percent = (MainRoleManager.actorInfo.totalStat.hp / MainRoleManager.actorInfo.totalStat.life) * 100;
                if (percent <= ClientSettingProtectManager.hpPercentToUseGoods)
                {
					isHPLow = true;
                }
//				percent = (MainRoleManager.actorInfo.totalStat.mp / MainRoleManager.actorInfo.totalStat.mana) * 100;
//                if (percent <= ClientSettingProtectManager.mpPercentToUseGoods)
//                {
//					isMpLow = true;
//                }
                if (isHPLow || isMpLow)
                {
                    startTimer();
                }
            }
        }
		
		private static function onMainRoleDeathHanlder(...arg):void
		{
			if(ClientSettingProtectManager.toAutoRelive)//使用复活药
			{
				var deaditem:ClientItemInfo=BackPackManager.instance.getResurgenceItem();
				if(deaditem!=null && !ItemCDManager.getInstance().getSkillHasCDTime(deaditem.qItem))//做CD判断
				{
					TweenLite.killDelayedCallsTo(useDeadItem);
					TweenLite.delayedCall(3,useDeadItem,[deaditem]);
				}
			}
		}
		
		private static function useDeadItem(deaditem:ClientItemInfo):void
		{
			if(MainRoleManager.actor&&MainRoleManager.actor.stateMachine.isDeadState)
			{
				SceneSender.reqReviveLocalRole(deaditem.qItem.q_id,1);
			}
		}

        private static function onMainRoleLevelUp():void
        {
			FunctionOpenManager.openFunctionByLevel(MainRoleManager.actorInfo.totalStat.level,true);
			FunctionOpenManager.openNoticeByLevel(MainRoleManager.actorInfo.totalStat.level);
			ActivetyDataManager.checkOpenAct();//检测最新活动开启
//            var goodID:int;
//            var _local4:int;
//            var _local1:int;
//            var itemID:int;
//            var hpGoodsIDs:Vector.<int> = ClientGuaJiCfgData.hpGoodsIDs;
//            if (hpGoodsIDs && hpGoodsIDs.length)
//            {
//                for each (itemID in hpGoodsIDs)
//                {
//                    _local4 = ItemCfgData.getItemRequireLevel(itemID);
//                    if (MainRoleManager.actorInfo.totalStat.level >= _local4 && _local4 > _local1)
//                    {
//						goodID = itemID;
//                        _local1 = _local4;
//                    }
//                }
//            }
//            if (goodID != ClientSettingProtectManager.hpGoodsIDToUse)
//            {
//                ClientSettingProtectManager.hpGoodsIDToUse = goodID;
//            }
//            _local1 = 0;
//			goodID = 0;
//            var _local5:Vector.<int> = ClientGuaJiCfgData.mpGoodsIDs;
//            if (_local5 && _local5.length)
//            {
//                for each (itemID in _local5)
//                {
//                    _local4 = ItemCfgData.getItemRequireLevel(itemID);
//                    if (MainRoleManager.actorInfo.totalStat.level >= _local4 && _local4 > _local1)
//                    {
//						goodID = itemID;
//                        _local1 = _local4;
//                    }
//                }
//            }
//            if (goodID != ClientSettingProtectManager.mpGoodsIDToUse)
//            {
//                ClientSettingProtectManager.mpGoodsIDToUse = goodID;
//            }
        }

        private static function hpChange():void
        {
			ItemManager.getBackEquip(tryStartTimer);
            //tryStartTimer();
        }

        private static function mpChange():void
        {
            tryStartTimer();
        }

        private static function startTimer():void
        {
            if (!_gTimer)
            {
                _gTimer = new GameTimer("ProtectManager", 1000, 0, onTmTick);
                _gTimer.start();
                onTmTick();
            }
            else
            {
                if (!_gTimer.running)
                {
                    _gTimer.start();
                    onTmTick();
                }
            }
        }

        private static function onTmTick():void
        {
            var percent:int;
            var isStop:Boolean = true;
            if (ClientSettingProtectManager.toUseGoods)
            {
				percent = (MainRoleManager.actorInfo.totalStat.hp / MainRoleManager.actorInfo.totalStat.life) * 100;
                if (percent <= ClientSettingProtectManager.hpPercentToUseGoods && percent < 100)
                {
					isStop = false;
                    toUseGoods(ClientSettingProtectManager.toBuyGoods);
                }
//				percent = (MainRoleManager.actorInfo.totalStat.mp / MainRoleManager.actorInfo.totalStat.mana) * 100;
//                if (percent <= ClientSettingProtectManager.mpPercentToUseGoods && percent < 100)
//                {
//					isStop = false;
//                    toUseGoods(ClientSettingProtectManager.mpGoodsIDToUse, ClientSettingProtectManager.toBuyGoods);
//                }
            }
            if (isStop)
            {
                _gTimer.stop();
                _gTimer.reset();
            }
        }

        private static function toUseGoods(toBuyGoods:Boolean):void
        {
            if (MainRoleManager.actorInfo.totalStat.hp <= 0)
            {
                return;
            }
			
			var item:ClientItemInfo=BackPackManager.instance.searchHPSuitDrugItem(toBuyGoods);
			if(item!=null)     //搜索物品的时候已经做了CD判断
			{
				//BackPackManager.instance.useItem(item.cfgId, item.qItem.q_bind);
				ItemUseManager.useItem(item);
			}
        }
    }
}