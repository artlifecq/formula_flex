﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds.sort.compare
{
    public function compareStringCaseSensitiveDesc(a:String, b:String):int
    {
        var r:int;
        var k:int;
        var i:int;
        if (((a.length + b.length) > 2))
        {
            r = 0;
            k = (((a.length)>b.length) ? a.length : b.length);
            i = 0;
            while (i < k)
            {
                r = (b.charCodeAt(i) - a.charCodeAt(i));
                if (r != 0) break;
                i++;
            };
            return (r);
        };
        return ((b.charCodeAt(0) - a.charCodeAt(0)));
    }

}//package org.client.mainCore.ds.sort.compare
