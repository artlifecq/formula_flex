package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 *
	 * 加载进度条视图
	 * @author L.L.M.Sunny
	 * 创建时间：2016-3-31 上午10:15:32
	 *
	 */
	public class LoadProgressView extends Sprite
	{
		private var _stage : Stage;

		private var _title : String;
		private var _titleTextFlied : TextField;
		private var _currentPercent : Number;

		public function LoadProgressView()
		{
			init();
		}

		private function init() : void
		{
			_titleTextFlied = new TextField();
			_titleTextFlied.width = 300;
			_titleTextFlied.height = 28;
			_titleTextFlied.autoSize = TextFieldAutoSize.NONE;
			_titleTextFlied.mouseEnabled = false;
			_titleTextFlied.mouseWheelEnabled = false;
			_titleTextFlied.textColor = 0xf9f0cc;
			_titleTextFlied.defaultTextFormat = new TextFormat("SimSun", 16, 0xf9f0cc, true, null, null, null, null, TextFormatAlign.CENTER);
			addChild(_titleTextFlied);
		}

		public function set percent(value : Number) : void
		{
			_currentPercent = value;
			updateText();
		}

		private function updateText() : void
		{
			_titleTextFlied.text = _title + " " + int(_currentPercent * 100) + "%";
		}

		public function set title(text : String) : void
		{
			_title = text;
			_titleTextFlied.text = _title;
		}

		public function show(stage : Stage) : void
		{
			_stage = stage;
			if (_stage == null)
				return;
			_stage.addEventListener(Event.RESIZE, onStgResize);
			onStgResize(null);
		}

		public function dispose() : void
		{
			_stage.removeEventListener(Event.RESIZE, onStgResize);
			if (parent != null)
				parent.removeChild(this);
		}

		private function onStgResize(event : Event) : void
		{
			if (_stage == null)
				return;
			x = int((_stage.stageWidth - this.width) * 0.5);
			y = int((_stage.stageHeight - this.height) * 0.5);
		}
	}
}
