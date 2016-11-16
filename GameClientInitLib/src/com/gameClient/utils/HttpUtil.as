package com.gameClient.utils
{
	import flash.errors.IOError;
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class HttpUtil
	{
		/**
		 * 暴露给JavaScript调用的函数 
		 * @param functionName 暴露的函数名
		 * @param closure 函数地址
		 * @param fnError 失败回调
		 * @author 童勇军 2015-04-30
		 */		
		public static function jsCallBack( functionName:String, closure:Function, fnError:Function = null ):void
		{
			try
			{
				ExternalInterface.addCallback( functionName, closure );
			}
			catch ( error:Error )
			{
				if ( fnError != null )
				{
					fnError();
				}
			}
		}
		
		/**
		 * 调用JavaScript的函数 
		 * @param functionName 调用的JavaScript函数
		 * @param args 传参
		 * @param fnError 失败回调
		 * @author 童勇军 2015-04-30
		 */		
		public function jsCall( functionName:String, args:Array = null, fnError:Function = null ):*
		{
			var result:*;
			try
			{
				if ( args == null )
				{
					args = new Array();
				}
				args.unshift( functionName );
				result = ExternalInterface.call.apply( null, args );
			}
			catch( error:Error )
			{
				if ( fnError != null )
				{
					fnError();
				}
			}
			return result;
		}
		
		/**
		 * 打开一个新的WEB窗口
		 * @param url URL地址
		 * @param target 窗口模式
		 * @author 童勇军 2012-9-3
		 */		
		public function openURL( url:String, window:String='_blank' ):void
		{
			
			if ( ! checkIsUrl( url ) )
			{
				return;
			}
			var urlRequest:URLRequest = new URLRequest( url );
			try
			{
				navigateToURL( urlRequest, window );
			}
			catch( err:IOError )
			{
			}
			catch ( err:SecurityError )
			{
			}
			catch ( err:Error )
			{
			}
		}
		
		/**
		 * 检查是否符合URL地址需求，当前检测力度较低,只检查是否符合http://|https://两种情况 
		 * @param url
		 * @return 
		 * @author 童勇军 2012-12-24
		 */		
		private function checkIsUrl( url:String ):Boolean
		{
			var ret:Boolean = url && url.search( /^http(s?):\/\//g ) != -1;
			return ret;
		}
	}
}