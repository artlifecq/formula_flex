//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds.sort
{
    public function arrayedShellSort(a:Array):void
    {
        var j:int;
        var increment:int;
        var temp:int;
        var i:int;
        var size:int = a.length;
        increment = (size >> 1);
        while (increment > 0)
        {
            i = increment;
            while (i < size)
            {
                j = i;
                temp = a[j];
                while ((((j >= increment)) && ((a[(j - increment)] > temp))))
                {
                    a[j] = a[(j - increment)];
                    j = (j - increment);
                };
                a[j] = temp;
                i++;
            };
            if ((increment == 2))
            {
                increment = 1;
            }
            else
            {
                increment = (increment / 2.2);
            };
        };
    }

}//package org.client.mainCore.ds.sort
