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
    import flash.geom.Rectangle;
    import flash.utils.ByteArray;
    import flash.utils.Endian;
    import flash.utils.getTimer;
    
    import away3d.core.managers.Stage3DProxy;
    import away3d.events.Stage3DEvent;
    import away3d.log.Log;
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
		private var _isDynamic:Boolean;
		
		protected var _referencedMeshCount:int;
		private static var totalConcreteTexture:int;
		
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
			_autoRecycleEnable = true;
			_autoRecycleDataEnable = false;
			_smooth = false;
			_hasMipmaps = false;
			totalConcreteTexture++;
        }
        
		public function get key():String
		{
			return url;
		}
		
		public function set key(value:String):void
		{
			url = value;
		}
		
		override public function get textureType():int
		{
			return Stage3DProxy.STARLING_TYPE;	
		}
		
		CONFIG::Debug
			{
				override public function get base():TextureBase
				{
						if(!_texture)
						{
							Log.error("当前访问的textureBase不存在!"+url);
						}
						return _texture;
				}
			}
		
		public function get referencedMeshCount():int
		{
			return _referencedMeshCount;
		}
		
		public function set referencedMeshCount(value:int):void
		{
			_referencedMeshCount = value;
		}
		
		public function get isDynamic():Boolean
		{
			return _isDynamic;
		}
		
		public function set isDynamic(value:Boolean):void
		{
			_isDynamic = value;
		}
		
		public function get transformationMatrix():Matrix { return null; }
		
		public function get transformationMatrixToRoot():Matrix { return null; }
		
        /** Disposes the TextureBase object. */
        override public function dispose():void
        {
			if(_referencedMeshCount > 0)
			{
				_referencedMeshCount--;
			}
			
			if(_isDynamic)
				return;
			
			if(_referencedMeshCount < 1)
			{
				if(!_disposed)
				{
					CONFIG::Debug
						{
							if(getTimer() - lastUsedTime < 10)
							{
								Log.warn("贴图仍正在被使用,立即回收可能会引起#3605运行时错误 取样器 %1 绑定的纹理无效:"+url);
								return;
							}
						}

					totalConcreteTexture--;
					super.dispose();
				}
			}
        }
		
		public static function get numInstance():int
		{
			return totalConcreteTexture;
		}
		
		override public function  load(url:String, priority:int=6000):void
		{
			super.load(url, priority);
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
		
		public function uploadBitmapData(bitmapData:BitmapData, rect:Rectangle = null):void
		{
			if(!_bgraData)
			{
				if(!rect) rect = bitmapData.rect;
				var bgraBytes:ByteArray = new ByteArray();
				bgraBytes.endian = Endian.LITTLE_ENDIAN;
				bitmapData.copyPixelsToByteArray(rect, bgraBytes);
				_bgraData = new BGRAData(bgraBytes,rect.width,rect.height,hasAlpha);
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
		
		public function uploadBitmapDataByMemoryItem(bitmapData:BitmapData,  rect:Rectangle = null):void
		{
/*			if(!rect) rect = bitmapData.rect;
			var memoryItem:MemoryItem = HeapAllocator.malloc(rect.width*rect.height*4);
			_hasAlpha = bitmapData.transparent;
			var data:MemoryItemBgraData = new MemoryItemBgraData(memoryItem, rect.width, rect.height, hasAlpha);		
			data.bgraBytes.position = memoryItem.heapPtr;
			bitmapData.copyPixelsToByteArray(rect, data.bgraBytes);
			setBgraData(data);*/
			
			uploadBitmapData(bitmapData, rect);
		}
		
		public function uploadAtfDataByteArray(data:ByteArray):void
		{
			disposeOldData();
			_atfData = new ATFData(data);
			this.hasAlpha = _atfData.hasAlpha;
			this.textureData = _atfData;
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

		override protected function showAlphaChangeWarning():void
		{
			//do nothing	
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