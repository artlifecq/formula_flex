package com.game.engine2D.scene.render.vo
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.core.TexturePack;
	import com.game.engine2D.parser.IResParser;
	import com.game.engine2D.scene.render.loader.RenderUnitLoader;
	import com.game.engine2D.scene.render.vo.img.RenderImgData;
	import com.game.engine2D.scene.render.vo.xml.RenderUnitStatus;
	import com.game.engine2D.tools.SceneCache;
	import com.game.engine2D.utils.AnalysisTexture;
	import com.game.mainCore.libCore.share.CountShareData;
	
	import flash.events.Event;
	import flash.net.URLLoaderDataFormat;
	import flash.system.ApplicationDomain;
	import flash.system.ImageDecodingPolicy;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import org.client.load.loader.multi.UrlLoadManager;
	import org.client.load.loader.multi.loader.UrlLoader;
	import org.client.load.loader.multi.vo.LoadData;
	import org.client.mainCore.manager.EventManager;

	/**
	 * @private
	 * XML和IMG数据
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-4-21 上午10:33:37
	 * */
	public class XmlImgData extends CountShareData
	{
		private var _parser:IResParser;
		
		/**换装部件状态配置数据*/
		public var aps:RenderUnitStatus;
		
		/**换装部件状态图像数据*/
		public var aid:RenderImgData;
		
		/** 是否为UI显示资源 */
		public var isStarling:Boolean;
		
		public function XmlImgData()
		{
			super();
		}
			
		/**
		 * 加载资源 
		 * @param fullSourchPath
		 * @param apd
		 * @param completeHandler
		 * 
		 */		
		final public function loadSource(fullSourchPath:String,
										 apd:RenderParamData,
										 completeHandler:Function=null,
										 errorHandler:Function=null):void
		{
			var isBinary:Boolean = isStarling || fullSourchPath.indexOf(GlobalConfig2D.avatarResExtension) != -1;
			var format:String = isBinary ? URLLoaderDataFormat.BINARY : null;
			if(RenderUnitLoader.specailLoadFun != null)
			{
				RenderUnitLoader.specailLoadFun(fullSourchPath);
			}
			else if(format == null)
			{
				if(!_parser)
					_parser = new GlobalConfig2D.avatarResParser();
				_parser.onLoadComplete(completeHandler).onLoadError(errorHandler);
				_parser.load(fullSourchPath,apd.priority);
			}
			else
			{
				var ld:LoadData = new LoadData(fullSourchPath, loadSourceComplete,null,loadError,"","",
					apd.priority,format,GlobalConfig2D.decode,null,
					2,0,ImageDecodingPolicy.ON_LOAD);
				ld.applicationDomain = new ApplicationDomain();
				UrlLoadManager.load(ld);
			}
		}
		
		private static function loadError($ld:LoadData, e:Event=null):void
		{
			var fullSourchPath:String = $ld.url;
			trace("加载出错,加载出错........坑坑坑坑坑坑坑坑坑坑坑坑坑坑:",fullSourchPath);
			EventManager.dispatchEvent("renderUnit404",fullSourchPath);
			//注意这里，如果加载失败，则要把缓存项清掉
			//-------------------------------------
			if(SceneCache.renderUnitCountShare.hasShareData(fullSourchPath))
			{
				SceneCache.renderUnitCountShare.removeShareData(fullSourchPath);//清掉XML数据资源缓存项
			}
			//移除等待缓存项
			//SceneCache.dowithWaiting(fullSourchPath,null);
		}
		
		private static function loadSourceComplete($ld:LoadData, e:Event):void
		{
			var uLoader:UrlLoader = (e.target as UrlLoader);
			var fullSourchPath:String = $ld.url;
			var xid:XmlImgData = SceneCache.renderUnitCountShare.getShareData(fullSourchPath) as XmlImgData;
			if(xid == null)//如果为null,说明等待加载中的数据已经被移除调了,但是加载并没有停止,而让加载完成后就加载不到了;
			{
				//trace($ld.url,"如果为null,说明等待加载中的数据已经被移除调了,但是加载并没有停止,而让加载完成后就加载不到了.");//动作切换太快了...是会存在这个问题的...要卸载掉,不然会有内存问题...
				if (uLoader)
				{
					uLoader.clear();
					uLoader = null;
				}
				return;
			}
			
			if (uLoader)
			{
				var dataBytes:ByteArray = uLoader.data;
				var pack:TexturePack = AnalysisTexture.decompressTexturePack(dataBytes, fullSourchPath);
				var configDic:Dictionary = GlobalConfig2D.resParseFunc(fullSourchPath, pack.dataBytes);
				if(configDic)
				{
					xid.aps = new RenderUnitStatus();
					xid.aps.initForDic(fullSourchPath,configDic);
					xid.aid = new RenderImgData();
					if (xid.isStarling)
						xid.aid.initForATFStarlingDic(xid.aps,configDic,pack);
					else
						xid.aid.initForATFDic(xid.aps,configDic,pack);
					SceneCache.dowithWaiting(fullSourchPath, xid.aps);
				}
			}
			else
			{
				trace(fullSourchPath + " ->未知资源文件格式, 你确定这个能播放?");
			}
		}
		
		public function initStatus(fullSourchPath:String, actionInfoDic:Dictionary) : void
		{
			if(aps)
			{
				aps.dispose();
				aps = null;
			}
			aps = new RenderUnitStatus();
			aps.initForDic(fullSourchPath, actionInfoDic);
		}
		
		public function initImgData(actionInfoDic:Dictionary) : void
		{
			aid = new RenderImgData();
			aid.initForDic(aps, actionInfoDic, _parser.extractor);
		}
		
		public function unload():void
		{
			if(_parser)
			{
				_parser.dispose();
				_parser = null;
			}
		}
		
		/**
		 * 解析zatf资源 
		 * @param atfBytes：文件bytes
		 * @param fullSourchPath：资源url
		 * 
		 */
		public function parserATFSource(atfBytes:ByteArray, fullSourchPath:String):void
		{
			var pack:TexturePack = AnalysisTexture.decompressTexturePack(atfBytes, fullSourchPath);
			var configDic:Dictionary = GlobalConfig2D.resParseFunc(fullSourchPath, pack.dataBytes);
			this.aps = new RenderUnitStatus();
			this.aps.initForDic(fullSourchPath,configDic);
			this.aid = new RenderImgData();
			this.aid.initForATFDic(this.aps,configDic,pack);
		}
		
		/**释放*/
		override public function destroy():void
		{
			unload();
			if(aid!=null)
			{
				aid.dispose();
				aid = null;
			}
			if(aps)
			{
				aps.dispose();
				aps = null;
			}
			super.destroy();
		}
	}
}