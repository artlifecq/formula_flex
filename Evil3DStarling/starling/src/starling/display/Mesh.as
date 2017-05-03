// =================================================================================================
//
//  Starling Framework
//  Copyright Gamua GmbH. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package starling.display
{
    import flash.geom.Point;
    import flash.geom.Rectangle;
    
    import away3d.events.Event;
    
    import starling.core.Starling;
    import starling.core.starling_internal;
    import starling.rendering.IndexData;
    import starling.rendering.Painter;
    import starling.rendering.VertexData;
    import starling.rendering.VertexDataFormat;
    import starling.styles.IMeshStyle;
    import starling.styles.MeshStyle;
    import starling.textures.IStarlingTexture;
    import starling.utils.MatrixUtil;
    import starling.utils.MeshUtil;
    import starling.utils.Pool;

    use namespace starling_internal;

    /** The base class for all tangible (non-container) display objects, spawned up by a number
     *  of triangles.
     *
     *  <p>Since Starling uses Stage3D for rendering, all rendered objects must be constructed
     *  from triangles. A mesh stores the information of its triangles through VertexData and
     *  IndexData structures. The default format stores position, color and texture coordinates
     *  for each vertex.</p>
     *
     *  <p>How a mesh is rendered depends on its style. Per default, this is an instance
     *  of the <code>MeshStyle</code> base class; however, subclasses may extend its behavior
     *  to add support for color transformations, normal mapping, etc.</p>
     *
     *  @see MeshBatch
     *  @see starling.styles.MeshStyle
     *  @see starling.rendering.VertexData
     *  @see starling.rendering.IndexData
     */
    public class Mesh extends DisplayObject implements IMeshStyle
    {
        /** @private */ internal var _style:MeshStyle;
        /** @private */ internal var _vertexData:VertexData;
        /** @private */ internal var _indexData:IndexData;
        /** @private */ internal var _pixelSnapping:Boolean;

        private static var sDefaultStyle:Class = MeshStyle;
        private static var sDefaultStyleFactory:Function = null;

        /** Creates a new mesh with the given vertices and indices.
         *  If you don't pass a style, an instance of <code>MeshStyle</code> will be created
         *  for you. Note that the format of the vertex data will be matched to the
         *  given style right away. */
        public function Mesh(vertexData:VertexData, indexData:IndexData, style:MeshStyle=null)
        {
            if (vertexData == null) throw new ArgumentError("VertexData must not be null");
            if (indexData == null)  throw new ArgumentError("IndexData must not be null");

            _vertexData = vertexData;
            _indexData = indexData;

            setStyle(style, false);
        }

        /** @inheritDoc */
        override public function dispose():void
        {
            _vertexData.clear();
            _indexData.clear();
			if(_stats)
			{
				_stats.dispose();
				_stats = null;
			}
			texture = null;
            super.dispose();
        }

        /** @inheritDoc */
        override public function hitTest(localPoint:Point):DisplayObject
        {
            if (!visible || !touchable || !hitTestMask(localPoint)) return null;
            else return MeshUtil.containsPoint(_vertexData, _indexData, localPoint) ? this : null;
        }

        /** @inheritDoc */
        override public function getBounds(targetSpace:DisplayObject, out:Rectangle=null):Rectangle
        {
            return MeshUtil.calculateBounds(_vertexData, this, targetSpace, out);
        }

        /** @inheritDoc */
        override public function render(painter:Painter):void
        {
            if (_pixelSnapping)
                MatrixUtil.snapToPixels(painter.state.modelviewMatrix, painter.pixelSize);

            painter.batchMesh(this);
        }

        /** Sets the style that is used to render the mesh. Styles (which are always subclasses of
         *  <code>MeshStyle</code>) provide a means to completely modify the way a mesh is rendered.
         *  For example, they may add support for color transformations or normal mapping.
         *
         *  <p>When assigning a new style, the vertex format will be changed to fit it.
         *  Do not use the same style instance on multiple objects! Instead, make use of
         *  <code>style.clone()</code> to assign an identical style to multiple meshes.</p>
         *
         *  @param meshStyle             the style to assign. If <code>null</code>, the default
         *                               style will be created.
         *  @param mergeWithPredecessor  if enabled, all attributes of the previous style will be
         *                               be copied to the new one, if possible.
         *  @see #defaultStyle
         *  @see #defaultStyleFactory
         */
        public function setStyle(meshStyle:MeshStyle=null, mergeWithPredecessor:Boolean=true):void
        {
            if (meshStyle == null) meshStyle = createDefaultMeshStyle();
            else if (meshStyle == _style) return;
            else if (meshStyle.target) meshStyle.target.setStyle();

            if (_style)
            {
                if (mergeWithPredecessor) meshStyle.copyFrom(_style);
                _style.setTarget(null);
            }

            _style = meshStyle;
            _style.setTarget(this, _vertexData, _indexData);
        }

        private function createDefaultMeshStyle():MeshStyle
        {
            var meshStyle:MeshStyle;

            if (sDefaultStyleFactory != null)
            {
                if (sDefaultStyleFactory.length == 0) meshStyle = sDefaultStyleFactory();
                else meshStyle = sDefaultStyleFactory(this);
            }

            if (meshStyle == null)
                meshStyle = new sDefaultStyle() as MeshStyle;

            return meshStyle;
        }

        // vertex manipulation

        /** The position of the vertex at the specified index, in the mesh's local coordinate
         *  system.
         *
         *  <p>Only modify the position of a vertex if you know exactly what you're doing, as
         *  some classes might not work correctly when their vertices are moved. E.g. the
         *  <code>Quad</code> class expects its vertices to spawn up a perfectly rectangular
         *  area; some of its optimized methods won't work correctly if that premise is no longer
         *  fulfilled or the original bounds change.</p>
         */
        public function getVertexPosition(vertexID:int, out:Point=null):Point
        {
            return _style.getVertexPosition(vertexID, out);
        }

        public function setVertexPosition(vertexID:int, x:Number, y:Number):void
        {
            _style.setVertexPosition(vertexID, x, y);
        }

        /** Returns the alpha value of the vertex at the specified index. */
        public function getVertexAlpha(vertexID:int):Number
        {
            return _style.getVertexAlpha(vertexID);
        }

        /** Sets the alpha value of the vertex at the specified index to a certain value. */
        public function setVertexAlpha(vertexID:int, alpha:Number):void
        {
            _style.setVertexAlpha(vertexID, alpha);
        }

        /** Returns the RGB color of the vertex at the specified index. */
        public function getVertexColor(vertexID:int):uint
        {
            return _style.getVertexColor(vertexID);
        }

        /** Sets the RGB color of the vertex at the specified index to a certain value. */
        public function setVertexColor(vertexID:int, color:uint):void
        {
            _style.setVertexColor(vertexID, color);
        }

        /** Returns the texture coordinates of the vertex at the specified index. */
        public function getTexCoords(vertexID:int, out:Point = null):Point
        {
            return _style.getTexCoords(vertexID, out);
        }

        /** Sets the texture coordinates of the vertex at the specified index to the given values. */
        public function setTexCoords(vertexID:int, u:Number, v:Number):void
        {
            _style.setTexCoords(vertexID, u, v);
        }

        // properties

        /** The vertex data describing all vertices of the mesh.
         *  Any change requires a call to <code>setRequiresRedraw</code>. */
        protected function get vertexData():VertexData { return _vertexData; }

        /** The index data describing how the vertices are interconnected.
         *  Any change requires a call to <code>setRequiresRedraw</code>. */
        protected function get indexData():IndexData { return _indexData; }

        /** The style that is used to render the mesh. Styles (which are always subclasses of
         *  <code>MeshStyle</code>) provide a means to completely modify the way a mesh is rendered.
         *  For example, they may add support for color transformations or normal mapping.
         *
         *  <p>The setter will simply forward the assignee to <code>setStyle(value)</code>.</p>
         *
         *  @default MeshStyle
         */
        public function get style():MeshStyle { return _style; }
        public function set style(value:MeshStyle):void
        {
            setStyle(value);
        }

        /** The texture that is mapped to the mesh (or <code>null</code>, if there is none). */
        public function get texture():IStarlingTexture { return _style.texture; }
        public function set texture(value:IStarlingTexture):void 
		{ 
			if(_style.texture != value)
			{
				if(_style.texture)
				{
					_style.texture.referencedMeshCount--;
					_style.texture.removeEventListener(Event.CHANGE, onTextureChange);
				}
				
				if(value)
				{
					value.referencedMeshCount++;
					value.addEventListener(Event.CHANGE, onTextureChange);
				}
			}
			
			_style.texture = value; 
		}
		
		private function onTextureChange(event:Event):void
		{
			if(event.data is IStarlingTexture)
			{
				texture = event.data as IStarlingTexture;
			}
		}

        /** Changes the color of all vertices to the same value.
         *  The getter simply returns the color of the first vertex. */
        public function get color():uint { return _style.color; }
        public function set color(value:uint):void { _style.color = value; }

        /** Controls whether or not the instance snaps to the nearest pixel. This can prevent the
         *  object from looking blurry when it's not exactly aligned with the pixels of the screen.
         *  @default false */
        public function get pixelSnapping():Boolean { return _pixelSnapping; }
        public function set pixelSnapping(value:Boolean):void { _pixelSnapping = value; }

        /** The total number of vertices in the mesh. */
        public function get numVertices():int { return _vertexData.numVertices; }

        /** The total number of indices referencing vertices. */
        public function get numIndices():int { return _indexData.numIndices; }

        /** The total number of triangles in this mesh.
         *  (In other words: the number of indices divided by three.) */
        public function get numTriangles():int { return _indexData.numTriangles; }

        /** The format used to store the vertices. */
        public function get vertexFormat():VertexDataFormat { return _style.vertexFormat; }

        // static properties

        /** The default style used for meshes if no specific style is provided. The default is
         *  <code>starling.rendering.MeshStyle</code>, and any assigned class must be a subclass
         *  of the same. */
        public static function get defaultStyle():Class { return sDefaultStyle; }
        public static function set defaultStyle(value:Class):void
        {
            sDefaultStyle = value;
        }

        /** A factory method that is used to create the 'MeshStyle' for a mesh if no specific
         *  style is provided. That's useful if you are creating a hierarchy of objects, all
         *  of which need to have a certain style. Different to the <code>defaultStyle</code>
         *  property, this method allows plugging in custom logic and passing arguments to the
         *  constructor. Return <code>null</code> to fall back to the default behavior (i.e.
         *  to instantiate <code>defaultStyle</code>). The <code>mesh</code>-parameter is optional
         *  and may be omitted.
         *
         *  <listing>
         *  Mesh.defaultStyleFactory = function(mesh:Mesh):MeshStyle
         *  {
         *      return new ColorizeMeshStyle(Math.random() * 0xffffff);
         *  }</listing>
         */
        public static function get defaultStyleFactory():Function { return sDefaultStyleFactory; }
        public static function set defaultStyleFactory(value:Function):void
        {
            sDefaultStyleFactory = value;
        }
		
		//=================================================================
		/**
		 *展示Starling显示对象的三角形网格状态，方便查找问题和性能优化
		 *@authour wewell
		 */	
		private function creatMeshStats():Shape
		{
			var numVertices:int = vertexData.numVertices;
			if(numVertices < 4)return null;
			
			var canvas:Shape = new Shape();
			canvas.lineStyle(1,0xFFFFFF,0.5);
			var p:Point = Pool.getPoint();
			var posAttrName:String = "position";
			vertexData.getPoint(0, posAttrName, p);
			var scaleX:Number = this.scaleX;
			var scaleY:Number = this.scaleY;
			var a:Point=Pool.getPoint(), b:Point=Pool.getPoint(), c:Point=Pool.getPoint(), d:Point=Pool.getPoint();
			var len:int = numVertices-4;
			for(var v:int=0; v<=len; v+=4)
			{
				vertexData.getPoint(v, posAttrName, a);
				vertexData.getPoint(v+1, posAttrName, b);
				vertexData.getPoint(v+2, posAttrName, c);
				vertexData.getPoint(v+3, posAttrName, d);
				
				canvas.moveTo(a.x * scaleX, a.y * scaleY);
				canvas.lineTo(b.x * scaleX, b.y * scaleY);
				canvas.lineTo(c.x * scaleX, c.y * scaleY);
				canvas.lineTo(a.x * scaleX, a.y * scaleY);
				
				canvas.moveTo(d.x * scaleX, d.y * scaleY);
				canvas.lineTo(c.x * scaleX, c.y * scaleY);
				canvas.lineTo(b.x * scaleX, b.y * scaleY);
				canvas.lineTo(d.x * scaleX, d.y * scaleY);
			}
			
			Pool.putPoint(p);
			Pool.putPoint(a);
			Pool.putPoint(b);
			Pool.putPoint(c);
			Pool.putPoint(d);
			
			canvas.isDebugStats = true;
			return canvas;
		}
		
		private var _stats:Shape;
		public function getMeshStats():Shape
		{
			if(!Starling.current.showMeshStats || isDebugStats)return null;
			if(!_stats)_stats = creatMeshStats();
			return _stats;
		}
		//=================================================================
		
    }
}
