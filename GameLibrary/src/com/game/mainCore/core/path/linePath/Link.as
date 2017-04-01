//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.path.linePath
{
    public class Link 
    {

        public var node:Node;
        public var cost:Number;

        public function Link(node:Node, cost:Number)
        {
            this.node = node;
            this.cost = cost;
        }

    }
}//package com.game.mainCore.core.path.linePath
