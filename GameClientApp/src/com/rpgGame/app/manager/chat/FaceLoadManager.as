package com.rpgGame.app.manager.chat
{
	import com.rpgGame.core.app.AppLoadManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.events.ProgressEvent;
	
	import away3d.loaders.multi.MultiLoadData;
	
	import org.client.mainCore.ds.HashMap;

	public class FaceLoadManager
	{
		public function FaceLoadManager()
		{
		}

		private static const FACE_RESOURCE : String = "mc";

		private static var _isLoad : Boolean = false;

		private static var _completeFunMap:HashMap;

		/**
		 * 需要把表情先load进来再用
		 *
		 */
		public static function loadFace(fun : Function = null,params:Array = null) : void
		{
			if (_isLoad)
			{
				if(fun != null)
				{
					fun && fun.apply(null,params);
				}
				return;
			}
			if(_completeFunMap == null)
			{
				_completeFunMap = new HashMap();
			}
			if(fun != null)
			{
				_completeFunMap.add(fun,params);
			}
//			var loader : ThemeLoader = new ThemeLoader();
//			var url : String = ClientConfig.getUI(FACE_RESOURCE);
//			loader.load(url, onFinish, onPorgress, onError);
			var loadUrl : String = ClientConfig.getUI(FACE_RESOURCE);
			AppLoadManager.instace().loadByUrl(loadUrl, "", onFinish, onError);
		}

		private static function onError(_appUrl:* = null) : void
		{
			trace("表情素材载入失败！！！");
		}

		private static function onPorgress(ld : MultiLoadData, e : ProgressEvent) : void
		{

		}
		
		public static function get isLoad():Boolean{
			return _isLoad;
		}

		private static function onFinish(_appUrl:* = null) : void
		{
			trace("表情素材载入成功");
			_isLoad = true;
			var keys:Array = _completeFunMap.keys();
			var len:int = keys.length;
			for(var i:int = 0; i < len; i++)
			{
				var call:Function = keys[i];
				var params:Array = _completeFunMap.getValue(call);
				call.apply(null,params);
			}
			_completeFunMap.clear();
		}
		
		public static function removeFunKey(fun : Function):void{
			if(fun!=null && _completeFunMap!=null){
				_completeFunMap.remove(fun);
			}
		}

	}
}
