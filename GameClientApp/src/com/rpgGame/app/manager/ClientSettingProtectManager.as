package com.rpgGame.app.manager
{
    public class ClientSettingProtectManager 
    {
        private static var _initedData:Boolean;
        private static var _protectSet:Object = new Object();

        public static function initData(dataStr:String):void
        {
            
        }

        public static function saveToServer():void
        {
            
        }

        public static function get toUseGoods():Boolean
        {
            return SystemSetManager.hpSelect;
        }

        public static function get toBuyGoods():Boolean
        {
            return SystemSetManager.lifeSelect;
        }
		
		public static function get toAutoRelive():Boolean
		{
			return SystemSetManager.autoResurrection;
		}

        public static function get hpPercentToUseGoods():int
        {
            return SystemSetManager.hpValue;
        }

        public static function get mpPercentToUseGoods():int
        {
            return _protectSet.mpPercentToUseGoods;
        }

//        public static function get hpGoodsIDToUse():int
//        {
//            return _protectSet.hpGoodsIDToUse;
//        }
//
//        public static function get mpGoodsIDToUse():int
//        {
//            return _protectSet.mpGoodsIDToUse;
//        }

        public static function set toUseGoods(value:Boolean):void
        {
            if (_protectSet.toUseGoods != value)
            {
				_protectSet.toUseGoods = value;
                if (_protectSet.toUseGoods)
                {
                    ProtectManager.tryStartTimer();
                }
                saveToServer();
            }
        }

        public static function set toBuyGoods(value:Boolean):void
        {
            if (_protectSet.toBuyGoods != value)
            {
				_protectSet.toBuyGoods = value;
                saveToServer();
            }
        }
		
		public static function set toAutoRelive(value:Boolean):void
		{
			if (_protectSet.toAutoRelive != value)
			{
				_protectSet.toAutoRelive = value;
				saveToServer();
			}
		}

        public static function set hpPercentToUseGoods(value:int):void
        {
            if (_protectSet.hpPercentToUseGoods != value)
            {
				_protectSet.hpPercentToUseGoods = value;
                ProtectManager.tryStartTimer();
                saveToServer();
            }
        }

        public static function set mpPercentToUseGoods(value:int):void
        {
            if (_protectSet.mpPercentToUseGoods != value)
            {
				_protectSet.mpPercentToUseGoods = value;
                ProtectManager.tryStartTimer();
                saveToServer();
            }
        }

//        public static function set hpGoodsIDToUse(value:int):void
//        {
//            if (_protectSet.hpGoodsIDToUse != value)
//            {
//				_protectSet.hpGoodsIDToUse = value;
//                saveToServer();
//                EventManager.dispatchEvent(GuaJiEvent.HP_GOODS_ID_CHANGED);
//            }
//        }
//
//        public static function set mpGoodsIDToUse(value:int):void
//        {
//            if (_protectSet.mpGoodsIDToUse != value)
//            {
//				_protectSet.mpGoodsIDToUse = value;
//                saveToServer();
//                EventManager.dispatchEvent(GuaJiEvent.MP_GOODS_ID_CHANGED);
//            }
//        }

        public static function checkHasInitData():void
        {
            var hpGoodsIDs:Array;
            var mpGoodsIDs:Array;
            if (!_initedData)
            {
                _initedData = true;
				_protectSet.toUseGoods = true;
				_protectSet.toBuyGoods = true;
				_protectSet.toAutoRelive = true;
				_protectSet.hpPercentToUseGoods = 65;
				_protectSet.mpPercentToUseGoods = 65;
//				hpGoodsIDs = ClientGuaJiCfgData.hpGoodsIDs;
//                if (hpGoodsIDs && hpGoodsIDs.length)
//                {
//                    for each (var id:int in hpGoodsIDs)
//                    {
//                        if (MainRoleManager.actorInfo.totalStat.level >= ItemCfgData.getItemRequireLevel(id))
//                        {
//							_protectSet.hpGoodsIDToUse = id;
//                            break;
//                        }
//                    }
//                }
//				mpGoodsIDs = ClientGuaJiCfgData.mpGoodsIDs;
//                if (mpGoodsIDs && mpGoodsIDs.length)
//                {
//                    for each (var id:int in mpGoodsIDs)
//                    {
//                        if (MainRoleManager.actorInfo.totalStat.level >= ItemCfgData.getItemRequireLevel(id))
//                        {
//							_protectSet.mpGoodsIDToUse = id;
//                            return;
//                        }
//                    }
//                }
            }
        }
    }
}