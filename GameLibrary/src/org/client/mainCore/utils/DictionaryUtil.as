//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.utils.Dictionary;

    public class DictionaryUtil 
    {


        public static function getKeys(d:Dictionary):Array
        {
            var a:Array = [];
            for (var key:Object in d)
            {
                a.push(key);
            };
            return (a);
        }

        public static function getValues(d:Dictionary):Array
        {
            var a:Array = [];
            for each (var value:Object in d)
            {
                a.push(value);
            };
            return (a);
        }


    }
}//package org.client.mainCore.utils
