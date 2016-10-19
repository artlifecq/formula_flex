package com.rpgGame.app.manager.chat
{
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	import away3d.loaders.multi.MultiLoadData;
	
	import feathers.themes.ThemeLoader;
	
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
				fun && fun.apply(null,params);
				return;
			}
			if(_completeFunMap == null)
			{
				_completeFunMap = new HashMap();
			}
			_completeFunMap.add(fun,params);
			var loader : ThemeLoader = new ThemeLoader();
			var url : String = ClientConfig.getUI(FACE_RESOURCE);
			loader.load(url, onFinish, onPorgress, onError);
		}

		private static function onError(ld : MultiLoadData, e : Event) : void
		{
			trace("表情素材载入失败！！！");
		}

		private static function onPorgress(ld : MultiLoadData, e : ProgressEvent) : void
		{

		}

		private static function onFinish(loader : ThemeLoader) : void
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
		}

	}
}
