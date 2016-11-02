//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.sound
{
    import flash.media.Sound;
    import flash.net.URLRequest;
    import flash.media.SoundLoaderContext;

    public class SingleSound extends Sound 
    {

        public var resUrl:String;

        public function SingleSound(stream:URLRequest=null, context:SoundLoaderContext=null)
        {
            super(stream, context);
        }

    }
}//package com.game.mainCore.libCore.sound
