package com.game.engine2D.utils
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.core.ATFByteTexture;
	import com.game.engine2D.core.ATFTextureMaterial;
	import com.game.engine2D.core.AsyncByteTexture;
	import com.game.engine2D.core.BPGByteTexture;
	import com.game.engine2D.core.BPGTextureMaterial;
	import com.game.engine2D.core.ITextureMaterial;
	import com.game.engine2D.core.SingleTextureMaterial;
	
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display3D.Context3DCompareMode;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import away3d.materials.TextureMaterial;
	import away3d.materials.WriteDepthOption;
	import away3d.textures.AsyncTexture2D;
	import away3d.textures.BGRAData;
	import away3d.utils.Cast;
	
	import starling.textures.IStarlingTexture;
	import starling.textures.TextureFactory;
	import starling.utils.MathUtil;
	
	public class MaterialUtils
	{
		/** bpg资源没有解析出来前显示的透明度  */
		static public var bpgTextureAlpha:Number = 0.1;
		
		public function MaterialUtils()
		{
		}
		
		private static var _defaultImageTexture:IStarlingTexture;
		public static function get defaultImageTexture():IStarlingTexture
		{
			if(!_defaultImageTexture)
			{
				_defaultImageTexture = TextureFactory.fromBitmapData(new BitmapData(4,4,true,0xffff0000), false,false);
			}
			return _defaultImageTexture;
		}
		
		private static var _defaultTexture:TextureMaterial;
		public static function get default1x1Texture():TextureMaterial
		{
			if(!_defaultTexture)
			{
				var bmT:AsyncTexture2D = Cast.asyncTexture(new BitmapData(4,4,true,0x00110000), true, false);
				_defaultTexture = new TextureMaterial(bmT);
				_defaultTexture.name = "default1x1";
				_defaultTexture.blendMode = BlendMode.LAYER;
			}
			return _defaultTexture;
		}
		
		public static function getMaterialCompressAlpha(bd:BitmapData):TextureMaterial
		{
			var bmT:AsyncTexture2D = Cast.asyncTexture(bd, true, false);
			
			var textureMaterial:TextureMaterial = new TextureMaterial(bmT);
			textureMaterial.writeDepth = WriteDepthOption.FALSE;
			textureMaterial.blendMode = BlendMode.LAYER;
			textureMaterial.animateUVs = true;
			textureMaterial.depthCompareMode = Context3DCompareMode.ALWAYS;
			textureMaterial.colorTransform = new ColorTransform();
			return textureMaterial;
		}
		
		public static function getMaterialCompress(bd:BitmapData):TextureMaterial
		{
			var bmT:AsyncTexture2D = Cast.asyncTexture(bd, false, false);
			var textureMaterial:TextureMaterial = new TextureMaterial(bmT)
			textureMaterial.alphaThreshold = 0.5;
			textureMaterial.writeDepth = WriteDepthOption.FALSE;
			return textureMaterial;
		}
		
		public static function getMaterialMapZoneByTexture(texture:AsyncByteTexture):TextureMaterial
		{
			var textureMaterial:TextureMaterial = new TextureMaterial(texture);
			textureMaterial.alphaThreshold = 0.5;
			textureMaterial.writeDepth = WriteDepthOption.FALSE;
			textureMaterial.blendMode = BlendMode.NORMAL;
			return textureMaterial;
		}
		
		public static function getAtfMaterialByData(data:ByteArray, path:String, autoRecycleEnable:Boolean, isAsync:Boolean):ITextureMaterial
		{
			var atfTexture:ATFByteTexture = new ATFByteTexture(data,path,autoRecycleEnable,isAsync);
			var texture:ATFTextureMaterial = new ATFTextureMaterial(atfTexture);
			texture.animateUVs = true;
			texture.writeDepth = GlobalConfig2D.avatarHighlightEnabled?WriteDepthOption.TRUE:WriteDepthOption.FALSE;
			texture.depthCompareMode = Context3DCompareMode.ALWAYS;
			texture.bothSides = true;
			texture.blendMode = BlendMode.LAYER;
			texture.alphaThreshold = 0.05;
			texture.name = "atf";
			return texture;
		}
		
		public static function getBpgMaterialByData(data:ByteArray, path:String, enableScaleTexture:Boolean,autoRecycleEnable:Boolean):ITextureMaterial
		{
			var bpgTexture:BPGByteTexture = new BPGByteTexture(data, path, enableScaleTexture,autoRecycleEnable);
			var texture:BPGTextureMaterial = new BPGTextureMaterial(bpgTexture);
			texture.animateUVs = true;
			texture.writeDepth = WriteDepthOption.FALSE;
			texture.depthCompareMode = Context3DCompareMode.ALWAYS;
			texture.bothSides = true;
			texture.blendMode = BlendMode.LAYER;
			texture.alphaThreshold = 0.05;
			texture.name = "bpg";
			return texture;
		}
		
		public static function getSingleMaterialByBitmapData(bitmapData:BitmapData):ITextureMaterial
		{
			var nextW:int = MathUtil.getNextPowerOfTwo(bitmapData.width);
			var nextH:int = MathUtil.getNextPowerOfTwo(bitmapData.height);
			
			if (nextW != bitmapData.width || nextH != bitmapData.width){
				var newBd:BitmapData = new BitmapData(nextW, nextH,true);
				newBd.copyPixels(bitmapData, bitmapData.rect, new Point());
				bitmapData.dispose();
				bitmapData = newBd;
			}
			var asyncTexture:AsyncByteTexture = new AsyncByteTexture(true,false);
			var bgraBytes:ByteArray = new ByteArray();
			bgraBytes.endian = Endian.LITTLE_ENDIAN;
			bitmapData.copyPixelsToByteArray(bitmapData.rect,bgraBytes);
			var bgraData:BGRAData = new BGRAData(bgraBytes,bitmapData.width,bitmapData.height,true);
			asyncTexture.setBgraData(bgraData);
			bitmapData.dispose();
			var textureSingle:SingleTextureMaterial = new SingleTextureMaterial(asyncTexture);
			textureSingle.animateUVs = true;
			textureSingle.writeDepth = WriteDepthOption.FALSE;
			asyncTexture.smooth = false;
			textureSingle.bothSides = true;
			textureSingle.blendMode = BlendMode.LAYER;
			
			return textureSingle;
		}
	}
}