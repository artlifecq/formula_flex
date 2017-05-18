package starling.textures
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display3D.Context3D;
	import flash.display3D.Context3DTextureFormat;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import away3d.enum.LoadPriorityType;
	
	import starling.core.Starling;
	import starling.errors.MissingContextError;

	public class TextureFactory
	{
		private static var sDefaultOptions:TextureOptions = new TextureOptions();
	
		public static function fromUrl(url:String, mipMapping:Boolean = false,optimizeForRenderToTexture:Boolean=false,format:String="bgra", priority:int = LoadPriorityType.LEVEL_2D_UI_DEFAULT):IStarlingTexture
		{
			var texture:ConcreteTexture = TextureFactory.empty(4,4,mipMapping,optimizeForRenderToTexture,format) as ConcreteTexture;
			texture.load(url, priority);
			return texture;
		}
		
		/** Creates a texture object from an embedded asset class. Textures created with this
		 *  method will be restored directly from the asset class in case of a context loss,
		 *  which guarantees a very economic memory usage.
		 *
		 *  @param assetClass  must contain either a Bitmap or a ByteArray with ATF data.
		 *  @param mipMapping  for Bitmaps, indicates if mipMaps will be created;
		 *                     for ATF data, indicates if the contained mipMaps will be used.
		 *  @param optimizeForRenderToTexture  indicates if this texture will be used as
		 *                     render target.
		 *  @param scale       the scale factor of the created texture.
		 *  @param format      the context3D texture format to use. Ignored for ATF data.
		 *  @param forcePotTexture  indicates if the underlying Stage3D texture should be created
		 *                     as the power-of-two based "IStarlingTexture" class instead of the more memory
		 *                     efficient "RectangleTexture". (Only applicable to bitmaps; ATF
		 *                     textures are always POT-textures, anyway.)
		 */
/*		public static function fromEmbeddedAsset(assetClass:Class, mipMapping:Boolean=false,
												 optimizeForRenderToTexture:Boolean=false,
												 format:String="bgra"):IStarlingTexture
		{
			var texture:IStarlingTexture;
			var asset:Object = new assetClass();
			
			if (asset is Bitmap)
			{
				texture = TextureFactory.empty(Bitmap(asset).width, Bitmap(asset).height,mipMapping,optimizeForRenderToTexture, format);
				ConcreteTexture(texture).loadBitmapClass(assetClass);
			}
			else if (asset is ByteArray)
			{
				texture = TextureFactory.fromAtfBytes(asset as ByteArray, mipMapping);
			}
			else
			{
				throw new ArgumentError("Invalid asset type: " + getQualifiedClassName(asset));
			}
			
			asset = null; // avoid that object stays in memory (through 'onRestore' functions)
			return texture;
		}*/
		
		/** Creates a texture object from a bitmap.
		 *  Beware: you must not dispose the bitmap's data if Starling should handle a lost device
		 *  context alternatively, you can handle restoration yourself via "texture.root.onRestore".
		 *
		 *  @param bitmap   the texture will be created with the bitmap data of this object.
		 *  @param generateMipMaps  indicates if mipMaps will be created.
		 *  @param optimizeForRenderToTexture  indicates if this texture will be used as
		 *                  render target
		 *  @param scale    the scale factor of the created texture. This affects the reported
		 *                  width and height of the texture object.
		 *  @param format   the context3D texture format to use. Pass one of the packed or
		 *                  compressed formats to save memory (at the price of reduced image
		 *                  quality).
		 *  @param forcePotTexture  indicates if the underlying Stage3D texture should be created
		 *                  as the power-of-two based "IStarlingTexture" class instead of the more memory
		 *                  efficient "RectangleTexture".
		 */
		public static function fromBitmap(bitmap:Bitmap, generateMipMaps:Boolean=false,
										  optimizeForRenderToTexture:Boolean=false,
										  format:String="bgra"):IStarlingTexture
		{
			return fromBitmapData(bitmap.bitmapData, generateMipMaps, optimizeForRenderToTexture,format);
		}
		
		/** Creates a texture object from bitmap data.
		 *  Beware: you must not dispose 'data' if Starling should handle a lost device context;
		 *  alternatively, you can handle restoration yourself via "texture.root.onRestore".
		 *
		 *  @param data     the bitmap data to upload to the texture.
		 *  @param generateMipMaps  indicates if mipMaps will be created.
		 *  @param optimizeForRenderToTexture  indicates if this texture will be used as
		 *                  render target
		 *  @param scale    the scale factor of the created texture. This affects the reported
		 *                  width and height of the texture object.
		 *  @param format   the context3D texture format to use. Pass one of the packed or
		 *                  compressed formats to save memory (at the price of reduced image
		 *                  quality).
		 *  @param forcePotTexture  indicates if the underlying Stage3D texture should be created
		 *                  as the power-of-two based "IStarlingTexture" class instead of the more memory
		 *                  efficient "RectangleTexture".
		 */
		public static function fromBitmapData(data:BitmapData, generateMipMaps:Boolean=false,
											  optimizeForRenderToTexture:Boolean=false,
											  format:String="bgra",disposeBitmapData:Boolean = true):IStarlingTexture
		{
			var texture:IStarlingTexture = TextureFactory.empty(data.width, data.height,generateMipMaps, optimizeForRenderToTexture,format);
			texture.autoRecycleDataEnable = false;
			texture.root.uploadBitmapData(data);
			
			if(disposeBitmapData)data.dispose();
			
			return texture;
		}
		
		public static function fromBitmapDataByMemoryItem(data:BitmapData, generateMipMaps:Boolean=false,
											  optimizeForRenderToTexture:Boolean=false,
											  format:String="bgra",disposeBitmapData:Boolean = true, clipRect:Rectangle=null):IStarlingTexture
		{
			clipRect ||= data.rect;
			var texture:IStarlingTexture = TextureFactory.empty(clipRect.width, clipRect.height,generateMipMaps, optimizeForRenderToTexture,format);
			texture.autoRecycleDataEnable = false;
			texture.root.uploadBitmapDataByMemoryItem(data, clipRect);
			
			if(disposeBitmapData)data.dispose();
			
			return texture;
		}
		
		
		
		public static function fromAtfBytes(data:ByteArray,useMipMaps:Boolean=true):IStarlingTexture
		{
			var concreteTexture:ConcreteTexture = new ConcreteTexture(useMipMaps);
			concreteTexture.uploadAtfDataByteArray(data);
			return concreteTexture;
		}
		
		/** Creates an empty texture of a certain size.
		 *  Beware that the texture can only be used after you either upload some color data
		 *  ("texture.root.upload...") or clear the texture ("texture.root.clear()").
		 *
		 *  @param width   in points; number of pixels depends on scale parameter
		 *  @param height  in points; number of pixels depends on scale parameter
		 *  @param premultipliedAlpha  the PMA format you will use the texture with. If you will
		 *                 use the texture for bitmap data, use "true"; for ATF data, use "false".
		 *  @param mipMapping  indicates if mipmaps should be used for this texture. When you upload
		 *                 bitmap data, this decides if mipmaps will be created; when you upload ATF
		 *                 data, this decides if mipmaps inside the ATF file will be displayed.
		 *  @param optimizeForRenderToTexture  indicates if this texture will be used as render target
		 *  @param scale   if you omit this parameter, 'Starling.contentScaleFactor' will be used.
		 *  @param format  the context3D texture format to use. Pass one of the packed or
		 *                 compressed formats to save memory (at the price of reduced image quality).
		 *  @param forcePotTexture  indicates if the underlying Stage3D texture should be created
		 *                 as the power-of-two based "IStarlingTexture" class instead of the more memory
		 *                 efficient "RectangleTexture".
		 */
		public static function empty(width:Number, height:Number,mipMapping:Boolean=false, optimizeForRenderToTexture:Boolean=false,
									 format:String="bgra"):IStarlingTexture
		{
			var actualWidth:int, actualHeight:int;
			var concreteTexture:ConcreteTexture;
			var context:Context3D = Starling.context;
			
			if (context == null) throw new MissingContextError();
			
			var origWidth:Number  = width;
			var origHeight:Number = height;
			
			var comressed:Boolean = true;
			var hasAlpha:Boolean = true;
			if(format == Context3DTextureFormat.BGRA)
				comressed = false;
			if(format == Context3DTextureFormat.COMPRESSED)
				hasAlpha = false;
			
			actualWidth  = Math.ceil(origWidth  - 0.000000001); // avoid floating point errors
			actualHeight = Math.ceil(origHeight - 0.000000001);
			
			concreteTexture = new ConcreteTexture(mipMapping,comressed,hasAlpha,optimizeForRenderToTexture);
			concreteTexture.setSize(width,height);
			
			if (actualWidth - origWidth < 0.001 && actualHeight - origHeight < 0.001)
				return concreteTexture;
			else
				return new SubTexture(concreteTexture, new Rectangle(0, 0, width, height), true);
		}
		
		/** Creates a texture that contains a region (in pixels) of another texture. The new
		 *  texture will reference the base texture; no data is duplicated.
		 *
		 *  @param texture  The texture you want to create a SubTexture from.
		 *  @param region   The region of the parent texture that the SubTexture will show
		 *                  (in points).
		 *  @param frame    If the texture was trimmed, the frame rectangle can be used to restore
		 *                  the trimmed area.
		 *  @param rotated  If true, the SubTexture will show the parent region rotated by
		 *                  90 degrees (CCW).
		 *  @param scaleModifier  The scale factor of the new texture will be calculated by
		 *                  multiplying the parent texture's scale factor with this value.
		 */
		public static function fromTexture(texture:IStarlingTexture, region:Rectangle=null,
										   rotated:Boolean=false):IStarlingTexture
		{
			return new SubTexture(texture, region, false, rotated);
		}
	}
}