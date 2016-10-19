package com.game.engine3D.loader
{
	import flash.net.URLRequest;
	import flash.utils.Dictionary;

	import away3d.audio.SoundBox;
	import away3d.containers.ObjectContainer3D;
	import away3d.core.base.SubMesh;
	import away3d.entities.CompositeMesh;
	import away3d.entities.Mesh;
	import away3d.entities.SparticleMesh;
	import away3d.events.AssetEvent;
	import away3d.events.Event;
	import away3d.events.EventDispatcher;
	import away3d.events.LoaderEvent;
	import away3d.events.ParserEvent;
	import away3d.library.assets.AssetType;
	import away3d.library.assets.IAsset;
	import away3d.lights.LightBase;
	import away3d.loaders.AssetLoader;
	import away3d.loaders.parsers.AWD2Parser;
	import away3d.materials.MaterialBase;
	import away3d.materials.lightpickers.LightPickerBase;
	import away3d.materials.methods.EffectMethodBase;
	import away3d.materials.methods.RimLightMethod;

	import gs.TweenLite;

	import org.client.mainCore.ds.HashMap;

	/**
	 * 3D资源加载器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-3 下午3:07:11
	 *
	 */
	public class Resource3DLoader extends EventDispatcher
	{
		private var _loader : AssetLoader;
		private var _url : String;
		private var _isLoaded : Boolean;
		private var _isAsyncLoaded : Boolean;
		private var _meshByName : Dictionary;
		private var _objMap : HashMap;
		private var _elements : Vector.<ObjectContainer3D>;
		private var _methods : Vector.<EffectMethodBase>;
		private var _layerTypeByName : Dictionary;
		private var _visibleByName : Dictionary;
		private var _soundBox : SoundBox;
		private var _materialMap : Dictionary;
		private var _materialLightPickerMap : Dictionary;
		/** 灯光选择 **/
		private var _lightPickerMap : HashMap;
		/** 灯，包含顶灯 **/
		private var _lights : Vector.<LightBase>;
		public static var dabugDelayComplete : int = 0;

		public function Resource3DLoader()
		{
			super();
			_materialMap = new Dictionary(true);
			_materialLightPickerMap = new Dictionary(true);
			_meshByName = new Dictionary(true);
			_objMap = new HashMap();
			_elements = new Vector.<ObjectContainer3D>();
			_methods = new Vector.<EffectMethodBase>();
			_layerTypeByName = new Dictionary(true);
			_visibleByName = new Dictionary(true);
			_lightPickerMap = new HashMap();
			_lights = new Vector.<LightBase>();
			_soundBox = null;
		}

		public function get isLoaded() : Boolean
		{
			return _isLoaded;
		}

		public function get isAsyncLoaded() : Boolean
		{
			return _isAsyncLoaded;
		}

		public function load(url : String) : void
		{
			if (!_loader)
			{
				_isLoaded = false;
				_isAsyncLoaded = false;
				_url = url;
				_loader = new AssetLoader();

				_loader.addEventListener(LoaderEvent.RESOURCE_COMPLETE, onResourceComplete);
				_loader.addEventListener(AssetEvent.ASSET_COMPLETE, onAssetComplete);
				_loader.addEventListener(LoaderEvent.ASYNC_TEXTURES_COMPLETE, onAsyncTexturesComplete);
				_loader.addEventListener(LoaderEvent.LOAD_ERROR, onLoadError);
				_loader.addEventListener(ParserEvent.PARSE_ERROR, onParseError);
				_loader.load(new URLRequest(_url), null, null, new AWD2Parser());
			}
		}

		public function get url() : String
		{
			return _url;
		}

		private function onAssetComplete(e : AssetEvent) : void
		{
			if (e.type == AssetEvent.ASSET_COMPLETE)
			{
				var obj : IAsset = e.asset as IAsset;
				_objMap.add(obj.name, obj);
				switch (e.asset.assetType)
				{
					case AssetType.MESH:
					case AssetType.RIBBON:
					case AssetType.SPARTICLE_MESH:
						var mesh : Mesh = e.asset as Mesh; //CompositeMesh,SparticleMesh//
						if (mesh)
						{
							if (mesh is CompositeMesh)
							{
							}
							else if (mesh is SparticleMesh)
							{
							}
							else
							{
								_meshByName[mesh.name] = mesh;
							}
							if (!mesh.parent)
							{
								_elements.push(mesh);
							}
						}
						break;
					case AssetType.ANIMATOR:
						break;
					case AssetType.MATERIAL:
//					if (e.asset is MaterialBase)
//					{
//						var material : SinglePassMaterialBase = e.asset as SinglePassMaterialBase;
//						if (material)
//						{
//							materials.push(material);
//						}
//						else
//						{
//							throw new Error("un-supported material!!!");
//						}
//					}
						break;
					case AssetType.CONTAINER:
					case AssetType.COMPOSITE_ANIMATOR_GROUP:
					case AssetType.KEY_FRAME_OBJECT_CONTAINER:
					case AssetType.PROPERTY_ANIMATOR_CONTAINER:
					case AssetType.EVENTS_ANIMATOR_CONTAINER:
					case AssetType.CAMERAS_ACTIVE_CONTROL_GROUP:
					case AssetType.RESOURCE_BUNDLE_INSTANCE:
					case AssetType.WEATHER:
						if (!(e.asset as ObjectContainer3D).parent)
						{
							_elements.push(e.asset as ObjectContainer3D);
						}
						break;
					case AssetType.EFFECTS_METHOD:
						_methods.push(EffectMethodBase(e.asset));
						if (e.asset is RimLightMethod)
						{
							//						trace(e.asset.name);
						}
						break;
					case AssetType.LIGHT_PICKER:
						addLightPicker(obj as LightPickerBase);
						break;
					case AssetType.LIGHT:
						addLight(obj as LightBase);
						break;
					case AssetType.SOUND_BOX:
						_soundBox = SoundBox(e.asset);
						break;
					default:
						break;
				}
			}
		}

		private function onResourceComplete(e : Event) : void
		{
			if (dabugDelayComplete == 0)
				completeHandler(e);
			else
				TweenLite.delayedCall(dabugDelayComplete * 0.001, completeHandler, [e]);
		}

		private function onAsyncTexturesComplete(e : Event) : void
		{
			_isAsyncLoaded = true;
			this.dispatchEvent(e);
		}

		private function completeHandler(e : Event) : void
		{
			var len : int = _elements.length;
			for (var index : int = 0; index < len; index++)
			{
				var element : ObjectContainer3D = _elements[index];
				addLayerType(element);
			}
			for (var name : String in _meshByName)
			{
				var mesh : Mesh = _meshByName[name];
				var subMeshes : Vector.<SubMesh> = mesh.subMeshes;
				var material : MaterialBase;
				var subLen : int = subMeshes.length;
				for (var i : int = 0; i < subLen; i++)
				{
					material = subMeshes[i].material;
					_materialLightPickerMap[material.name] = material.lightPicker;
					_materialMap[material.name] = material;
				}
			}
			_isLoaded = true;
			this.dispatchEvent(e);
		}

		private function addLayerType(element : ObjectContainer3D) : void
		{
			if (element is Mesh)
			{
				var layerType : uint = (element as Mesh).layerType;
				_layerTypeByName[element.name] = layerType;
			}
			_visibleByName[element.name] = element.visible;
			var numChildren : int = element.numChildren;
			for (var i : int = 0; i < numChildren; i++)
			{
				var child : ObjectContainer3D = element.getChildAt(i);
				addLayerType(child);
			}
		}

		private function onParseError(e : ParserEvent) : void
		{
			trace("解析错误：" + _url);
			this.dispatchEvent(e);
			unload();
		}

		private function onLoadError(e : LoaderEvent) : void
		{
			trace("加载错误：" + _url);
			this.dispatchEvent(e);
			unload();
		}

		private function removeLoaderEvents() : void
		{
			if (_loader)
			{
				_loader.removeEventListener(LoaderEvent.RESOURCE_COMPLETE, onResourceComplete);
				_loader.removeEventListener(AssetEvent.ASSET_COMPLETE, onAssetComplete);
				_loader.removeEventListener(LoaderEvent.ASYNC_TEXTURES_COMPLETE, onAsyncTexturesComplete);
				_loader.removeEventListener(LoaderEvent.LOAD_ERROR, onLoadError);
				_loader.removeEventListener(ParserEvent.PARSE_ERROR, onParseError);
			}
		}

		public function get elements() : Vector.<ObjectContainer3D>
		{
			return _elements;
		}

		public function get methods() : Vector.<EffectMethodBase>
		{
			return _methods;
		}

		public function get materialLightPickerMap() : Dictionary
		{
			return _materialLightPickerMap;
		}

		public function get materialMap() : Dictionary
		{
			return _materialMap;
		}

		public function get layerTypeByName() : Dictionary
		{
			return _layerTypeByName;
		}

		public function get visibleByName() : Dictionary
		{
			return _visibleByName;
		}

		private function addLightPicker(lightPicker : LightPickerBase) : void
		{
			_lightPickerMap.add(lightPicker.name, lightPicker);
		}

		private function addLight(light : LightBase) : void
		{
			if (!light)
				return;
			if (_lights.indexOf(light) == -1)
			{
				_lights.push(light);
			}
		}

		public function get lightPickerMap() : HashMap
		{
			return _lightPickerMap;
		}

		public function get lights() : Vector.<LightBase>
		{
			return _lights;
		}

		public function get soundBox() : SoundBox
		{
			return _soundBox;
		}

		public function unload() : void
		{
			_isLoaded = false;
			_isAsyncLoaded = false;
			removeLoaderEvents();
			if (_loader)
			{
				_loader.stop();
				_loader.disposeGPUResource();
				_loader = null;
			}
		}

		public function dispose() : void
		{
			if (_elements)
			{
				for each (var element : ObjectContainer3D in _elements)
				{
					element.dispose();
				}
				_elements.length = 0;
				_elements = null;
			}
			if (_methods)
			{
				_methods.length = 0;
				_methods = null;
			}
			if (_objMap)
			{
				_objMap.clear();
				_objMap = null;
			}
			var name : String;
			if (_materialMap)
			{
				for (name in _materialMap)
				{
					_materialMap[name] = null;
					delete _materialMap[name];
				}
				_materialMap = null;
			}
			if (_meshByName)
			{
				for (name in _meshByName)
				{
					_meshByName[name] = null;
					delete _meshByName[name];
				}
				_meshByName = null;
			}
			if (_materialLightPickerMap)
			{
				for (name in _materialLightPickerMap)
				{
					_materialLightPickerMap[name] = null;
					delete _materialLightPickerMap[name];
				}
				_materialLightPickerMap = null;
			}
			if (_layerTypeByName)
			{
				for (name in _layerTypeByName)
				{
					_layerTypeByName[name] = null;
					delete _layerTypeByName[name];
				}
				_layerTypeByName = null;
			}
			if (_visibleByName)
			{
				for (name in _visibleByName)
				{
					_visibleByName[name] = null;
					delete _visibleByName[name];
				}
				_visibleByName = null;
			}
			if (_lightPickerMap)
			{
				var lightPickers : Array = _lightPickerMap.getValues();
				for each (var lightPicker : LightPickerBase in lightPickers)
				{
					lightPicker.dispose();
				}
				_lightPickerMap.clear();
				_lightPickerMap = null;
			}
			if (_lights)
			{
				for each (var light : LightBase in _lights)
				{
					if (light.parent)
					{
						light.parent.removeChild(light);
					}
					light.dispose();
				}
				_lights.length = 0;
				_lights = null;
			}
			_soundBox = null;
			unload();
			if (dabugDelayComplete > 0)
				TweenLite.killDelayedCallsTo(completeHandler);
		}
	}
}
