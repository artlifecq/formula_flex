//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore._special.drag
{
    import flash.display.InteractiveObject;
    import flash.geom.Rectangle;
    import flash.display.Stage;
    import flash.display.DisplayObjectContainer;
    import flash.display.DisplayObject;
    import flash.geom.Point;
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.geom.Matrix;
    import flash.display.BitmapData;
    import flash.display.Bitmap;

    public class DragData 
    {

        private var _canMove:Boolean;
        private var _dobj:InteractiveObject;
        private var _type:int;
        private var _mode:int;
        private var _showMode:int;
        private var _criticalDis:Number;
        private var _xyRect:Rectangle;
        private var _touchRect:Rectangle;
        private var _alpha:Number;
        private var _data:DropInData;
        private var _stage:Stage;
        private var _dobjParent:DisplayObjectContainer;
        private var _dobjIndex:int;
        private var _face:DisplayObject;
        private var _guiderStartPoint:Point;
        private var _dobjStartPoint:Point;
        private var _dobjStartAlpha:Number;
        private var _onComplete:Function;
        private var _onCompleteParameters:Array;

        public function DragData($dobj:InteractiveObject, $type:int=1, $mode:int=0, $showMode:int=0, $showUV:Point=null, $criticalDis:Number=2, $xyRect:Rectangle=null, $touchRect:Rectangle=null, $alpha:Number=1, $onComplete:Function=null, $onCompleteParameters:Array=null, $data:DropInData=null)
        {
            var face = null;
            var inFace = null;
            var ma = null;
            var bmd = null;
            var bm = null;
            super();
            if (((($dobj == null)) || (($dobj.stage == null))))
            {
                throw (new Error("$dobj对象必须不能为空，并且存在于在显示列表中"));
            };
            _canMove = false;
            _dobj = $dobj;
            _type = $type;
            _mode = $mode;
            _showMode = $showMode;
            _criticalDis = $criticalDis;
            _xyRect = $xyRect;
            _touchRect = $touchRect;
            _alpha = $alpha;
            _onComplete = $onComplete;
            _onCompleteParameters = $onCompleteParameters;
            _data = $data;
            _stage = $dobj.stage;
            _dobjParent = $dobj.parent;
            _dobjIndex = $dobj.parent.getChildIndex($dobj);
            var bounds:Rectangle = dobj.getRect(dobj);
            if (($showUV == null))
            {
                _guiderStartPoint = new Point(_dobj.mouseX, _dobj.mouseY);
            }
            else
            {
                _guiderStartPoint = new Point((bounds.width * $showUV.x), (bounds.height * $showUV.y));
            };
            _dobjStartPoint = new Point(_dobj.x, _dobj.y);
            _dobjStartAlpha = _dobj.alpha;
            var dobjStartPoint_onStage:Point = _dobjParent.localToGlobal(_dobjStartPoint);
            switch (_showMode)
            {
                case 0:
                    _face = _dobj;
                    return;
                case 1:
                    inFace = new Shape();
                    inFace.graphics.clear();
                    inFace.graphics.lineStyle(1, 0, 1);
                    inFace.graphics.beginFill(0, 0);
                    inFace.graphics.drawRect(0, 0, bounds.width, bounds.height);
                    inFace.graphics.endFill();
                    face = new Sprite();
                    face.mouseEnabled = false;
                    face.mouseChildren = false;
                    face.addChild(inFace);
                    inFace.x = bounds.x;
                    inFace.y = bounds.y;
                    _face = face;
                    return;
                default:
                    ma = new Matrix();
                    ma.translate(-(bounds.x), -(bounds.y));
                    bmd = new BitmapData(bounds.width, bounds.height, true, 0);
                    bmd.draw(_dobj, ma, null, null, null, true);
                    bm = new Bitmap(bmd, "auto", true);
                    face = new Sprite();
                    face.mouseEnabled = false;
                    face.mouseChildren = false;
                    face.addChild(bm);
                    bm.x = bounds.x;
                    bm.y = bounds.y;
                    _face = face;
                    return;
            };
        }

        public function isValid():Boolean
        {
            return (((((((((((((((((((((((!((dobj == null))) && (!((_dobjParent == null))))) && (!(isNaN(_dobjIndex))))) && (!(isNaN(_type))))) && (!(isNaN(_mode))))) && (!(isNaN(_showMode))))) && (!((_guiderStartPoint == null))))) && (!(isNaN(_criticalDis))))) && (!((_dobjStartPoint == null))))) && (!(isNaN(_dobjStartAlpha))))) && (!(isNaN(_alpha))))) && (!((_stage == null)))));
        }

        public function equal($dragData:DragData):Boolean
        {
            return ((dobj == $dragData.dobj));
        }

        public function get type():int
        {
            return (_type);
        }

        public function get mode():int
        {
            return (_mode);
        }

        public function get showMode():int
        {
            return (_showMode);
        }

        public function get dobj():InteractiveObject
        {
            return (_dobj);
        }

        public function get guiderStartPoint():Point
        {
            return (_guiderStartPoint);
        }

        public function get dobjStartPoint():Point
        {
            return (_dobjStartPoint);
        }

        public function get dobjStartAlpha():Number
        {
            return (_dobjStartAlpha);
        }

        public function get criticalDis():Number
        {
            return (_criticalDis);
        }

        public function get xyRect():Rectangle
        {
            return (_xyRect);
        }

        public function get touchRect():Rectangle
        {
            return (_touchRect);
        }

        public function get alpha():Number
        {
            return (_alpha);
        }

        public function get onComplete():Function
        {
            return (_onComplete);
        }

        public function get onCompleteParameters():Array
        {
            return (_onCompleteParameters);
        }

        public function get data():DropInData
        {
            return (_data);
        }

        public function get face():DisplayObject
        {
            return (_face);
        }

        public function get canMove():Boolean
        {
            return (_canMove);
        }

        public function get stage():Stage
        {
            return (_stage);
        }

        public function get dobjParent():DisplayObjectContainer
        {
            return (_dobjParent);
        }

        public function get dobjIndex():int
        {
            return (_dobjIndex);
        }

        public function set canMove($value:Boolean):void
        {
            _canMove = $value;
        }


    }
}//package com.game.mainCore.libCore._special.drag
