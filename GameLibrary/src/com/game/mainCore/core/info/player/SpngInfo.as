package com.game.mainCore.core.info.player
{
    import flash.display.BitmapData;
    import flash.display.MovieClip;
    import flash.display.Shape;
    import flash.system.ApplicationDomain;
    
    import org.client.mainCore.ds.HashMap;

    public class SpngInfo 
    {

        public var id:uint;
        public var url:String;
        private var _resContent:MovieClip;
        private var _resBmpData:BitmapData;
        private var _resMap:HashMap;
        private var _app:ApplicationDomain;
        private var _count:int;
        private var _frameRate:uint = 100;
        private var _map:HashMap;

        public function SpngInfo()
        {
            _resMap = new HashMap();
            _map = new HashMap();
            super();
        }

        public function get app():ApplicationDomain
        {
            return _app;
        }

        public function set app(value:ApplicationDomain):void
        {
            var xml:XML = null;
            var avatarBmpFmVo:AvatarBmpFrameInfo = null;
            var key:String;
            _app = value;
            var cls:Class = _app.getDefinition(className) as Class;
            if (cls.hasOwnProperty("X_M_L"))
            {
                xml = cls.X_M_L;
            }
            else
            {
                return;
            }
            for each (var item:XML in xml.children())
            {
                for each (var xmlItem:XML in item.children())
                {
                    avatarBmpFmVo = new AvatarBmpFrameInfo();
                    avatarBmpFmVo.status = item.@k;
                    avatarBmpFmVo.interval = item.@t;
                    avatarBmpFmVo.width = xmlItem.@w;
                    avatarBmpFmVo.height = xmlItem.@h;
                    avatarBmpFmVo.frame = xmlItem.@f;
                    avatarBmpFmVo.angle = xmlItem.@a;
                    avatarBmpFmVo.sx = xmlItem.@sx;
                    avatarBmpFmVo.sy = xmlItem.@sy;
                    avatarBmpFmVo.tx = xmlItem.@tx;
                    avatarBmpFmVo.ty = xmlItem.@ty;
                    avatarBmpFmVo.ox = xmlItem.@ox;
                    avatarBmpFmVo.oy = xmlItem.@oy;
                    key = avatarBmpFmVo.status + "_" + avatarBmpFmVo.angle + "_" + avatarBmpFmVo.frame;
                    _map.add(key, avatarBmpFmVo);
                }
            }
        }

        public function set resContent(value:MovieClip):void
        {
            var avatarBmpFmVo:AvatarBmpFrameInfo = null;
            var key:String;
            _resContent = value;
            _resContent.gotoAndStop(1);
            var xml:XML = XML((_resContent.getChildAt(1) as Object).text);
            for each (var xmlItem:XML in xml.children())
            {
                avatarBmpFmVo = new AvatarBmpFrameInfo();
                avatarBmpFmVo.status = xml.@k;
                avatarBmpFmVo.interval = xml.@t;
                _frameRate = xml.@t;
                avatarBmpFmVo.width = xmlItem.@w;
                avatarBmpFmVo.height = xmlItem.@h;
                avatarBmpFmVo.frame = xmlItem.@f;
                avatarBmpFmVo.angle = xmlItem.@a;
                avatarBmpFmVo.sx = xmlItem.@sx;
                avatarBmpFmVo.sy = xmlItem.@sy;
                avatarBmpFmVo.tx = xmlItem.@tx;
                avatarBmpFmVo.ty = xmlItem.@ty;
                avatarBmpFmVo.ox = xmlItem.@ox;
                avatarBmpFmVo.oy = xmlItem.@oy;
                key = avatarBmpFmVo.status + "_" + avatarBmpFmVo.angle + "_" + avatarBmpFmVo.frame;
                _map.add(key, avatarBmpFmVo);
            }
            var shape:Shape = _resContent.getChildAt(0) as Shape;
            _resBmpData = new BitmapData(shape.width, shape.height, true, 0);
            _resBmpData.draw(shape);
            _resContent = null;
        }

        public function get frameRate():int
        {
            return _frameRate;
        }

        public function get count():int
        {
            return _count;
        }

        public function set count(value:int):void
        {
            _count = value;
            if (_count < 0)
            {
                _count = 0;
            }
        }

        public function dispose():void
        {
            for each (var info:AvatarStatusListInfo in _resMap.getValues())
            {
                if (info)
                {
                    info.dispose();
                    info = null;
                }
            }
            _resMap = new HashMap();
            _map = new HashMap();
        }

        public function getStatusAngleInfo(status:String, angle:uint):AvatarStatusListInfo
        {
            var listInfo:AvatarStatusListInfo = _resMap.getValue(status + "_" + angle);
            return listInfo;
        }

        public function get className():String
        {
            if (url != null && url != "")
            {
                return url.replace(/\\/g, "/").replace(/^(.*\/)*([a-zA-Z_\d]+)\..+$/, "$2");
            }
            return "";
        }
    }
}