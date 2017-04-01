//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.ds
{
    public class TreeList implements ITree 
    {

        private var _root:TreeList;
        private var _parent:TreeList;
        private var _children:Array;
        private var _data;

        public function TreeList(data:*=null, parent:TreeList=null)
        {
            _data = data;
            _children = [];
            this.parent = parent;
        }

        public function get data()
        {
            return (_data);
        }

        public function set data(d:*):void
        {
            _data = d;
        }

        public function get length():int
        {
            var c:int = numChildren;
            var node:TreeList = _parent;
            while (node)
            {
                c = (c + node.numChildren);
                node = node.parent;
                if ((node == this))
                {
                    throw (new Error("TreeList Infinite Loop"));
                };
            };
            return (c);
        }

        public function get isRoot():Boolean
        {
            return ((_root == this));
        }

        public function get isLeaf():Boolean
        {
            return ((_children.length == 0));
        }

        public function get depth():int
        {
            if ((_parent == null))
            {
                return (0);
            };
            var node:TreeList = _parent;
            var c:int;
            while (node)
            {
                c++;
                node = node.parent;
                if ((node == this))
                {
                    throw (new Error("TreeList Infinite Loop"));
                };
            };
            return (c);
        }

        public function get numChildren():int
        {
            return (_children.length);
        }

        public function get numSiblings():int
        {
            if (_parent)
            {
                return (_parent.numChildren);
            };
            return (0);
        }

        public function get root():TreeList
        {
            return (_root);
        }

        public function set parent(parent:TreeList):void
        {
            var index:int;
            if (_parent)
            {
                index = _parent.children.indexOf(this);
                if (!((index == -1)))
                {
                    _parent.children.splice(index, 1);
                };
            };
            if ((parent == this))
            {
                return;
            };
            _parent = parent;
            if (_parent)
            {
                _parent.children.push(this);
            };
            setRoot();
        }

        public function get parent():TreeList
        {
            return (_parent);
        }

        public function get children():Array
        {
            return (_children);
        }

        public function remove():void
        {
            if ((_parent == null))
            {
                return;
            };
            for each (var child:TreeList in _children)
            {
                child.parent = _parent;
            };
        }

        public function clear():void
        {
            _children = [];
        }

        private function setRoot():void
        {
            if ((_parent == null))
            {
                _root = this;
                return;
            };
            var node:TreeList = _parent;
            while (node)
            {
                if ((node.parent == null))
                {
                    _root = node;
                    return;
                };
                node = node.parent;
                if ((node == this))
                {
                    throw (new Error("TreeList Infinite Loop"));
                };
            };
        }


    }
}//package org.client.mainCore.ds
