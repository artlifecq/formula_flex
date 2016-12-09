package com.game.mainCore.libCore.vo
{
    public class LNode 
    {
        private var _id:String;
        private var _data:Object;
        private var _pre:LNode;
        private var _next:LNode;

        public function LNode($data:Object, $id:String=null)
        {
            _data = $data;
            _id = $id;
            _next = null;
            _pre = null;
        }

        public function get pre():LNode
        {
            return _pre;
        }

        public function set pre($ln:LNode):void
        {
            _pre = $ln;
        }

        public function get next():LNode
        {
            return _next;
        }

        public function set next($ln:LNode):void
        {
            _next = $ln;
        }

        public function get data():Object
        {
            return _data;
        }

        public function set data($value:Object):void
        {
            _data = $value;
        }

        public function get id():String
        {
            return _id;
        }
    }
}