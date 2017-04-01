//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.sound
{
    import flash.events.EventDispatcher;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.media.SoundTransform;
    import flash.events.Event;

    public class SoundData extends EventDispatcher 
    {

        public static const SOUND_PLAY_ONCE_COMPLETE:String = "SoundData.SOUND_PLAY_ONCE_COMPLETE";
        public static const LOOP_COMPLETE:String = "SoundData.LOOP_COMPLETE";

        private var _sound:Sound;
        private var _channel:SoundChannel;
        private var _leftLoops:int;
        private var _oneLoopCmpFun:Function;
        private var _oneLoopCmpFunArgs:Array;
        private var _mute:Boolean = false;
        private var _pause:Boolean = false;
        private var _volume:Number = 1;

        public function SoundData($sound:Sound, $channel:SoundChannel, $leftLoops:int=0)
        {
            _sound = $sound;
            _channel = $channel;
            _leftLoops = $leftLoops;
            _volume = _channel.soundTransform.volume;
            _channel.addEventListener("soundComplete", soundCompleteHandler);
        }

        public function setOneLoopCmpFun($fun:Function, ... args):void
        {
            _oneLoopCmpFun = $fun;
            _oneLoopCmpFunArgs = args;
        }

        public function get sound():Sound
        {
            return (_sound);
        }

        public function get channel():SoundChannel
        {
            return (_channel);
        }

        public function get volume():Number
        {
            return (_volume);
        }

        public function setVolume($value:Number):void
        {
            _volume = $value;
            _channel.soundTransform = new SoundTransform(_volume);
        }

        public function getMute():Boolean
        {
            return (_mute);
        }

        public function setMute($value:Boolean):void
        {
            _mute = $value;
            if (_mute)
            {
                _channel.soundTransform = new SoundTransform(0);
            }
            else
            {
                setVolume(_volume);
            };
        }

        public function getPause():Boolean
        {
            return (_pause);
        }

        public function setPause($value:Boolean):void
        {
            var position:Number;
            _pause = $value;
            if (_pause)
            {
                position = _channel.position;
                _channel.stop();
            }
            else
            {
                _channel = _sound.play(_channel.position, 0, _channel.soundTransform);
                _channel.addEventListener("soundComplete", soundCompleteHandler);
            };
        }

        private function soundCompleteHandler(e:Event):void
        {
            if (!((_oneLoopCmpFun == null)))
            {
                _oneLoopCmpFunArgs.unshift(this);
                _oneLoopCmpFun.apply(this, _oneLoopCmpFunArgs);
            };
            if ((_leftLoops > 0))
            {
                _leftLoops--;
                _channel = _sound.play(0, 0, _channel.soundTransform);
                _channel.addEventListener("soundComplete", soundCompleteHandler);
            }
            else
            {
                this.dispatchEvent(new Event("SoundData.LOOP_COMPLETE"));
            };
        }

        public function stopAndDispose():void
        {
            _channel.removeEventListener("soundComplete", soundCompleteHandler);
            _channel.stop();
            _leftLoops = 0;
            _oneLoopCmpFun = null;
            _oneLoopCmpFunArgs = null;
        }


    }
}//package com.game.mainCore.libCore.sound
