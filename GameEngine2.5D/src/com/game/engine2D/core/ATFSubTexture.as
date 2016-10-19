package com.game.engine2D.core
{
	
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import away3d.materials.TextureMaterial;
	import away3d.textures.Texture2DBase;
	

	/**
	 * ATFSubTexture
	 * @author guoqing.wen
	 * 
	 */
    public class ATFSubTexture
    {
		private var _atfPath:String;
		private var _hinderStart:uint;
		private var _hitSize:uint;
		private var _textureWidth:int;
		private var _hinderBytes:ByteArray;
		
		private var mParent:ITextureMaterial;
		private var mRegion:Rectangle;
		private var mWidth:Number;
		private var mHeight:Number;
		private var mTransformationMatrix:Matrix;
		
		/**
		 *  ATFTexture构造函数
		 * @param parent:大图集Texture
		 * @param region：在大图中的位置rect
		 * @param hinderBytes：障碍数据
		 * @param hinderStart:障碍数据起点偏移值offset
		 * @param hitSize:障碍数据单元格的大小
		 * 
		 */
        public function ATFSubTexture(parent:ITextureMaterial, region:Rectangle, hinderBytes:ByteArray, hinderStart:uint, hitSize:uint, path:String = null)
        {
			_atfPath = path;
			_hinderStart = hinderStart;
			_hitSize = hitSize;
			_hinderBytes = hinderBytes;
			_textureWidth = region.width;
			
			updateTexture(parent, region);
		}
		
		/** 更新parent贴图 */
		public function updateTexture(parent:ITextureMaterial, region:Rectangle=null):void
		{
			mParent = parent;
			mRegion = region ? region.clone() : new Rectangle(0, 0, parent.width, parent.height);
			mWidth  = mRegion.width;
			mHeight = mRegion.height;
			mTransformationMatrix = new Matrix();
			mTransformationMatrix.scale(mRegion.width  / parent.width,
				mRegion.height / parent.height);
			mTransformationMatrix.translate(mRegion.x  / parent.width,
				mRegion.y  / parent.height);
		}
		
		public function get textureParsed():Boolean
		{
			return mParent.textureParsed;
		}

		/**
		 * 获取障碍数据
		 * @return 
		 */
		public function checkHinderData(px:Number, py:Number):Boolean
		{
			if (_hinderBytes && _hinderBytes.length > 0)
			{
				var pos:int = int(py/_hitSize) * Math.ceil(_textureWidth/_hitSize) + int(px/_hitSize);
				var hex:int = _hinderBytes[_hinderStart + int(pos / 8)];
				return ((hex >> (pos % 8)) & 1);
			}
			return false;
		}
		public function copyTo(uvTransform:Matrix):void { 
			uvTransform.identity();
			uvTransform.copyFrom(mTransformationMatrix);
		}
		public function get parent():TextureMaterial { return mParent as TextureMaterial; }
		public function get parentI():ITextureMaterial { return mParent; }
		public function get parentTexture():Texture2DBase { return parent.texture; }
		public function get region():Rectangle { return mRegion; }
		public function get width():Number { return mRegion.width; }
		public function get height():Number { return mRegion.height; }
		public function get textureWidth():Number { return mParent.width; }
		public function get textureHeight():Number { return mParent.height; }
		
        public function dispose():void
        { 
			_hinderBytes = null;
        }
    }
}