﻿package org.client.load.loader.multi
{
	import org.client.load.loader.multi.vo.LoadData;
	import org.client.load.loader.multi.loader.UrlLoader;
	import flash.events.Event;
	
	public class UrlLoadManager
	{
		
		private static var waitLoadList:Array = [];
		
		private static var loaderList:Array = [];
		
		public static var MAX_THREAD:int = 10;
		
		private static var _isPriorityChg:Boolean = false;
		
		
		public function UrlLoadManager()
		{
			super();
			throw new Error("Can not New!");
		}
		
		public static function load($loadData:LoadData) : void
		{
			var rslLoader:UrlLoader = getFreeLoader($loadData.priority);
			if(rslLoader != null)
			{
				loadNext(rslLoader,$loadData);
			}
			else
			{
				waitLoadList.push($loadData);
				waitLoadList.sortOn("priority",2 | 16);
			}
		}
		
		public static function cancelLoadByUrl($url:String) : void
		{
			var i:int = 0;
			var ld:LoadData = null;
			var len:int = waitLoadList.length;
			for(i = len - 1; i >= 0; )
			{
				ld = waitLoadList[i];
				if(ld.url == $url)
				{
					waitLoadList.splice(i,1);
				}
				i--;
			}
			var _loc7_:int = 0;
			var _loc6_:* = loaderList;
			for each(var rslLoader in loaderList)
			{
				if(rslLoader.isLoading)
				{
					if(rslLoader.rslLoadData.url == $url)
					{
						removeLoadEvent(rslLoader);
						rslLoader.stop();
						rslLoader.clear();
						loadNext(rslLoader);
					}
				}
			}
		}
		
		public static function cancelLoadByUrlCallBack($urlCallBack:Function) : void
		{
			var i:int = 0;
			var ld:* = null;
			var len:int = waitLoadList.length;
			for(i = len - 1; i >= 0; )
			{
				ld = waitLoadList[i];
				if(ld.onComplete == $urlCallBack)
				{
					waitLoadList.splice(i,1);
				}
				i--;
			}
			var _loc7_:int = 0;
			var _loc6_:* = loaderList;
			for each(var rslLoader in loaderList)
			{
				if(rslLoader.isLoading)
				{
					if(rslLoader.rslLoadData.onComplete == $urlCallBack)
					{
						removeLoadEvent(rslLoader);
						rslLoader.stop();
						rslLoader.clear();
						loadNext(rslLoader);
					}
				}
			}
		}
		
		public static function cancelLoadByUrlAndUrlCallBack($url:String, $urlCallBack:Function) : void
		{
			var i:int = 0;
			var ld:* = null;
			var len:int = waitLoadList.length;
			for(i = len - 1; i >= 0; )
			{
				ld = waitLoadList[i];
				if(ld.url == $url && ld.onComplete == $urlCallBack)
				{
					waitLoadList.splice(i,1);
				}
				i--;
			}
			var _loc8_:int = 0;
			var _loc7_:* = loaderList;
			for each(var rslLoader in loaderList)
			{
				if(rslLoader.isLoading)
				{
					if(rslLoader.rslLoadData.url == $url && rslLoader.rslLoadData.onComplete == $urlCallBack)
					{
						removeLoadEvent(rslLoader);
						rslLoader.stop();
						rslLoader.clear();
						loadNext(rslLoader);
					}
				}
			}
		}
		
		public static function updateLoadPriority() : void
		{
			_isPriorityChg = true;
		}
		
		private static function getFreeLoader($priority:int = 0) : UrlLoader
		{
			var rslLoader:* = null;
			var lowLoader:* = null;
			var _loc5_:int = 0;
			var _loc4_:* = loaderList;
			for each(rslLoader in loaderList)
			{
				if(!rslLoader.isLocked && !rslLoader.isLoading)
				{
					if(rslLoader.rslLoadData == null)
					{
						return rslLoader;
					}
				}
			}
			if(loaderList.length < MAX_THREAD)
			{
				rslLoader = new UrlLoader();
				loaderList.push(rslLoader);
				return rslLoader;
			}
			var _loc7_:int = 0;
			var _loc6_:* = loaderList;
			for each(rslLoader in loaderList)
			{
				if(!rslLoader.isLocked && (lowLoader == null || lowLoader.rslLoadData.priority > rslLoader.rslLoadData.priority))
				{
					lowLoader = rslLoader;
				}
			}
			if(lowLoader && lowLoader.rslLoadData.priority < $priority)
			{
				removeLoadEvent(lowLoader);
				lowLoader.stop();
				waitLoadList.push(lowLoader.rslLoadData);
				waitLoadList.sortOn("priority",2 | 16);
				lowLoader.clear();
				return lowLoader;
			}
			return null;
		}
		
		private static function loadNext($rslLoader:UrlLoader, $loadData:LoadData = null) : void
		{
			var self:* = null;
			if(_isPriorityChg)
			{
				waitLoadList.sortOn("priority",2 | 16);
				_isPriorityChg = false;
			}
			if($rslLoader.isLoading || $rslLoader.isLocked)
			{
				return;
			}
			if($loadData != null)
			{
				self = $loadData;
			}
			else if(waitLoadList.length > 0)
			{
				self = waitLoadList.shift();
			}
			if(self != null)
			{
				initLoadEvent($rslLoader);
				$rslLoader.load(self);
			}
		}
		
		private static function initLoadEvent($rslLoader:UrlLoader) : void
		{
			$rslLoader.addEventListener("complete",rslLoaderHandler);
			$rslLoader.addEventListener("progress",rslLoaderHandler);
			$rslLoader.addEventListener("ioError",rslLoaderHandler);
			$rslLoader.addEventListener("securityError",rslLoaderHandler);
		}
		
		private static function removeLoadEvent($rslLoader:UrlLoader) : void
		{
			$rslLoader.removeEventListener("complete",rslLoaderHandler);
			$rslLoader.removeEventListener("progress",rslLoaderHandler);
			$rslLoader.removeEventListener("ioError",rslLoaderHandler);
			$rslLoader.removeEventListener("securityError",rslLoaderHandler);
		}
		
		private static function rslLoaderHandler(e:Event) : void
		{
			var rslLoader:UrlLoader = e.currentTarget as UrlLoader;
			var _loc3_:* = e.type;
			if("complete" !== _loc3_)
			{
				if("progress" !== _loc3_)
				{
					if("ioError" !== _loc3_)
					{
						if("securityError" !== _loc3_)
						{
						}
					}
					trace("UrlLoaderManager: 尝试" + rslLoader.rslLoadData.tryCount + "次后，加载" + rslLoader.rslLoadData.url + "失败");
					removeLoadEvent(rslLoader);
					if(rslLoader.rslLoadData != null && rslLoader.rslLoadData.onError != null)
					{
						rslLoader.isLocked = true;
						rslLoader.rslLoadData.onError(rslLoader.rslLoadData,e);
					}
					rslLoader.stop();
					rslLoader.clear();
					rslLoader.isLocked = false;
					loadNext(rslLoader);
				}
				else if(rslLoader.rslLoadData != null && rslLoader.rslLoadData.onUpdate != null)
				{
					rslLoader.isLocked = true;
					rslLoader.rslLoadData.onUpdate(rslLoader.rslLoadData,e);
					rslLoader.isLocked = false;
				}
			}
			else
			{
				removeLoadEvent(rslLoader);
				if(rslLoader.rslLoadData != null && rslLoader.rslLoadData.onComplete != null)
				{
					rslLoader.isLocked = true;
					rslLoader.rslLoadData.onComplete(rslLoader.rslLoadData,e);
				}
				rslLoader.stop();
				rslLoader.clear();
				rslLoader.isLocked = false;
				loadNext(rslLoader);
			}
		}
	}
}
