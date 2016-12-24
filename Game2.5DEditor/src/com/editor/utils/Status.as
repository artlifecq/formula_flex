package com.editor.utils
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.getTimer;

	/**
	 *
	 * 状态查看器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-17 上午10:30:12
	 *
	 */
	public class Status extends Sprite
	{
		private static var _instance : Status = null;

		private var _tft : TextFormat;

		private var _version : TextField; //fp版本
		private var _fps : TextField; //帧频
		private var _mem : TextField; //内存

		private var _frame : int;
		private var _lastTimer : int;

		public function Status()
		{
			this.mouseEnabled = false;
			this.mouseChildren = false;

			style();

			addTextField();

			this.addEventListener(Event.ADDED_TO_STAGE, onAddStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveStage);
			this.addEventListener(Event.RESIZE, stageResizeHandler);
			this.filters = [new GlowFilter(0, 1, 2, 2, 4, 2)];
		}

		private function addTextField() : void
		{
			/*版本*/
			_version = new TextField();
			_version.x = 10;
			_version.y = 10;
			_version.text = getFlashVersion();
			_version.autoSize = TextFieldAutoSize.LEFT;
			_version.defaultTextFormat = _tft;
			_version.setTextFormat(_tft);
			this.addChild(_version);

			/*帧频*/
			_fps = new TextField();
			_fps.x = 10;
			_fps.y = 25;
			_fps.autoSize = TextFieldAutoSize.LEFT;
			_fps.defaultTextFormat = _tft;
			this.addChild(_fps);

			/*内存*/
			_mem = new TextField();
			_mem.x = 10;
			_mem.y = 40;
			_mem.autoSize = TextFieldAutoSize.LEFT;
			_mem.defaultTextFormat = _tft;
			this.addChild(_mem);
		}

		private function style() : void
		{
			_tft = new TextFormat();
			_tft.font = "Arial";
			_tft.size = 12;
			_tft.bold = false;
			_tft.color = 0xFFFFFF;
		}

		public static function get instance() : Status
		{
			if (_instance == null)
			{
				_instance = new Status();
			}
			return _instance;
		}

		private function onAddStage(event : Event) : void
		{
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		private function onRemoveStage(event : Event) : void
		{
			this.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		public function getFlashVersion() : String
		{
			return Capabilities.version;
		}

		private function stageResizeHandler(event : Event) : void
		{
			if (stage)
			{
				this.x = stage.stageWidth - this.width;
			}
		}

		private function enterFrameHandler(event : Event) : void
		{
			var now : int = getTimer() - _lastTimer;
			_frame++;
			if (now > 1000)
			{
				var fps : Number = Math.floor(_frame / (now * 0.001) * 1000) * 0.001;
				_fps.text = "FPS:" + fps.toFixed(2);
				_lastTimer = getTimer();
				_frame = 0;

				var mem : Number = Math.round(System.totalMemory * 0.001 * 0.001);
				_mem.text = "MEM:" + mem + "MB";
			}
		}
	}
}
