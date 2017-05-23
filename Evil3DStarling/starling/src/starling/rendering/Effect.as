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
    import flash.display3D.Context3DProgramType;
    import flash.geom.Matrix3D;
    import flash.utils.Dictionary;
    import flash.utils.getQualifiedClassName;
    
    import away3d.arcane;
    import away3d.core.base.IndexBuffer3DProxy;
    import away3d.core.base.VertexBuffer3DProxy;
    import away3d.core.data.ShaderCache;
    import away3d.core.managers.AGALProgram3DCache;
    import away3d.core.managers.Stage3DProxy;
    import away3d.events.Event;
    import away3d.events.Stage3DEvent;
    
    import starling.core.Starling;
    import starling.utils.execute;
	
	use namespace arcane;

    /** An effect encapsulates all steps of a Stage3D draw operation. It configures the
     *  render context and sets up shader programs as well as index- and vertex-buffers, thus
     *  providing the basic mechanisms of all low-level rendering.
     *
     *  <p><strong>Using the Effect class</strong></p>
     *
     *  <p>Effects are mostly used by the <code>MeshStyle</code> and <code>FragmentFilter</code>
     *  classes. When you extend those classes, you'll be required to provide a custom effect.
     *  Setting it up for rendering is done by the base class, though, so you rarely have to
     *  initiate the rendering yourself. Nevertheless, it's good to know how an effect is doing
     *  its work.</p>
     *
     *  <p>Using an effect always follows steps shown in the example below. You create the
     *  effect, configure it, upload vertex data and then: draw!</p>
     *
     *  <listing>
     *  // create effect
     *  var effect:MeshEffect = new MeshEffect();
     *  
     *  // configure effect
     *  effect.mvpMatrix3D = painter.state.mvpMatrix3D;
     *  effect.texture = getHeroTexture();
     *  effect.color = 0xf0f0f0;
     *  
     *  // upload vertex data
     *  effect.uploadIndexData(indexData);
     *  effect.uploadVertexData(vertexData);
     *  
     *  // draw!
     *  effect.render(0, numTriangles);</listing>
     *
     *  <p>Note that the <code>VertexData</code> being uploaded has to be created with the same
     *  format as the one returned by the effect's <code>vertexFormat</code> property.</p>
     *
     *  <p><strong>Extending the Effect class</strong></p>
     *
     *  <p>The base <code>Effect</code>-class can only render white triangles, which is not much
     *  use in itself. However, it is designed to be extended; subclasses can easily implement any
     *  kinds of shaders.</p>
     *
     *  <p>Normally, you won't extend this class directly, but either <code>FilterEffect</code>
     *  or <code>MeshEffect</code>, depending on your needs (i.e. if you want to create a new
     *  fragment filter or a new mesh style). Whichever base class you're extending, you should
     *  override the following methods:</p>
     *
     *  <ul>
     *    <li><code>createProgram():Program</code> — must create the actual program containing 
     *        vertex- and fragment-shaders. A program will be created only once for each render
     *        context; this is taken care of by the base class.</li>
     *    <li><code>get programVariantName():uint</code> (optional) — override this if your
     *        effect requires different programs, depending on its settings. The recommended
     *        way to do this is via a bit-mask that uniquely encodes the current settings.</li>
     *    <li><code>get vertexFormat():String</code> (optional) — must return the
     *        <code>VertexData</code> format that this effect requires for its vertices. If
     *        the effect does not require any special attributes, you can leave this out.</li>
     *    <li><code>beforeDraw(context:Context3D):void</code> — Set up your context by
     *        configuring program constants and buffer attributes.</li>
     *    <li><code>afterDraw(context:Context3D):void</code> — Will be called directly after
     *        <code>context.drawTriangles()</code>. Clean up any context configuration here.</li>
     *  </ul>
     *
     *  <p>Furthermore, you need to add properties that manage the data you require on rendering,
     *  e.g. the texture(s) that should be used, program constants, etc. I recommend looking at
     *  the implementations of Starling's <code>FilterEffect</code> and <code>MeshEffect</code>
     *  classes to see how to approach sub-classing.</p>
     *
     *  @see FilterEffect
     *  @see MeshEffect
     *  @see starling.styles.MeshStyle
     *  @see starling.filters.FragmentFilter
     *  @see starling.utils.RenderUtil
     */
    public class Effect
    {
        /** The vertex format expected by <code>uploadVertexData</code>:
         *  <code>"position:float2"</code> */
        public static const VERTEX_FORMAT:VertexDataFormat =
            VertexDataFormat.fromString("position:float2");

        private var _vertexBuffer:VertexBuffer3DProxy;
        private var _vertexBufferSize:int; // in bytes
        private var _indexBuffer:IndexBuffer3DProxy;
        private var _indexBufferSize:int;  // in number of indices
        private var _indexBufferUsesQuadLayout:Boolean;
		
		private var _explicitVertexBuffer:VertexBuffer3DProxy;
		private var _explicitIndexBuffer:IndexBuffer3DProxy;

        private var _mvpMatrix3D:Matrix3D;
        private var _onRestore:Function;
        private var _programBaseName:String;
		
		
		//internal use
		public var useSharedBuffer:Boolean;

        // helper objects
        private static var sProgramNameCache:Dictionary = new Dictionary();
		
		arcane var _shaderCache:ShaderCache;

        /** Creates a new effect. */
        public function Effect()
        {
            _mvpMatrix3D = new Matrix3D();
            _programBaseName = getQualifiedClassName(this);

            // Handle lost context (using conventional Flash event for weak listener support)
			Stage3DProxy.getInstance().addEventListener(Stage3DEvent.CONTEXT3D_RECREATED, onContextCreated);
        }

        /** Purges the index- and vertex-buffers. */
        public function dispose():void
        {
			Stage3DProxy.getInstance().removeEventListener(Event.CONTEXT3D_CREATE, onContextCreated);
            purgeBuffers();
			
			if (_shaderCache) {
				AGALProgram3DCache.getInstance().freeProgram3D(_shaderCache);
				_shaderCache = null;
			}
        }

        private function onContextCreated(event:Stage3DEvent):void
        {
            purgeBuffers();
            execute(_onRestore, this);
        }

        /** Purges one or both of the vertex- and index-buffers. */
        public function purgeBuffers(vertexBuffer:Boolean=true, indexBuffer:Boolean=true):void
        {
            // We wrap the dispose calls in a try/catch block to work around a stage3D problem.
            // Since they are not re-used later, that shouldn't have any evil side effects.
			if(!useSharedBuffer)
			{
	            if (_vertexBuffer && vertexBuffer)
	            {
					_vertexBuffer.dispose();
	                _vertexBuffer = null;
	            }
			}

			if(!useSharedBuffer)
			{
	            if (_indexBuffer && indexBuffer)
	            {
	                try { _indexBuffer.dispose(); } catch (e:Error) {}
	                _indexBuffer = null;
	            }
			}
        }

        /** Uploads the given index data to the internal index buffer. If the buffer is too
         *  small, a new one is created automatically.
         *
         *  @param indexData   The IndexData instance to upload.
         *  @param bufferUsage The expected buffer usage. Use one of the constants defined in
         *                     <code>Context3DBufferUsage</code>. Only used when the method call
         *                     causes the creation of a new index buffer.
         */
        public function uploadIndexData(indexData:IndexData):void
        {
            var numIndices:int = indexData.numIndices;
            var isQuadLayout:Boolean = indexData.useQuadLayout;
            var wasQuadLayout:Boolean = _indexBufferUsesQuadLayout;

			if(useSharedBuffer)
			{
				if(isQuadLayout)
				{
					_indexBuffer = Starling.current.sharedBufferManager.getProperQuadIndexBuffer(numIndices);
				}
				else
				{
					_indexBuffer = Starling.current.sharedBufferManager.getProperNormalIndexBufferAndUploadData(numIndices, indexData.rawData)
				}
				_indexBufferUsesQuadLayout = isQuadLayout;
				
			}
			else
			{
	            if (_indexBuffer)
	            {
	                if (numIndices <= _indexBufferSize)
	                {
	                    if (!isQuadLayout || !wasQuadLayout)
	                    {
	                        indexData.uploadToIndexBuffer(_indexBuffer);
	                        _indexBufferUsesQuadLayout = isQuadLayout && numIndices == _indexBufferSize;
	                    }
	                }
	                else
	                    purgeBuffers(false, true);
	            }
	            if (_indexBuffer == null)
	            {
	                _indexBuffer = indexData.createIndexBuffer(true);
	                _indexBufferSize = numIndices;
	                _indexBufferUsesQuadLayout = isQuadLayout;
	            }
			}
        }

        /** Uploads the given vertex data to the internal vertex buffer. If the buffer is too
         *  small, a new one is created automatically.
         *
         *  @param vertexData  The VertexData instance to upload.
         *  @param bufferUsage The expected buffer usage. Use one of the constants defined in
         *                     <code>Context3DBufferUsage</code>. Only used when the method call
         *                     causes the creation of a new vertex buffer.
         */
        public function uploadVertexData(vertexData:VertexData,
                                         bufferUsage:String="staticDraw"):void
        {
			if(useSharedBuffer)
			{
				_vertexBuffer = Starling.current.sharedBufferManager.getProperVertexBuffer(vertexData.numVertices, vertexData.vertexSizeIn32Bits);
				vertexData.uploadToVertexBuffer(_vertexBuffer);
			}
			else
			{
	            if (_vertexBuffer)
	            {
	                if (vertexData.size <= _vertexBufferSize)
	                    vertexData.uploadToVertexBuffer(_vertexBuffer);
	                else
	                    purgeBuffers(true, false);
	            }
	            if (_vertexBuffer == null)
	            {
	                _vertexBuffer = vertexData.createVertexBuffer(true, bufferUsage);
	                _vertexBufferSize = vertexData.size;
	            }
			}
        }

        // rendering

        /** Draws the triangles described by the index- and vertex-buffers, or a range of them.
         *  This calls <code>beforeDraw</code>, <code>context.drawTriangles</code>, and
         *  <code>afterDraw</code>, in this order. */
        public function render(firstIndex:int=0, numTriangles:int=-1):void
        {
            if (numTriangles < 0) numTriangles = _indexBufferSize / 3;
            if (numTriangles == 0) return;

			var stage3DProxy:Stage3DProxy = Starling.current.stage3DProxy;
            beforeDraw(stage3DProxy);
			stage3DProxy.drawTriangles(indexBuffer, firstIndex, numTriangles, Stage3DProxy.STARLING_TYPE);
            afterDraw(stage3DProxy);
        }

        /** This method is called by <code>render</code>, directly before
         *  <code>context.drawTriangles</code>. It activates the program and sets up
         *  the context with the following constants and attributes:
         *
         *  <ul>
         *    <li><code>vc0-vc3</code> — MVP matrix</li>
         *    <li><code>va0</code> — vertex position (xy)</li>
         *  </ul>
         */
        protected function beforeDraw(stage3DProxy:Stage3DProxy):void
		{
			updateProgram(stage3DProxy);
			
			stage3DProxy.setProgramCache(_shaderCache);
			
			vertexFormat.setVertexBufferAt(stage3DProxy, 0, vertexBuffer, "position");
			stage3DProxy.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 0, mvpMatrix3D, true);
		}
		
		arcane function getVertexCode():String
		{
			return "m44 op, va0, vc0\n" + "seq v0, va0, va0\n";
		}
		
		arcane function getFragmentCode():String
		{
			return "mov oc, v0";
		}
		
		arcane function updateProgram(stage3DProxy:Stage3DProxy):void
		{
			var key:uint = programName;
			_shaderCache = AGALProgram3DCache.getInstance().getProgram2D(key);
			if(!_shaderCache)
			{
				_shaderCache = AGALProgram3DCache.getInstance().setProgram2D(key, getVertexCode(), getFragmentCode());
			}
		}

        /** This method is called by <code>render</code>, directly after
         *  <code>context.drawTriangles</code>. Resets vertex buffer attributes.
         */
        protected function afterDraw(stage3DProxy:Stage3DProxy):void
        {
			stage3DProxy.setVertexBufferAt(0, null);
        }

        // properties

        /** The function that you provide here will be called after a context loss.
         *  Call both "upload..." methods from within the callback to restore any vertex or
         *  index buffers. The callback will be executed with the effect as its sole parameter. */
        public function get onRestore():Function { return _onRestore; }
        public function set onRestore(value:Function):void { _onRestore = value; }

        /** The data format that this effect requires from the VertexData that it renders:
         *  <code>"position:float2"</code> */
        public function get vertexFormat():VertexDataFormat { return VERTEX_FORMAT; }

        /** The MVP (modelview-projection) matrix transforms vertices into clipspace. */
        public function get mvpMatrix3D():Matrix3D { return _mvpMatrix3D; }
        public function set mvpMatrix3D(value:Matrix3D):void { _mvpMatrix3D.copyFrom(value); }

        /** The internally used index buffer used on rendering. */
        protected function get indexBuffer():IndexBuffer3DProxy 
		{ 
			if(_explicitIndexBuffer)
				return _explicitIndexBuffer;
			else
				return _indexBuffer; 
		}

        /** The internally used vertex buffer used on rendering. */
        protected function get vertexBuffer():VertexBuffer3DProxy 
		{
			if(_explicitVertexBuffer)
				return _explicitVertexBuffer;
			else
				return _vertexBuffer; 
		}
        

		protected function get programVariantName():uint
		{
			return 0;
		}
		
		protected function get programBaseName():uint { return ProgramNameID.EFFECT; }
		
		protected function get programName():uint
		{
			return (programBaseName << 24) | programVariantName;
		}

		public function get explicitIndexBuffer():IndexBuffer3DProxy
		{
			return _explicitIndexBuffer;
		}

		public function set explicitIndexBuffer(value:IndexBuffer3DProxy):void
		{
			_explicitIndexBuffer = value;
		}

		public function get explicitVertexBuffer():VertexBuffer3DProxy
		{
			return _explicitVertexBuffer;
		}

		public function set explicitVertexBuffer(value:VertexBuffer3DProxy):void
		{
			_explicitVertexBuffer = value;
		}


    }
}
