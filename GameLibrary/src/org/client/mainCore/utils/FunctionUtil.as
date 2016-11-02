//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.display.Sprite;

    public class FunctionUtil 
    {


        public static function getFunctionName(fun:Function):String
        {
            var k = null;
            var fn = null;
            try
            {
                k = Sprite(fun);
            }
            catch(err:Error)
            {
                fn = err.message.replace(/.+::(\w+\/\w+)\(\)\}\@.+/, "$1");
                return ((((fn)==err.message) ? err.message.replace(/.+ (function\-\d+) .+/i, "$1") : fn));
            };
            return (null);
        }


    }
}//package org.client.mainCore.utils
