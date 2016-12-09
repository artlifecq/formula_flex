package com.game.engine2D.scene
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.config.MapConfig;
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine2D.core.AsyncMapTexture;
	import com.game.engine2D.interfaces.IZoneMesh;
	
	import flash.display.BlendMode;
	import flash.geom.Matrix;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Mesh;
	import away3d.materials.TextureMaterial;
	import away3d.materials.WriteDepthOption;
	
	/**
	 * 缩略地图
	 */
	public class SceneSmallLayer extends ObjectContainer3D
	{
		private var _smallMap:IZoneMesh;
		private var _smallScaleX:Number;
		private var _smallScaleY:Number;
		private var _smallMapTransform:Matrix;
		private var _smallMapTextureMaterial:TextureMaterial;
		private var _smallMaterial:TextureMaterial;
		private var _smallMapTexture:AsyncMapTexture;
		private var _sceneCurrent:Scene;
		
		public function SceneSmallLayer($scene:Scene)
		{
			super();
			_sceneCurrent = $scene;
			
			_smallMapTextureMaterial = new TextureMaterial(null);
			_smallMapTextureMaterial.alphaThreshold = 0.5;
			_smallMapTextureMaterial.animateUVs = true;
			_smallMapTextureMaterial.writeDepth = WriteDepthOption.FALSE;
			_smallMapTextureMaterial.blendMode = BlendMode.NORMAL;
		}

		public function get smallMapTexture():AsyncMapTexture
		{
			return _smallMapTexture;
		}

		public function set smallMapTexture(value:AsyncMapTexture):void
		{
			if (_smallMap == null)
			{
				_smallMap = GlobalConfig2D.MapZoneClass["create"](null);
				_smallMap.depth = -400;//最下面
				_smallMap.z = -500;
				addChild(_smallMap as Mesh);
			}
			
			var mapConfig:MapConfig = _sceneCurrent.mapConfig;
			
			_smallMapTexture = value;
			_smallMapTexture.smooth = true;
			_smallMapTextureMaterial.texture = _smallMapTexture;
			_smallScaleX = mapConfig.width/mapConfig.smallWidth;
			_smallScaleY = mapConfig.height/mapConfig.smallHeight;
			_smallMap.material = _smallMapTextureMaterial;
			drawSmallMapScale();
			drawSmallMapTranslate();
		}

		public function get smallMaterial():TextureMaterial
		{
			return _smallMaterial;
		}

		public function set smallMaterial(value:TextureMaterial):void
		{
			_smallMaterial = value;
		}
		
		public function drawSmallMapScale():void
		{
			var mapConfig:MapConfig = _sceneCurrent.mapConfig;
			var sceneConfig:SceneConfig = _sceneCurrent.sceneConfig;
			if (mapConfig && mapConfig.smallMapTexture && mapConfig.smallMapTexture.loadComplete)
			{
				_smallMap.width = sceneConfig.width;
				_smallMap.height = sceneConfig.height;
				_smallMap.run();
				
				_smallMapTransform = _smallMap.overrideMaterialProps.prependedUVTransform;
				_smallMapTransform.identity();
				
				_smallMapTransform.scale(
					sceneConfig.width/(_smallScaleX*mapConfig.smallMapTexture.width),
					sceneConfig.height/(_smallScaleY*mapConfig.smallMapTexture.height)
				);
			}
		}
		
		public function drawSmallMapTranslate():void
		{
			var mapConfig:MapConfig = _sceneCurrent.mapConfig;
			if (_smallMapTransform && mapConfig.smallMapTexture && mapConfig.smallMapTexture.loadComplete){
				_smallMap.x = -_sceneCurrent.x;
				_smallMap.y = -_sceneCurrent.y;
				_smallMap.setPosition();
				
				_smallMapTransform.tx = (_smallMap.x / _smallScaleX)/Number(mapConfig.smallMapTexture.width);
				_smallMapTransform.ty = (_smallMap.y / _smallScaleY)/Number(mapConfig.smallMapTexture.height);
			}
		}

	}
}