//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.ui
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import __AS3__.vec.Vector;
    import flash.text.StyleSheet;
    import flash.events.Event;
    import flash.utils.getTimer;
    import flash.system.System;
    import flash.display.DisplayObjectContainer;
    import flash.events.MouseEvent;

    public class MovieMonitor extends Sprite 
    {

        private var theText:TextField;
        private var fps:int = 0;
        private var ms:uint;
        private var lastTimeCheck:uint;
        private var maxMemory:Number = 0;
        private var fpsVector:Vector.<Number>;
        private var childrenCount:int;
        private var startRunTm:Number = 0;
        private var xml:XML;
        private var _style:StyleSheet;
        private var _itemKeyValueMap:Object;
        private var _addItemMap:Object;

        public function MovieMonitor():void
        {
            fpsVector = new Vector.<Number>();
            xml = <xml>
			<sectionLabel>时间: </sectionLabel>
			<time>-</time>
			<sectionLabel>运行时长: </sectionLabel>
			<runTime>-</runTime>
			<sectionTitle>帧频 监视</sectionTitle>
			<sectionLabel>当前的帧频: </sectionLabel>
			<framesPerSecond>-</framesPerSecond>
			<sectionLabel>一分钟内帧频平均值: </sectionLabel>
			<averageFPS>-</averageFPS>
			<sectionLabel>每毫秒当前帧: </sectionLabel>
			<msFrame>-</msFrame>
			<sectionTitle>内存 监视</sectionTitle>
			<sectionLabel>当前使用的内存量: </sectionLabel>
			<directMemory>-</directMemory>
			<sectionLabel>分配的最大内存量: </sectionLabel>
			<directMemoryMax>-</directMemoryMax>
			<sectionLabel>内存总量: </sectionLabel>
			<veryTotalMemory>-</veryTotalMemory>
			<sectionLabel>已分配未使用内存量: </sectionLabel>
			<garbageMemory>-</garbageMemory>
			<sectionTitle>舞台 监视</sectionTitle>
			<sectionLabel>舞台的宽度: </sectionLabel>
			<widthPx>-</widthPx>
			<sectionLabel>舞台的高度: </sectionLabel>
			<heightPx>-</heightPx>
			<sectionLabel>显示对象的个数 : </sectionLabel>
			<nChildren>-</nChildren>
			</xml>
            ;
            _itemKeyValueMap = {};
            _addItemMap = {};
            super();
            var style:StyleSheet = new StyleSheet();
            style.setStyle("xml", {
                "fontSize":"10px",
                "fontFamily":"宋体"
            });
            style.setStyle("time", {"color":"#FFcc00"});
            style.setStyle("runTime", {"color":"#00FF00"});
            style.setStyle("sectionTitle", {"color":"#FFAA00"});
            style.setStyle("sectionLabel", {
                "color":"#CCCCCC",
                "display":"inline"
            });
            style.setStyle("framesPerSecond", {"color":"#FFFFFF"});
            style.setStyle("msFrame", {"color":"#FFFFFF"});
            style.setStyle("averageFPS", {"color":"#FFFFFF"});
            style.setStyle("directMemory", {"color":"#FFFFFF"});
            style.setStyle("veryTotalMemory", {"color":"#FFFFFF"});
            style.setStyle("garbageMemory", {"color":"#FFFFFF"});
            style.setStyle("directMemoryMax", {"color":"#FFFFFF"});
            style.setStyle("widthPx", {"color":"#FFFFFF"});
            style.setStyle("heightPx", {"color":"#FFFFFF"});
            style.setStyle("nChildren", {"color":"#FF0000"});
            _style = style;
            theText = new TextField();
            theText.alpha = 0.8;
            theText.autoSize = "left";
            theText.styleSheet = style;
            theText.condenseWhite = true;
            theText.selectable = false;
            theText.mouseEnabled = false;
            theText.background = true;
            theText.backgroundColor = 0;
            addChild(theText);
            addEventListener("addedToStage", onAddToStage);
            addEventListener("removedFromStage", onRemoveFromStage);
            startRunTm = new Date().time;
        }

        public function addItem(name:String, valueObj:Object, valueName:String, color:uint=0xFFFFFF, cName:String=null):void
        {
            if (_addItemMap.hasOwnProperty(name))
            {
                return;
            };
            cName = ((cName) || (name));
            var x1:XML = XML(((("<sectionLabel>" + cName) + " : ") + "</sectionLabel>"));
            var x2:XML = XML((((("<" + name) + ">-</") + name) + ">"));
            xml.appendChild(x1);
            xml.appendChild(x2);
            var cStr:String = color.toString(16);
            _style.setStyle(name, {"color":("#" + cStr)});
            _addItemMap[name] = valueObj;
            _itemKeyValueMap[name] = valueName;
        }

        private function onAddToStage(e:Event):void
        {
            addEventListener("enterFrame", update);
            addEventListener("mouseDown", onMosDown);
            addEventListener("mouseUp", onMosUp);
        }

        private function onRemoveFromStage(e:Event):void
        {
            removeEventListener("enterFrame", update);
            removeEventListener("mouseDown", onMosDown);
            removeEventListener("mouseUp", onMosUp);
        }

        private function update(e:Event):void
        {
            var vectorLength:int;
            var vectorAverage:Number;
            var i:Number;
            var date = null;
            var directMemory:Number;
            var valueObj = null;
            var value = null;
            var xmlList = null;
            var timer:int = getTimer();
            if (((timer - 1000) > lastTimeCheck))
            {
                vectorLength = fpsVector.push(fps);
                if ((vectorLength > 60))
                {
                    fpsVector.shift();
                };
                vectorAverage = 0;
                i = 0;
                while (i < fpsVector.length)
                {
                    vectorAverage = (vectorAverage + fpsVector[i]);
                    i++;
                };
                date = new Date();
                vectorAverage = (vectorAverage / fpsVector.length);
                xml.time = date.toTimeString();
                xml.runTime = msec2THMS((date.time - startRunTm));
                xml.averageFPS = Math.round(vectorAverage);
                directMemory = System.totalMemory;
                maxMemory = Math.max(directMemory, maxMemory);
                xml.directMemory = (directMemory / 0x100000).toFixed(3);
                xml.directMemoryMax = (maxMemory / 0x100000).toFixed(3);
                xml.veryTotalMemory = (System.privateMemory / 0x100000).toFixed(3);
                xml.garbageMemory = (System.freeMemory / 0x100000).toFixed(3);
                xml.framesPerSecond = ((fps + " / ") + stage.frameRate);
                xml.widthPx = ((stage.width + " / ") + stage.stageWidth);
                xml.heightPx = ((stage.height + " / ") + stage.stageHeight);
                childrenCount = 0;
                countDisplayList(stage);
                xml.nChildren = childrenCount;
                for (var key:String in _addItemMap)
                {
                    valueObj = _addItemMap[key];
                    value = valueObj[_itemKeyValueMap[key]];
                    xmlList = xml.descendants(key);
                    xmlList[0] = value;
                    xml.@key = xmlList[0];
                };
                fps = 0;
                lastTimeCheck = timer;
            };
            fps++;
            xml.msFrame = (timer - ms);
            ms = timer;
            theText.htmlText = xml;
        }

        private function countDisplayList(container:DisplayObjectContainer):void
        {
            var i:int;
            childrenCount = (childrenCount + container.numChildren);
            i = 0;
            while (i < container.numChildren)
            {
                if ((container.getChildAt(i) is DisplayObjectContainer))
                {
                    countDisplayList(DisplayObjectContainer(container.getChildAt(i)));
                };
                i++;
            };
        }

        private function onMosDown(e:MouseEvent):void
        {
            this.startDrag();
        }

        private function onMosUp(e:MouseEvent):void
        {
            this.stopDrag();
        }

        private function msec2THMS(msec:uint):String
        {
            var sec:uint = Math.floor((msec / 1000));
            var hours:uint = Math.floor((sec / 3600));
            var minutes:uint = Math.floor((Math.floor((sec % 3600)) / 60));
            var seconds:uint = Math.floor((Math.floor((sec % 3600)) % 60));
            if ((hours == 0))
            {
                return ((((minutes + "分") + seconds) + "秒"));
            };
            return ((((((hours + "小时") + minutes) + "分") + seconds) + "秒"));
        }


    }
}//package com.game.mainCore.core.ui
