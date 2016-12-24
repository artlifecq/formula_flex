package gameEngine2D {
    import flash.utils.Dictionary;
    public class LRUCache implements ICache {
        private var _cacheSize : int = 0;
        private var _curSize : int = 0;
        private var _nodes : Dictionary = null;
        private var _head : LRUCacheNode = null;
        private var _tail : LRUCacheNode = null;

        public function LRUCache(cnt : int = 200) {
            this._cacheSize = cnt;
            this._nodes = new Dictionary();
        }

        public function get(key : String) : IDispose {
            var node : LRUCacheNode = this._nodes[key];
            if (null != node) {
                this.moveToHead(node);
                return node.value;
            }
            return null;
        }

        public function put(key : String, value : IDispose) : void {
            var node : LRUCacheNode = this._nodes[key];
            if (null == node) {
                if (this._curSize >= this._cacheSize) {
                    this.removeTail();
                } else {
                    ++this._curSize;
                }
                node = new LRUCacheNode();
                CONFIG::netDebug {
                    //NetDebug.LOG("[LRUCache] [put] add Cache key:", key);
                }
            }
            node.key = key;
            node.value = value;
            this.moveToHead(node);
            this._nodes[key] = node;
        }

        public function hasKey(key : String) : Boolean {
            return null != this._nodes[key];
        }

        public function remove(key : String) : void {
            var node : LRUCacheNode = this._nodes[key];
            if (null == node) {
                return;
            }
//            CONFIG::netDebug {
//                //NetDebug.LOG("[LRUCache] [rmove] key:", key);
//            }
            node.value.dispose();
            if (null != node.prev) {
                node.prev = node.next;
            }
            if (null != node.next) {
                node.next.prev = node.prev;
            }
            if (node == this._tail) {
                this._tail = node.prev;
            }
            if (node == this._head) {
                this._head = node.next;
            }
            delete this._nodes[key];
            --this._curSize;
        }

        public function removeAll() : void {
            CONFIG::netDebug {
                NetDebug.LOG("[LRUCache] [rmoveAll]");
            }
            while (null != this._head) {
                this.removeTail();
            }
            this._curSize = 0;
        }

        private function removeTail() : void {
            if (null != this._tail) {
                this._tail.value.dispose();
//                CONFIG::netDebug {
//                    //NetDebug.LOG("[LRUCache] [rmoveTail] key:", this._tail.key);
//                }
                if (null != this._tail.prev) {
                    this._tail.prev.next = null;
                } else {
                    this._head = null;
                }
                delete this._nodes[this._tail.key];
                this._tail = this._tail.prev;
            }
        }

        private function moveToHead(node : LRUCacheNode) : void {
            //CONFIG::netDebug {
                //NetDebug.LOG("[LRUCache] [moveToHead] key:", node.key);
            //}
            if (node == this._head) {
                return;
            }
            if (null != node.prev) {
                node.prev.next = node.next;
            }
            if (null != node.next) {
                node.next.prev = node.prev;
            }
            if (node == this._tail) {
                this._tail = node.prev;
            }
            if (null != this._head) {
                node.next = this._head;
                this._head.prev = node;
            }
            this._head = node;
            node.prev = null;
            if (null == this._tail) {
                this._tail = this._head;
            }
        }
    }
}
