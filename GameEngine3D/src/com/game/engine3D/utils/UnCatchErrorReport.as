package com.game.engine3D.utils
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.vo.ErrorReportData;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.system.System;
	import flash.utils.Timer;
	import flash.utils.getTimer;

	import away3d.arcane;
	import away3d.core.managers.Stage3DProxy;
	import away3d.premium.heap.HeapAllocator;

	/**
	 *
	 * 未捕获异常上报
	 * @author L.L.M.Sunny
	 * 创建时间：2017-03-10 上午10:42:33
	 *
	 */
	public class UnCatchErrorReport
	{
		use namespace arcane;

		private static var _ticker : Timer;
		private static var _errorInfos : Array;
		private static var _errorDic : Object = {};
		private static var _reportUrl : String = null;
		private static var _outputHandle : Function = null;
		public static var infoTrace : Function = trace;

		public function UnCatchErrorReport()
		{
		}

		public static function setup(reportUrl : String, outputHandle : Function) : void
		{
			_reportUrl = reportUrl;
			_outputHandle = outputHandle;
			_errorInfos = [];
			if (_ticker == null)
			{
				_ticker = new Timer(1000);
				_ticker.addEventListener(TimerEvent.TIMER, onTick);
				_ticker.start();
			}
		}

		public static function sendErroLog(errortxt : String) : void
		{
			if (!errortxt)
				return;
			if (_outputHandle == null)
				return;
			var stage3DProxy : Stage3DProxy = Stage3DLayerManager.stage3DProxy;
			var reportData : ErrorReportData = new ErrorReportData();
			reportData.memory = System.totalMemory / 1024 / 1024; //报错时的内存
			reportData.displayMemory = stage3DProxy.textureMemory3D / 1024 / 1024; //报错时的显存
			reportData.maxDM = stage3DProxy.maxTextureMemory / 1024 / 1024; //最大可用显存
			reportData.stageWidth = Stage3DLayerManager.stage.stageWidth; //舞台宽度
			reportData.stageHeight = Stage3DLayerManager.stage.stageHeight; //舞台高度
			reportData.runTime = int(getTimer() / 1000 / 60); //客户端运行时间 
			reportData.vex2D = stage3DProxy.totalVertexBuffer2D; //2D顶点数
			reportData.vex3D = stage3DProxy.totalVertexBuffer3D; //3D顶点数
			reportData.heap = (HeapAllocator.CACHE_SIZE - HeapAllocator.sizeAvailable) / 1024 / 1024; //domainMemory
			reportData.draw2D = stage3DProxy.drawCount2D; //2D drawCall
			reportData.draw3D = stage3DProxy.drawCount3D; //3D drawCall
			reportData.fps = Stage3DLayerManager.fps; //报错时的帧率
			reportData.avgFps = Stage3DLayerManager.getAverageFps(10); //报错时的平均帧率
			reportData.kernelInfo = GlobalConfig.kernelVersion; //浏览器内核信息
			reportData.driverInfo = stage3DProxy.driverInfo.toLocaleLowerCase(); //硬件驱动信息
			reportData.errorInfo = errortxt; //错误信息
			var errorStr : String = _outputHandle(reportData);
			if (errorStr)
			{
				if (_errorDic.hasOwnProperty(errorStr))
				{
					errorStr = null;
				}
			}
			if (errorStr && _errorInfos.indexOf(errorStr) < 0)
			{
				_errorInfos.push(errorStr);
			}
		}

		private static function onTick(event : Event) : void
		{
			if (_reportUrl && _errorInfos.length > 0)
			{
				var errorStr : String = _errorInfos.shift();
				_errorDic[errorStr] = 1;
				var urlRequest : URLRequest = new URLRequest(_reportUrl); //新建URLRequest对象，用来获取flash中textArea的数据
				var loader : URLLoader = new URLLoader(); //建立URLLoader对象，用来发送flash中textArea的数据
				var urlvariables : URLVariables = new URLVariables(); //建立URLVariables对象，
				urlvariables.errorLog = errorStr; //通过cc参数传递 txtcontent里的数据
				urlRequest.data = urlvariables; //讲urlvariables的数据赋值给.data
				loader.addEventListener(Event.COMPLETE, onLoaderComlete);
				loader.addEventListener(IOErrorEvent.IO_ERROR, onIoerror);
				urlRequest.method = URLRequestMethod.POST; //.method 也为 URLLoader的一个属性值
				loader.load(urlRequest); //开始发送数据
				errorStr = null;
			}
		}

		private static function onLoaderComlete(event : Event) : void
		{
			if (infoTrace != null)
				infoTrace("error 上报成功");
		}

		private static function onIoerror(event : IOErrorEvent) : void
		{
			if (infoTrace != null)
				infoTrace("error 上报失败");
		}
	}
}
