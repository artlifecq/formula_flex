// =================================================================================================
//
//	Starling Framework
//	Copyright Gamua GmbH. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package starling.rendering
{
    import flash.geom.Matrix;
    
    import starling.display.Mesh;
    import starling.display.MeshBatch;
    import starling.utils.MeshSubset;

    /** This class manages a list of mesh batches of different types;
     *  it acts as a "meta" MeshBatch that initiates all rendering.
     */
    internal class BatchProcessor
    {
        private var _batches:Vector.<MeshBatch>;
        private var _batchPool:BatchPool;
        private var _currentBatch:MeshBatch;
        private var _currentStyleType:Class;
        private var _onBatchComplete:Function;

        // helper objects
        private static var sMeshSubset:MeshSubset = new MeshSubset();

        /** Creates a new batch processor. */
        public function BatchProcessor()
        {
            _batches = new <MeshBatch>[];
            _batchPool = new BatchPool();
        }

        /** Disposes all batches (including those in the reusable pool). */
        public function dispose():void
        {
            for each (var batch:MeshBatch in _batches)
                batch.dispose();

            _batches.length = 0;
            _batchPool.purge();
            _currentBatch = null;
            _onBatchComplete = null;
        }

        /** Adds a mesh to the current batch, or to a new one if the current one does not support
         *  it. Whenever the batch changes, <code>onBatchComplete</code> is called for the previous
         *  one.
         *
         *  @param mesh       the mesh to add to the current (or new) batch.
         *  @param state      the render state from which to take the current settings for alpha,
         *                    modelview matrix, and blend mode.
         *  @param subset     the subset of the mesh you want to add, or <code>null</code> for
         *                    the complete mesh.
         *  @param ignoreTransformations   when enabled, the mesh's vertices will be added
         *                    without transforming them in any way (no matter the value of the
         *                    state's <code>modelviewMatrix</code>).
         */
        public function addMesh(mesh:Mesh, state:RenderState, subset:MeshSubset=null,
                                ignoreTransformations:Boolean=false):void
        {
            if (subset == null)
            {
                subset = sMeshSubset;
                subset.vertexID = subset.indexID = 0;
                subset.numVertices = mesh.numVertices;
                subset.numIndices  = mesh.numIndices;
            }
            else
            {
                if (subset.numVertices < 0) subset.numVertices = mesh.numVertices - subset.vertexID;
                if (subset.numIndices  < 0) subset.numIndices  = mesh.numIndices  - subset.indexID;
            }

            if (subset.numVertices > 0)
            {
                if (_currentBatch == null || !_currentBatch.canAddMesh(mesh, subset.numVertices))
                {
                    finishBatch();

                    _currentStyleType = mesh.style.type;
                    _currentBatch = _batchPool.get(_currentStyleType);
                    _currentBatch.blendMode = state ? state.blendMode : mesh.blendMode;
                    _batches[_batches.length] = _currentBatch;
                }

                var matrix:Matrix = state ? state._modelviewMatrix : null;
                var alpha:Number  = state ? state._alpha : 1.0;

                _currentBatch.addMesh(mesh, matrix, alpha, subset, ignoreTransformations);
            }
        }

        /** Finishes the current batch, i.e. call the 'onComplete' callback on the batch and
         *  prepares initialization of a new one. */
        public function finishBatch():void
        {
            var meshBatch:MeshBatch = _currentBatch;

            if (meshBatch)
            {
                _currentBatch = null;
                _currentStyleType = null;

                if (_onBatchComplete != null)
                    _onBatchComplete(meshBatch);
            }
        }

        /** Clears all batches and adds them to a pool so they can be reused later. */
        public function clear():void
        {
            var numBatches:int = _batches.length;

            for (var i:int=0; i<numBatches; ++i)
                _batchPool.put(_batches[i]);

            _batches.length = 0;
            _currentBatch = null;
            _currentStyleType = null;
        }

        /** Returns the batch at a certain index. */
        public function getBatchAt(batchID:int):MeshBatch
        {
			if(batchID < 0 || batchID >= _batches.length)
			{
				trace("BatchProcessor.getBatchAt RangeError: Error #1125 _batches.length =",_batches.length, "batchID=",batchID);
				return null;
			}
            return _batches[batchID];
        }

        /** Disposes all batches that are currently unused. */
        public function trim():void
        {
            _batchPool.purgeUnactivated();
        }


        /** The number of batches currently stored in the BatchProcessor. */
        public function get numBatches():int { return _batches.length; }

        /** This callback is executed whenever a batch is finished and replaced by a new one.
         *  The finished MeshBatch is passed to the callback. Typically, this callback is used
         *  to actually render it. */
        public function get onBatchComplete():Function { return _onBatchComplete; }
        public function set onBatchComplete(value:Function):void { _onBatchComplete = value; }
    }
}

import flash.utils.Dictionary;

import away3d.tick.Tick;

import starling.display.MeshBatch;

class BatchPool
{
    private var _batchLists:Dictionary;
	private static const PURGE_UNACTIVATED_TIME:int = 10*1000;
	
    public function BatchPool()
    {
        _batchLists = new Dictionary();
    }

    public function purge():void
    {
        for each (var batchList:Vector.<MeshBatch> in _batchLists)
        {
            for (var i:int=0; i<batchList.length; ++i)
                batchList[i].dispose();

            batchList.length = 0;
        }
    }
	
	public function purgeUnactivated():void
	{
		var meshBatch:MeshBatch;
		var timeNow:int = Tick.instance.time;
		var tempList:Vector.<MeshBatch>;
		var len:int;
		for each (var batchList:Vector.<MeshBatch> in _batchLists)
		{
			if(batchList.length == 0)continue;
			
			tempList = batchList.concat();
			len = tempList.length;
			batchList.length = 0;
			
			for (var i:int=0; i<len; ++i)
			{
				meshBatch = tempList[i];
				if(timeNow - meshBatch.lastActiveTime > PURGE_UNACTIVATED_TIME) 
				{
					meshBatch.dispose();
				}else{
					batchList.push(meshBatch);
				}
			}
		}
	}

    public function get(styleType:Class):MeshBatch
    {
        var batchList:Vector.<MeshBatch> = _batchLists[styleType];
        if (batchList == null)
        {
            batchList = new <MeshBatch>[];
            _batchLists[styleType] = batchList;
        }

        if (batchList.length > 0) return batchList.pop();
        else return new MeshBatch(true);
    }

    public function put(meshBatch:MeshBatch):void
    {
        var styleType:Class = meshBatch.style.type;
        var batchList:Vector.<MeshBatch> = _batchLists[styleType];
        if (batchList == null)
        {
            batchList = new <MeshBatch>[];
            _batchLists[styleType] = batchList;
        }
		
		/* 为了保证性能，这里注释掉
		if(batchList.indexOf(meshBatch) != -1)
		{
			return;
		}*/
		
		meshBatch.clear();
        batchList[batchList.length] = meshBatch;
    }
}
