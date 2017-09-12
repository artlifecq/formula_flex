package com.game.engine2D.scene
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.config.MapConfig;
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine2D.core.AsyncMapTexture;
	import com.game.engine2D.vo.PoolMesh;
	
	import flash.display.BlendMode;
	import flash.geom.Matrix;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.materials.TextureMaterial;
	import away3d.materials.WriteDepthOption;
	
	/**
	 * 缩略地图
	 */
	public class SceneSmallLayer extends ObjectContainer3D
	{
		private var _smallMap:PoolMesh;
		private var _smallScaleX:Number;
		private var _smallScaleY:Number;
		private var _smallMapTransform:Matrix;
		private var _smallMapTextureMaterial:TextureMaterial;
		private var _smallMapTexture:AsyncMapTexture;
		private var _sceneCurrent:Scene;
		private var _smallVisible:Boolean;
		
		public function SceneSmallLayer($scene:Scene)
		{
			super();
			_sceneCurrent = $scene;
			_smallVisible = true;
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
				_smallMap = PoolMesh.create();
				_smallMap.z = 500;
				addChild(_smallMap);
			}
			
			var mapConfig:MapConfig = _sceneCurrent.mapConfig;
			_smallMap.smooth = true;
			_smallMapTexture = value;
			_smallMapTexture.smooth = true;
			_smallMapTextureMaterial.texture = _smallMapTexture;
			_smallScaleX = mapConfig.width/mapConfig.smallWidth;
			_smallScaleY = mapConfig.height/mapConfig.smallHeight;
			_smallMap.material = _smallMapTextureMaterial;
			drawSmallMapScale();
			drawSmallMapTranslate();
		}
		
		public function drawSmallMapScale():void
		{
			var mapConfig:MapConfig = _sceneCurrent.mapConfig;
			if (!mapConfig)return;
			
			var sceneConfig:SceneConfig = _sceneCurrent.sceneConfig;
			var smallTexture:AsyncMapTexture = mapConfig.smallMapTexture;
			if (smallTexture && smallTexture.loadComplete)
			{
				_smallMap.width = sceneConfig.width;
				_smallMap.height = sceneConfig.height;
				_smallMap.run();
				
				_smallMapTransform = _smallMap.overrideMaterialProps.prependedUVTransform;
				_smallMapTransform.identity();
				
				_smallMapTransform.scale(
					sceneConfig.width/(_smallScaleX*smallTexture.width),
					sceneConfig.height/(_smallScaleY*smallTexture.height)
				);
			}
		}
		
		public function drawSmallMapTranslate():void
		{
			var mapConfig:MapConfig = _sceneCurrent.mapConfig;
			var smallTexture:AsyncMapTexture = mapConfig.smallMapTexture;
			if (_smallMapTransform && smallTexture && smallTexture.loadComplete){
				_smallMap.x = -_sceneCurrent.x;
				_smallMap.y = -_sceneCurrent.y;
				_smallMap.setPosition();
				_smallMapTransform.tx = (_smallMap.x / _smallScaleX)/Number(smallTexture.width);
				_smallMapTransform.ty = (_smallMap.y / _smallScaleY)/Number(smallTexture.height);
			}
		}
		
		public function updateSmallVisible(loadComplete:Boolean):void
		{
			this.visible = _smallVisible && !loadComplete;
		}
		
		public function set smallVisible(value:Boolean):void
		{
			_smallVisible = value;
			updateSmallVisible(_sceneCurrent.sceneZoneMapLayer.loadComplete);
		}
		
		public function get smallVisible():Boolean
		{
			return _smallVisible;
		}
	}
}