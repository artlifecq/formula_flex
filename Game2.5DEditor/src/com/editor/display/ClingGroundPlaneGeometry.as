package com.editor.display
{
	import com.game.engine3D.utils.MathUtil;
	
	import away3d.core.base.CompactSubGeometry;
	import away3d.pathFinding.HeightMapHelper;
	import away3d.premium.heap.HeapAllocator;
	import away3d.premium.heap.MemoryItem;
	import away3d.premium.heap.MemoryItemTypes;
	import away3d.primitives.PrimitiveBase;

	/**
	 *
	 * 附着地面的平面几何
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-9 上午10:03:17
	 *
	 */
	public class ClingGroundPlaneGeometry extends PrimitiveBase
	{
		private var _segmentsW : uint;
		private var _segmentsH : uint;
		private var _yUp : Boolean;
		private var _x : Number = 0;
		private var _y : Number = 0;
		private var _width : Number;
		private var _height : Number;
		private var _doubleSided : Boolean;
		private var _flatNormal : Boolean;
		private var _rotationY : Number = 0;
		private var _heightMapHelper : HeightMapHelper;

		public function ClingGroundPlaneGeometry(heightMapHelper : HeightMapHelper, width : Number = 100, height : Number = 100, segmentsW : uint = 1, segmentsH : uint = 1, yUp : Boolean = false, doubleSided : Boolean = false, flatNormal : Boolean = false, hasNormals : Boolean = true, hasTangents : Boolean = false)
		{
			super(hasNormals, hasTangents);

			_segmentsW = segmentsW;
			_segmentsH = segmentsH;
			_yUp = yUp;
			_width = width;
			_height = height;
			_heightMapHelper = heightMapHelper;
			_doubleSided = doubleSided;
			_flatNormal = flatNormal;
		}

		public function get segmentsW() : uint
		{
			return _segmentsW;
		}

		public function set segmentsW(value : uint) : void
		{
			_segmentsW = value;
			invalidateGeometry();
			invalidateUVs();
		}

		public function get segmentsH() : uint
		{
			return _segmentsH;
		}

		public function set segmentsH(value : uint) : void
		{
			_segmentsH = value;
			invalidateGeometry();
			invalidateUVs();
		}

		public function get yUp() : Boolean
		{
			return _yUp;
		}

		public function set yUp(value : Boolean) : void
		{
			_yUp = value;
			invalidateGeometry();
		}

		public function get doubleSided() : Boolean
		{
			return _doubleSided;
		}

		public function set doubleSided(value : Boolean) : void
		{
			_doubleSided = value;
			invalidateGeometry();
		}

		public function get width() : Number
		{
			return _width;
		}

		public function set width(value : Number) : void
		{
			_width = value;
			invalidateGeometry();
		}

		public function get height() : Number
		{
			return _height;
		}

		public function set height(value : Number) : void
		{
			_height = value;
			invalidateGeometry();
		}

		public function set x(value : Number) : void
		{
			_x = value;
			invalidateGeometry();
		}

		public function set y(value : Number) : void
		{
			_y = value;
			invalidateGeometry();
		}

		public function set rotationY(value : Number) : void
		{
			_rotationY = value;
			invalidateGeometry();
		}

		protected override function buildGeometry(target : CompactSubGeometry) : void
		{
			var data : MemoryItem;
			var indices : MemoryItem;
			var x : Number, y : Number, z : Number, temp : Number;
			var numIndices : uint;
			var base : uint;
			var tw : uint = _segmentsW + 1;
			var numVertices : uint = (_segmentsH + 1) * tw;
			var stride : uint = target.vertexStride;
			if (_doubleSided)
				numVertices *= 2;
			
			numIndices = _segmentsH * _segmentsW * 6;
			if (_doubleSided)
				numIndices <<= 1;
			
			var dataPos:int,indicesPos:int;
			
			if (target.vertexData && (numVertices * stride << 2) == target.vertexData.length)
			{
				data = target.vertexData;
				indices = target.indexData;
			}
			else
			{
				data = HeapAllocator.malloc((numVertices*stride)<<2,MemoryItemTypes.GEOMETRY);
				indices = HeapAllocator.malloc(numIndices<<1,MemoryItemTypes.GEOMETRY);
				
				invalidateUVs();
			}
			
			numIndices = 0;
			var index : uint = target.vertexOffset;
			for (var yi : uint = 0; yi <= _segmentsH; ++yi)
			{
				for (var xi : uint = 0; xi <= _segmentsW; ++xi)
				{
					x = (xi / _segmentsW) * _width; //x = ((xi / _segmentsW) - 0.5) * _width;
					y = (yi / _segmentsH) * _height; //y = ((yi / _segmentsH) - 0.5) * _height;
					var dist : Number = MathUtil.getDistance(0, 0, x, y);
					var angle : Number = MathUtil.getAngle(0, 0, x, y) + _rotationY;
					var dx : Number = MathUtil.getDxByAngle(dist, angle);
					var dy : Number = MathUtil.getDyByAngle(dist, angle);
					z = _heightMapHelper ? _heightMapHelper.queryHeightAt(_x + dx, _y + dy) : 0;
					
					dataPos = (index)<<2;
					data.writeFloat(x,dataPos);dataPos+=4;
					index++;
					if (_yUp)
					{
						data.writeFloat(y,dataPos);dataPos+=4;
						data.writeFloat(z,dataPos);dataPos+=4;
						index++;
						index++;
					}
					else
					{
						data.writeFloat(y,dataPos);dataPos+=4;
						data.writeFloat(z,dataPos);dataPos+=4;
						index++;
						index++;
					}
					
					if (target.hasNormals)
					{
						if (!_flatNormal)
						{
							data.writeFloat(0,dataPos);dataPos+=4;
							index++;
							if (_yUp)
							{
								data.writeFloat(1,dataPos);dataPos+=4;
								data.writeFloat(0,dataPos);dataPos+=4;
								
								index++;
								index++;
							}
							else
							{
								data.writeFloat(1,dataPos);dataPos+=4;
								data.writeFloat(-1,dataPos);dataPos+=4;
								
								index++;
								index++;
							}
						}
						else
						{
							data.writeFloat(Math.abs(x) / x,dataPos);dataPos+=4;
							index++;
							if (_yUp)
							{
								data.writeFloat(0,dataPos);dataPos+=4;
								data.writeFloat(Math.abs(y) / y,dataPos);dataPos+=4;
								index++;
								index++;
							}
							else
							{
								data.writeFloat(Math.abs(y) / y,dataPos);dataPos+=4;
								data.writeFloat(0,dataPos);dataPos+=4;
								index++;
								index++;
							}
						}
					}
					
					if (target.hasTangents)
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
					
					index += 2; //skip uv
					
					// add vertex with same position, but with inverted normal & tangent
					if (_doubleSided)
					{
						for (var i : int = 0; i < 3; ++i)
						{
							dataPos = (index - stride) << 2; 
							temp = data.readFloat(dataPos);
							dataPos = index << 2;
							data.writeFloat(temp,dataPos);
							++index;
						}
						if (target.hasNormals)
						{
							if (!_flatNormal)
							{
								for (i = 0; i < 3; ++i)
								{
									dataPos = (index - stride) << 2; 
									temp = data.readFloat(dataPos);
									dataPos = index << 2;
									data.writeFloat(-temp,dataPos);
									++index;
								}
							}
							else
							{
								for (i = 0; i < 3; ++i)
								{
									dataPos = (index - stride) << 2; 
									temp = data.readFloat(dataPos);
									dataPos = index << 2;
									data.writeFloat(temp,dataPos);
									++index;
								}
							}
						}
						if (target.hasTangents)
						{
							for (i = 0; i < 4; ++i)
							{
								dataPos = (index - stride) << 2; 
								temp = data.readFloat(dataPos);
								dataPos = index << 2;
								data.writeFloat(-temp,dataPos);
								++index;
							}
						}
						index += 2; //skip uv
					}
					
					if (xi != _segmentsW && yi != _segmentsH)
					{
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
		
		override protected function buildUVs(target : CompactSubGeometry) : void
		{
			var data : MemoryItem;
			var dataPos:int;
			var stride : uint = target.UVStride;
			var numUvs : uint = (_segmentsH + 1) * (_segmentsW + 1) * stride;
			var skip : uint = stride - 2;
			
			if (_doubleSided)
				numUvs *= 2;
			
			if (target.UVData && (numUvs<<2) == target.UVData.length)
			{
				data = target.UVData;
			}
			else
			{
				data = HeapAllocator.malloc(numUvs<<2,MemoryItemTypes.GEOMETRY);
				invalidateGeometry();
			}
			
			var index : uint = target.UVOffset;
			
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

		public function get flatNormal() : Boolean
		{
			return _flatNormal;
		}

		public function set flatNormal(value : Boolean) : void
		{
			_flatNormal = value;
			invalidateGeometry();
		}

		override public function dispose() : void
		{
			_heightMapHelper = null;
			super.dispose();
		}
	}
}
