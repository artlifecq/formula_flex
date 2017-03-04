package com.game.engine2D.tools
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.SceneCharacter;
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.scene.StarlingLayerManager;
	import com.game.engine2D.scene.render.IRenderUnit;
	import com.game.engine2D.scene.render.RenderSet;
	import com.game.engine2D.scene.render.RenderUnit;
	import com.game.engine2D.scene.render.vo.XmlImgData;
	import com.game.engine2D.scene.render.vo.xml.RenderUnitStatus;
	import com.game.engine2D.vo.BaseObj;
	import com.game.mainCore.libCore.share.CountShare;
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import away3d.loaders.multi.MultiUrlLoadManager;
	import away3d.tick.Tick;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 * 场景所有缓存
	 * @author Carver
	 * @modifier guoqing.wen
	 * 修改时间：2017-2-20 上午10:33:37
	 */
	public class SceneCache
	{
		private static const LOAD_CACHE_TIME:uint = 60000;
		private static var loadCacheMap:HashMap = new HashMap();
		/**
		 * 等待加载的换装数据
		 * 类型:Vector.<WaitLoadAvatarVo>数组的集合
		 * key:换装地址
		 */
		private static var waitingLoadAvatarsMap:HashMap = new HashMap();
		
		/**
		 * 换装计数卸载
		 */
		public static var renderUnitCountShare:CountShare = new CountShare(600000);
		
		public static function startCountShare():void
		{
			renderUnitCountShare.startCount();
		}
		
		public static function stopCountShare():void
		{
			renderUnitCountShare.stopCount();
		}
		
		setup();
		private static function setup():void
		{
			Tick.instance.addCallBack(onTickLoadCache);
		}
		
		
		static private var txt : TextField
		static public function addTxt(txtStr : String) : void
		{
			if (!txt)
			{
				txt = new TextField();
				txt.x = 100;
				txt.y = 100;
				if (txt.parent == null)
				{
					StarlingLayerManager.stage.addChild(txt);
				}
				txt.defaultTextFormat = new TextFormat(null, 14, 0xffff00);
			}
			txt.width = 1920;
			txt.text = txtStr;
		}
		
		private static function onTickLoadCache(deltaTime:int):void
		{
			var time:int = GlobalConfig2D.nowTime;
			var urlList:Array = loadCacheMap.keys();
			for(var i:int=urlList.length-1;i>=0;i--)
			{
				var url:String = urlList[i];
				var t:int = loadCacheMap.getValue(url);
				if(time - t > LOAD_CACHE_TIME)
				{
					var isInWait:Boolean = waitingLoadAvatarsMap.containsKey(url);
					if(!isInWait)
					{
						loadCacheMap.remove(url);
						MultiUrlLoadManager.cancelLoadByUrl(url);
						//addTxt("UrlLoadManager.cancelLoadByUrl(url):"+url);
					}
				}
			}
		}
		
		public static function get countShareCnt():uint
		{
			return renderUnitCountShare.getAllCacheKeyList().length;
		}
		
		//等待加载数组用**********************************************************************************************************
		/**
		 * 将等待加载的添加进等待队列
		 * 
		 */
		public static function addWaitingLoadAvatar($ap:IRenderUnit,$fullSourchPath:String):void
		{
			//可用性判断
			if(!$ap.usable || !$fullSourchPath || $fullSourchPath=="")
			{
				return;
			}
			//记录等待加载数据
			var watingArr:Vector.<IRenderUnit> = waitingLoadAvatarsMap.getValue($fullSourchPath);
			if(watingArr == null)
			{ 
				//不存在该数组就新创建
				watingArr = new Vector.<IRenderUnit>;
				watingArr.push($ap);
				waitingLoadAvatarsMap.add($fullSourchPath,watingArr);
			}
			else
			{
				//存在该数组就检测数组中是否存在与该项等价的项，如果不存在就添加
				var exist:Boolean = false;
				var len:int = watingArr.length;
				while(len-->0)
				{
					var ap:IRenderUnit = watingArr[len];
					if($ap==ap)
					{
						exist = true;
						break;
					}
				}
				if(!exist)
				{
					watingArr.push($ap);
				}
			}
		}
		/**
		 * 将等待添加的添加进等待队列
		 * 
		 */
		public static function addWaitingAddAvatar($ap:IRenderUnit, $in_aps:RenderUnitStatus):void
		{
			//可用性判断
			if($ap && !$ap.usable && $in_aps)
			{
				return;
			}
			//添加换装
			$ap.setRenderUnitStatus($in_aps);
		}
		
		/**
		 * @param $ap
		 * @param $in_fullSourchPath
		 * @param $stopLoad
		 */			
		public static function removeWaitingRenderUnit($ap:IRenderUnit,$in_fullSourchPath:String=null,$stopLoad:Boolean=true):void
		{
			//移除等待加载的
			var watingArr:Vector.<IRenderUnit>;
			var loadFun:Function;
			var xid:XmlImgData;
			watingArr = waitingLoadAvatarsMap.getValue($in_fullSourchPath);
			if(watingArr)
			{
				var len:int = watingArr.length;
				while(len-->0)
				{
					var ap:IRenderUnit = watingArr[len];
					if(ap == $ap)
					{
						watingArr.splice(len,1);
					}
				}
				if(watingArr.length == 0)//如果没了...就移除掉...
				{
					//移除加载函数 
					if($stopLoad)
					{
						loadCacheMap.add($in_fullSourchPath,GlobalConfig2D.nowTime);
						//						MultiUrlLoadManager.cancelLoadByUrl($in_fullSourchPath);
					}
					//移除等待加载项
					waitingLoadAvatarsMap.remove($in_fullSourchPath);
					xid = SceneCache.renderUnitCountShare.getShareData($in_fullSourchPath) as XmlImgData;
					if(xid)
						xid.destroy();
					renderUnitCountShare.removeShareData($in_fullSourchPath);//干掉
				}
			}
			else
			{
				if($stopLoad)
				{
					loadCacheMap.add($in_fullSourchPath,GlobalConfig2D.nowTime);
					//MultiUrlLoadManager.cancelLoadByUrl($in_fullSourchPath);
					xid = SceneCache.renderUnitCountShare.getShareData($in_fullSourchPath) as XmlImgData;
					if(xid)
						xid.destroy();
					///////////////////////////////////////////////////////
					renderUnitCountShare.removeShareData($in_fullSourchPath);//干掉
				}
			}
		}
		
		/**
		 * @private
		 * 立即处理等待项
		 * @param $in_apsList 为null，则相当于执行缓存移除
		 * 
		 */
		public static function dowithWaiting($in_fullSourchPath:String,$in_aps:RenderUnitStatus=null,isRemoveRenderSetUnit:Boolean=true):void
		{
			var watingArr:Vector.<IRenderUnit> = waitingLoadAvatarsMap.getValue($in_fullSourchPath);
			//移除等待缓存项
			waitingLoadAvatarsMap.remove($in_fullSourchPath);
			//校验一下
			if(watingArr==null || watingArr.length==0)
			{
				return;
			}
			var ap:IRenderUnit;
			var len:int = watingArr.length;
			if($in_aps!=null)
			{
				while(len-->0)
				{
					ap = watingArr[len];
					//添加换装
					addWaitingAddAvatar(ap, $in_aps);
				}
			}
			else
			{
				while(len-->0)
				{
					ap = watingArr[len];
					if(isRemoveRenderSetUnit)
					{
						var scene:Scene = Scene.scene;
						var bo:BaseObj = scene.getSceneObjByAp(ap as RenderUnit);
						var renderUnit:RenderUnit = ap as RenderUnit;
						if(bo)
						{
							if(bo is SceneCharacter)
							{
								if(renderUnit.renderSet != null)
								{
									(bo as SceneCharacter).removeBaseObj(renderUnit.renderSet);
								}else
								{
									(bo as SceneCharacter).avatar.removeRenderUnit(renderUnit);
								}
							}
							else if(bo is RenderSet)
							{
								//(bo as RenderSet).removeRenderUnit(ap as RenderUnit);
								Scene.scene.removeSceneObj(bo);
							}
							else if(bo is RenderUnit)//只移除单个好了。。。
							{
								Scene.scene.removeSceneObj(bo);
							}
						}
					}
					else
					{
						if((ap as RenderUnit) && (ap as RenderUnit).parent == Scene.scene.sceneRenderLayer)//只移除单个好了。。。
						{
							Scene.scene.removeSceneObj(ap as RenderUnit);
						}
					}
				}
			}
			watingArr.length = 0;
			watingArr = null;
		}
	}
}
