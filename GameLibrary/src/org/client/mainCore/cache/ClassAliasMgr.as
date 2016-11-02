//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.cache
{
    import flash.net.registerClassAlias;

    public class ClassAliasMgr 
    {

        protected static var instance:ClassAliasMgr;

        private var map:Object;
        private var pool:ClassObjectPool;

        public function ClassAliasMgr(classPool:ClassObjectPool=null)
        {
            map = {};
            super();
            if (instance)
            {
                throw (new Error("ClassAliasMap is singleton class and allready exists!"));
            };
            instance = this;
            instance.pool = ((classPool) || (instance.newClassPool()));
        }

        public static function active(classPool:ClassObjectPool=null):void
        {
            instance = new (ClassAliasMgr)(classPool);
        }

        public static function regClassAlias(aliasName:String, classObject:Class, isAmf:Boolean=true):void
        {
            instance.map[aliasName] = classObject;
            if (isAmf)
            {
                (registerClassAlias(aliasName, classObject));
            };
        }

        public static function hasClassByAlias(aliasName:String):Boolean
        {
            return (instance.map.hasOwnProperty(aliasName));
        }

        public static function getClsByAlias(aliasName:String):Class
        {
            if (!(hasClassByAlias(aliasName)))
            {
                return (null);
            };
            return (instance.map[aliasName]);
        }

        public static function createObjectByAlias(aliasName:String, params:Array=null):Object
        {
            var cls:Class = getClsByAlias(aliasName);
            if (cls)
            {
                return (instance.pool.getAndCreateObj(cls, params));
            };
            return (null);
        }


        protected function newClassPool():ClassObjectPool
        {
            return (new ClassObjectPool());
        }


    }
}//package org.client.mainCore.cache
