package starling.rendering
{
	import flash.geom.Matrix;
	
	import away3d.core.base.IndexBuffer3DProxy;
	import away3d.core.base.VertexBuffer3DProxy;
	
	import starling.core.Starling;
	import starling.core.starling_internal;
	import starling.display.Mesh;

	use namespace starling_internal;
	
	public class MeshDataMerger
	{
		/** The maximum number of vertices that fit into one MeshBatch. */
		private static const MAX_NUM_VERTICES:int = 65535;
		
		public var _mergedVertexData:VertexData;
		public var _mergedIndexData:IndexData;
		
		public var vertexID:int;
		public var indexID:int;
		
		public var numMeshes:int;
		
		private var _vbProxy:VertexBuffer3DProxy;
		
		private var _ibProxy:IndexBuffer3DProxy;
		
		public function MeshDataMerger()
		{
			_mergedVertexData = new VertexData;
			_mergedIndexData = new IndexData;
		}
		
		public function canAddMesh(mesh:Mesh):Boolean
		{
			if (vertexID == 0)
				return true;
			if (mesh.numVertices + vertexID > MAX_NUM_VERTICES) 
				return false;
			return true;
		}
		
		public function getVertexBuffer():VertexBuffer3DProxy
		{
			if(!_vbProxy)
			{
				//todo: 这里其实不能使用共享的buffer，因为这个buffer需要使用很长世间，但是现在vertexSizeIn32Bits是5，不会和3D的冲突
				_vbProxy = Starling.current.sharedBufferManager.getProperVertexBuffer(vertexID, _mergedVertexData.vertexSizeIn32Bits);
				_vbProxy.fullUploadFromDomainMemory(_mergedVertexData.rawData, 0, 0);
			}
			return _vbProxy;
		}
		
		public function getIndexBuffer():IndexBuffer3DProxy
		{
			if(!_ibProxy)
			{
				_ibProxy = Starling.current.sharedBufferManager.getProperNormalIndexBufferAndUploadData(indexID, _mergedIndexData.rawData);
			}
			return _ibProxy;
		}
		
		
		
		public function addMesh(mesh:Mesh, matrix:Matrix, alpha:Number):void
		{
			
			if(mesh.numVertices>0)
			{
				_vbProxy = null;
				_ibProxy = null;
				
				var vertexData:VertexData = mesh._vertexData;
				var indexData:IndexData = mesh._indexData;
				vertexData.copyTo(_mergedVertexData, vertexID, matrix);
				indexData.copyTo(_mergedIndexData, indexID, vertexID);
				
				if(alpha!=1.0)
					_mergedVertexData.scaleAlphas("color", alpha, vertexID, vertexData.numVertices);
				
				vertexID += vertexData.numVertices;
				indexID += indexData.numIndices;
				
				numMeshes ++;
			}
			else
			{
				//trace("empty mesh!!!!");
				numMeshes ++;
			}
		}
		
		public function clear():void
		{
			_mergedVertexData.numVertices = numMeshes = indexID = vertexID = 0;
			_vbProxy = null;
			_ibProxy = null;
		}
		
		public function dispose():void
		{
			_mergedVertexData.clear();
			_mergedVertexData = null;
			_mergedIndexData.clear();
			_mergedIndexData = null;
		}
	}
}