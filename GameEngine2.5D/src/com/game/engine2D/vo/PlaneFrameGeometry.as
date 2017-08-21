package com.game.engine2D.vo
{
	import away3d.arcane;
	import away3d.core.base.CompactSubGeometry;
	import away3d.premium.heap.HeapAllocator;
	import away3d.premium.heap.MemoryItem;
	import away3d.premium.heap.MemoryItemTypes;
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
			var data:MemoryItem;
			var indices:MemoryItem;
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
			
			var dataPos:int,indicesPos:int;
			
			if (target.vertexData && (numVertices*stride<<2) == target.vertexData.length) {
				data = target.vertexData;
				indices = target.indexData;
			} else {
				data = HeapAllocator.malloc((numVertices*stride)<<2,MemoryItemTypes.GEOMETRY);
				indices = HeapAllocator.malloc(numIndices<<1,MemoryItemTypes.GEOMETRY);
				invalidateUVs();
			}
			
			numIndices = 0;
			var index:uint = target.vertexOffset;
			for (var yi:uint = 0; yi <= _segmentsH; ++yi) {
				for (var xi:uint = 0; xi <= _segmentsW; ++xi) {
					x = (xi/_segmentsW - 0)*_width;
					y = (yi/_segmentsH - 1)*_height;
					dataPos = (index)<<2;
					data.writeFloat(x,dataPos);dataPos+=4;
					index++;
					if (_yUp) {
						data.writeFloat(0,dataPos);dataPos+=4;
						data.writeFloat(y,dataPos);dataPos+=4;
						index++;
						index++;
					} else {
						data.writeFloat(y,dataPos);dataPos+=4;
						data.writeFloat(0,dataPos);dataPos+=4;
						index++;
						index++;
					}
					
					if(target.hasNormals)
					{
						if(!_flatNormal)
						{
							data.writeFloat(0,dataPos);dataPos+=4;
							index++;
							if (_yUp) {
								data.writeFloat(1,dataPos);dataPos+=4;
								data.writeFloat(0,dataPos);dataPos+=4;
								index++;
								index++;
							} else {
								data.writeFloat(0,dataPos);dataPos+=4;
								data.writeFloat(-1,dataPos);dataPos+=4;
								index++;
								index++;
							}
						}
						else
						{
							data.writeFloat((x==0)?-1:1,dataPos);dataPos+=4;
							index++;
							if (_yUp) {
								data.writeFloat(0,dataPos);dataPos+=4;
								data.writeFloat((y==0)?-1:1,dataPos);dataPos+=4;
								index++;
								index++;
							} else {
								data.writeFloat((y==0)?-1:1,dataPos);dataPos+=4;
								data.writeFloat(0,dataPos);dataPos+=4;
								index++;
								index++;
							}
						}
					}
					
					if(target.hasTangents)
					{
						data.writeFloat(1,dataPos);dataPos+=4;
						data.writeFloat(0,dataPos);dataPos+=4;
						data.writeFloat(0,dataPos);dataPos+=4;
						data.writeFloat(1,dataPos);
						index++;
						index++;
						index++;
						index++;
					}
					
					index += 2;//skip uv
					
					// add vertex with same position, but with inverted normal & tangent
					if (_doubleSided) {
						for (var i:int = 0; i < 3; ++i) {
							dataPos = (index - stride)<<2;
							temp = data.readFloat(dataPos);
							dataPos = index<<2;
							data.writeFloat(temp,dataPos);
							++index;
						}
						if(target.hasNormals)
						{
							if(!_flatNormal)
							{
								for (i = 0; i < 3; ++i) {
									dataPos = (index - stride)<<2;
									temp = data.readFloat(dataPos);
									dataPos = index<<2;
									data.writeFloat(-temp,dataPos);
									++index;
								}
							}
							else
							{
								for (i = 0; i < 3; ++i) {
									dataPos = (index - stride)<<2;
									temp = data.readFloat(dataPos);
									dataPos = index<<2;
									data.writeFloat(temp,dataPos);
									++index;
								}
							}
						}
						if(target.hasTangents)
						{
							for (i = 0; i < 4; ++i) {
								dataPos = (index - stride)<<2;
								temp = data.readFloat(dataPos);
								dataPos = index<<2;
								data.writeFloat(-temp,dataPos);
								++index;
							}
						}
						index += 2;//skip uv
					}
					
					if (xi != _segmentsW && yi != _segmentsH) {
						base = xi + yi*tw;
						var mult:int = _doubleSided? 2 : 1;
						
						indices.writeInt16(base*mult,indicesPos);indicesPos+=2;
						indices.writeInt16((base + tw)*mult,indicesPos);indicesPos+=2;
						indices.writeInt16((base + tw + 1)*mult,indicesPos);indicesPos+=2;
						indices.writeInt16(base*mult,indicesPos);indicesPos+=2;
						indices.writeInt16((base + tw + 1)*mult,indicesPos);indicesPos+=2;
						indices.writeInt16((base + 1)*mult,indicesPos);indicesPos+=2;
						
						if (_doubleSided) {
							indices.writeInt16((base + tw + 1)*mult + 1,indicesPos);indicesPos+=2;
							indices.writeInt16((base + tw)*mult + 1,indicesPos);indicesPos+=2;
							indices.writeInt16(base*mult + 1,indicesPos);indicesPos+=2;
							indices.writeInt16((base + 1)*mult + 1,indicesPos);indicesPos+=2;
							indices.writeInt16((base + tw + 1)*mult + 1,indicesPos);indicesPos+=2;
							indices.writeInt16(base*mult + 1,indicesPos);indicesPos+=2;
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
			var data:MemoryItem;
			var dataPos:int;
			var stride:uint = target.UVStride;
			var numUvs:uint = (_segmentsH + 1)*(_segmentsW + 1)*stride;
			var skip:uint = stride - 2;
			
			if (_doubleSided)
				numUvs *= 2;
			
			if (target.UVData && (numUvs<<2) == target.UVData.length)
				data = target.UVData;
			else {
				data = HeapAllocator.malloc(numUvs<<2,MemoryItemTypes.GEOMETRY);
				invalidateGeometry();
			}
			
			var index:uint = target.UVOffset;
			
			for (var yi:uint = 0; yi <= _segmentsH; ++yi) {
				for (var xi:uint = 0; xi <= _segmentsW; ++xi) {
					dataPos = index<<2;
					data.writeFloat( xi/_segmentsW ,dataPos);dataPos+=4;
					data.writeFloat( 1 - yi/_segmentsH ,dataPos);
					index++;
					index++;
					index += skip;
					
					if (_doubleSided) {
						dataPos = index<<2;
						data.writeFloat( xi/_segmentsW,dataPos);dataPos+=4;
						data.writeFloat( 1 - yi/_segmentsH,dataPos);
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
		
		override public function dispose():void
		{
			
		}
	}
}

