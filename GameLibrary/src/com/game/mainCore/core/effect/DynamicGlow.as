package com.game.mainCore.core.effect
{
    import flash.display.DisplayObject;
    import flash.filters.ColorMatrixFilter;
    import com.game.mainCore.core.timer.GameTimer;
    import flash.filters.GlowFilter;
    import flash.events.Event;

    public class DynamicGlow 
    {

        public static const FADE:uint = 1;
        public static const DARK_LIGHT:uint = 2;
        public static const COLOR_FADE:uint = 3;

        private var _dis:DisplayObject;
        private var _color:uint;
        private var _delay:uint;
        private var _tgBlur:Number = 1;
        private var _blur:Number = 2;
        private var _toggle:Boolean;
        private var _glowType:uint;
        private var _colorFilter:ColorMatrixFilter;
        private var _inner:Boolean;
        private var _gTimer:GameTimer;

        public function DynamicGlow(dis:DisplayObject, color:uint, delay:uint=40, blur:uint=15, glowType:uint=1, inner:Boolean=false, colorFilter:ColorMatrixFilter=null)
        {
            _dis = dis;
            _color = color;
            _delay = delay;
            _blur = blur;
            _glowType = glowType;
            _inner = inner;
            _colorFilter = colorFilter;
        }

        public function start():void
        {
            var name:String = "DynamicGlow_" + Math.random();
            stop();
            switch (_glowType)
            {
                case 1:
                    _gTimer = new GameTimer(name, _delay, 0, onFadeInterval);
                    break;
                case 2:
                    _gTimer = new GameTimer(name, _delay, 0, onDarkLightInterval);
                    break;
                case 3:
                    _gTimer = new GameTimer(name, _delay, 0, onColorFadeInterval);
                default:
            }
            _gTimer.start();
            _dis.addEventListener("removedFromStage", onRemoveStage);
        }
		
		protected function onRemoveStage(event:Event):void
		{
			// TODO Auto-generated method stub
			stop();
			_dis.removeEventListener("removedFromStage", onRemoveStage);
		}
		
		private function onColorFadeInterval():void
		{
			// TODO Auto Generated method stub
			_toggle = !(_toggle);
			if (_toggle)
			{
				_dis.filters = [_colorFilter];
			}
			else
			{
				_dis.filters = null;
			}
		}
		
		private function onDarkLightInterval():void
		{
			// TODO Auto Generated method stub
			var glow = null;
			_toggle = !_toggle;
			if (_toggle)
			{
				glow = new GlowFilter(_color, 1, _blur, _blur, 3, 2);
				_dis.filters = [glow];
			}
			else
			{
				_dis.filters = null;
			}
		}
		
        public function stop():void
        {
            _dis.filters = null;
            if (_gTimer)
            {
                _gTimer.destroy();
                _gTimer = null;
            }
        }

        private function onFadeInterval():void
        {
			if (_tgBlur >= _blur)
			{
				_toggle = false;
			}
			else
			{
				if (_tgBlur <= 2)
				{
					_toggle = true;
				}
			}
			/*if (_inner)
			{
				((_toggle) ? ((var _local2 = (_tgBlur + 1.5)), (_tgBlur = _local2), _local2) : ((_local2 = (_tgBlur - 1.5)), (_tgBlur = _local2), _local2));
			}
			else
			{
				((_toggle) ? ((_local2 = (_tgBlur + 0.5)), (_tgBlur = _local2), _local2) : ((_local2 = (_tgBlur - 0.5)), (_tgBlur = _local2), _local2));
			};
			var glow:GlowFilter = new GlowFilter(_color, 0.8, _tgBlur, _tgBlur, 5, 2, _inner);
			_dis.filters = [glow];*/
        }
    }
}