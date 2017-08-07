package com.rpgGame.statistics
{
    public class NodeInfo
    {
        private var _id : int;
        private var _desc : String;
        
        public function NodeInfo(id : int, desc : String) {
            this._id = id;
            this._desc = desc;
        }

        public function get id():int
        {
            return _id;
        }

        public function set id(value:int):void
        {
            _id = value;
        }

        public function get desc():String
        {
            return _desc;
        }

        public function set desc(value:String):void
        {
            _desc = value;
        }


    }
}