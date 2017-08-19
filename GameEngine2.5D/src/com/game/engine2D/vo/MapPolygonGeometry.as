package com.game.engine2D.vo
{
	import flash.geom.Vector3D;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import away3d.core.base.CompactSubGeometry;
	import away3d.primitives.PrimitiveBase;

	/**
	 * A MapPolygonGeometry primitive mesh.
	 */
	public class MapPolygonGeometry extends PrimitiveBase
	{
		protected var _points:Vector.<Vector3D>;
		protected var _rawData:ByteArray;
		protected var _rawIndices:ByteArray;
		
		private var _nextVertexIndex:uint;
		private var _currentIndex:uint;
		private var _currentTriangleIndex:uint;
		private var _numVertices:uint;
		private var _stride:uint;
		private var _vertexOffset:uint;
		
		public function MapPolygonGeometry(points:Vector.<Vector3D>)
		{
			super(false, false);
			
			_points = points;
			if(_points == null || _points.length < 3)
			{
				throw new Error("MapPolygonGeometry points is not null or length >= 3");
			}
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function buildGeometry(target:CompactSubGeometry):void
		{
			var numPoint:uint = _points.length;
			var numTriangles:uint = numPoint - 2;
			var i:int,len:int = numPoint - 1;
			
			_stride = target.vertexStride;
			_vertexOffset = target.vertexOffset;
			
			// reset utility variables
			_numVertices = numPoint;
			_nextVertexIndex = 0;
			_currentIndex = 0;
			_currentTriangleIndex = 0;
			
			// need to initialize raw arrays or can be reused?
			//_rawData = target.getRawVertexData();
			if (_rawData && (_numVertices*_stride<<2) == _rawData.length) {
				//_rawIndices = target.indexData;
				_rawData.position = 0;
				_rawIndices.position = 0;
			} else {
				var numVertComponents:uint = _numVertices*_stride;
				_rawData = new ByteArray;
				_rawData.endian = Endian.LITTLE_ENDIAN;
				_rawData.length = numVertComponents<<2;
				_rawIndices = new ByteArray;
				_rawIndices.endian = Endian.LITTLE_ENDIAN;
				_rawIndices.length = (numTriangles*3)<<1;
			}
			
			for ( i = 0; i <= len; i++) 
			{
				var vec:Vector3D = _points[i];
				addVertex(vec.x, vec.y, vec.z, target);
			}
			
			for ( i = 1; i < len; i++) 
			{
				addTriangleClockWise(0,i+1,i);
			}
			
			// build real data from raw data
			//target.updateData(_rawData);
			//target.updateIndexData(_rawIndices);
		}
		
		private function addVertex(px:Number, py:Number, pz:Number,target:CompactSubGeometry):void
		{
			var compVertInd:uint = _vertexOffset + _nextVertexIndex*_stride; // current component vertex index
			_rawData.position = compVertInd<<2;
			_rawData.writeFloat(px);
			_rawData.writeFloat(py);
			_rawData.writeFloat(pz);
			_rawData.writeFloat(0);
			_rawData.writeFloat(0);
			_nextVertexIndex++;
		}
		
		private function addTriangleClockWise(cwVertexIndex0:uint, cwVertexIndex1:uint, cwVertexIndex2:uint):void
		{
			_rawIndices.position = _currentIndex<<1;
			_rawIndices.writeShort(cwVertexIndex0);
			_rawIndices.writeShort(cwVertexIndex1);
			_rawIndices.writeShort(cwVertexIndex2);
			_currentIndex+=3;
			_currentTriangleIndex++;
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function buildUVs(target:CompactSubGeometry):void
		{
		}
	}
}