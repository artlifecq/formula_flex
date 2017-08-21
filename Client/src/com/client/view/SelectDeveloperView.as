package com.client.view
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import feathers.controls.ComboBox;
	
	import starling.core.Starling;

	/**
	 *
	 * 选择开发者视图
	 * @author 未知
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-4-3 下午6:05:12
	 *
	 */
	public class SelectDeveloperView extends Sprite
	{
		private var _xml : XML;

		private var _clickFun : Function;
		private var _so : SharedObject = null;
		private var com:ComboBox;

		public function SelectDeveloperView(clickFun : Function = null)
		{
			_clickFun = clickFun;
			urlloader=new URLLoader();
			urlloader.addEventListener(Event.COMPLETE,onLoadComplete);
			urlloader.addEventListener(IOErrorEvent.IO_ERROR,onErr);
			urlloader.dataFormat=URLLoaderDataFormat.TEXT;
			urlloader.load(new URLRequest("server.xml"));
			addEventListener(Event.ADDED_TO_STAGE, onAddToStg);
			var com:ComboBox=new ComboBox();
			
		}
		
		protected function onErr(event:IOErrorEvent):void
		{
			GameLog.addError("加载服务配置失败!");
		}
		
		protected function onLoadComplete(event:Event):void
		{
			urlloader.removeEventListener(Event.COMPLETE,onLoadComplete);
			
			_xml=new XML(urlloader.data);
			initItem();
		}
		
		private function onAddToStg(e : Event) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStg);
			this.stage.addEventListener(Event.RESIZE, onStgResize);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		}

		private function onStgResize(event : Event) : void
		{
			x = (stage.stageWidth - width) * 0.5;
			y = (stage.stageHeight - height) * 0.5;
		}

		private function onRemoveFromStage(e : Event) : void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			this.stage.removeEventListener(Event.RESIZE, onStgResize);
		}

		private var _textIpPort : TextField;

		private var urlloader:URLLoader;

		private function initItem() : void
		{
			var txtFmt : TextFormat = new TextFormat();
			txtFmt.font = "SimSun";
			txtFmt.size = 32;
			
			com=new ComboBox();

			//显示播放器版本
			var txt : TextField = new TextField();
			txt.defaultTextFormat = new TextFormat("SimSun", 12, 0x9999999);
			txt.text = "Player Version:  " + (Capabilities.isDebugger ? "Debug" : "Release") + " " + Capabilities.version + //
				"\n" + "Game Version:  " + ClientConfig.versionInfo;
			txt.width = txt.textWidth + 20;
			txt.selectable = false;
			txt.x = (600 - txt.width) / 2;
			addChild(txt);

			var cnt : uint = 1;
			for each (var xml : XML in _xml.descendants("item"))
			{
				var name : String = xml.@name;
				var ip : String = xml.@ip;
				var port : String = xml.@port;

				txt = new TextField();
				txt.defaultTextFormat = txtFmt;
				txt.textColor = 0x000066;
				txt.text = "[" + name + "]" + "ip:" + ip + "(" + "port:" + port + ")";
				txt.autoSize = TextFieldAutoSize.LEFT;
				this.addChild(txt);
				txt.y += 50 * cnt;
				cnt++;
				txt.background = true;
				txt.backgroundColor = 0xEEEE00;
				txt.selectable = false;
				txt.addEventListener(MouseEvent.CLICK, onClickTxt(ip, port));
			}

			_textIpPort = new TextField();
			_textIpPort.type = TextFieldType.INPUT;
			_textIpPort.y = 50 * cnt;
			_textIpPort.autoSize = TextFieldAutoSize.LEFT;
			_textIpPort.background = true;
			_textIpPort.backgroundColor = 0xFF9900;
			_textIpPort.width = 300;
			_textIpPort.defaultTextFormat = txtFmt;
			_so = SharedObject.getLocal("UserIpPort");
			var str : String = _so.data["UserIpPort"] || "127.0.0.1:9999";
			_textIpPort.text = str;
			this.addChild(_textIpPort);
			
			var txtBtn : TextField = new TextField();
			txtBtn.x = 600;
			txtBtn.defaultTextFormat = txtFmt;
			txtBtn.y = 50 * cnt;
			txtBtn.text = "进入";
			txtBtn.height = _textIpPort.height;
			txtBtn.background = true;
			txtBtn.selectable = false;
			txtBtn.backgroundColor = 0xFFEE66;
			addChild(txtBtn);
			txtBtn.addEventListener(MouseEvent.CLICK, onClickEnter);
			onStgResize(null);
		}

		private function onClickEnter(ev : MouseEvent) : void
		{
			var str : Array = _textIpPort.text.split(":");
			var ip : String = String(str[0]);
			var port : String = String(str[1]);

			_so.data["UserIpPort"] = _textIpPort.text;
			_so.flush();

			_clickFun(ip, port);
		}

		private function onClickTxt(ip : String, port : String) : Function
		{
			var fun : Function = function(e : MouseEvent) : void
			{
				if (_clickFun != null)
				{
					_clickFun(ip, port);
				}
			}
			return fun;
		}
	}
}
