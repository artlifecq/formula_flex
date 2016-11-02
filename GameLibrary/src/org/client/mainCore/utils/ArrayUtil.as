//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    public class ArrayUtil 
    {


        public static function arrayContainsValue(arr:Array, value:Object):Boolean
        {
            return (!((arr.indexOf(value) == -1)));
        }

        public static function removeValueFromArray(arr:Array, value:Object):void
        {
            var i:int = arr.indexOf(value);
            if (i != -1)
            {
                arr.splice(i, 1);
            };
        }

        public static function createUniqueCopy(a:Array):Array
        {
            a = a;
            var uniqueArr:Array = [];
            a.forEach(function (item:Object, index:int, array:Array):void
            {
                if ((uniqueArr.indexOf(_arg1) == -1))
                {
                    uniqueArr.push(_arg1);
                };
            });
            return (uniqueArr);
        }

        public static function copyArray(arr:Array):Array
        {
            return (arr.slice());
        }

        public static function arraysAreEqual(arr1:Array, arr2:Array):Boolean
        {
            arr1 = arr1;
            arr2 = arr2;
            if (!((arr1.length == arr2.length)))
            {
                return (false);
            };
            var isd:Boolean = arr1.every(function (item:Object, index:int, array:Array):Boolean
            {
                if ((arr2.indexOf(_arg1) == -1))
                {
                    return (false);
                };
                return (true);
            });
            if (!(isd))
            {
                return (false);
            };
            isd = arr2.every(function (item:Object, index:int, array:Array):Boolean
            {
                if ((arr1.indexOf(_arg1) == -1))
                {
                    return (false);
                };
                return (true);
            });
            return (isd);
        }

        public static function embody(arr1:Array, arr2:Array):Boolean
        {
            arr1 = arr1;
            arr2 = arr2;
            var isd:Boolean = arr2.every(function (item:Object, index:int, array:Array):Boolean
            {
                if ((arr1.indexOf(_arg1) == -1))
                {
                    return (false);
                };
                return (true);
            });
            return (isd);
        }

        public static function getRandomItem(arr:Array)
        {
            return (arr[(Math.random() * arr.length)]);
        }


    }
}//package org.client.mainCore.utils
