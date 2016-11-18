package org.client.mainCore.utils
{
    public class Delegate 
    {
        public static function create(method:Function, ... additionalArgs):Function
        {
            return createWithArgs(method, additionalArgs);
        }

        private static function createWithArgs(func:Function, args:Array):Function
        {
            function f():*
            {
                var func:Function = arguments.callee.func;
                var pat:Array = arguments.concat(args);
                return func.apply(null, pat);
            }
            f["func"] = func;
            return f;
        }
    }
}