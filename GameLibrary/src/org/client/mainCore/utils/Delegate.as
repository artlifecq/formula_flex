//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    public class Delegate 
    {


        public static function create(method:Function, ... additionalArgs):Function
        {
            return (createWithArgs(method, additionalArgs));
        }

        private static function createWithArgs(func:Function, args:Array):Function
        {
            func = func;
            args = args;
            var f:Function = function ()
            {
                var func:Function = arguments.callee.func;
                var pat:Array = arguments.concat(args);
                return (func.apply(null, pat));
            };
            f["func"] = func;
            return (f);
        }


    }
}//package org.client.mainCore.utils
