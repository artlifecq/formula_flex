// =================================================================================================
//
//	Starling Framework
//	Copyright Gamua GmbH. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package starling.core
{
    import flash.display.BitmapData;
    import flash.system.System;
    import flash.utils.getTimer;
    
    import away3d.debug.LogPanel;
    import away3d.events.Event;
    
    import starling.debug.StarlingLogPanel;
    import starling.display.Button;
    import starling.display.Mesh;
    import starling.display.Quad;
    import starling.display.Sprite;
    import starling.events.EnterFrameEvent;
    import starling.rendering.Painter;
    import starling.styles.MeshStyle;
    import starling.text.BitmapFont;
    import starling.text.TextField;
    import starling.textures.ConcreteTexture;
    import starling.textures.IStarlingTexture;
    import starling.textures.LabelTextureAtlas;
    import starling.textures.SubTexture;
    import starling.textures.TextureFactory;
    import starling.utils.Align;

    /** A small, lightweight box that displays the current framerate, memory consumption and
     *  the number of draw calls per frame. The display is updated automatically once per frame. */
    internal class StatsDisplay extends Sprite
    {
        private static const UPDATE_INTERVAL:Number = 0.5;
        private static const B_TO_MB:Number = 1.0 / (1024 * 1024); // convert from bytes to MB
        
        private var _background:Quad;
        private var _labels:TextField;
        private var _values:TextField;
		private var _logBtn:Button;
        
		private var _frameCount:int = 0;
		private var _totalTime:Number = 0;
		private var _runTime:Number = 0;
		private static const DAY:int = 3600*24;

        private var _fps:Number = 0;
        private var _memory:Number = 0;
        private var _gpuMemory:Number = 0;
        private var _drawCount:int = 0;
        private var _skipCount:int = 0;
		
        /** Creates a new Statistics Box. */
        public function StatsDisplay()
        {
            const fontName:String = BitmapFont.MINI;
            const fontSize:Number = BitmapFont.NATIVE_SIZE;
            const fontColor:uint  = 0xffffff;
            const width:Number    = 120;
            const height:Number   = 99;
			const labels:String   = "Time:"+
				"\nframes/sec:"+
				"\nstd memory:" +  
				"\ngpu memory:"+
				"\ndraw calls:"+
				"\nMesh:"+
				"\nConcreteTexture:"+
				"\nSubTexture:"+
				"\nLabelAtlas:"+
				"\nstageMeshs:"+
				"\nmaxStack:";

            _labels = new TextField(width, height, labels);
            _labels.format.setTo(fontName, fontSize, fontColor, Align.LEFT);
            _labels.batchable = true;
            _labels.x = 2;

            _values = new TextField(width - 1, height, "");
            _values.format.setTo(fontName, fontSize, fontColor, Align.RIGHT);
            _values.batchable = true;

            _background = new Quad(width, height, 0x0);
			
			var bd:BitmapData = new BitmapData(10, 10, false, 0xFFFFFF);
			var btnTexture:IStarlingTexture = TextureFactory.fromBitmapData(bd, false, false, "bgra", false);
			_logBtn = new Button(btnTexture,"L");
			_logBtn.addEventListener(Event.TRIGGERED, _onLogBtnClick);
			_logBtn.x = width;

            // make sure that rendering takes 2 draw calls
            if (_background.style.type != MeshStyle) _background.style = new MeshStyle();
            if (_labels.style.type     != MeshStyle) _labels.style     = new MeshStyle();
            if (_values.style.type     != MeshStyle) _values.style     = new MeshStyle();

            addChild(_background);
			addChild(_logBtn);
            addChild(_labels);
            addChild(_values);
            
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			
			this.y = 216;
        }
        
		private var _logPanel:LogPanel;
        private function onAddedToStage():void
        {
            addEventListener(Event.ENTER_FRAME, onEnterFrame);
            _totalTime = _frameCount = _skipCount = 0;
			_runTime = getTimer();
            update();
			
			if(!_logPanel)
			{
				_logPanel = new StarlingLogPanel(Starling.current.nativeStage, false);
				_logPanel.startLog();
			}
        }
		
		private function _onLogBtnClick(ev:*):void
		{
			_logPanel.showOrHide();
		}
        
        private function onRemovedFromStage():void
        {
            //removeEventListener(Event.ENTER_FRAME, onEnterFrame);
        }
        
        private function onEnterFrame(event:EnterFrameEvent):void
        {
			_runTime += event.passedTime;
			if(!stage)return;
			
			_totalTime += event.passedTime;
			_frameCount++;
            
            if (_totalTime > UPDATE_INTERVAL)
            {
                update();
                _frameCount = _skipCount = _totalTime = 0;
            }
        }
        
        /** Updates the displayed values. */
        public function update():void
        {
            _background.color = _skipCount > _frameCount / 2 ? 0x003F00 : 0x0;
            _fps = _totalTime > 0 ? _frameCount / _totalTime : 0;
            _memory = System.totalMemory * B_TO_MB;
            _gpuMemory = supportsGpuMem ? Starling.context['totalGPUMemory'] * B_TO_MB : -1;

/*			const labels:String   = "frames/sec:"+
				"\nstd memory:" +  
				"\ngpu memory:"+
				"\ndraw calls:"+
				"\nTime:"+
				"\nMesh:"+
				"\nConcreteTexture:"+
				"\nSubTexture:"+
				"\nLabelAtlas:";*/
			
            var fpsText:String = _fps.toFixed(_fps < 100 ? 1 : 0);
            var memText:String = _memory.toFixed(_memory < 100 ? 1 : 0);
            var gpuMemText:String = _gpuMemory < 1 ? "NaN": _gpuMemory.toFixed(_gpuMemory < 100 ? 1 : 0);
            var drwCall:String = (_totalTime > 0 ? _drawCount : _drawCount).toString(); // contains self :2

			var day:int = _runTime/DAY;
			var hour:int = (_runTime - day*DAY)/3600;
			var min:int = (_runTime - day*DAY - hour*3600)/60;
			var sec:int = (_runTime - day*DAY - hour*3600 - min*60);
			var time:String =  (day ? day+":" : "") +( hour < 10 ? "0"+hour : hour)+ ":"+( min < 10 ? "0"+min : min) + ":"+( sec < 10 ? "0"+sec : sec);
			
			_values.text =  time +"\n"+fpsText + "\n" + memText + "\n" +gpuMemText +"\n"+ drwCall;
			_values.text += "\n"+Mesh.numInstance+"\n"+ConcreteTexture.numInstance+"\n"+SubTexture.numInstance+"\n"+LabelTextureAtlas.numInstance;
			
			var meshStats:Boolean = Starling.current.showMeshStats;
			if(meshStats)
			{
				_values.text += "\n"+Starling.current.numStageMeshs+"\n"+Starling.current.maxStack;
			}else{
				_values.text += "\nNaN\nNaN";
			}
        }

        /** Call this once in every frame that can skip rendering because nothing changed. */
        public function markFrameAsSkipped():void
        {
            _skipCount += 1;
        }
        
        public override function render(painter:Painter):void
        {
            // By calling 'finishQuadBatch' and 'excludeFromCache', we can make sure that the stats
            // display is always rendered with exactly two draw calls. That is taken into account
            // when showing the drawCount value (see 'ignore self' comment above)

            painter.excludeFromCache(this);
            painter.finishMeshBatch();
            super.render(painter);
        }

        /** Indicates if the current runtime supports the 'totalGPUMemory' API. */
        private function get supportsGpuMem():Boolean
        {
            return "totalGPUMemory" in Starling.context;
        }
        
        /** The number of Stage3D draw calls per second. */
        public function get drawCount():int { return _drawCount; }
        public function set drawCount(value:int):void { _drawCount = value; }
        
        /** The current frames per second (updated twice per second). */
        public function get fps():Number { return _fps; }
        public function set fps(value:Number):void { _fps = value; }
        
        /** The currently used system memory in MB. */
        public function get memory():Number { return _memory; }
        public function set memory(value:Number):void { _memory = value; }

        /** The currently used graphics memory in MB. */
        public function get gpuMemory():Number { return _gpuMemory; }
        public function set gpuMemory(value:Number):void { _gpuMemory = value; }
    }
}