package com.game.mainCore.libCore.observer
{
    public class Notification 
    {

        public var name:*;
        public var body:*;

        public function Notification($name:*, $body:*=null)
        {
            name = $name;
            body = $body;
        }
    }
}