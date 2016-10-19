package com.game.engine2D.scene.map.vo
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine2D.core.AsyncByteTexture;
	import com.game.engine2D.interfaces.IZoneMesh;
	import com.game.engine2D.scene.map.MapCache;
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.EntityLayerType;
	import away3d.entities.Mesh;
	import away3d.events.Event;
	import away3d.materials.TextureMaterial;
	
	/**
	 * 场景区域图块
	 * @author Carver
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-5-11 下午16:19:35
	 */
	public class MapZone
	{
		public static function getKey(tileX : uint, tileY : uint) : String
		{
			return tileX + "_" + tileY;
		}
		
		private var _mesh : IZoneMesh;
		private var _isClear : Boolean = false;
		private var _isLoaded : Boolean = false;
		private var _isLoading : Boolean = false;
		private var _completeHandler : Function;

		public function MapZone()
		{
		}
		
		public function get hasDraw():Boolean
		{
			return !_isClear && _mesh && _mesh.material == _bmpMaterial;
		}

		final public function setContainer(container : ObjectContainer3D, x : int, y : int) : void
		{
			if (!_mesh)
			{
				_mesh = GlobalConfig2D.MapZoneClass.create(null);
				_mesh.width = SceneConfig.ZONE_WIDTH;
				_mesh.height = SceneConfig.ZONE_HEIGHT;
			}
			if (_mesh.parent != container)
				container.addChild(_mesh as Mesh);
			_mesh.x = x;
			_mesh.y = y;
			_mesh.z = -200;
			_mesh.run();
			_mesh.depth = -300;
			_mesh.layerType = EntityLayerType.DEFAULT | EntityLayerType.POST_GLASS;
		}

		final public function drawMask(textureMaterial : TextureMaterial, smallScaleX : Number, smallScaleY : Number) : void
		{
			/*if (_mesh)
			{
				_mesh.material = textureMaterial;
				_mesh.width = SceneConfig.ZONE_WIDTH;
				_mesh.height = SceneConfig.ZONE_HEIGHT;
				_mesh.run();
				var transformationMatrix:Matrix = _mesh.overrideMaterialProps.prependedUVTransform;
				transformationMatrix.identity();
				transformationMatrix.scale(SceneConfig.ZONE_WIDTH/(smallScaleX*textureMaterial.texture.width), 
					SceneConfig.ZONE_HEIGHT/(smallScaleX*textureMaterial.texture.height));
				transformationMatrix.translate(Math.round(piexl_x / smallScaleX)/textureMaterial.texture.width,
					Math.round(piexl_y / smallScaleY)/textureMaterial.texture.height);
			}*/
		}
		
		final public function load(filePath : String, priority : int, userData : Object, completeHandler : Function) : Boolean
		{
			if (_isLoaded || _isLoading)
			{
				throw new Error("加载中不能再次加载，本次加载请调用clear清除！");
				return null;
			}
			_isClear = false;
			_isLoading = true;
			_isLoaded = false;
			_completeHandler = completeHandler;
			
			var texture:AsyncByteTexture = new AsyncByteTexture(false);
			texture.url = filePath;
			texture.userData = userData;
			texture.addEventListener(Event.COMPLETE, onLoaderComplete);
			texture.load(filePath);
			return true;
		}
		
		protected function onLoaderComplete(event:Event):void
		{
			var texture:AsyncByteTexture = event.currentTarget as AsyncByteTexture;
			texture.removeEventListener(Event.COMPLETE, onLoaderComplete);
			var mapZone : MapZone = texture.userData.mapZone;
			var key : * = getKey(mapZone.tile_x, mapZone.tile_y);
			_isLoading = false;
			_isLoaded = true;
			MapCache.getInstance().addZoneBmpData(key, texture);
			MapCache.getInstance().removeWaitingLoad(key);
			
			if (_completeHandler != null)
				_completeHandler(this);
			else
				trace("我日，真是日了狗了！！！_completeHandler=null！！！");
				
		}
		
		private var _bmpMaterial:TextureMaterial;
		static private var _count:int = 0;
		final public function draw($material : TextureMaterial) : void
		{
			if(_mesh && $material)
			{
				if ($material.texture)
					$material.texture.getTextureForStage3D(Stage3DLayerManager.stage3DProxy, 0);
				_bmpMaterial = $material;
				_mesh.material = _bmpMaterial;
				_mesh.width = SceneConfig.ZONE_WIDTH;
				_mesh.height = SceneConfig.ZONE_HEIGHT;
				_mesh.run();
			}
			else
			{
				trace(_tile_x + "_" + _tile_y + " : _mesh=null;");
			}
		}

		/**
		 * 清除
		 */
		final public function clear() : void
		{
			if (!_isLoading){
				_isLoading = false;
				_isLoaded = false;
				_completeHandler = null;
				if (_mesh)
				{
					GlobalConfig2D.MapZoneClass.recycle(_mesh);
					hideTxt();
					_mesh = null;
					_bmpMaterial = null;
				}
				_isClear = true;
			}
		}

		public function get isLoaded() : Boolean
		{
			return _isLoaded;
		}

		public function get isLoading() : Boolean
		{
			return _isLoading;
		}

		//坐标相关================================================================================================
		/**
		 * @private
		 * 像素坐标x
		 */
		private var _piexl_x : Number = 0;

		/*** 像素坐标x*/
		final public function get piexl_x() : Number
		{
			return _piexl_x
		}

		/*** 像素坐标x*/
		final public function set piexl_x($value : Number) : void
		{
			_piexl_x = $value;
			_tile_x = _piexl_x / SceneConfig.ZONE_WIDTH;
		}

		/**
		 * @private
		 * 像素坐标y
		 */
		private var _piexl_y : Number = 0;

		/*** 像素坐标y*/
		final public function get piexl_y() : Number
		{
			return _piexl_y
		}

		/*** 像素坐标y*/
		final public function set piexl_y($value : Number) : void
		{
			_piexl_y = $value;
			_tile_y = _piexl_y / SceneConfig.ZONE_HEIGHT;
		}

		/**
		 * @private
		 * 逻辑坐标x
		 */
		private var _tile_x : int = 0;

		/*** 逻辑坐标x*/
		final public function get tile_x() : int
		{
			return _tile_x
		}

		/*** 逻辑坐标x*/
		final public function set tile_x($value : int) : void
		{
			_tile_x = $value;
			_piexl_x = _tile_x * SceneConfig.ZONE_WIDTH;
		}

		/**
		 * @private
		 * 逻辑坐标y
		 */
		private var _tile_y : int = 0;

		/*** 逻辑坐标y*/
		final public function get tile_y() : int
		{
			return _tile_y
		}

		/*** 逻辑坐标y*/
		final public function set tile_y($value : int) : void
		{
			_tile_y = $value;
			_piexl_y = _tile_y * SceneConfig.ZONE_HEIGHT;
		}

		private var txt : TextField

		final public function addTxt(txtStr : String) : void
		{
			return;
			if (_mesh && _mesh.parent)
			{
				if (!txt)
				{
					txt = new TextField();
				}
				txt.defaultTextFormat = new TextFormat(null, 14, 0xffff00);
				txt.width = SceneConfig.ZONE_WIDTH;
				txt.text = txtStr;
				if (txt.parent == null)
				{
					Scene.scene.sceneStageLayer.addChild(txt);
				}
				txt.x = _mesh.x;
				txt.y = _mesh.y;
			}
		}

		final public function hideTxt() : void
		{
			if(txt && txt.parent)
			{
				txt.parent.addChild(txt);
			}
		}
	}
}
