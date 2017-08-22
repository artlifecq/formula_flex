package com.game.engine2D.vo
{
	import flash.geom.Vector3D;
	
	import away3d.core.base.CompactSubGeometry;
	import away3d.premium.heap.HeapAllocator;
	import away3d.premium.heap.MemoryItem;
	import away3d.premium.heap.MemoryItemTypes;
	import away3d.primitives.PrimitiveBase;

	/**
	 * A MapPolygonGeometry primitive mesh.
	 */
	public class MapPolygonGeometry extends PrimitiveBase
	{
		protected var _points:Vector.<Vector3D>;
		protected var _rawData:MemoryItem;
		protected var _rawIndices:MemoryItem;
		
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
			_rawData = target.getRawVertexData();
			if (_rawData && (_numVertices*_stride<<2) == _rawData.length)
			{
				_rawIndices = target.indexData;
			} 
			else
			{
				var numVertComponents:uint = _numVertices*_stride;
				_rawData = HeapAllocator.malloc(numVertComponents<<2,MemoryItemTypes.GEOMETRY);
				_rawIndices = HeapAllocator.malloc((numTriangles*3)<<1,MemoryItemTypes.GEOMETRY);
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
			target.updateData(_rawData);
			target.updateIndexData(_rawIndices);
		}
		
		private function addVertex(px:Number, py:Number, pz:Number,target:CompactSubGeometry):void
		{
			var compVertInd:uint = _vertexOffset + _nextVertexIndex*_stride; // current component vertex index
			var dataPos:int = compVertInd<<2;
			_rawData.writeFloat(px,dataPos);dataPos+=4;
			_rawData.writeFloat(py,dataPos);dataPos+=4;
			_rawData.writeFloat(pz,dataPos);dataPos+=4;
			_rawData.writeFloat(0,dataPos);dataPos+=4;
			_rawData.writeFloat(0,dataPos);dataPos+=4;

			_nextVertexIndex++;
		}
		
		private function addTriangleClockWise(cwVertexIndex0:uint, cwVertexIndex1:uint, cwVertexIndex2:uint):void
		{
			var indicesPos:int = _currentIndex<<1;
			_rawIndices.writeInt16(cwVertexIndex0,indicesPos);indicesPos+=2;
			_rawIndices.writeInt16(cwVertexIndex1,indicesPos);indicesPos+=2;
			_rawIndices.writeInt16(cwVertexIndex2,indicesPos);indicesPos+=2;
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