package org.client.mainCore.utils
{
    import com.game.mainCore.libCore.pool.IPoolClass;
    
    import flash.errors.IllegalOperationError;
    import flash.system.ApplicationDomain;

    public class ClassConstruct 
    {
        public static function getClass($className:String, $applicationDomain:ApplicationDomain=null):Class
        {
            if ($className == null || $className == "")
            {
                return null;
            }
            if ($applicationDomain == null)
            {
                $applicationDomain = ApplicationDomain.currentDomain;
            }
            if ($applicationDomain.hasDefinition($className))
            {
                return $applicationDomain.getDefinition($className) as Class;
            }
            return null;
        }

        public static function construct(classObj:Class, params:Array=null):IPoolClass
        {
            if (!params)
            {
                return new classObj();
            }
            switch (params.length)
            {
                case 0:
                    return new classObj();
                case 1:
                    return new classObj(params[0]);
                case 2:
                    return new classObj(params[0], params[1]);
                case 3:
                    return new classObj(params[0], params[1], params[2]);
                case 4:
                    return new classObj(params[0], params[1], params[2], params[3]);
                case 5:
                    return new classObj(params[0], params[1], params[2], params[3], params[4]);
                case 6:
                    return new classObj(params[0], params[1], params[2], params[3], params[4], params[5]);
                case 7:
                    return new classObj(params[0], params[1], params[2], params[3], params[4], params[5], params[6]);
                case 8:
                    return new classObj(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7]);
                case 9:
                    return new classObj(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8]);
                case 10:
                    return new classObj(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9]);
                case 11:
                    return new classObj(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9], params[10]);
                case 12:
                    return new classObj(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9], params[10], params[11]);
                case 13:
                    return new classObj(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9], params[10], params[11], params[12]);
                case 14:
                    return new classObj(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9], params[10], params[11], params[12], params[13]);
                case 15:
                    return new classObj(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9], params[10], params[11], params[12], params[13], params[14]);
                default:
                    throw new IllegalOperationError("The number of parameters given exceeds the maximum number this method can handle.");
                    return null;
            }
        }
    }
}