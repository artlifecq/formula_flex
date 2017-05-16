package com.game.engine2D.parser
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.scene.render.vo.ActionInfo;
	import com.game.engine2D.scene.render.vo.XmlImgData;
	import com.game.engine2D.scene.render.vo.img.RenderImgData;
	import com.game.engine2D.scene.render.vo.xml.RenderUnitStatus;
	import com.game.engine2D.tools.SceneCache;
	import com.game.mainCore.libCore.utils.LoadBlackListUtils;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.system.ImageDecodingPolicy;
	import flash.utils.Dictionary;
	
	import org.client.load.loader.multi.DobjLoadManager;
	import org.client.load.loader.multi.loader.DobjLoader;
	import org.client.load.loader.multi.vo.LoadData;
	
	/**
	 *
	 * 换装Swf资源解析器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-29 上午10:12:35
	 *
	 */
	public class AvatarSwfParser implements IResParser
	{
		private var _loadData : LoadData;
		private var _loadCompleteFunc : Function;
		private var _loadErrorFunc : Function;
		private var _loaderInfo : LoaderInfo;
		private var _isLoaded : Boolean = false;
		private var _isLoading : Boolean = false;
		
		public function AvatarSwfParser()
		{
		}
		
		final public function load(fullSourchPath : String, priority : int, userData : Object = null) : void
		{
			if (_isLoaded || _isLoading)
			{
				throw new Error("加载中不能再次加载，本次加载请调用unload清除！");
				return;
			}
			_isLoading = true;
			_isLoaded = false;
			_loadData = new LoadData(fullSourchPath, loadSourceComplete, null, loadError, "", "", //
				priority, null, GlobalConfig2D.decode, null, //
				2, 0, ImageDecodingPolicy.ON_LOAD);
			_loadData.applicationDomain = new ApplicationDomain();
			_loadData.userData = userData;
			DobjLoadManager.load(_loadData);
		}
		
		private function loadSourceComplete(ld : LoadData, e : Event) : void
		{
			LoadBlackListUtils.removeLoadUrl(ld.url);
			parseComplete(ld, e.target as DobjLoader);
		}
		
		private function loadError(ld : LoadData, e : Event = null) : void
		{
			var fullSourchPath : String = ld.url;
			//注意这里，如果加载失败，则要把缓存项清掉
			SceneCache.renderUnitCountShare.removeShareData(fullSourchPath); //清掉XML数据资源缓存项
			//移除等待缓存项
			SceneCache.dowithWaiting(fullSourchPath);
			//
			LoadBlackListUtils.addLoadUrl(ld.url);
			
			if (_loadErrorFunc != null)
				_loadErrorFunc(this);
		}
		
		private function parseComplete(ld : LoadData, dLoader : DobjLoader) : void
		{
			var dobj : DisplayObject = dLoader.content;
			_loaderInfo = dLoader.loaderInfo;
			var fullSourchPath : String = ld.url;
			var xid : XmlImgData = SceneCache.renderUnitCountShare.getShareData(fullSourchPath) as XmlImgData;
			if (xid == null) //如果为null,说明等待加载中的数据已经被移除调了,但是加载并没有停止,而让加载完成后就加载不到了;
			{
				trace(ld.url, "如果为null,说明等待加载中的数据已经被移除调了,但是加载并没有停止,而让加载完成后就加载不到了."); //动作切换太快了...是会存在这个问题的...要卸载掉,不然会有内存问题...
				unload();
				return;
			}
			//
			var loadContent : Object = dLoader.content;
			if (loadContent is Bitmap)
			{
				var bm : Bitmap = dobj as Bitmap;
				xid.aps = new RenderUnitStatus();
				var acInfo : ActionInfo = new ActionInfo();
				acInfo.totalFrame = 1;
				var stand : uint = 1;
				xid.aps.initActionDic(stand, 0, acInfo);
				xid.aps.initForBitmapData(fullSourchPath, stand, 0, 0, bm.width, bm.height)
				xid.aid = new RenderImgData();
				xid.aid.initForBitmapData(xid.aps, stand, 0, 0, bm.bitmapData);
				xid.isParserComplete = true;
				bm = null;
				SceneCache.dowithWaiting(fullSourchPath, xid.aps);
			}
			else if (loadContent is DisplayObjectContainer)
			{
				var dic : Dictionary = GlobalConfig2D.resParseFunc(fullSourchPath, _loaderInfo);
				xid.initStatus(fullSourchPath, dic);
				xid.initImgData(dic);
				xid.isParserComplete = true;
				SceneCache.dowithWaiting(fullSourchPath, xid.aps);
			}
			else
			{
				trace(fullSourchPath + " ->未知资源文件格式, 你确定这个能播放?");
			}
			_isLoading = false;
			_isLoaded = true;
			if (_loadCompleteFunc != null)
				_loadCompleteFunc(this);
		}
		
		final public function extractor(className : String) : Object
		{
			if (_loaderInfo)
			{
				var appDomain : ApplicationDomain = _loaderInfo.applicationDomain;
				if (appDomain.hasDefinition(className))
				{
					var cls : Class = appDomain.getDefinition(className) as Class;
					return cls;
				}
			}
			return null;
		}
		
		final public function get loadData() : LoadData
		{
			return _loadData;
		}
		
		final public function onLoadComplete(func : Function) : IResParser
		{
			_loadCompleteFunc = func;
			return this;
		}
		
		final public function onLoadError(func : Function) : IResParser
		{
			_loadErrorFunc = func;
			return this;
		}
		
		final public function unload() : void
		{
			_isLoading = false;
			_isLoaded = false;
			if (_loadData)
			{
				if (_loadData.url)
					DobjLoadManager.cancelLoadByUrl(_loadData.url);
				_loadData.userData = null;
				_loadData = null;
			}
			_loadCompleteFunc = null;
			_loadErrorFunc = null;
			_loaderInfo = null;
		}
		
		final public function dispose() : void
		{
			unload();
		}
	}
}
