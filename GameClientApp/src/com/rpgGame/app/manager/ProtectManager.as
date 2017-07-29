package com.rpgGame.app.manager
{
    import com.game.mainCore.core.timer.GameTimer;
    import com.rpgGame.app.manager.goods.BackPackManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.shop.ShopManager;
    import com.rpgGame.app.ui.alert.GameAlert;
    import com.rpgGame.core.events.CharAttributeUpdateEvent;
    import com.rpgGame.core.events.MainPlayerEvent;
    import com.rpgGame.core.view.uiComponent.face.cd.CDDataManager;
    import com.rpgGame.coreData.info.item.ClientItemInfo;
    import com.rpgGame.coreData.type.CharAttributeType;
    import com.rpgGame.netData.shop.bean.ShopItemInfo;
    
    import __AS3__.vec.Vector;
    
    import org.client.mainCore.manager.EventManager;

    public class ProtectManager 
    {
        private static var _gTimer:GameTimer;

        public static function setup():void
        {
            CharAttributeManager.addEvent(MainRoleManager.actorID, CharAttributeType.HP, hpChange);
            CharAttributeManager.addEvent(MainRoleManager.actorID, CharAttributeType.MP, mpChange);
            EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE, onMainRoleLevelUp);
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
				percent = (MainRoleManager.actorInfo.totalStat.mp / MainRoleManager.actorInfo.totalStat.mana) * 100;
                if (percent <= ClientSettingProtectManager.mpPercentToUseGoods)
                {
					isMpLow = true;
                }
                if (isHPLow || isMpLow)
                {
                    startTimer();
                }
            }
        }

        private static function onMainRoleLevelUp():void
        {
            var goodID:int;
            var _local4:int;
            var _local1:int;
            var _local3:int;
            var hpGoodsIDs:Vector.<int> = ClientGuaJiCfgData.hpGoodsIDs;
            if (hpGoodsIDs && hpGoodsIDs.length)
            {
                for each (_local3 in hpGoodsIDs)
                {
                    _local4 = ItemCfgData.getItemRequireLevel(_local3);
                    if (MainRoleManager.actorInfo.totalStat.level >= _local4 && _local4 > _local1)
                    {
						goodID = _local3;
                        _local1 = _local4;
                    }
                }
            }
            if (goodID != ClientSettingProtectManager.hpGoodsIDToUse)
            {
                ClientSettingProtectManager.hpGoodsIDToUse = goodID;
            }
            _local1 = 0;
			goodID = 0;
            var _local5:Vector.<int> = ClientGuaJiCfgData.mpGoodsIDs;
            if (_local5 && _local5.length)
            {
                for each (_local3 in _local5)
                {
                    _local4 = ItemCfgData.getItemRequireLevel(_local3);
                    if (MainRoleManager.actorInfo.totalStat.level >= _local4 && _local4 > _local1)
                    {
						goodID = _local3;
                        _local1 = _local4;
                    }
                }
            }
            if (goodID != ClientSettingProtectManager.mpGoodsIDToUse)
            {
                ClientSettingProtectManager.mpGoodsIDToUse = goodID;
            }
        }

        private static function hpChange(event:CharAttributeUpdateEvent):void
        {
            tryStartTimer();
        }

        private static function mpChange(event:CharAttributeUpdateEvent):void
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
                    toUseGoods(ClientSettingProtectManager.hpGoodsIDToUse, ClientSettingProtectManager.toBuyGoods);
                }
				percent = (MainRoleManager.actorInfo.totalStat.mp / MainRoleManager.actorInfo.totalStat.mana) * 100;
                if (percent <= ClientSettingProtectManager.mpPercentToUseGoods && percent < 100)
                {
					isStop = false;
                    toUseGoods(ClientSettingProtectManager.mpGoodsIDToUse, ClientSettingProtectManager.toBuyGoods);
                }
            }
            if (isStop)
            {
                _gTimer.stop();
                _gTimer.reset();
            }
        }

        private static function toUseGoods(goodsID:int, toBuyGoods:Boolean):void
        {
            var itemCount:int;
            var cdType:String = null;
            var cdTime:int;
            var itemInfo:ClientItemInfo = null;
            var shopItem:ShopItemInfo = null;
            var _local10:int;
            var _local8:int;
            var _local3:int;
            var _local5:int;
            var _local11:int;
            if (MainRoleManager.actorInfo.totalStat.hp <= 0)
            {
                return;
            }
            if (goodsID)
            {
				itemCount = BackPackManager.instance.getItemCount(goodsID);
                if (itemCount > 0)
                {
					cdType = "ITEM_" + goodsID;
					cdTime = CDDataManager.getCdLostTm(cdType);
                    if (cdTime <= 0)
                    {
						itemInfo = BackPackManager.instance.getBagItemsByID(goodsID)[0];
                        BackPackManager.instance.useItem(goodsID, itemInfo.binded);
                    }
                }
                else
                {
                    if (toBuyGoods)
                    {
                        if (BackPackManager.instance.haveEmptyGrid())
                        {
//							shopItem = ShopCfgData.getShopGoodsDataFromDepotShop(goodsID);
//                            if (shopItem)
//                            {
//                                _local10 = MainRoleManager.actorInfo.amountInfo.getAmountByType(shopItem.priceType);
//                                _local8 = (shopItem.price + TaxManager.getTaxByType(15, shopItem.price));
//                                _local3 = (_local10 / _local8);
//                                _local5 = Math.min(_local3, shopItem.itemInfo.maxCount);
//                                if (_local5 <= 0)
//                                {
//                                    _local11 = MainRoleManager.actorInfo.amountInfo.getAmountByType(2);
//                                    _local3 = (_local11 / _local8);
//                                    _local5 = Math.min(_local3, shopItem.itemInfo.maxCount);
//                                }
//                                if (_local5)
//                                {
//                                    if (!GameAlert.hasAlert("TYPE_MONEY_REPLACE_BAND_MONEY_IF_NOT_ENOUGH"))
//                                    {
//                                        ShopManager.reqBuyGoods(shopItem, _local5);
//                                    }
//                                }
//                            }
                        }
                    }
                }
            }
        }
    }
}