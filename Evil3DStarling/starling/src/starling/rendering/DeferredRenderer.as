package starling.rendering
{
	import flash.geom.Matrix;
	
	import starling.core.starling_internal;
	import starling.display.Interoperation3DContainer;
	import starling.display.Mesh;
	import starling.rendering.deferred.Context3DOperator;
	import starling.rendering.deferred.Inter3DOperator;
	import starling.rendering.deferred.OperatorPool;
	import starling.rendering.deferred.RenderEffectOperator;
	import starling.rendering.deferred.RenderMeshListOperator;
	import starling.rendering.deferred.StencilOperator;
	import starling.styles.MeshStyle;
	
	use namespace starling_internal;
	
	public class DeferredRenderer
	{
		private var _painter:Painter;
		private var _meshDataMergers:Vector.<MeshDataMerger>;
		private var _currentMergerPosition:int;
		private var _currentMeshDataMerger:MeshDataMerger;
		
		private var _currentStyle:MeshStyle;
		private var _renderOperators:Vector.<Context3DOperator>;
		private var _opPos:int;		
		private var _operatorPool:OperatorPool;
		
		private var _runningOp:Boolean;
		
		public function DeferredRenderer(painter:Painter)
		{
			_painter = painter;
			_meshDataMergers = new Vector.<MeshDataMerger>;
			_currentMeshDataMerger = _meshDataMergers[_currentMergerPosition] = new MeshDataMerger;
			
			_renderOperators = new Vector.<Context3DOperator>;
			_operatorPool = new OperatorPool;
			_opPos = -1;
		}
		
		public function clear():void
		{
			while(_opPos>=0)
			{
				_operatorPool.put(_renderOperators[_opPos]);
				_opPos--;
			}
			_opPos = -1;
			_currentStyle = null;
			_renderOperators.length = 0;
			
			while(_currentMergerPosition>=0)
			{
				_meshDataMergers[_currentMergerPosition].clear();
				_currentMergerPosition--;
			}
			_currentMergerPosition = 0;
			_currentMeshDataMerger = _meshDataMergers[0];
		}
		
		
		public function addEffect(effect:Effect, numTriangles:int):void
		{
			if(_runningOp)
				throw new Error("渲染时禁止插入operation!");
			breakBatch();
			var op:RenderEffectOperator = _operatorPool.get(Context3DOperator.RENDER_EFFECT) as RenderEffectOperator;
			_renderOperators[++_opPos] = op;
			op.effect = effect;
			op.numTriangles = numTriangles;
			op.renderState.copyFrom(_painter._state);
		}
		
		public function addInter3D(Inter3D:Interoperation3DContainer):void
		{
			if(_runningOp)
				throw new Error("渲染时禁止插入operation!");
			breakBatch();
			var op:Inter3DOperator = _operatorPool.get(Context3DOperator.INTER_3D) as Inter3DOperator;
			_renderOperators[++_opPos] = op;
			op.interContainer = Inter3D;
		}
		
		public function addMesh(mesh:Mesh):void
		{
			if(_runningOp)
				throw new Error("渲染时禁止插入operation!");
			
			if(mesh.numVertices<=0)
				return;
			
			if(!_currentMeshDataMerger.canAddMesh(mesh))
			{
				breakBatch();
				_currentMergerPosition++;
				if(_meshDataMergers.length <= _currentMergerPosition)
					_meshDataMergers[_currentMergerPosition] = new MeshDataMerger;
				_currentMeshDataMerger = _meshDataMergers[_currentMergerPosition];
			}
			
			
			if(_currentStyle && _currentStyle.canBatchWith(mesh.style))
			{
				//trace("do nothing");
			}
			else
			{
				breakBatch();
				_currentStyle  = mesh.style;
				
				var renderOperator:RenderMeshListOperator = _operatorPool.get(Context3DOperator.RENDER_MESH_LIST) as RenderMeshListOperator;
				renderOperator.meshDataMerger = _currentMeshDataMerger;
				_renderOperators[++_opPos] = renderOperator;
				renderOperator.firstRenderable = mesh;
				renderOperator.firstIndexID = _currentMeshDataMerger.indexID;
				renderOperator.firstVertexID = _currentMeshDataMerger.vertexID;
				
				
				renderOperator.renderState.copyFrom(_painter._state, true);
			}
			
			var matrix:Matrix = _painter._state._modelviewMatrix;
			var alpha:Number  = _painter._state._alpha;
			_currentMeshDataMerger.addMesh(mesh, matrix, alpha);
		}
		
		public function setStencilActions(triangleFace:String="frontAndBack", compareMode:String="always", actionOnBothPass:String="keep", actionOnDepthFail:String="keep", actionOnDepthPassStencilFail:String="keep"):void
		{
			if(_runningOp)
				throw new Error("渲染时禁止插入operation!");
			var op:StencilOperator = _operatorPool.get(Context3DOperator.STENCIL_TEST) as StencilOperator;
			_renderOperators[++_opPos] = op;
			op.op = StencilOperator.SET_STENCIL_ACTIONS;
			op.triangleFace = triangleFace;
			op.compareMode = compareMode;
			op.actionOnBothPass = actionOnBothPass;
			op.actionOnDepthFail = actionOnDepthFail;
			op.actionOnDepthPassStencilFail = actionOnDepthPassStencilFail;
		}
		
		public function setStencilReferenceValue(referenceValue:uint, readMask:uint=255, writeMask:uint=255):void
		{
			if(_runningOp)
				throw new Error("渲染时禁止插入operation!");
			var op:StencilOperator = _operatorPool.get(Context3DOperator.STENCIL_TEST) as StencilOperator;
			_renderOperators[++_opPos] = op;
			op.op = StencilOperator.SET_STENCIL_REFERENCE;
			op.referenceValue = referenceValue;
			op.readMask = readMask;
			op.writeMask = writeMask;
		}
		
		public function breakBatch():void
		{
			if(_opPos>=0 && _currentStyle)
			{
				var renderOp:RenderMeshListOperator = _renderOperators[_opPos] as RenderMeshListOperator;
				renderOp.lastIndexID = _currentMeshDataMerger.indexID;
				renderOp.lastVertexID = _currentMeshDataMerger.vertexID;
				_currentStyle = null;
			}
		}
		
		
		public function deferredRender():void
		{
			breakBatch();
			_runningOp = true;
			for(var i:int = 0; i<_opPos+1; i++)
			{
				_renderOperators[i].execute();
			}
			_runningOp = false;
		}
		
		public function dispose():void
		{
			while(_opPos>=0)
			{
				_operatorPool.put(_renderOperators[_opPos]);
				_opPos--;
			}
			_renderOperators.length = 0;
			
			for each( var merger:MeshDataMerger in _meshDataMergers)
			{
				merger.dispose();
			}
			_meshDataMergers.length = 0;
		}
	}
}