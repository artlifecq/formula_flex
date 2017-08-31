package com.client.process
{
	import com.client.loader.FontLoader;
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.process.BaseProcess;
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.statistics.Statistics;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.text.Font;
	
	import feathers.controls.text.Fontter;
	
	import org.client.load.loader.multi.vo.LoadData;

	/**
	 *
	 * 加载字体库
	 * @author wewell@163.com
	 *
	 */
	public class LoadEmbedFonts extends BaseProcess
	{
		private static const FONTS : String = "SimHei.swf";

		public function LoadEmbedFonts()
		{
			super();
		}

		override public function getState() : String
		{
			return ProcessState.STATE_LOAD_FONTS;
		}

		override public function startProcess() : void
		{
			super.startProcess();

//			ResLoadingView.instance.show();
//			ResLoadingView.instance.title = str;

//			var mainUiLoad : SwfLoader = new SwfLoader(ClientConfig.decode);
//			mainUiLoad.addEventListener(Event.COMPLETE, handler_comp);
//			mainUiLoad.addEventListener(ProgressEvent.PROGRESS, onLoaderPorgress);
//			mainUiLoad.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
//			mainUiLoad.load(url);
			
			var url : String = ClientConfig.getFont(FONTS);
			var str:String = "开始加载字体库...";
			GameLog.addShow(str);
			var loader:FontLoader = new FontLoader(null);
			loader.addEventListener(Event.COMPLETE, handler_comp);
			loader.addEventListener(ProgressEvent.PROGRESS, onLoaderPorgress);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
			loader.load(url);
		}
		
		override public function switchMaster():void
		{
			super.switchMaster();
			ResLoadingView.instance.show();
			ResLoadingView.instance.title = "正在加载字体库...";
		}

		private function onLoaderPorgress(e : ProgressEvent) : void
		{
			var currPercent : Number = e.bytesLoaded / e.bytesTotal;
			setProcessPercent(currPercent);
		}

		private function onLoadError(ld : LoadData, e : Event) : void
		{
			var err:String = "加载加载字体库错误";
			ResLoadingView.instance.title = err ;
			GameLog.addShow( err );
		}

		override public function processHandler(percent : Number) : void
		{
			ResLoadingView.instance.percent = percent;
		}

		private function handler_comp(e : Event) : void
		{
			GameLog.addShow("加载字体库完成...");

			var loader : FontLoader = e.target as FontLoader;
			const className : String = "Font_hei_ti";
			const fontName : String = "SimHei";
			try
			{
				var c : Class = loader.loader.contentLoaderInfo.applicationDomain.getDefinition(className) as Class;
				Font.registerFont(c);
				Fontter.embedFonts = true;
				Fontter.addEmbedFont(fontName, fontName, fontName);
				Fontter.DEFAULT_FONT_NAME = fontName;
				Fontter.DEFAULT_FONT_SIZE = 14;
				Fontter.DEFAULT_THICKNESS = 150;
			}
			catch (e : Error)
			{
				trace("未知嵌入字体：" + className);
			}
			Statistics.intance.pushNode(Statistics.STEP_LOAD_FONT,"字体加载成功");
			completeProcess();
		}

		override public function dispose() : void
		{
			super.dispose();
		}
	}
}
