package com.game.engine2D.core
{
	
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import starling.textures.IStarlingTexture;
	import starling.textures.SubTexture;
	

	/**
	 * ATFTexture
	 * @author guoqing.wen
	 * 
	 */
    public class ATFStarlingTexture extends SubTexture
    {
		private var _atfPath:String;
		private var _hinderStart:uint;
		private var _hitSize:uint;
		private var _textureWidth:int;
		private var _hinderBytes:ByteArray;
		
		/**
		 *  ATFTexture构造函数
		 * @param parent:大图集Texture
		 * @param region：在大图中的位置rect
		 * @param hinderBytes：障碍数据
		 * @param hinderStart:障碍数据起点偏移值offset
		 * @param hitSize:障碍数据单元格的大小
		 * 
		 */
        public function ATFStarlingTexture(parent:IStarlingTexture, region:Rectangle, hinderBytes:ByteArray, hinderStart:uint, hitSize:uint, path:String = null)
        {
			_atfPath = path;
			_hinderStart = hinderStart;
			_hitSize = hitSize;
			_hinderBytes = hinderBytes;
			_textureWidth = region.width;
			super(parent, region);
        }

		/**
		 * 获取障碍数据
		 * @return 
		 */
		public function checkHinderData(px:Number, py:Number):Boolean
		{
			if (_hinderBytes && _hinderBytes.length > 0 && px >= 0 && py >= 0)
			{
				var pos:int = int(py/_hitSize) * Math.ceil(_textureWidth/_hitSize) + int(px/_hitSize);
				var hex:int = _hinderBytes[_hinderStart + int(pos / 8)];
				return ((hex >> (pos % 8)) & 1);
			}
			return false;
		}
		
        override public function dispose():void
        { 
			_hinderBytes = null;
			super.dispose();
        } 
    }
}