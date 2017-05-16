package com.game.engine2D.vo
{
	import flash.geom.Vector3D;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import away3d.arcane;
	import away3d.core.base.CompactSubGeometry;
	import away3d.core.math.Vector3DUtils;
	import away3d.primitives.PrimitiveBase;
	
	use namespace arcane;
	
	/**
	 * A UV PointLineGeometry primitive mesh.
	 */
	public class PointLineGeometry extends PrimitiveBase
	{
		protected var _planeWidth:Number;
		protected var _yUp:Boolean;
		private var _rawVertexData:ByteArray;
		private var _rawIndices:ByteArray;
		private var _nextVertexIndex:uint;
		private var _currentIndex:uint;
		private var _currentTriangleIndex:uint;
		private var _numVertices:uint;
		private var _vertexStride:uint;
		private var _vertexOffset:int;
		private var _points:Vector.<Vector3D>;
		
		private function addVertex(px:Number, py:Number, pz:Number, target:CompactSubGeometry):void
		{
			var compVertInd:uint = _vertexOffset + _nextVertexIndex*_vertexStride; // current component vertex index
			_rawVertexData.position = compVertInd<<2;
			_rawVertexData.writeFloat(px);
			_rawVertexData.writeFloat(py);
			_rawVertexData.writeFloat(pz);
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
		protected override function buildGeometry(target:CompactSubGeometry):void
		{
			var i:uint, j:uint;
			var numTriangles:uint;
			var pointNum:uint = _points.length;
			// reset utility variables
			_numVertices = 0;
			_nextVertexIndex = 0;
			_currentIndex = 0;
			_currentTriangleIndex = 0;
			_vertexStride = target.vertexStride;
			_vertexOffset = target.vertexOffset;
			
			// evaluate target number of vertices, triangles and indices
			_numVertices = pointNum*2; // segmentsT + 1 because of closure, segmentsR + 1 because of closure
			numTriangles = pointNum*2; // each level has segmentR quads, each of 2 triangles
			
			
			_rawVertexData = target.getRawVertexData();
			if (_rawVertexData && (_numVertices*_vertexStride<<2) == _rawVertexData.length) {
				_rawVertexData.position = 0;
				_rawIndices = target.indexData;
				_rawIndices.position = 0;
			} else {
				var numVertComponents:uint = _numVertices*_vertexStride;
				_rawVertexData = new ByteArray;
				_rawVertexData.endian = Endian.LITTLE_ENDIAN;
				_rawVertexData.length = numVertComponents<<2;
				_rawIndices = new ByteArray;
				_rawIndices.endian = Endian.LITTLE_ENDIAN;
				_rawIndices.length = (numTriangles*3)<<1;
				invalidateUVs();
			}
			
			var startIndex:uint;
			
			// surface
			var a:uint, b:uint, c:uint, d:uint, length:Number;
			var va:Vector3D,vb:Vector3D,vc:Vector3D;
			var p1:Vector3D = new Vector3D();
			var p2:Vector3D = new Vector3D();
			
			for (i = 0; i < pointNum; ++i) {
				startIndex = _vertexOffset + _nextVertexIndex*_vertexStride;
				
				va = _points[i == 0 ? pointNum - 1 : i - 1];
				
				vb = _points[i];
				
				vc = _points[i == pointNum - 1 ? 0 : i + 1];
				
				var ba:Vector3D = va.subtract(vb);
				var bc:Vector3D = vc.subtract(vb);
				
				var angle:Number = Vector3DUtils.getAngle(ba, bc);
				var l:Number = (_planeWidth/2)/Math.sin(angle/2);
				//单位化，保证ba.add(bc)计算中线向量
				ba.normalize();
				bc.normalize();
				var middle:Vector3D = ba.add(bc);
				middle.normalize();
				p1.copyFrom(middle);
				p2.copyFrom(middle);
				//p1朝middle向量方向移动l距离
				p1.scaleBy(l);
				p2.scaleBy(-l);
				//相加到vb，得到最终点的距离
				p1.incrementBy(vb);
				p2.incrementBy(vb);
				
				if (_yUp) {
					addVertex(p1.x, -p1.z, p1.y, target);
					addVertex(p2.x, -p2.z, p2.y, target);
				} else {
					addVertex(p1.x, p1.y, p1.z, target);
					addVertex(p2.x, p2.y, p2.z, target);
				}
				
				// close triangle
				if (i > 0) {
					a = _nextVertexIndex - 1; // current
					b = _nextVertexIndex - 2; // previous
					c = _nextVertexIndex - 3; // previous of last level
					d = _nextVertexIndex - 4; // current of last level
					addTriangleClockWise(a, b, c);
					addTriangleClockWise(b, d, c);
				}
				if (i == pointNum - 1){
					a = _nextVertexIndex - 1; // current
					b = _nextVertexIndex - 2; // previous
					c = 0; // previous of last level
					d = 1; // current of last level
					addTriangleClockWise(a, c, b);
					addTriangleClockWise(a, d, c);
				}
				
			}
			
			// build real data from raw data
			target.updateData(_rawVertexData);
			target.updateIndexData(_rawIndices);
		}
		
		/**
		 * @inheritDoc
		 */
		protected override function buildUVs(target:CompactSubGeometry):void
		{
			var offset:int = target.UVOffset;
			var skip:int = target.UVStride - 2;
			var pointNum:uint = _points.length;
			var uvNum:uint = pointNum*2;
			
			var data:ByteArray = target.getRawVertexData();
			
			// current uv component index
			var currentUvCompIndex:uint = offset;
			// surface
			for (var i:int = 0; i < uvNum; ++i) {
				// revolution vertex
				data.position = currentUvCompIndex<<2;
				if (i%4 == 0)
				{
					data.writeFloat(0);//u
					data.writeFloat(0);//v
				}
				else if (i%4 == 1)
				{
					data.writeFloat(0);//u
					data.writeFloat(1);//v
				}
				else if (i%4 == 2)
				{
					data.writeFloat(1);//u
					data.writeFloat(0);//v
				}
				else 
				{
					data.writeFloat(1);//u
					data.writeFloat(1);//v
				}
				currentUvCompIndex++;
				currentUvCompIndex++
					currentUvCompIndex += skip;
			}
			
			// build real data from raw data
			target.updateData(data);
		}
		
		public function get points():Vector.<Vector3D>
		{
			return _points;
		}
		
		public function set points(value:Vector.<Vector3D>):void
		{
			_points = value;
			invalidateGeometry();
		}
		
		/**
		 * The radius of the torus.
		 */
		public function get radius():Number
		{
			return _planeWidth;
		}
		
		public function set radius(value:Number):void
		{
			_planeWidth = value;
			invalidateGeometry();
		}
		
		/**
		 * Defines whether the torus poles should lay on the Y-axis (true) or on the Z-axis (false).
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
		 * Creates a new <code>Torus</code> object.
		 * @param radius The radius of the torus.
		 * @param tuebRadius The radius of the inner tube of the torus.
		 * @param segmentsR Defines the number of horizontal segments that make up the torus.
		 * @param segmentsT Defines the number of vertical segments that make up the torus.
		 * @param yUp Defines whether the torus poles should lay on the Y-axis (true) or on the Z-axis (false).
		 */
		public function PointLineGeometry(points:Vector.<Vector3D>, planeWidth:Number = 50, yUp:Boolean = true)
		{
			super(false, false);
			
			_points = points;
			_planeWidth = planeWidth;
			_yUp = yUp;
		}
	}
}
