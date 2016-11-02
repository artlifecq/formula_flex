//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds.sort
{
    public function arrayedInsertionSort(a:Array):void
    {
        var val:Number;
        var j:int;
        var i:int;
        var k:Number = a.length;
        i = 1;
        while (i < k)
        {
            val = a[i];
            j = i;
            while ((((j > 0)) && ((a[(j - 1)] > val))))
            {
                a[j] = a[(j - 1)];
                j--;
            };
            a[j] = val;
            i++;
        };
    }

}//package org.client.mainCore.ds.sort
