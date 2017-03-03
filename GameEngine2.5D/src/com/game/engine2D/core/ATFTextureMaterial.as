package com.game.engine2D.core
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.geom.ColorTransform;
	
	import away3d.materials.TextureMaterial;
	
	/**
	 * atf材质 
	 * @author guoqing.wen
	 * 
	 */
	public class ATFTextureMaterial extends TextureMaterial implements ITextureMaterial
	{
		private var _atfByteTexture:ATFByteTexture;
		public function ATFTextureMaterial(texture:ATFByteTexture)
		{
			super(texture);
			_atfByteTexture = texture;
			this.colorTransform = new ColorTransform();
		}
		
		public function get isDefaultTexture():Boolean
		{
			if (_atfByteTexture)
				return _atfByteTexture.isDefaultTexture;
			return true;
		}
		
		public function get textureReady():Boolean
		{
			if (_atfByteTexture)
				return _atfByteTexture.isReady;
			return false;
		}
		
		public function uploadTexture():void
		{
			if (_atfByteTexture)
				_atfByteTexture.getTextureForStage3D(Stage3DLayerManager.stage3DProxy);
		}
		
		public function get isTextureScale():Boolean
		{
			return false;
		}
		
		public function get textureScale():Number
		{
			return 1.0;
		}
		
		public function get height():int
		{
			return _atfByteTexture.height;
		}
		
		public function get width():int
		{
			return _atfByteTexture.width;
		}
		
		override public function dispose():void
		{
			_atfByteTexture = null;
			super.dispose();
		}
		
		public function clone():TextureMaterial
		{
			var texture:ATFTextureMaterial = new ATFTextureMaterial(_atfByteTexture);
			texture.animateUVs = this.animateUVs;
			texture.writeDepth = this.writeDepth;
			texture.bothSides = this.bothSides;
			texture.blendMode = this.blendMode;
			return texture;
		}
	}
}