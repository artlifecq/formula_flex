package gameEngine2D {
    public class LRUCacheNode {
        private var _key : String;
        private var _value : IDispose;
        private var _next : LRUCacheNode;
        private var _prev : LRUCacheNode;

        public function LRUCacheNode() {
            this._key = null;
            this._value = null;
            this._next = null;
            this._prev = null;
        }

        public function set key(value : String) : void {
            this._key = value;
        }

        public function get key() : String {
            return this._key;
        }

        public function set value(val : IDispose) : void {
            this._value = val;
        }

        public function get value() : IDispose {
            return this._value;
        }

        public function set next(value : LRUCacheNode) : void {
            this._next = value;
        }

        public function get next() : LRUCacheNode {
            return this._next;
        }

        public function set prev(value : LRUCacheNode) : void {
            this._prev = value;
        }

        public function get prev() : LRUCacheNode {
            return this._prev;
        }
    }
}
