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
    import away3d.arcane;
    import away3d.core.managers.Stage3DProxy;
    
    import starling.textures.IStarlingTexture;
    import starling.utils.RenderUtil;

	use namespace arcane;

    /** An effect drawing a mesh of textured vertices.
     *  This is the standard effect that is the base for all fragment filters;
     *  if you want to create your own fragment filters, you will have to extend this class.
     *
     *  <p>For more information about the usage and creation of effects, please have a look at
     *  the documentation of the parent class, "Effect".</p>
     *
     *  @see Effect
     *  @see MeshEffect
     *  @see starling.filters.FragmentFilter
     */
    public class FilterEffect extends Effect
    {
        /** The vertex format expected by <code>uploadVertexData</code>:
         *  <code>"position:float2, texCoords:float2"</code> */
        public static const VERTEX_FORMAT:VertexDataFormat =
            Effect.VERTEX_FORMAT.extend("texCoords:float2");

        /** The AGAL code for the standard vertex shader that most filters will use.
         *  It simply transforms the vertex coordinates to clip-space and passes the texture
         *  coordinates to the fragment program (as 'v0'). */
        public static const STD_VERTEX_SHADER:String =
            "m44 op, va0, vc0 \n"+  // 4x4 matrix transform to output clip-space
            "mov v0, va1";          // pass texture coordinates to fragment program

        protected var _texture:IStarlingTexture;

        /** Creates a new FilterEffect instance. */
        public function FilterEffect()
        {
        }

        /** This method is called by <code>render</code>, directly before
         *  <code>context.drawTriangles</code>. It activates the program and sets up
         *  the context with the following constants and attributes:
         *
         *  <ul>
         *    <li><code>vc0-vc3</code> — MVP matrix</li>
         *    <li><code>va0</code> — vertex position (xy)</li>
         *    <li><code>va1</code> — texture coordinates (uv)</li>
         *    <li><code>fs0</code> — texture</li>
         *  </ul>
         */
        override protected function beforeDraw(stage3DProxy:Stage3DProxy):void
        {
            super.beforeDraw(stage3DProxy);

            if (_texture)
            {
				stage3DProxy.setTextureAt(0,_texture.root);
                vertexFormat.setVertexBufferAt(stage3DProxy, 1, vertexBuffer, "texCoords");
            }
        }

        /** This method is called by <code>render</code>, directly after
         *  <code>context.drawTriangles</code>. Resets texture and vertex buffer attributes. */
        override protected function afterDraw(stage3DProxy:Stage3DProxy):void
        {
            if (_texture)
            {
				stage3DProxy.setTextureAt(0, null);
				stage3DProxy.setVertexBufferAt(1, null);
            }

            super.afterDraw(stage3DProxy);
        }

        /** Creates an AGAL source string with a <code>tex</code> operation, including an options
         *  list with the appropriate format flag. This is just a convenience method forwarding
         *  to the respective RenderUtil method.
         *
         *  @see starling.utils.RenderUtil#createAGALTexOperation()
         */
        protected static function tex(resultReg:String, uvReg:String, sampler:int, texture:IStarlingTexture,
                                      convertToPmaIfRequired:Boolean=true):String
        {
            return RenderUtil.createAGALTexOperation(resultReg, uvReg, sampler, texture,
                convertToPmaIfRequired);
        }

        /** The data format that this effect requires from the VertexData that it renders:
         *  <code>"position:float2, texCoords:float2"</code> */
        override public function get vertexFormat():VertexDataFormat { return VERTEX_FORMAT; }

        /** The texture to be mapped onto the vertices. */
        public function get texture():IStarlingTexture { return _texture; }
        public function set texture(value:IStarlingTexture):void 
		{
				_texture = value;
		}
		
		override protected function get programVariantName():uint
		{
			return RenderUtil.getTextureVariantBits(_texture);
		}
		
		override protected function get programBaseName():uint 
		{ 
			return ProgramNameID.FILTER_EFFECT;
		}
		
		override arcane function getVertexCode():String
		{
			if(_texture)
			{
				return STD_VERTEX_SHADER;
			}
			else
				return super.getVertexCode();
		}
		
		override arcane function getFragmentCode():String
		{
			if(_texture)
				return tex("oc", "v0", 0, _texture);
			else
				return super.getFragmentCode();
		}
    }
}
