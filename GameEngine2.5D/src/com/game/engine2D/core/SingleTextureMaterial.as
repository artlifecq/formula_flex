package com.game.engine2D.core
{
	import away3d.materials.TextureMaterial;
	import away3d.textures.Texture2DBase;
	
	/**
	 *  单一贴图材质
	 * @author guoqing.wen
	 * 
	 */
	public class SingleTextureMaterial extends TextureMaterial implements ITextureMaterial
	{
		public function SingleTextureMaterial(texture:Texture2DBase=null)
		{
			super(texture);
		}
		
		public function get textureParsed():Boolean
		{
			return false;
		}
		
		public function get height():int
		{
			if (texture)
				return texture.height;
			return 0;
		}
		
		public function get width():int
		{
			if (texture)
				return texture.width;
			return 0;
		}
		
		public function clone():TextureMaterial
		{
			var singleTexture:SingleTextureMaterial = new SingleTextureMaterial(texture);
			singleTexture.animateUVs = this.animateUVs;
			singleTexture.writeDepth = this.writeDepth;
			singleTexture.bothSides = this.bothSides;
			singleTexture.blendMode = this.blendMode;
			return singleTexture;
		}
	}
}