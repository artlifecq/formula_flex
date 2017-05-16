package com.game.engine3D.scene.render
{
	import com.game.engine3D.loader.Resource3DLoader;
	import com.game.engine3D.utils.CallBackUtil;
	import com.game.engine3D.vo.CallBackData;
	import com.game.engine3D.vo.share.CountShareData;
	
	import flash.utils.Dictionary;
	
	import away3d.audio.SoundBox;
	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;
	import away3d.events.Event;
	import away3d.events.LoaderEvent;
	import away3d.events.ParserEvent;
	import away3d.lights.LightBase;
	import away3d.materials.methods.EffectMethodBase;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 *
	 * 3D渲染单元加载器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-08-08 下午1:26:38
	 *
	 */
	public class RenderUnitLoader extends CountShareData
	{
		private var _fullSourchPath : String;
		private var _isLoaded : Boolean;
		private var _isLoading : Boolean;
		private var _isAsyncLoaded : Boolean;
		private var _isUnloaded : Boolean;
		private var _resCompleteCallBackList : Vector.<CallBackData>;
		private var _asyncResCompleteCallBackList : Vector.<CallBackData>;
		private var _resErrorCallBackList : Vector.<CallBackData>;
		private var _loader : Resource3DLoader;
		
		public function RenderUnitLoader()
		{
			_isLoaded = false;
			_isLoading = false;
			_isAsyncLoaded = false;
			_isUnloaded = false;
			_resCompleteCallBackList = new Vector.<CallBackData>();
			_asyncResCompleteCallBackList = new Vector.<CallBackData>();
			_resErrorCallBackList = new Vector.<CallBackData>();
		}
		
		public function setResCompleteCallBack(value : Function, args : Array = null) : void
		{
			CallBackUtil.addCallBackData(_resCompleteCallBackList, value, args);
		}
		
		public function removeResCompleteCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_resCompleteCallBackList, value);
		}
		
		public function setSyncResCompleteCallBack(value : Function, args : Array = null) : void
		{
			CallBackUtil.addCallBackData(_asyncResCompleteCallBackList, value, args);
		}
		
		public function removeSyncResCompleteCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_asyncResCompleteCallBackList, value);
		}
		
		public function setResErrorCallBack(value : Function, args : Array = null) : void
		{
			CallBackUtil.addCallBackData(_resErrorCallBackList, value, args);
		}
		
		public function removeResErrorCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_resErrorCallBackList, value);
		}
		
		/**
		 *
		 * @param fullSourchPath
		 *
		 */
		final public function loadSource(fullSourchPath : String, priority : int = 100) : void
		{
			if (_loader)
			{
				removeLoaderEvents();
				_loader.dispose();
				_loader = null;
			}
			_isLoaded = false;
			_isLoading = true;
			_isAsyncLoaded = false;
			_isUnloaded = false;
			_fullSourchPath = fullSourchPath;
			_loader = new Resource3DLoader();
			_loader.addEventListener(LoaderEvent.RESOURCE_COMPLETE, onResourceComplete);
			_loader.addEventListener(LoaderEvent.ASYNC_TEXTURES_COMPLETE, onAsyncTexturesComplete);
			_loader.addEventListener(LoaderEvent.LOAD_ERROR, onResourceLoadError);
			_loader.addEventListener(ParserEvent.PARSE_ERROR, onResourceParseError);
			_loader.load(_fullSourchPath, priority);
		}
		
		private function removeLoaderEvents() : void
		{
			if (_loader)
			{
				_loader.removeEventListener(LoaderEvent.RESOURCE_COMPLETE, onResourceComplete);
				_loader.removeEventListener(LoaderEvent.ASYNC_TEXTURES_COMPLETE, onAsyncTexturesComplete);
				_loader.removeEventListener(LoaderEvent.LOAD_ERROR, onResourceLoadError);
				_loader.removeEventListener(ParserEvent.PARSE_ERROR, onResourceParseError);
			}
		}
		
		private function onResourceComplete(e : Event) : void
		{
			_isLoaded = true;
			_isLoading = false;
			CallBackUtil.exceteCallBackData(this, _resCompleteCallBackList);
		}
		
		private function onAsyncTexturesComplete(e : Event) : void
		{
			_isAsyncLoaded = true;
			CallBackUtil.exceteCallBackData(this, _asyncResCompleteCallBackList);
		}
		
		private function onResourceLoadError(e : LoaderEvent) : void
		{
			CallBackUtil.exceteCallBackData(this, _resErrorCallBackList);
			unload();
		}
		
		private function onResourceParseError(e : ParserEvent) : void
		{
			CallBackUtil.exceteCallBackData(this, _resErrorCallBackList);
			unload();
		}
		
		public function unload() : void
		{
			_isLoaded = false;
			_isLoading = false;
			_isAsyncLoaded = false;
			_isUnloaded = true;
			if (_resCompleteCallBackList)
			{
				_resCompleteCallBackList.length = 0;
			}
			if (_asyncResCompleteCallBackList)
			{
				_asyncResCompleteCallBackList.length = 0;
			}
			if (_resErrorCallBackList)
			{
				_resErrorCallBackList.length = 0;
			}
			removeLoaderEvents();
			if (_loader)
			{
				_loader.dispose();
				_loader = null;
			}
		}
		
		public function get elements() : Vector.<ObjectContainer3D>
		{
			if (_loader)
				return _loader.elements;
			return null;
		}
		
		public function get methods() : Vector.<EffectMethodBase>
		{
			if (_loader)
				return _loader.methods;
			return null;
		}
		
		public function get lightPickerMap() : HashMap
		{
			if (_loader)
				return _loader.lightPickerMap;
			return null;
		}
		
		public function get lights() : Vector.<LightBase>
		{
			if (_loader)
				return _loader.lights;
			return null;
		}
		
		public function get soundBox() : SoundBox
		{
			if (_loader)
				return _loader.soundBox;
			return null;
		}
		
		public function get camera() : Camera3D
		{
			if (_loader)
				return _loader.camera;
			return null;
		}
		
		public function get materialMap() : Dictionary
		{
			if (_loader)
				return _loader.materialMap;
			return null;
		}
		
		public function get materialLightPickerMap() : Dictionary
		{
			if (_loader)
				return _loader.materialLightPickerMap;
			return null;
		}
		
		public function get fullSourchPath() : String
		{
			return _fullSourchPath;
		}
		
		public function get isLoaded() : Boolean
		{
			return _isLoaded;
		}
		
		public function get isLoading() : Boolean
		{
			return _isLoading;
		}
		
		public function get isAsyncLoaded() : Boolean
		{
			return _isAsyncLoaded;
		}
		
		public function get isUnloaded() : Boolean
		{
			return _isUnloaded;
		}
		
		override public function destroy() : void
		{
			unload();
			if (_loader)
			{
				_loader.dispose();
				_loader = null;
			}
			if (_resCompleteCallBackList)
			{
				_resCompleteCallBackList.length = 0;
				_resCompleteCallBackList = null;
			}
			if (_asyncResCompleteCallBackList)
			{
				_asyncResCompleteCallBackList.length = 0;
				_asyncResCompleteCallBackList = null;
			}
			if (_resErrorCallBackList)
			{
				_resErrorCallBackList.length = 0;
				_resErrorCallBackList = null;
			}
			_fullSourchPath = null;
			super.destroy();
		}
	}
}
