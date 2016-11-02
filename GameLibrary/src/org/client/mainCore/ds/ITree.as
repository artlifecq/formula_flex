//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds
{
    public /*dynamic*/ interface ITree 
    {

        function get data();
        function set data(_arg1:*):void;
        function get length():int;
        function get isRoot():Boolean;
        function get isLeaf():Boolean;
        function get depth():int;
        function get numChildren():int;
        function get numSiblings():int;
        function remove():void;
        function clear():void;

    }
}//package org.client.mainCore.ds
