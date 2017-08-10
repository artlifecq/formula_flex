
package  com.rpgGame.app.fight.spell
{

    import com.rpgGame.app.manager.hint.FloatingText;
    
    import flash.geom.Point;
    
    import gs.TweenLite;
    import gs.TweenMax;
    import gs.easing.Expo;
    
    import starling.display.DisplayObject;

    public class TweenLiteUtil {

		private static var _funcIndex:int=0;
		private static var _funcArr:Array=[hurtNum,hurtNum2,hurtNum3,hurtNum5,hurtNum7,hurtNum10,hurtNum11];
		public static  function testFunc(cusItem:DisplayObject, cusStartPoint:Point, cusEndPoint:Point, cusCallBack:Function=null):void
		{
			var func:Function=_funcArr[_funcIndex];
			if (func) 
			{
				func(cusItem,cusStartPoint,cusEndPoint,cusCallBack);
			}
		}
		public static function next():void
		{
			_funcIndex=(_funcIndex+1)%_funcArr.length;
			FloatingText.showUp("index"+_funcIndex)
		}

        public static function hurtNum(cusItem:DisplayObject, cusStartPoint:Point, cusEndPoint:Point, cusCallBack:Function=null):void{
            var _endPos:Point;
            var _t2:Number;
            var _angle:Number = Math.atan2((cusEndPoint.y - cusStartPoint.y), (cusEndPoint.x - cusStartPoint.x));
            var _dis:int = (80 + (50 * Math.random()));
            var _randomX:int = (((_dis * Math.cos(_angle)) + 20) - (50 * Math.random()));
            var _randomY:int = (((_dis * Math.sin(_angle)) + 30) - (60 * Math.random()));
            var _startPoint:Point = cusEndPoint;
            var _endPoint:Point = new Point(_randomX, _randomY);
            cusItem.x = _startPoint.x;
            cusItem.y = (_startPoint.y - 120);
            cusItem.alpha = 1;
            var _middlePos:Point = new Point();
            _middlePos.x = (cusItem.x + _endPoint.x);
            _middlePos.y = (cusItem.y + _endPoint.y);
            _endPos = new Point();
            _endPos.x = (_middlePos.x + (_endPoint.x * 0.5));
            _endPos.y = (_middlePos.y + (_endPoint.y * 0.5));
            var _t1:Number = (0.4 + (Math.random() * 0.2));
            _t2 = (0.6 + (Math.random() * 0.2));
            TweenLite.to(cusItem, _t1, {
                "x":_middlePos.x,
                "y":_middlePos.y,
                "ease":Expo.easeOut,
                "onComplete":function ():void{
                    TweenLite.to(cusItem, _t2, {
                        "alpha":0.1,
                        "x":_endPos.x,
                        "y":_endPos.y,
                        "ease":Expo.easeOut,
                        "onComplete":function ():void{
                            cusItem.parent.removeChild(cusItem);
                            if (cusCallBack != null)
                            {
                                cusCallBack(cusItem);
                            };
                        }
                    });
                }
            });
        }

        public static function hurtNum2(cusItem:DisplayObject, cusStartPoint:Point, cusEndPoint:Point, cusCallBack:Function=null):void{
            cusEndPoint.y = (cusEndPoint.y - 100);
            cusItem.x = cusEndPoint.x;
            cusItem.y = cusEndPoint.y;
            cusItem.scaleX = 1.7;
            cusItem.scaleY = 1.7;
            var _tx:int = ((((cusStartPoint.x - cusEndPoint.x) > 0)) ? -100 : 100);
            var _ty:int = (-70 - (Math.random() * 50));
            TweenLite.to(cusItem, 0.5, {
                "scaleX":1,
                "scaleY":1,
                "x":((cusEndPoint.x + _tx) + (cusItem.width * 0.5)),
                "y":(cusEndPoint.y + _ty),
                "onComplete":function ():void{
                    TweenLite.to(cusItem, 0.8, {
                        "y":((cusEndPoint.y - 140) - (Math.random() * 50)),
                        "onComplete":function ():void{
                            TweenLite.to(cusItem, 1, {
                                "alpha":0.2,
                                "onComplete":function ():void{
                                    cusItem.parent.removeChild(cusItem);
                                    if (cusCallBack != null)
                                    {
                                        cusCallBack(cusItem);
                                    };
                                }
                            });
                        }
                    });
                }
            });
        }

        public static function hurtNum3(cusItem:DisplayObject, cusStartPoint:Point, cusEndPoint:Point, cusCallBack:Function=null):void{
            var _endPos:Point;
            var _t2:Number;
            var _angle:Number = Math.atan2((cusEndPoint.y - cusStartPoint.y), (cusEndPoint.x - cusStartPoint.x));
            var _dis:int = (200 + (50 * Math.random()));
            var _randomX:int = (cusStartPoint.x + (((_dis * Math.cos(_angle)) + 20) - (50 * Math.random())));
            var _randomY:int = (cusStartPoint.y + (((_dis * Math.sin(_angle)) + 10) - (25 * Math.random())));
            var _startPoint:Point = new Point((_randomX - (cusItem.width * 0.5)), (_randomY - (cusItem.height * 0.5)));
            _dis = (400 + (50 * Math.random()));
            _randomX = (cusStartPoint.x + (((_dis * Math.cos(_angle)) + 20) - (50 * Math.random())));
            _randomY = (cusStartPoint.y + (((_dis * Math.sin(_angle)) + 10) - (25 * Math.random())));
            _endPos = new Point((_randomX - (cusItem.width * 0.5)), (_randomY - (cusItem.height * 0.5)));
            cusItem.alpha = 1;
            cusItem.scaleX = 3;
            cusItem.scaleY = 3;
            cusItem.x = _startPoint.x;
            cusItem.y = _startPoint.y;
            var _t1:Number = (0.2 + (Math.random() * 0.3));
            _t2 = (1 + (Math.random() * 0.3));
            TweenLite.to(cusItem, _t1, {
                "scaleX":1,
                "scaleY":1,
                "ease":Expo.easeOut,
                "onComplete":function ():void{
                    TweenLite.to(cusItem, _t2, {
                        "alpha":0.6,
                        "x":_endPos.x,
                        "y":_endPos.y,
                        "ease":Expo.easeOut,
                        "onComplete":function ():void{
                            cusItem.parent.removeChild(cusItem);
                            if (cusCallBack != null)
                            {
                                cusCallBack(cusItem);
                            };
                        }
                    });
                }
            });
        }

        public static function hurtNum4(cusItem:DisplayObject, cusEndPoint:Point, cusCallBack:Function=null):void{
            var _endPos:Point;
            var _t2:Number;
            var _angle:Number = ((150 * Math.PI) / 180);
            var _dis:int = (160 + (50 * Math.random()));
            var _randomX:int = (((_dis * Math.cos(_angle)) + 20) - (50 * Math.random()));
            var _randomY:int = (((_dis * Math.sin(_angle)) + 10) - (25 * Math.random()));
            var _startPoint:Point = cusEndPoint;
            var _endPoint:Point = new Point(_randomX, _randomY);
            cusItem.x = _startPoint.x;
            cusItem.y = (_startPoint.y - 120);
            cusItem.alpha = 1;
            var _middlePos:Point = new Point();
            _middlePos.x = (cusItem.x + _endPoint.x);
            _middlePos.y = (cusItem.y + _endPoint.y);
            _endPos = new Point();
            _endPos.x = (_middlePos.x + (_endPoint.x * 0.5));
            _endPos.y = (_middlePos.y + (_endPoint.y * 0.5));
            var _t1:Number = (0.8 + (Math.random() * 0.3));
            _t2 = (1.3 + (Math.random() * 0.3));
            TweenLite.to(cusItem, _t1, {
                "x":_middlePos.x,
                "y":_middlePos.y,
                "ease":Expo.easeOut,
                "onComplete":function ():void{
                    TweenLite.to(cusItem, _t2, {
                        "alpha":0.1,
                        "x":_endPos.x,
                        "y":_endPos.y,
                        "ease":Expo.easeOut,
                        "onComplete":function ():void{
                            cusItem.parent.removeChild(cusItem);
                            if (cusCallBack != null)
                            {
                                cusCallBack(cusItem);
                            };
                        }
                    });
                }
            });
        }

        public static function hurtNum5(cusItem:DisplayObject, cusStartPoint:Point, cusEndPoint:Point, cusCallBack:Function=null):void{
            var _ty:int;
            cusEndPoint.y = (cusEndPoint.y - 100);
            cusItem.x = cusEndPoint.x;
            cusItem.y = cusEndPoint.y;
            cusItem.scaleX = 1.7;
            cusItem.scaleY = 1.7;
            var _tx:int = ((((cusStartPoint.x - cusEndPoint.x) > 0)) ? -160 : 160);
            _ty = (-70 - (Math.random() * 50));
            TweenLite.to(cusItem, 0.35, {
                "scaleX":1,
                "scaleY":1,
                "x":(((cusEndPoint.x + _tx) + ((((((cusStartPoint.x - cusEndPoint.x) > 0)) ? -1 : 1) * cusItem.width) * 0.5)) + ((Math.random() * 40) - 20)),
                "y":(cusEndPoint.y + _ty),
                "onComplete":function ():void{
                    TweenLite.to(cusItem, 0.35, {
                        "y":((cusEndPoint.y + _ty) - (30 + (Math.random() * 20))),
                        "onComplete":function ():void{
                            TweenLite.to(cusItem, 0.55, {
                                "alpha":0.2,
                                "onComplete":function ():void{
                                    cusItem.parent.removeChild(cusItem);
                                    if (cusCallBack != null)
                                    {
                                        cusCallBack(cusItem);
                                    };
                                }
                            });
                        }
                    });
                }
            });
        }

        public static function hurtNum6(_arg_1:DisplayObject, _arg_2:Function=null):void{
            _arg_1.x = (-(_arg_1.width) * 0.5);
            _arg_1.y = -100;
            attFly(_arg_1, _arg_2, 70, 0, 60, 15, 25, 1, 1, 0.6);
        }

        public static function hurtNum7(cusItem:DisplayObject, cusStartPoint:Point, cusEndPoint:Point, cusCallBack:Function=null):void{
            cusEndPoint.y = (cusEndPoint.y - 100);
            cusItem.x = cusEndPoint.x;
            cusItem.y = cusEndPoint.y;
            cusItem.scaleX = (1.7 / 2);
            cusItem.scaleY = (1.7 / 2);
            var _tx:int = ((((cusStartPoint.x - cusEndPoint.x) > 0)) ? -150 : 150);
            var _ty:int = (-70 - (Math.random() * 50));
            TweenLite.to(cusItem, 0.5, {
                "scaleX":(1 / 2),
                "scaleY":(1 / 2),
                "x":((((cusEndPoint.x + _tx) + (cusItem.width * 0.5)) + (Math.random() * 170)) - 85),
                "y":(cusEndPoint.y + _ty),
                "onComplete":function ():void{
                    TweenLite.to(cusItem, 0.8, {
                        "y":((cusEndPoint.y - 140) - (Math.random() * 50)),
                        "onComplete":function ():void{
                            TweenLite.to(cusItem, 1, {
                                "alpha":0.2,
                                "onComplete":function ():void{
                                    cusItem.parent.removeChild(cusItem);
                                    if (cusCallBack != null)
                                    {
                                        cusCallBack(cusItem);
                                    };
                                }
                            });
                        }
                    });
                }
            });
        }

        public static function hurtNum8(cusItem:DisplayObject, cusStartPoint:Point, cusCallBack:Function=null):void{
            var _endPos:Point;
            var _t2:Number;
            var _angle:Number = (((120 + (60 * Math.random())) * Math.PI) / 180);
            var _dis:int = (100 + (50 * Math.random()));
            var _randomX:int = (cusStartPoint.x + (((_dis * Math.cos(_angle)) + 20) - (50 * Math.random())));
            var _randomY:int = (cusStartPoint.y + (((_dis * Math.sin(_angle)) + 10) - (25 * Math.random())));
            var _startPoint:Point = new Point((_randomX - (cusItem.width * 0.5)), (_randomY - (cusItem.height * 0.5)));
            _dis = (300 + (50 * Math.random()));
            _randomX = (cusStartPoint.x + (((_dis * Math.cos(_angle)) + 20) - (50 * Math.random())));
            _randomY = (cusStartPoint.y + (((_dis * Math.sin(_angle)) + 10) - (25 * Math.random())));
            _endPos = new Point((_randomX - (cusItem.width * 0.5)), (_randomY - (cusItem.height * 0.5)));
            cusItem.alpha = 1;
            cusItem.scaleX = 3;
            cusItem.scaleY = 3;
            cusItem.x = _startPoint.x;
            cusItem.y = _startPoint.y;
            var _t1:Number = (0.2 + (Math.random() * 0.3));
            _t2 = (1 + (Math.random() * 0.3));
            TweenLite.to(cusItem, _t1, {
                "scaleX":1,
                "scaleY":1,
                "ease":Expo.easeOut,
                "onComplete":function ():void{
                    TweenLite.to(cusItem, _t2, {
                        "alpha":0.6,
                        "x":_endPos.x,
                        "y":_endPos.y,
                        "ease":Expo.easeOut,
                        "onComplete":function ():void{
                            cusItem.parent.removeChild(cusItem);
                            if (cusCallBack != null)
                            {
                                cusCallBack(cusItem);
                            };
                        }
                    });
                }
            });
        }

        public static function hurtNum9(_arg_1:DisplayObject, _arg_2:Point, _arg_3:Function=null):void{
            _arg_1.x = (_arg_2.x - (_arg_1.width * 0.5));
            _arg_1.y = (_arg_2.y - 100);
            attFly(_arg_1, _arg_3, 60, 0, 60, 15, 0, 1, 1, 0.6, 0.3, 1, 1);
        }

        public static function hurtNum10(cusItem:DisplayObject, cusAttPoint:Point, cusTargetPoint:Point, cusCallBack:Function=null):void{
            var _dis:int = (100 + (Math.random() * 30));
            cusTargetPoint.x = (cusTargetPoint.x - (cusItem.width * 0.5));
            cusTargetPoint.y = (cusTargetPoint.y - 50);
            cusItem.x = cusTargetPoint.x;
            cusItem.y = cusTargetPoint.y;
            cusItem.scaleX = 0.4;
            cusItem.scaleY = 0.4;
            var _a:Number = Math.atan2((cusTargetPoint.y - cusAttPoint.y), (cusTargetPoint.x - cusAttPoint.x));
            var _mp:Point = new Point((cusTargetPoint.x + (_dis * Math.cos(_a))), (cusTargetPoint.y + (_dis * Math.sin(_a))));
            TweenLite.to(cusItem, 0.2, {
                "scaleX":1,
                "scaleY":1
            });
            TweenLite.to(cusItem, 0.5, {
                "x":_mp.x,
                "y":_mp.y,
                "onComplete":function ():void{
                    TweenLite.to(cusItem, 1, {
                        "alpha":0.2,
                        "x":(cusItem.x + ((((cusTargetPoint.x - cusAttPoint.x) < 0)) ? -50 : 50)),
                        "onComplete":function ():void{
                            if (cusItem.parent)
                            {
                                cusItem.parent.removeChild(cusItem);
                            };
                            if (cusCallBack != null)
                            {
                                cusCallBack(cusItem);
                            };
                        }
                    });
                }
            });
        }

        public static function hurtNum11(cusItem:DisplayObject, cusStartPoint:Point, cusEndPoint:Point, cusCallBack:Function=null):void{
            cusEndPoint.y = (cusEndPoint.y - 100);
            cusItem.x = cusEndPoint.x;
            cusItem.y = cusEndPoint.y;
            cusItem.scaleX = 1.7;
            cusItem.scaleY = 1.7;
            var _tx:int = ((((cusStartPoint.x - cusEndPoint.x) > 0)) ? -150 : 150);
            var _ty:int = (-70 - (Math.random() * 50));
            TweenLite.to(cusItem, 0.5, {
                "scaleX":1,
                "scaleY":1,
                "x":((((cusEndPoint.x + _tx) + (cusItem.width * 0.5)) + (Math.random() * 170)) - 85),
                "y":(cusEndPoint.y + _ty),
                "onComplete":function ():void{
                    TweenLite.to(cusItem, 0.8, {
                        "y":((cusEndPoint.y - 140) - (Math.random() * 50)),
                        "onComplete":function ():void{
                            TweenLite.to(cusItem, 1, {
                                "alpha":0.2,
                                "onComplete":function ():void{
                                    cusItem.parent.removeChild(cusItem);
                                    if (cusCallBack != null)
                                    {
                                        cusCallBack(cusItem);
                                    };
                                }
                            });
                        }
                    });
                }
            });
        }

        public static function shanbi(_arg_1:DisplayObject, _arg_2:Function=null):void{
            _arg_1.x = 0;
            _arg_1.y = 10;
            attFly(_arg_1, _arg_2, 120, 15, -80);
        }

        public static function roleAtt(_arg_1:DisplayObject, _arg_2:Function=null):void{
            _arg_1.x = 0;
            _arg_1.y = 10;
            attFly(_arg_1, _arg_2, 120, 10, -100);
        }

        public static function beSkillName(_arg_1:DisplayObject, _arg_2:Function=null):void{
            _arg_1.x = -40;
            _arg_1.y = 10;
            attFly(_arg_1, _arg_2, 120, 0, 120);
        }

        public static function tiaoShan(_arg_1:DisplayObject, _arg_2:Function=null):void{
            _arg_1.x = 0;
            _arg_1.y = 10;
            attFly(_arg_1, _arg_2, 120, 15, -120);
        }

        public static function beiBaoJi(_arg_1:DisplayObject, _arg_2:Function=null):void{
            _arg_1.x = (-(_arg_1.width) * 0.5);
            _arg_1.y = -20;
            attFly(_arg_1, _arg_2, 170, 0, 0);
        }

        public static function attFly(cusItem:DisplayObject, cusCallBack:Function, cusFlyHeight:int=50, cusMidXOffset:int=0, cusOffset:int=60, cusOffsetHeight:int=15, cusOffUpHeight:int=25, cusEndScaleX:Number=1, cusEndScaleY:Number=1, cusFlyInTime:Number=1.2, cusFlyOutTime:Number=0.3, cusMinScaleX:Number=1, cusMinScaleY:Number=1):void{
            var _tweenM:TweenMax;
            cusItem = cusItem;
            cusCallBack = cusCallBack;
            cusFlyHeight = cusFlyHeight;
            cusOffset = cusOffset;
            cusOffsetHeight = cusOffsetHeight;
            cusOffUpHeight = cusOffUpHeight;
            cusEndScaleX = cusEndScaleX;
            cusEndScaleY = cusEndScaleY;
            cusFlyInTime = cusFlyInTime;
            cusFlyOutTime = cusFlyOutTime;
            var _endPos:Point = new Point();
            _endPos.x = ((cusItem.x - (cusOffset * 0.5)) + getRD((cusOffset * 0.5)));
            _endPos.y = (cusItem.y - (cusFlyHeight + getRD(cusOffsetHeight)));
            var _midPos:Point = new Point();
            _midPos.x = (_endPos.x + cusMidXOffset);
            _midPos.y = _endPos.y;
            cusItem.scaleY = 0.4;
            cusItem.scaleX = 0.4;
            _tweenM = TweenMax.to(cusItem, cusFlyInTime, {
                "bezierThrough":[{
                    "x":_midPos.x,
                    "y":_midPos.y
                }, {
                    "x":_endPos.x,
                    "y":_endPos.y
                }],
                "scaleX":cusMinScaleX,
                "scaleY":cusMinScaleY,
                "ease":Expo.easeOut,
                "onComplete":function ():void{
                    var _tweenL:* = undefined;
                    _tweenM.kill();
                    _tweenL = TweenLite.to(cusItem, cusFlyOutTime, {
                        "scaleX":cusEndScaleX,
                        "scaleY":cusEndScaleY,
                        "alpha":0.4,
                        "y":(cusItem.y - cusOffUpHeight),
                        "onComplete":function ():void{
                            _tweenL.kill();
                            if (cusItem.parent)
                            {
                                cusItem.parent.removeChild(cusItem);
                            };
                            if (cusCallBack != null)
                            {
                                cusCallBack(cusItem);
                            };
                        }
                    });
                }
            });
        }

        public static function exp(_arg_1:DisplayObject, _arg_2:Function=null):void{
            _arg_1.x = (-(_arg_1.width) * 0.5);
            _arg_1.y = -100;
            attFly(_arg_1, _arg_2, 70, 0, 0, 15, 25, 1, 1, 0.6);
        }

        public static function moduleAtt(cusItem:DisplayObject, startPos:Point, cusCallBack:Function=null):void{
            var tween1:TweenLite;
            tween1 = TweenLite.to(cusItem, 1, {
                "y":(startPos.y - 50),
                "onComplete":function ():void{
                    var tween2:* = undefined;
                    tween1.kill();
                    tween2 = TweenLite.to(cusItem, 1, {
                        "alpha":0,
                        "onComplete":function ():void{
                            tween2.kill();
                            if (cusItem.parent)
                            {
                                cusItem.parent.removeChild(cusItem);
                            };
                            if (cusCallBack != null)
                            {
                                cusCallBack(cusItem);
                            };
                        }
                    });
                }
            });
        }

        private static function getRD(_arg_1:int):Number{
            return ((_arg_1 * Math.random()));
        }

        public static function stopTween(_arg_1:DisplayObject):void{
            TweenLite.killTweensOf(_arg_1);
        }

        public static function straightFlyIcon(cusItem:DisplayObject, cusEndPoint:Point, cusTime:Number, cusCallBack:Function=null, cusCallbackParams:Array=null, cusNeedScale:Boolean=false, cusEndWidth:int=40, cusEndHeight:int=40):void{
            var tweenParam:Object = {
                "x":cusEndPoint.x,
                "y":cusEndPoint.y,
                "onComplete":function ():void{
                    if (cusCallBack != null)
                    {
                        if (((!(cusCallbackParams)) || ((cusCallbackParams.length < 1))))
                        {
                            cusCallBack();
                        }
                        else
                        {
                            cusCallBack(cusCallbackParams);
                        };
                    };
                }
            };
            if (cusNeedScale)
            {
                tweenParam["width"] = cusEndWidth;
                tweenParam["height"] = cusEndHeight;
            };
            TweenLite.to(cusItem, cusTime, tweenParam);
        }

        public static function flyExp(cusItem:DisplayObject, pathPoints:Array, cusCallBack:Function=null, time:Number=1.3, lightTime:Number=0.4):void{
  
            TweenMax.to(cusItem, time, {
                "bezier":pathPoints,
                "ease":Expo.easeInOut,
                "onComplete":function ():void{
                    lighting(cusItem, lightTime, 0xFFCC00, function ():void{
                        if (cusItem.parent)
                        {
                            cusItem.parent.removeChild(cusItem);
                        };
                        if (cusCallBack != null)
                        {
                            cusCallBack(cusItem);
                        };
                    });
                }
            });
        }

        public static function flyZhenqi(cusItem:starling.display.DisplayObject, pathPoints:Array, cusCallBack:Function=null):void{
            TweenMax.to(cusItem, 1.3, {
                "bezier":pathPoints,
                "ease":Expo.easeInOut,
                "onComplete":function ():void{
                    lighting(cusItem, 0.6, 0xFFCC00, function ():void{
                        if (cusItem.parent)
                        {
                            cusItem.parent.removeChild(cusItem);
                        };
                        if (cusCallBack != null)
                        {
                            cusCallBack(cusItem);
                        };
                    });
                }
            });
        }

        public static function lighting(_arg_1:DisplayObject, _arg_2:Number=0.4, _arg_3:uint=0xFFCC00, _arg_4:Function=null, _arg_5:Array=null):TweenMax{
            if (TweenMax.isTweening(_arg_1))
            {
                return (null);
            };
            var _local_6:Object = {};
            _local_6["colorMatrixFilter"] = {
                "colorize":_arg_3,
                "amount":1,
                "contrast":1,
                "saturation":1,
                "brightness":3,
                "hue":0
            };
            _local_6["yoyo"] = true;
            _local_6["repeat"] = 1;
            _local_6["onComplete"] = _arg_4;
            _local_6["onCompleteParams"] = _arg_5;
            return (TweenMax.to(_arg_1, _arg_2, _local_6));
        }


    }
}//package game.utils

