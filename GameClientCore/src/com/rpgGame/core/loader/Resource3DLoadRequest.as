package com.rpgGame.core.loader
{
	
	
	public class Resource3DLoadRequest
	{
		/**
		 * 请求加载的资源地址 
		 */		
		public var url:String;
		
		/**
		 * 资源加载完的回调函数，回调函数需要提供一个参数，形如func(resource3D:Resource3D):void 
		 */		
		public var completeCallBack:Function;
		
		/**
		 * 资源加载失败回调函数，回调函数需要提供一个参数，形如func(url:String):void 
		 */		
		public var errorCallBack:Function;
		
		/**
		 * 资源加载进度回调函数，需要提供三个个参数,形如：fun(url:String,bytesLoaded:int,bytesTotal:int),url表示资源的地址,bytesLoaded是已经加载的字节数，bytesTotal是总的需要加载的字节数，bytesTotal是总的需要加载的字节数
		 */		
		public var progressCallBack:Object;
		
		/**
		 * 资源加载优先级,数值越大，优先级越高
		 */		
		public var priority:int;
		
		/**
		 * 请求加载资源的时间 
		 */		
		public var requestTime:int;
	
		/**
		 *  在资源加载完成之后，希望在回调函数里依旧返回回来的参数
		 */		
		public var args:Object;
		
		/**
		 * 加载资源的类 
		 */		
		public var loaderType:Class;
		
		/**
		 * 资源加载请求信息构造器 
		 * @param url 请求加载的资源地址 
		 * @param completeCallBack 资源加载成功的回调函数，回调函数需要提供一个参数，形如func(resource3D:Resource3D):void 
		 * @param errorCallBack 资源加载失败回调函数，回调函数需要提供一个参数，形如func(url:String):void, 其中url表示加载的资源地址
		 * @param progressCallBack 资源加载进度回调函数，需要提供三个个参数,形如：fun(url:String,bytesLoaded:int,bytesTotal:int),url表示资源的地址,bytesLoaded是已经加载的字节数，bytesTotal是总的需要加载的字节数，bytesTotal是总的需要加载的字节数
		 * @param priority 资源加载优先级,数值越大，优先级越高
		 * @param args 在资源加载完成之后，希望在回调函数里依旧返回回来的参数，如果这个参数不为空，那么completeCallBack就需要提供两个参数,形如 func(resource3D:Resource3D,args:Object):void 
		 * @param loaderType 加载资源的类
		 */		
		public function Resource3DLoadRequest(url:String,completeCallBack:Function,errorCallBack:Function,progressCallBack:Object,priority:int,args:Object,loaderType:Class)
		{
			this.url = url;
			this.completeCallBack = completeCallBack;
			this.errorCallBack = errorCallBack;
			this.progressCallBack = progressCallBack;
			this.priority = priority;
			this.args = args;
			this.loaderType = loaderType;
		}
	}
}