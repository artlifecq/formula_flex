package org.client.mainCore.ds
{
    public class TreeMap implements ITree 
    {

        private var _root:TreeMap;
        private var _parent:TreeMap;
        private var _key:*;
        private var _children:HashMap;
        private var _data:*;

        public function TreeMap(key:*, data:*=null, parent:TreeMap=null)
        {
            _key = key;
            _data = data;
            _children = new HashMap();
            this.parent = parent;
        }

        public function get data():*
        {
            return _data;
        }

        public function set data(d:*):void
        {
            _data = d;
        }

        public function get length():int
        {
            var c:int = numChildren;
            var node:TreeMap = _parent;
            while (node)
            {
                c = c + node.numChildren;
                node = node.parent;
                if (node == this)
                {
                    throw new Error("TreeMap Infinite Loop");
                }
            }
            return c;
        }

        public function get isRoot():Boolean
        {
            return _root == this;
        }

        public function get isLeaf():Boolean
        {
            return _children.length == 0;
        }

        public function get depth():int
        {
            if (_parent == null)
            {
                return 0;
            }
            var node:TreeMap = _parent;
            var c:int;
            while (node)
            {
                c++;
                node = node.parent;
                if (node == this)
                {
                    throw new Error("TreeMap Infinite Loop");
                }
            }
            return c;
        }

        public function get numChildren():int
        {
            return _children.length;
        }

        public function get numSiblings():int
        {
            if (_parent)
            {
                return _parent.numChildren;
            }
            return 0;
        }

        public function get root():TreeMap
        {
            return _root;
        }

        public function set parent(parent:TreeMap):void
        {
            if (_parent)
            {
                _parent.children.remove(_key);
            }
            if (parent == this)
            {
                return;
            }
            _parent = parent;
            if (_parent)
            {
                _parent.children.add(_key, this);
            }
            setRoot();
        }

        public function get parent():TreeMap
        {
            return _parent;
        }

        public function get children():HashMap
        {
            return _children;
        }

        public function set key(k:*):void
        {
            if (_parent)
            {
                _parent.children.remove(_key);
                _parent.children.add(k, this);
            }
            _key = k;
        }

        public function get key():*
        {
            return _key;
        }

        public function remove():void
        {
            if (_parent == null)
            {
                return;
            }
            _children.eachValue(function (child:TreeMap):void
            {
				child.parent = _parent;
            });
        }

        public function clear():void
        {
            _children = new HashMap();
        }

        private function setRoot():void
        {
            if (_parent == null)
            {
                _root = this;
                return;
            }
            var node:TreeMap = _parent;
            while (node)
            {
                if (node.parent == null)
                {
                    _root = node;
                    return;
                }
                node = node.parent;
                if (node == this)
                {
                    throw new Error("TreeMap Infinite Loop");
                }
            }
        }
    }
}