package com.game.engine2D.vo
{
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import away3d.arcane;
	import away3d.core.base.CompactSubGeometry;
	import away3d.primitives.PrimitiveBase;
	
	use namespace arcane;
	
	/**
	 * A Plane primitive mesh.
	 */
	public class PlaneFrameGeometry extends PrimitiveBase
	{
		private var _segmentsW:uint;
		private var _segmentsH:uint;
		private var _yUp:Boolean;
		private var _width:Number;
		private var _height:Number;
		private var _doubleSided:Boolean;
		private var _flatNormal:Boolean;
		
		/**
		 * Creates a new Plane object.
		 * @param width The width of the plane.
		 * @param height The height of the plane.
		 * @param segmentsW The number of segments that make up the plane along the X-axis.
		 * @param segmentsH The number of segments that make up the plane along the Y or Z-axis.
		 * @param yUp Defines whether the normal vector of the plane should point along the Y-axis (true) or Z-axis (false).
		 * @param doubleSided Defines whether the plane will be visible from both sides, with correct vertex normals.
		 */
		public function PlaneFrameGeometry(width:Number = 100, height:Number = 100, yUp:Boolean = true)
		{
			super(true, false);
			
			_segmentsW = 1;
			_segmentsH = 1;
			_yUp = yUp;
			_width = width;
			_height = height;
			_doubleSided = false;
			_flatNormal = true;
		}
		
		/**
		 * The number of segments that make up the plane along the X-axis. Defaults to 1.
		 */
		public function get segmentsW():uint
		{
			return _segmentsW;
		}
		
		public function set segmentsW(value:uint):void
		{
			_segmentsW = value;
			invalidateGeometry();
			invalidateUVs();
		}
		
		/**
		 * The number of segments that make up the plane along the Y or Z-axis, depending on whether yUp is true or
		 * false, respectively. Defaults to 1.
		 */
		public function get segmentsH():uint
		{
			return _segmentsH;
		}
		
		public function set segmentsH(value:uint):void
		{
			_segmentsH = value;
			invalidateGeometry();
			invalidateUVs();
		}
		
		/**
		 *  Defines whether the normal vector of the plane should point along the Y-axis (true) or Z-axis (false). Defaults to true.
		 */
		public function get yUp():Boolean
		{
			return _yUp;
		}
		
		public function set yUp(value:Boolean):void
		{
			_yUp = value;
			invalidateGeometry();
		}
		
		/**
		 * Defines whether the plane will be visible from both sides, with correct vertex normals (as opposed to bothSides on Material). Defaults to false.
		 */
		public function get doubleSided():Boolean
		{
			return _doubleSided;
		}
		
		public function set doubleSided(value:Boolean):void
		{
			_doubleSided = value;
			invalidateGeometry();
		}
		
		/**
		 * The width of the plane.
		 */
		public function get width():Number
		{
			return _width;
		}
		
		public function set width(value:Number):void
		{
			_width = value;
			invalidateGeometry();
		}
		
		/**
		 * The height of the plane.
		 */
		public function get height():Number
		{
			return _height;
		}
		
		public function set height(value:Number):void
		{
			_height = value;
			invalidateGeometry();
		}
		
		/**
		 * @inheritDoc
		 */
		protected override function buildGeometry(target:CompactSubGeometry):void
		{
			var data:ByteArray;
			var indices:ByteArray;
			var x:Number, y:Number, temp:Number;
			var numIndices:uint;
			var base:uint;
			var tw:uint = _segmentsW + 1;
			var numVertices:uint = (_segmentsH + 1)*tw;
			var stride:uint = target.vertexStride;
			if (_doubleSided)
				numVertices *= 2;
			
			numIndices = _segmentsH*_segmentsW*6;
			if (_doubleSided)
				numIndices <<= 1;
			
			if (target.vertexData && (numVertices*stride<<2) == target.vertexData.length) {
				data = target.vertexData;
				indices = target.indexData;
				data.position = 0;
				indices.position = 0;
			} else {
				data = new ByteArray;
				data.endian = Endian.LITTLE_ENDIAN;
				data.length = (numVertices*stride)<<2;
				indices = new ByteArray;
				indices.endian = Endian.LITTLE_ENDIAN;
				indices.length = numIndices<<1;
				invalidateUVs();
			}
			
			numIndices = 0;
			var index:uint = target.vertexOffset;
			for (var yi:uint = 0; yi <= _segmentsH; ++yi) {
				for (var xi:uint = 0; xi <= _segmentsW; ++xi) {
					x = (xi/_segmentsW - 0)*_width;
					y = (yi/_segmentsH - 1)*_height;
					data.position = (index)<<2;
					data.writeFloat(x);
					index++;
					if (_yUp) {
						data.writeFloat(0);
						data.writeFloat(y);
						index++;
						index++;
					} else {
						data.writeFloat(y);
						data.writeFloat(0);
						index++;
						index++;
					}
					
					if(target.hasNormals)
					{
						if(!_flatNormal)
						{
							data.writeFloat(0);
							index++;
							if (_yUp) {
								data.writeFloat(1);
								data.writeFloat(0);
								index++;
								index++;
							} else {
								data.writeFloat(0);
								data.writeFloat(-1);
								index++;
								index++;
							}
						}
						else
						{
							data.writeFloat((x==0)?-1:1);
							index++;
							if (_yUp) {
								data.writeFloat(0);
								data.writeFloat((y==0)?-1:1);
								index++;
								index++;
							} else {
								data.writeFloat((y==0)?-1:1);
								data.writeFloat(0);
								index++;
								index++;
							}
						}
					}
					
					if(target.hasTangents)
					{
						data.writeFloat(1);
						data.writeFloat(0);
						data.writeFloat(0);
						data.writeFloat(1);
						index++;
						index++;
						index++;
						index++;
					}
					
					index += 2;//skip uv
					
					// add vertex with same position, but with inverted normal & tangent
					if (_doubleSided) {
						for (var i:int = 0; i < 3; ++i) {
							data.position = (index - stride)<<2;
							temp = data.readFloat();
							data.position = index<<2;
							data.writeFloat(temp);
							++index;
						}
						if(target.hasNormals)
						{
							if(!_flatNormal)
							{
								for (i = 0; i < 3; ++i) {
									data.position = (index - stride)<<2;
									temp = data.readFloat();
									data.position = index<<2;
									data.writeFloat(-temp);
									++index;
								}
							}
							else
							{
								for (i = 0; i < 3; ++i) {
									data.position = (index - stride)<<2;
									temp = data.readFloat();
									data.position = index<<2;
									data.writeFloat(temp);
									++index;
								}
							}
						}
						if(target.hasTangents)
						{
							for (i = 0; i < 4; ++i) {
								data.position = (index - stride)<<2;
								temp = data.readFloat();
								data.position = index<<2;
								data.writeFloat(-temp);
								++index;
							}
						}
						index += 2;//skip uv
					}
					
					if (xi != _segmentsW && yi != _segmentsH) {
						base = xi + yi*tw;
						var mult:int = _doubleSided? 2 : 1;
						
						indices.writeShort(base*mult);
						indices.writeShort((base + tw)*mult);
						indices.writeShort((base + tw + 1)*mult);
						indices.writeShort(base*mult);
						indices.writeShort((base + tw + 1)*mult);
						indices.writeShort((base + 1)*mult);
						
						if (_doubleSided) {
							indices.writeShort((base + tw + 1)*mult + 1);
							indices.writeShort((base + tw)*mult + 1);
							indices.writeShort(base*mult + 1);
							indices.writeShort((base + 1)*mult + 1);
							indices.writeShort((base + tw + 1)*mult + 1);
							indices.writeShort(base*mult + 1);
						}
					}
				}
			}
			
			target.updateData(data);
			target.updateIndexData(indices);
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function buildUVs(target:CompactSubGeometry):void
		{
			var data:ByteArray;
			var stride:uint = target.UVStride;
			var numUvs:uint = (_segmentsH + 1)*(_segmentsW + 1)*stride;
			var skip:uint = stride - 2;
			
			if (_doubleSided)
				numUvs *= 2;
			
			if (target.UVData && (numUvs<<2) == target.UVData.length)
				data = target.UVData;
			else {
				data = new ByteArray;
				data.endian = Endian.LITTLE_ENDIAN;
				data.length = numUvs<<2;
				invalidateGeometry();
			}
			
			var index:uint = target.UVOffset;
			
			for (var yi:uint = 0; yi <= _segmentsH; ++yi) {
				for (var xi:uint = 0; xi <= _segmentsW; ++xi) {
					data.position = index<<2;
					data.writeFloat( (xi/_segmentsW) );
					data.writeFloat( (1 - yi/_segmentsH) );
					index++;
					index++;
					index += skip;
					
					if (_doubleSided) {
						data.position = index<<2;
						data.writeFloat( (xi/_segmentsW) );
						data.writeFloat( (1 - yi/_segmentsH) );
						index++;
						index++;
						index += skip;
					}
				}
			}
			
			target.updateData(data);
		}
		
		public function get flatNormal():Boolean
		{
			return _flatNormal;
		}
		
		public function set flatNormal(value:Boolean):void
		{
			_flatNormal = value;
			invalidateGeometry();
		}
		
	}
}

