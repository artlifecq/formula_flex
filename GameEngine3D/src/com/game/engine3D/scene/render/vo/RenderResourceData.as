package com.game.engine3D.scene.render.vo
{
	import com.game.engine3D.enum.NameEnum;
	import com.game.engine3D.scene.render.RenderUnitLoader;
	import com.game.engine3D.scene.render.SceneRenderCache;
	import com.game.engine3D.utils.CallBackUtil;
	import com.game.engine3D.vo.CallBackData;
	import com.game.engine3D.vo.share.CountShareData;
	
	import flash.utils.Dictionary;
	
	import away3d.audio.SoundBox;
	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.CompositeMesh;
	import away3d.entities.Mesh;
	import away3d.lights.LightBase;
	import away3d.materials.lightpickers.LightPickerBase;
	import away3d.materials.methods.EffectMethodBase;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 渲染资源数据
	 * 主要是用来加载模型及模型动画的数据
	 * @author neil
	 * 创建时间
	 *
	 */
	public class RenderResourceData extends CountShareData
	{
		private var _drawElements : Vector.<ObjectContainer3D>;
		private var _animatorElements : Vector.<CompositeMesh>;
		private var _baseVirtualElements : Vector.<ObjectContainer3D> = new Vector.<ObjectContainer3D>();;
		
		private var _soundBox : SoundBox;
		private var _camera : Camera3D;
		
		private var _materialMap : Dictionary;
		private var _materialLightPickerMap : Dictionary;
		
		private var _meshSourcePath : String;
		private var _animatorSourcePath : String;
		
		private var _renderMeshLoader : RenderUnitLoader;
		private var _renderAnimatorLoader : RenderUnitLoader;
		
		private var _isOnlyInstance : Boolean;
		private var _lightPickerMap : HashMap;
		private var _lights : Vector.<LightBase>;
		private var _methods : Vector.<EffectMethodBase>;
		
		private var _resCompleteCallBackList : Vector.<CallBackData>;
		private var _asyncResCompleteCallBackList : Vector.<CallBackData>;
		private var _asyncResProgressCallBackList : Vector.<CallBackData>;
		private var _resErrorCallBackList : Vector.<CallBackData>;
		
		private var _isSkinMesh : Boolean;
			
		public function get isSkinMesh() : Boolean
		{
			
			return _isSkinMesh;
		}
			
		public function set isSkinMesh(value : Boolean) : void
		{
			_isSkinMesh = value;
		}


		/**是否唯一的实例，不需要复制*/
		public function set isOnlyInstance(value : Boolean) : void
		{
			_isOnlyInstance = value;
		}

		public function RenderResourceData()
		{
			super();
			_resCompleteCallBackList = new Vector.<CallBackData>();
			_resErrorCallBackList = new Vector.<CallBackData>();
		}

		/**
		 * 加载资源
		 * @param fullSourchPath
		 * @param apd
		 * @param completeHandler
		 *
		 */
		final public function loadSource(meshSourcePath : String, animatorSourcePath : String = null, priority : int = 100) : void
		{
			_meshSourcePath = meshSourcePath;
			_animatorSourcePath = animatorSourcePath;
			if (_meshSourcePath && !_renderMeshLoader)
			{
				_renderMeshLoader = SceneRenderCache.installRenderRes(_meshSourcePath, this);
				if (_renderMeshLoader.isLoaded)
				{
					onMeshComplete(_renderMeshLoader);
				}
				else
				{
					_renderMeshLoader.setResCompleteCallBack(onMeshComplete);
					_renderMeshLoader.setResErrorCallBack(onMeshError);
					if (!_renderMeshLoader.isLoading)
					{
						_renderMeshLoader.loadSource(_meshSourcePath, priority);
					}
				}

				if (_renderMeshLoader)
				{
					if (_renderMeshLoader.isAsyncLoaded)
					{
						onMeshAsyncComplete(_renderMeshLoader);
					}
					else
					{
						_renderMeshLoader.setSyncResCompleteCallBack(onMeshAsyncComplete);
						_renderMeshLoader.setSyncResProgressCallBack(onMeshAsyncProgress);
					}
				}
			}
			if (_animatorSourcePath && !_renderAnimatorLoader)
			{
				_renderAnimatorLoader = SceneRenderCache.installRenderRes(_animatorSourcePath, this);
				if (_renderAnimatorLoader.isLoaded)
				{
					onAnimatorComplete(_renderAnimatorLoader);
				}
				else
				{
					_renderAnimatorLoader.setResCompleteCallBack(onAnimatorComplete);
					_renderAnimatorLoader.setResErrorCallBack(onAnimatorError);
					if (!_renderAnimatorLoader.isLoading)
					{
						_renderAnimatorLoader.loadSource(_animatorSourcePath, priority);
					}
				}
			}
		}
		
		private function meshSortFunc(a:ObjectContainer3D,b:ObjectContainer3D):int
		{
			if(a is Mesh)
			{
				return -1;
			}
			if(b is Mesh)
			{
				return 1;
			}
			return 0;
		}

		private function onMeshComplete(loader : RenderUnitLoader) : void
		{
			if (!_renderMeshLoader)
				return;
			
			var elements : Vector.<ObjectContainer3D> = _renderMeshLoader.elements;
			if(elements)
			{
				_drawElements = new Vector.<ObjectContainer3D>();
				for each (var element : ObjectContainer3D in elements)
				{
					if (element is Mesh)
					{
						_drawElements.unshift(Mesh(element));
					}
					else
					{
						_drawElements.push(element);
						addVirtualElements(element);
					}
				}
			}
			
//			_drawElements.sort(meshSortFunc);
			_lightPickerMap = _renderMeshLoader.lightPickerMap;
			_lights = _renderMeshLoader.lights;
			_methods = _renderMeshLoader.methods;
			_soundBox = _renderMeshLoader.soundBox;
			_camera = _renderMeshLoader.camera;
			_materialMap = _renderMeshLoader.materialMap;
			_materialLightPickerMap = _renderMeshLoader.materialLightPickerMap;
			tryResourceComplete();
		}

		private function onMeshError(loader : RenderUnitLoader) : void
		{
			CallBackUtil.exceteCallBackData(this, _resErrorCallBackList);
			if (_resErrorCallBackList)
				_resErrorCallBackList.length = 0;
		}

		private function onAnimatorComplete(loader : RenderUnitLoader) : void
		{
			if (!_renderAnimatorLoader)
				return;
			var elements : Vector.<ObjectContainer3D> = _renderAnimatorLoader.elements;
			if (elements)
			{
				_animatorElements = new Vector.<CompositeMesh>();
				
				for each (var element : ObjectContainer3D in elements)
				{
					if (element is CompositeMesh)
					{
						_animatorElements.push(CompositeMesh(element));
					} 
					else
					{
						addVirtualElements(element);
					}
				}
			}
			
			tryResourceComplete();
			tryResourceAsyncComplete();
		}
		
		private function addVirtualElements(element:ObjectContainer3D):void
		{
			if(element.name.indexOf(NameEnum.TYPE_CHEST) != -1 
				|| element.name.indexOf(NameEnum.TYPE_ZERO) != -1 
				|| element.name.indexOf(NameEnum.TYPE_ZT) != -1)
			{
				_baseVirtualElements.push(ObjectContainer3D(element));
			}
		}

		private function onAnimatorError(loader : RenderUnitLoader) : void
		{
			CallBackUtil.exceteCallBackData(this, _resErrorCallBackList);
			if (_resErrorCallBackList)
				_resErrorCallBackList.length = 0;
		}

		private function tryResourceComplete() : void
		{
			if (_animatorSourcePath)
			{
				if (_renderAnimatorLoader && _renderAnimatorLoader.isLoaded && _renderMeshLoader && _renderMeshLoader.isLoaded)
				{
					CallBackUtil.exceteCallBackData(this, _resCompleteCallBackList);
					_resCompleteCallBackList.length = 0;
				}
			}
			else
			{
				if (_renderMeshLoader && _renderMeshLoader.isLoaded)
				{
					CallBackUtil.exceteCallBackData(this, _resCompleteCallBackList);
					_resCompleteCallBackList.length = 0;
				}
			}
		}
		
		private function onMeshAsyncProgress(progress:Number,loader : RenderUnitLoader) : void
		{
			if (_asyncResProgressCallBackList == null)return;
			if (_animatorSourcePath)
			{
				if (_renderAnimatorLoader && _renderAnimatorLoader.isLoaded && _renderMeshLoader && _renderMeshLoader.isAsyncLoaded)
				{
					CallBackUtil.exceteCallBackData(this, _asyncResProgressCallBackList,progress);
				}
			}
			else
			{
				if (_renderMeshLoader && _renderMeshLoader.isAsyncLoaded)
				{
					CallBackUtil.exceteCallBackData(this, _asyncResProgressCallBackList,progress);
				}
			}
		}

		private function onMeshAsyncComplete(loader : RenderUnitLoader) : void
		{
			if (!_renderMeshLoader)
			{
				return;
			}
			tryResourceAsyncComplete();
		}

		private function tryResourceAsyncComplete() : void
		{
			if (_asyncResCompleteCallBackList == null)return;
			if (_animatorSourcePath)
			{
				if (_renderAnimatorLoader && _renderAnimatorLoader.isLoaded && _renderMeshLoader && _renderMeshLoader.isAsyncLoaded)
				{
					CallBackUtil.exceteCallBackData(this, _asyncResCompleteCallBackList);
					_asyncResCompleteCallBackList.length = 0;
				}
			}
			else
			{
				if (_renderMeshLoader && _renderMeshLoader.isAsyncLoaded)
				{
					CallBackUtil.exceteCallBackData(this, _asyncResCompleteCallBackList);
					_asyncResCompleteCallBackList.length = 0;
				}
			}
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
			_asyncResCompleteCallBackList ||= new Vector.<CallBackData>();
			CallBackUtil.addCallBackData(_asyncResCompleteCallBackList, value, args);
		}
		
		public function removeSyncResCompleteCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_asyncResCompleteCallBackList, value);
		}
		
		public function setSyncResProgressCallBack(value : Function, args : Array = null) : void
		{
			_asyncResProgressCallBackList ||= new Vector.<CallBackData>();
			CallBackUtil.addCallBackData(_asyncResProgressCallBackList, value, args);
		}
		
		public function removeSyncResProgressCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_asyncResProgressCallBackList, value);
		}

		public function setResErrorCallBack(value : Function, args : Array = null) : void
		{
			CallBackUtil.addCallBackData(_resErrorCallBackList, value, args);
		}

		public function removeResErrorCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_resErrorCallBackList, value);
		}

		public function get isLoaded() : Boolean
		{
			if (_animatorSourcePath)
				return _renderAnimatorLoader && _renderAnimatorLoader.isLoaded && _renderMeshLoader && _renderMeshLoader.isLoaded;
			else
				return _renderMeshLoader && _renderMeshLoader.isLoaded;
		}

		public function get isLoading() : Boolean
		{
			if (_animatorSourcePath)
				return (_renderAnimatorLoader && _renderAnimatorLoader.isLoading) || (_renderMeshLoader && _renderMeshLoader.isLoading);
			else
				return _renderMeshLoader && _renderMeshLoader.isLoading;
		}

		public function get isAsyncLoaded() : Boolean
		{
			if (_animatorSourcePath)
				return _renderAnimatorLoader && _renderAnimatorLoader.isLoaded && _renderMeshLoader && _renderMeshLoader.isAsyncLoaded;
			else
				return _renderMeshLoader && _renderMeshLoader.isAsyncLoaded;
		}

		public function get isUnloaded() : Boolean
		{
			if (_animatorSourcePath)
				return (_renderAnimatorLoader && _renderAnimatorLoader.isUnloaded) || (_renderMeshLoader && _renderMeshLoader.isUnloaded);
			else
				return _renderMeshLoader && _renderMeshLoader.isUnloaded;
		}

		public function getMethods() : Vector.<EffectMethodBase>
		{
			return _methods;
		}

		public function get soundBox() : SoundBox
		{
			return _soundBox;
		}
		
		public function get camera() : Camera3D
		{
			return _camera;
		}

		public function cloneDrawElements() : Vector.<ObjectContainer3D>
		{
			if (!_drawElements)
			{
				return null;
			}
			if (_isOnlyInstance)
			{
				return _drawElements;
			}
			var elements : Vector.<ObjectContainer3D> = new Vector.<ObjectContainer3D>();
			for each (var element : ObjectContainer3D in _drawElements)
			{
				elements.push(element.clone());
			}
			return elements;
		}

		public function cloneAnimatorElements() : Vector.<CompositeMesh>
		{
			if (!_animatorElements)
			{
				return null;
			}
			if (_isOnlyInstance)
			{
				return _animatorElements;
			}
			var elements : Vector.<CompositeMesh> = new Vector.<CompositeMesh>();
			for each (var element : CompositeMesh in _animatorElements)
			{
				elements.push(CompositeMesh(element.clone()));
			}
			return elements;
		}
		
		public function cloneBaseVirtualElements() : Vector.<ObjectContainer3D> 
		{
			if (!_baseVirtualElements)
			{
				return null;
			}
			if (_isOnlyInstance) 
			{
				return _baseVirtualElements;
			}
			var elements : Vector.<ObjectContainer3D> = new Vector.<ObjectContainer3D>();
			for each(var element : ObjectContainer3D in _baseVirtualElements) 
			{
				elements.push(ObjectContainer3D(element.clone()));
			}
			return elements;
		}

		public function get materialMap() : Dictionary
		{
			return _materialMap;
		}

		public function get materialLightPickerMap() : Dictionary
		{
			return _materialLightPickerMap;
		}

		public function get meshSourcePath() : String
		{
			return _meshSourcePath;
		}

		public function get animatorSourcePath() : String
		{
			return _animatorSourcePath;
		}

		public function get renderMeshLoader() : RenderUnitLoader
		{
			return _renderMeshLoader;
		}

		public function get renderAnimatorLoader() : RenderUnitLoader
		{
			return _renderAnimatorLoader;
		}
		
		public function animatorUseForSkin():void
		{
			if(_renderAnimatorLoader)
				_renderAnimatorLoader.isUseForSkin = true;
		}
		
		public function isAnimatorUseForSkin():Boolean
		{
			if(_renderAnimatorLoader)
				return _renderAnimatorLoader.isUseForSkin;
			return false;
		}
		
		public function meshUseForSkeleton(name:String):void
		{
			if(_renderMeshLoader)
				_renderMeshLoader.useForSkeletonName = name;
		}
		
		public function meshUseForSkeletonName():String
		{
			if(_renderMeshLoader)
				return _renderMeshLoader.useForSkeletonName;
			return null;
		}

		/**
		 * 预览灯光
		 * @return 预览灯光
		 */
		public function getLightPickerByName(name : String) : LightPickerBase
		{
			if (!_lightPickerMap)
				return null;
			if (!name)
				return null;
			return _lightPickerMap.getValue(name) as LightPickerBase;
		}

		public function getLightPicker(index : int) : LightPickerBase
		{
			if (!_lightPickerMap)
				return null;
			var pickers : Array = _lightPickerMap.getValues();
			if (pickers.length > 0 && index > -1 && index < pickers.length)
				return pickers[index] as LightPickerBase;
			return null;
		}

		public function unload() : void
		{
			_resCompleteCallBackList.length = 0;
			if (_asyncResCompleteCallBackList)
				_asyncResCompleteCallBackList.length = 0;
			if (_asyncResProgressCallBackList)
				_asyncResProgressCallBackList.length = 0;
			_resErrorCallBackList.length = 0;
			if (_renderMeshLoader)
			{
				_renderMeshLoader.removeResCompleteCallBack(onMeshComplete);
				_renderMeshLoader.removeSyncResCompleteCallBack(onMeshAsyncComplete);
				_renderMeshLoader.removeResErrorCallBack(onMeshError);
			}
			if (_renderAnimatorLoader)
			{
				_renderAnimatorLoader.removeResCompleteCallBack(onAnimatorComplete);
				_renderAnimatorLoader.removeResErrorCallBack(onAnimatorError);
			}
		}
		
		/**释放*/
		override public function destroy() : void
		{
			SceneRenderCache.disposeRenderUnitDatas(this);
			unload();
			_resCompleteCallBackList = null;
			_asyncResCompleteCallBackList = null;
			_asyncResProgressCallBackList = null;
			_resErrorCallBackList = null;
			_renderMeshLoader = null;
			_renderAnimatorLoader = null;
			_drawElements = null;
			_animatorElements = null;
			_lightPickerMap = null;
			_lights = null;
			_methods = null;
			_soundBox = null;
			_camera = null;
			_materialMap = null;
			_materialLightPickerMap = null;
			_meshSourcePath = null;
			_animatorSourcePath = null;
			_isSkinMesh = false;
			super.destroy();
		}
	}
}
