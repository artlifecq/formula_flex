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
    import flash.display3D.textures.TextureBase;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    
    import away3d.core.managers.Stage3DProxy;
    import away3d.events.Event;
    import away3d.events.EventDispatcher;
    
    import starling.core.starling_internal;

    /** A SubTexture represents a section of another texture. This is achieved solely by
     *  manipulation of texture coordinates, making the class very efficient. 
     *
     *  <p><em>Note that it is OK to create subtextures of subtextures.</em></p>
     */
    public class SubTexture extends EventDispatcher implements IStarlingTexture
    {
        private var _parent:IStarlingTexture;
        private var _ownsParent:Boolean;
        private var _region:Rectangle;
        private var _rotated:Boolean;
        private var _width:int;
        private var _height:int;
        private var _transformationMatrix:Matrix;
        private var _transformationMatrixToRoot:Matrix;

		private var _key:String;
		protected var _referencedMeshCount:int;
		private var _isDynamic:Boolean;
		private static var totalSubTexture:int;
		
		public function get key():String
		{
			return _key || "sub_"+( parent ? parent.key : "no_parant");
		}
		
		public function set key(value:String):void
		{
			_key = value;
		}
		
		private var _disposed:Boolean;

		public function get disposed():Boolean
		{
			return _disposed;
		}

		
        /** Creates a new SubTexture containing the specified region of a parent texture.
         *
         *  @param parent     The texture you want to create a SubTexture from.
         *  @param region     The region of the parent texture that the SubTexture will show
         *                    (in points). If <code>null</code>, the complete area of the parent.
         *  @param ownsParent If <code>true</code>, the parent texture will be disposed
         *                    automatically when the SubTexture is disposed.
         *  @param frame      If the texture was trimmed, the frame rectangle can be used to restore
         *                    the trimmed area.
         *  @param rotated    If true, the SubTexture will show the parent region rotated by
         *                    90 degrees (CCW).
         *  @param scaleModifier  The scale factor of the SubTexture will be calculated by
         *                    multiplying the parent texture's scale factor with this value.
         */
        public function SubTexture(parent:IStarlingTexture, region:Rectangle=null,
                                   ownsParent:Boolean=false,
                                   rotated:Boolean=false)
        {
			totalSubTexture++;
            starling_internal::setTo(parent, region, ownsParent, rotated);
        }

        /** @private
         *
         *  <p>Textures are supposed to be immutable, and Starling uses this assumption for
         *  optimizations and simplifications all over the place. However, in some situations where
         *  the texture is not accessible to the outside, this can be overruled in order to avoid
         *  allocations.</p>
         */
        starling_internal function setTo(parent:IStarlingTexture, region:Rectangle=null,
                                         ownsParent:Boolean=false,
                                         rotated:Boolean=false):void
        {
            if (_region == null) _region = new Rectangle();
            if (region) _region.copyFrom(region);
            else _region.setTo(0, 0, parent.width, parent.height);

            _parent = parent;
            _ownsParent = ownsParent;
            _rotated = rotated;
            _width  = (rotated ? _region.height : _region.width);
            _height = (rotated ? _region.width  : _region.height);

            updateMatrices();
        }

        private function updateMatrices():void
        {
            if (_transformationMatrix) _transformationMatrix.identity();
            else _transformationMatrix = new Matrix();

            if (_transformationMatrixToRoot) _transformationMatrixToRoot.identity();
            else _transformationMatrixToRoot = new Matrix();

            if (_rotated)
            {
                _transformationMatrix.translate(0, -1);
                _transformationMatrix.rotate(Math.PI / 2.0);
            }

            _transformationMatrix.scale(_region.width  / _parent.width,
                                        _region.height / _parent.height);
            _transformationMatrix.translate(_region.x  / _parent.width,
                                            _region.y  / _parent.height);

            var texture:SubTexture = this;
            while (texture)
            {
                _transformationMatrixToRoot.concat(texture._transformationMatrix);
                texture = texture.parent as SubTexture;
            }
        }
        
        /** Disposes the parent texture if this texture owns it. */
        public function dispose():void
        {
			if (_referencedMeshCount > 0)
				_referencedMeshCount--;
			
			if (_isDynamic) {
				if (hasEventListener(Event.DISPOSED)) {
					dispatchEventWith(Event.DISPOSED);
				}
				return;
			}
			
			if (_referencedMeshCount < 1) {
				if (!_disposed) {
					totalSubTexture--;
					if (_ownsParent) {
						_parent.dispose();
					}
					_disposed = true;
				}
			}
        }
		
		public static function get numInstance():int
		{
			return totalSubTexture;
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

        /** The texture which the SubTexture is based on. */
        public function get parent():IStarlingTexture { return _parent; }
        
        /** Indicates if the parent texture is disposed when this object is disposed. */
        public function get ownsParent():Boolean { return _ownsParent; }
        
        /** If true, the SubTexture will show the parent region rotated by 90 degrees (CCW). */
        public function get rotated():Boolean { return _rotated; }

        /** The region of the parent texture that the SubTexture is showing (in points).
         *
         *  <p>CAUTION: not a copy, but the actual object! Do not modify!</p> */
        public function get region():Rectangle { return _region; }
		
        /** @inheritDoc */
        public function get transformationMatrix():Matrix { return _transformationMatrix; }

        /** @inheritDoc */
        public function get transformationMatrixToRoot():Matrix { return _transformationMatrixToRoot; }
		
        /** @inheritDoc */
        public function get root():ConcreteTexture { return _parent.root; }
        
        /** @inheritDoc */
        public function get format():String { return _parent.format; }
        
        /** @inheritDoc */
        public function get width():int { return _width; }
        
        /** @inheritDoc */
        public function get height():int { return _height; }
        
        /** @inheritDoc */
        public function get hasMipMaps():Boolean { return _parent.hasMipMaps; }

		public function get optimizeForRenderToTexture():Boolean{ return _parent.optimizeForRenderToTexture;}
		
		public function set optimizeForRenderToTexture(value:Boolean):void{ _parent.optimizeForRenderToTexture = value;}
		
		public function get textureType():int
		{
			return Stage3DProxy.STARLING_TYPE;	
		}
		
		/** 更新parent贴图  guoqing.wen add*/
		public function updateTexture(parent:IStarlingTexture, region:Rectangle=null,
									  ownsParent:Boolean=false,
									  rotated:Boolean=false):void
		{
			starling_internal::setTo(parent, region, ownsParent, rotated);
		}
			
		public function getTextureForStage3D(stage3DProxy:Stage3DProxy, slot:int = 0):TextureBase
		{
			return _parent.getTextureForStage3D(stage3DProxy,slot);
		}
		
		public function invalidateContent():void
		{
//			if (_parent)
//				_parent.invalidateContent();
		}
		
		public function set autoRecycleEnable(value:Boolean):void
		{
//			_parent.autoRecycleEnable = value;
		}
		
		public function get autoRecycleEnable():Boolean
		{
			return _parent.autoRecycleEnable;
		}
		
		public function set autoRecycleDataEnable(value:Boolean):void
		{
//			_parent.autoRecycleDataEnable = value;
		}
		
		public function get autoRecycleDataEnable():Boolean
		{
			return _parent.autoRecycleDataEnable;
		}
		
		public function get base():TextureBase
		{
			if (_parent)return _parent.base;
			return null;
		}
		
		public function get lastUsedTime():int{
			if (_parent)return _parent.lastUsedTime;
			return 0;
		};
		
		public function get anisotropic():int
		{
			throw new Error("Starling does not support texture anisotropic!");
		}
		
		public function set anisotropic(value:int):void
		{
			throw new Error("Starling does not support texture anisotropic!");
		}
		
		final public function get repeat():Boolean
		{
			return root.repeat;
		}
		
		final public function get smooth():Boolean
		{
			return root.smooth;
		}
		
		final public function set repeat(value:Boolean):void
		{
//			root.repeat = value;
		}
		
		final public function set smooth(value:Boolean):void
		{
//			root.smooth = value;
		}
    }
}