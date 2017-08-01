package com.rpgGame.app.manager
{
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.sender.MiscSender;
    
    import flash.utils.ByteArray;
    
    import org.client.mainCore.manager.EventManager;

    public class ClientSettingProtectManager 
    {
        private static var _initedData:Boolean;
        private static var _byteArray:ByteArray;
        private static var _protectSetProto:Object = new Object();

        public static function initData(byteArray:ByteArray):void
        {
            if (byteArray != null)
            {
                _byteArray = byteArray;
                _byteArray.uncompress();
                if (_byteArray.bytesAvailable)
                {
                    _protectSetProto.mergeFrom(byteArray);
                    _initedData = true;
                }
            }
        }

        public static function saveToServer():void
        {
            if (_byteArray == null)
            {
                _byteArray = new ByteArray();
            }
            else
            {
                _byteArray.clear();
            }
            _protectSetProto.writeTo(_byteArray);
            _byteArray.compress();
            MiscSender.reqSetClientOnlyIntConfig(3, _byteArray);
        }

        public static function get toUseGoods():Boolean
        {
            return _protectSetProto.toUseGoods;
        }

        public static function get toBuyGoods():Boolean
        {
            return _protectSetProto.toBuyGoods;
        }

        public static function get hpPercentToUseGoods():int
        {
            return _protectSetProto.hpPercentToUseGoods;
        }

        public static function get mpPercentToUseGoods():int
        {
            return _protectSetProto.mpPercentToUseGoods;
        }

        public static function get hpGoodsIDToUse():int
        {
            return _protectSetProto.hpGoodsIDToUse;
        }

        public static function get mpGoodsIDToUse():int
        {
            return _protectSetProto.mpGoodsIDToUse;
        }

        public static function set toUseGoods(value:Boolean):void
        {
            if (_protectSetProto.toUseGoods != value)
            {
                _protectSetProto.toUseGoods = value;
                if (_protectSetProto.toUseGoods)
                {
                    ProtectManager.tryStartTimer();
                }
                saveToServer();
            }
        }

        public static function set toBuyGoods(value:Boolean):void
        {
            if (_protectSetProto.toBuyGoods != value)
            {
                _protectSetProto.toBuyGoods = value;
                saveToServer();
            }
        }

        public static function set hpPercentToUseGoods(value:int):void
        {
            if (_protectSetProto.hpPercentToUseGoods != value)
            {
                _protectSetProto.hpPercentToUseGoods = value;
                ProtectManager.tryStartTimer();
                saveToServer();
            }
        }

        public static function set mpPercentToUseGoods(value:int):void
        {
            if (_protectSetProto.mpPercentToUseGoods != value)
            {
                _protectSetProto.mpPercentToUseGoods = value;
                ProtectManager.tryStartTimer();
                saveToServer();
            }
        }

        public static function set hpGoodsIDToUse(value:int):void
        {
            if (_protectSetProto.hpGoodsIDToUse != value)
            {
                _protectSetProto.hpGoodsIDToUse = value;
                saveToServer();
                EventManager.dispatchEvent(GuaJiEvent.HP_GOODS_ID_CHANGED);
            }
        }

        public static function set mpGoodsIDToUse(value:int):void
        {
            if (_protectSetProto.mpGoodsIDToUse != value)
            {
                _protectSetProto.mpGoodsIDToUse = value;
                saveToServer();
                EventManager.dispatchEvent(GuaJiEvent.MP_GOODS_ID_CHANGED);
            }
        }

        public static function checkHasInitData():void
        {
            var _local4:*;
            var _local3:*;
            if (!_initedData)
            {
                _initedData = true;
                _protectSetProto.toUseGoods = true;
                _protectSetProto.toBuyGoods = true;
                _protectSetProto.hpPercentToUseGoods = 65;
                _protectSetProto.mpPercentToUseGoods = 65;
                _local4 = ClientGuaJiCfgData.hpGoodsIDs;
                if (((_local4) && (_local4.length)))
                {
                    for each (var _local2:int in _local4)
                    {
                        if (MainRoleManager.actorInfo.level >= ItemCfgData.getItemRequireLevel(_local2))
                        {
                            _protectSetProto.hpGoodsIDToUse = _local2;
                            break;
                        }
                    }
                }
                _local3 = ClientGuaJiCfgData.mpGoodsIDs;
                if (_local3 && _local3.length)
                {
                    for each (var _local1:int in _local3)
                    {
                        if (MainRoleManager.actorInfo.level >= ItemCfgData.getItemRequireLevel(_local1))
                        {
                            _protectSetProto.mpGoodsIDToUse = _local1;
                            return;
                        }
                    }
                }
            }
        }
    }
}