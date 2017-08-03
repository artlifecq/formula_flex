package com.rpgGame.appModule.gm
{
    import __AS3__.vec.Vector;

    public class GMUtil 
    {
        public static function sortPageByName(string1:String, string2:String):int
        {
            if (string1.substring(0, 1) < string2.substring(0, 1))
            {
                return -1;
            }
            if (string1.substring(0, 1) > string2.substring(0, 1))
            {
                return 1;
            }
            return 0;
        }

        public static function sortListByType(list1:GmList, list2:GmList):int
        {
            if (list1.listType < list2.listType)
            {
                return -1;
            }
            if (list1.listType > list2.listType)
            {
                return 1;
            }
            return 0;
        }

        public static function autoAlignment(listVect:Vector.<GmList>):void
        {
            var list:GmList = null;
            var i:int=0;
            var len:int = listVect.length;
            var _local9:int = 5;
            var j:int;
            var listType:int = -1;
            var _local8:int;
            var _local2:int = -20;
            while (i < len)
            {
				list = listVect[i];
                if (listType != list.listType)
                {
                    j = 0;
					listType = list.listType;
                    _local9 = (1000 / list.getRealWidth());
                    _local8 = (_local2 + 30);
                }
				list.x = (j % _local9) * (list.getRealWidth() + 4);
				list.y = _local8 + (Math.floor(j / _local9) * (list.getRealHeight() + 4));
                _local2 = list.y + list.getRealHeight();
                j++;
                i++;
            }
        }
    }
}