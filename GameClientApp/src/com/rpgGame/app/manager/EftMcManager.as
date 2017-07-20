package com.rpgGame.app.manager
{
	import com.rpgGame.core.app.AppLoadManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.utils.getDefinitionByName;
	
	import feathers.controls.UIMovieClip;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 特效资源管理器
	 * @author dik
	 * 
	 */
	public class EftMcManager
	{
		private static  const EFFECT_RESOURCE : String = "effect";
		private static var _isLoad : Boolean = false;
		private static var waitList:Array;
		private static var _isLoading:Boolean;
		
		public function EftMcManager()
		{
		
		}
		
		public static function setMcStyle(mc:UIMovieClip,name:String):void
		{
			if(!_isLoad){//没加载
				loadEft([mc,name]);
			}else{
				mc.styleClass=getStyle(name);
			}
		}
		
		private static function getStyle(name:String):Class
		{
			return getDefinitionByName("org.mokylin.skin.effect.mc."+name) as Class;
		}
		
		private static function loadEftComplete(params:Array):void
		{
			var mc:UIMovieClip=params[0];
			var style:Class=getStyle(params[1]);
			mc.styleClass=style;
		}
		
		/**
		 * 需要把特效先load进来再用
		 *
		 */
		private static function loadEft(params:Array = null) : void
		{
			if (_isLoad)
			{
				 loadEftComplete(params);
				return;
			}
			if(waitList == null)
			{
				waitList = []
			}
			waitList.push(params);
			if(_isLoading){
				return;
			}
			var loadUrl : String = ClientConfig.getUI(EFFECT_RESOURCE);
			_isLoading=true;
			AppLoadManager.instace().loadByUrl(loadUrl, "", onFinish, onError);
		}
		
		private static function onFinish(_appUrl:* = null) : void
		{
			trace("公用特效素材载入成功");
			_isLoad = true;
			_isLoading=false;
			var len:int = waitList.length;
			for(var i:int = 0; i < len; i++)
			{
				var params:Array = waitList[i];
				loadEftComplete(params);
			}
		}
		
		private static function onError(_appUrl:* = null) : void
		{
			trace("公用特效素材载入失败！！！");
			_isLoading=false;
		}
	}
}