// =================================================================================================
//
//	Starling Framework
//	Copyright Gamua GmbH. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package starling.textures
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display3D.textures.TextureBase;
    import flash.geom.Matrix;
    import flash.utils.ByteArray;
    import flash.utils.Endian;
    
    import away3d.core.managers.Stage3DProxy;
    import away3d.events.Stage3DEvent;
    import away3d.textures.ATFData;
    import away3d.textures.AsyncTexture2D;
    import away3d.textures.BGRAData;
    
    import starling.events.Event;

    /** A ConcreteTexture wraps a Stage3D texture object, storing the properties of the texture
     *  and providing utility methods for data upload, etc.
     *
     *  <p>This class cannot be instantiated directly; create instances using
     *  <code>TextureFactory.fromTextureBase</code> instead. However, that's only necessary when
     *  you need to wrap a <code>TextureBase</code> object in a Starling texture;
     *  the preferred way of creating textures is to use one of the other
     *  <code>TextureFactory.from...</code> factory methods in the <code>Texture</code> class.</p>
     *
     *  @see Texture
     */
    public class ConcreteTexture extends AsyncTexture2D implements IStarlingTexture
    {
		private var _key:String;		
		
		private var _disposed:Boolean;
		
		protected var _referencedMeshCount:uint;
		
        /** @private
         *
         *  Creates a ConcreteTexture object from a TextureBase, storing information about size,
         *  mip-mapping, and if the channels contain premultiplied alpha values. May only be
         *  called from subclasses.
         *
         *  <p>Note that <code>width</code> and <code>height</code> are expected in pixels,
         *  i.e. they do not take the scale factor into account.</p>
         */
        public function ConcreteTexture(mipMapping:Boolean = false,compressed:Boolean = false,hasAlpha:Boolean = false,optimizedForRenderTexture:Boolean = false)
        {
            super(hasAlpha,mipMapping,false,compressed)
			_optimizeForRenderToTexture = optimizedForRenderTexture;
			_textureType = Stage3DProxy.STARLING_TYPE;
			_autoRecycleEnable = true;
			_autoRecycleDataEnable = false;
        }
        
		public function get key():String
		{
			return _key;
		}
		
		public function set key(value:String):void
		{
			_key = value;
		}
		
		public function get disposed():Boolean
		{
			return _disposed;
		}
		
		public function get referencedMeshCount():uint
		{
			return _referencedMeshCount;
		}
		
		public function set referencedMeshCount(value:uint):void
		{
			_referencedMeshCount = value;
		}
		
		public function get transformationMatrix():Matrix { return null; }
		
		public function get transformationMatrixToRoot():Matrix { return null; }
		
        /** Disposes the TextureBase object. */
        override public function dispose():void
        {
           	super.dispose();
			
			_disposed = true;
        }
        
		public function loadBitmapClass(bitmapClass:Class):void
		{
			disposeOldData();
			if(_textureData)
				_textureData.removeEventListener(Event.CHANGE,onTextureDataChanged);
			_rawData = bitmapClass;
			var bp:Bitmap = new bitmapClass();
			uploadBitmapData(bp.bitmapData);
		}
		
		public function uploadBitmapData(bitmapData:BitmapData):void
		{
			if(!_bgraData)
			{
				var bgraBytes:ByteArray = new ByteArray();
				bgraBytes.endian = Endian.LITTLE_ENDIAN;
				bitmapData.copyPixelsToByteArray(bitmapData.rect,bgraBytes);
				_bgraData = new BGRAData(bgraBytes,bitmapData.width,bitmapData.height,hasAlpha);
				this.textureData = bgraData;
			}
			else
			{
				_bgraData.setBgraBytesFromBitmapData(bitmapData);
			}
		}
		
		public function uploadBitmapDataByteArray(data:ByteArray, offset:int=0):void
		{
			if(!_bgraData)
			{
				_bgraData = new BGRAData(data,_width,_height,hasAlpha);
				this.textureData = bgraData;
			}
			else
			{
				_bgraData.setBgraBytes(data,_width,_height,_hasAlpha);
			}
		}
		
		public function uploadAtfDataByteArray(data:ByteArray):void
		{
			disposeOldData();
			var atfData:ATFData = new ATFData(data);
			_atfData = atfData;
			this.compressed = atfData.compressed;
			this.hasAlpha = atfData.hasAlpha;
			this.textureData = atfData;
		}
		
		override protected function createTexture(stage3DProxy:Stage3DProxy):TextureBase
		{
			if(!_textureData && _rawData is Class)
			{
				loadBitmapClass(_rawData);	
			}
			return super.createTexture(stage3DProxy);
		}
		
		override protected function onContext3DRecreated(e:Stage3DEvent):void
		{
			invalidateContent();
			if(!_rawData && !_textureData)//RenderTexture
				clear();
		}

        public function clear():void
        {
			if(_stage3DProxy)
			{
				_stage3DProxy.setRenderTarget(getTextureForStage3D(_stage3DProxy), false, 0, 0);
				_stage3DProxy.context3D.clear(0, 0, 0, 0);
				_stage3DProxy.setRenderTarget(null);
			}
        }

        public function get root():ConcreteTexture { return this; }
    }
}