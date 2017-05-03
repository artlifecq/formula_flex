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
    

    /** The TextureOptions class specifies options for loading textures with the
     *  <code>TextureFactory.fromData</code> and <code>TextureFactory.fromTextureBase</code> methods. */
    public class TextureOptions
    {
        private var _format:String;
        private var _mipMapping:Boolean;
        private var _optimizeForRenderToTexture:Boolean = false;
        private var _premultipliedAlpha:Boolean;
        private var _forcePotTexture:Boolean;
        private var _onReady:Function = null;
		private var _shareTexture:Boolean;

        /** Creates a new instance with the given options. */
        public function TextureOptions(mipMapping:Boolean=false, 
                                       format:String="bgra", premultipliedAlpha:Boolean=true,
                                       forcePotTexture:Boolean=false, shareTexture:Boolean=false)
        {
            _format = format;
            _mipMapping = mipMapping;
            _forcePotTexture = forcePotTexture;
            _premultipliedAlpha = premultipliedAlpha;
			_shareTexture = shareTexture;
        }
        
        /** Creates a clone of the TextureOptions object with the exact same properties. */
        public function clone():TextureOptions
        {
            var clone:TextureOptions = new TextureOptions(_mipMapping, _format);
            clone._optimizeForRenderToTexture = _optimizeForRenderToTexture;
            clone._premultipliedAlpha = _premultipliedAlpha;
            clone._forcePotTexture = _forcePotTexture;
            clone._onReady = _onReady;
			clone._shareTexture = _shareTexture;
            return clone;
		}
        
        /** The <code>Context3DTextureFormat</code> of the underlying texture data. Only used
         *  for textures that are created from Bitmaps; the format of ATF files is set when they
         *  are created. @default BGRA */
        public function get format():String { return _format; }
        public function set format(value:String):void { _format = value; }
        
        /** Indicates if the texture contains mip maps. @default false */
        public function get mipMapping():Boolean { return _mipMapping; }
        public function set mipMapping(value:Boolean):void { _mipMapping = value; }
        
        /** Indicates if the texture will be used as render target. */
        public function get optimizeForRenderToTexture():Boolean { return _optimizeForRenderToTexture; }
        public function set optimizeForRenderToTexture(value:Boolean):void { _optimizeForRenderToTexture = value; }

        /** Indicates if the underlying Stage3D texture should be created as the power-of-two based
         *  <code>Texture</code> class instead of the more memory efficient <code>RectangleTexture</code>.
         *  That might be useful when you need to render the texture with wrap mode <code>repeat</code>.
         *  @default false */
        public function get forcePotTexture():Boolean { return _forcePotTexture; }
        public function set forcePotTexture(value:Boolean):void { _forcePotTexture = value; }

        /** A callback that is used only for ATF textures; if it is set, the ATF data will be
         *  decoded asynchronously. The texture can only be used when the callback has been
         *  executed. This property is ignored for all other texture types (they are ready
         *  immediately when the 'TextureFactory.from...' method returns, anyway), and it's only used
         *  by the <code>TextureFactory.fromData</code> factory method.
         *  
         *  <p>This is the expected function definition: 
         *  <code>function(texture:Texture):void;</code></p>
         *
         *  @default null
         */
        public function get onReady():Function { return _onReady; }
        public function set onReady(value:Function):void { _onReady = value; }

        /** Indicates if the alpha values are premultiplied into the RGB values. This is typically
         *  true for textures created from BitmapData and false for textures created from ATF data.
         *  This property will only be read by the <code>TextureFactory.fromTextureBase</code> factory
         *  method. @default true */
        public function get premultipliedAlpha():Boolean { return _premultipliedAlpha; }
        public function set premultipliedAlpha(value:Boolean):void { _premultipliedAlpha = value; }
		
		public function get shareTexture():Boolean { return _shareTexture; }
		public function set shareTexture(value:Boolean):void { _shareTexture = value; }
    }
}