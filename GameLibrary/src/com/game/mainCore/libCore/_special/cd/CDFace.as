//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore._special.cd
{
    import flash.display.Bitmap;
    import com.game.mainCore.libCore.pool.IPoolClass;
    import com.game.mainCore.libCore.pool.Pool;
    import flash.display.Shape;
    import flash.utils.Dictionary;
    import flash.text.TextField;
    import org.client.mainCore.utils.DisplayUtil;
    import flash.text.TextFormat;
    import flash.filters.GlowFilter;
    import flash.events.Event;
    import flash.display.BitmapData;
    import flash.geom.Matrix;

    public class CDFace extends Bitmap implements IPoolClass 
    {

        private static var _pool:Pool = new com.game.mainCore.libCore.pool.Pool("CDFace.cdFacePool", 100);
        private static var _shape:Shape = new Shape();
        private static var _cacheBmd:Dictionary = new Dictionary();

        private var _r:Number;
        private var _w:Number;
        private var _h:Number;
        private var _angle:int;
        private var _circleMask:Shape;
        private var _isCircle:Boolean = false;
        private var _onComplete:Function;
        private var _rate:int = 64;
        private var _tmTxt:TextField;

        public function CDFace($width:Number, $height:Number, $onComplete:Function=null, $isCircle:Boolean=false)
        {
            reSet([$width, $height, $onComplete, $isCircle]);
        }

        public static function create($width:Number, $height:Number, $onComplete:Function=null, $isCircle:Boolean=false):CDFace
        {
            return ((_pool.createObj(CDFace, $width, $height, $onComplete, $isCircle) as CDFace));
        }

        public static function recyle($cdFace:CDFace):void
        {
            _pool.disposeObj($cdFace);
        }


        public function dispose():void
        {
            if (parent)
            {
                parent.removeChild(this);
            }
            else
            {
                this.removeEventListener("addedToStage", onAddedToStage);
            };
            if (_tmTxt)
            {
                _tmTxt.text = "";
                DisplayUtil.removeForParent(_tmTxt);
                _tmTxt = null;
            };
            this.bitmapData = null;
            _onComplete = null;
            if (_circleMask)
            {
                DisplayUtil.removeForParent(_circleMask);
                _circleMask = null;
            };
            this.mask = null;
        }

        public function showTmTxt(txtFormat:TextFormat=null):void
        {
            if (!(_tmTxt))
            {
                txtFormat = ((txtFormat) || (new TextFormat(null, 12, 0xFFFFFF, true, null, null, null, null, "center")));
                _tmTxt = new TextField();
                _tmTxt.width = (_w * 2);
                _tmTxt.height = 20;
                _tmTxt.mouseEnabled = false;
                _tmTxt.mouseWheelEnabled = false;
                _tmTxt.selectable = false;
                _tmTxt.defaultTextFormat = txtFormat;
                _tmTxt.filters = [new GlowFilter(3591, 1, 2, 2, 15, 1)];
            };
            if (!(_tmTxt.parent))
            {
                if (parent)
                {
                    addTxtToParent();
                };
            };
        }

        private function onAddedToStage(e:Event):void
        {
            addTxtToParent();
            addMaskToParent();
            this.removeEventListener("addedToStage", onAddedToStage);
        }

        private function addTxtToParent():void
        {
            var index:int;
            if (parent)
            {
                if (((_tmTxt) && (!(_tmTxt.parent))))
                {
                    index = parent.getChildIndex(this);
                    parent.addChildAt(_tmTxt, (index + 1));
                    _tmTxt.x = this.x;
                    _tmTxt.y = (this.y + ((_h * 0.5) + ((_h - _tmTxt.height) * 0.5)));
                };
            };
        }

        private function addMaskToParent():void
        {
            if (parent)
            {
                if (((_circleMask) && (!(_circleMask.parent))))
                {
                    parent.addChild(_circleMask);
                    _circleMask.x = (this.x + _w);
                    _circleMask.y = (this.y + _h);
                    this.mask = _circleMask;
                };
            };
        }

        public function hideTmTxt():void
        {
            if (_tmTxt)
            {
                _tmTxt.text = "";
                DisplayUtil.removeForParent(_tmTxt);
                _tmTxt = null;
            };
        }

        override public function set x(value:Number):void
        {
            super.x = value;
            if (parent)
            {
                if (_tmTxt)
                {
                    _tmTxt.x = this.x;
                };
                if (_circleMask)
                {
                    _circleMask.x = (this.x + _w);
                };
            };
        }

        override public function set y(value:Number):void
        {
            super.y = value;
            if (parent)
            {
                if (_tmTxt)
                {
                    _tmTxt.y = (this.y + ((_h * 0.5) + ((_h - _tmTxt.height) * 0.5)));
                };
                if (_circleMask)
                {
                    _circleMask.y = (this.y + _h);
                };
            };
        }

        public function reSet($parameters:Array):void
        {
            _w = ($parameters[0] >> 1);
            _h = ($parameters[1] >> 1);
            _onComplete = $parameters[2];
            _isCircle = $parameters[3];
            this.bitmapData = null;
            this.scaleX = (_w / _rate);
            this.scaleY = (_h / _rate);
            if (_isCircle)
            {
                if (!(_circleMask))
                {
                    _circleMask = new Shape();
                };
                _circleMask.graphics.clear();
                _circleMask.graphics.beginFill(0);
                _circleMask.graphics.drawCircle(0, 0, _w);
                _circleMask.graphics.endFill();
                addMaskToParent();
            }
            else
            {
                if (_circleMask)
                {
                    DisplayUtil.removeForParent(_circleMask);
                    _circleMask = null;
                };
            };
            if (!(parent))
            {
                this.addEventListener("addedToStage", onAddedToStage);
            };
        }

        public function update($now:Number, $cdTotal:Number, $isReserve:Boolean=false):void
        {
            if (((((($now < 0)) || (($cdTotal < 0)))) || (($now > $cdTotal))))
            {
                return;
            };
            var $angle:Number = (($now / $cdTotal) * 360);
            if ($isReserve)
            {
                $angle = (360 - $angle);
            };
            if (_tmTxt)
            {
                _tmTxt.text = (($cdTotal - $now) * 0.001).toFixed(1);
            };
            drawRectMask($angle);
        }

        private function drawRectMask(angle:int):void
        {
            var tanA:Number;
            var xx:Number;
            var yy:Number;
            var m = null;
            if ((_angle == angle))
            {
                return;
            };
            _angle = angle;
            this.bitmapData = _cacheBmd[_angle];
            if (!(this.bitmapData))
            {
                tanA = Math.tan(((_angle * 3.14159265358979) / 180));
                _shape.graphics.clear();
                _shape.graphics.lineStyle(0, 0, 0);
                _shape.graphics.beginFill(0, 0.5);
                _shape.graphics.moveTo(0, 0);
                if ((((_angle >= 0)) && ((_angle < 45))))
                {
                    xx = (_rate * tanA);
                    yy = -(_rate);
                    _shape.graphics.lineTo(xx, yy);
                    _shape.graphics.lineTo(_rate, -(_rate));
                    _shape.graphics.lineTo(_rate, _rate);
                    _shape.graphics.lineTo(-(_rate), _rate);
                    _shape.graphics.lineTo(-(_rate), -(_rate));
                }
                else
                {
                    if ((((_angle >= 45)) && ((_angle < 135))))
                    {
                        xx = _rate;
                        yy = (-(_rate) / tanA);
                        _shape.graphics.lineTo(xx, yy);
                        _shape.graphics.lineTo(_rate, _rate);
                        _shape.graphics.lineTo(-(_rate), _rate);
                        _shape.graphics.lineTo(-(_rate), -(_rate));
                    }
                    else
                    {
                        if ((((_angle >= 135)) && ((_angle < 225))))
                        {
                            xx = (-(_rate) * tanA);
                            yy = _rate;
                            _shape.graphics.lineTo(xx, yy);
                            _shape.graphics.lineTo(-(_rate), _rate);
                            _shape.graphics.lineTo(-(_rate), -(_rate));
                        }
                        else
                        {
                            if ((((_angle >= 225)) && ((_angle < 315))))
                            {
                                xx = -(_rate);
                                yy = (_rate / tanA);
                                _shape.graphics.lineTo(xx, yy);
                                _shape.graphics.lineTo(-(_rate), -(_rate));
                            }
                            else
                            {
                                if ((((_angle >= 315)) && ((_angle < 360))))
                                {
                                    xx = (_rate * tanA);
                                    yy = -(_rate);
                                    _shape.graphics.lineTo(xx, yy);
                                };
                            };
                        };
                    };
                };
                _shape.graphics.lineTo(0, -(_rate));
                _shape.graphics.lineTo(0, 0);
                _shape.graphics.endFill();
                this.bitmapData = new BitmapData((_rate << 1), (_rate << 1), true, 0);
                this.bitmapData.fillRect(this.bitmapData.rect, 0);
                m = new Matrix();
                m.translate(_rate, _rate);
                this.bitmapData.draw(_shape, m);
                _cacheBmd[_angle] = this.bitmapData;
            };
        }


    }
}//package com.game.mainCore.libCore._special.cd
