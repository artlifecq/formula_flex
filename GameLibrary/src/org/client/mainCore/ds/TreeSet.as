package org.client.mainCore.ds
{
    public class TreeSet implements ITree 
    {

        private var _root:TreeSet;
        private var _parent:TreeSet;
        private var _children:HashSet;
        private var _data:*;

        public function TreeSet(data:*=null, parent:TreeSet=null)
        {
            _data = data;
            _children = new HashSet();
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
            var node:TreeSet = _parent;
            while (node)
            {
                c = (c + node.numChildren);
                node = node.parent;
                if (node == this)
                {
                    throw new Error("TreeSet Infinite Loop");
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
            if (!_parent)
            {
                return 0;
            }
            var node:TreeSet = _parent;
            var c:int;
            while (node)
            {
                c++;
                node = node.parent;
                if (node == this)
                {
                    throw new Error("TreeSet Infinite Loop");
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

        public function get root():TreeSet
        {
            return _root;
        }

        public function set parent(parent:TreeSet):void
        {
            if (_parent)
            {
                _parent.children.remove(this);
            }
            if (parent == this)
            {
                return;
            }
            _parent = parent;
            if (_parent)
            {
                _parent.children.add(this);
            }
            setRoot();
        }

        public function get parent():TreeSet
        {
            return _parent;
        }

        public function get children():HashSet
        {
            return _children;
        }

        public function remove():void
        {
            if (_parent == null)
            {
                return;
            }
            _children.forEach(function (child:TreeSet):void
            {
				child.parent = _parent;
            });
        }

        public function clear():void
        {
            _children = new HashSet();
        }

        private function setRoot():void
        {
            if (_parent == null)
            {
                _root = this;
                return;
            }
            var node:TreeSet = _parent;
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
                    throw new Error("TreeSet Infinite Loop");
                }
            }
        }
    }
}