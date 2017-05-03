package starling.textures
{
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	import starling.rendering.VertexData;
	import starling.utils.MatrixUtil;

	public class TextureHelper
	{
		private static var sRectangle:Rectangle = new Rectangle();
		private static var sMatrix:Matrix = new Matrix();
		private static var sPoint:Point = new Point();
		
		/** Sets up a VertexData instance with the correct positions for 4 vertices so that
		 *  the texture can be mapped onto it unscaled. If the texture has a <code>frame</code>,
		 *  the vertices will be offset accordingly.
		 *
		 *  @param vertexData  the VertexData instance to which the positions will be written.
		 *  @param vertexID    the start position within the VertexData instance.
		 *  @param attrName    the attribute name referencing the vertex positions.
		 *  @param bounds      useful only for textures with a frame. This will position the
		 *                     vertices at the correct position within the given bounds,
		 *                     distorted appropriately.
		 */
		public static function setupVertexPositions(texture:IStarlingTexture,vertexData:VertexData, vertexID:int=0,
											 attrName:String="position",
											 bounds:Rectangle=null):void
		{
			var width:Number    = texture.width;
			var height:Number   = texture.height;
			
			sRectangle.setTo(0, 0, width, height);
			
			vertexData.setPoint(vertexID,     attrName, sRectangle.left,  sRectangle.top);
			vertexData.setPoint(vertexID + 1, attrName, sRectangle.right, sRectangle.top);
			vertexData.setPoint(vertexID + 2, attrName, sRectangle.left,  sRectangle.bottom);
			vertexData.setPoint(vertexID + 3, attrName, sRectangle.right, sRectangle.bottom);
			
			if (bounds)
			{
				var scaleX:Number = bounds.width  / width;
				var scaleY:Number = bounds.height / height;
				
				if (scaleX != 1.0 || scaleY != 1.0 || bounds.x != 0 || bounds.y != 0)
				{
					sMatrix.identity();
					sMatrix.scale(scaleX, scaleY);
					sMatrix.translate(bounds.x, bounds.y);
					vertexData.transformPoints(attrName, sMatrix, vertexID, 4);
				}
			}
		}
		
		/** Sets up a VertexData instance with the correct texture coordinates for
		 *  4 vertices so that the texture is mapped to the complete quad.
		 *
		 *  @param vertexData  the vertex data to which the texture coordinates will be written.
		 *  @param vertexID    the start position within the VertexData instance.
		 *  @param attrName    the attribute name referencing the vertex positions.
		 */
		public static function setupTextureCoordinates(texture:IStarlingTexture,vertexData:VertexData, vertexID:int=0,
												attrName:String="texCoords"):void
		{
			setTexCoords(texture,vertexData, vertexID    , attrName, 0.0, 0.0);
			setTexCoords(texture,vertexData, vertexID + 1, attrName, 1.0, 0.0);
			setTexCoords(texture,vertexData, vertexID + 2, attrName, 0.0, 1.0);
			setTexCoords(texture,vertexData, vertexID + 3, attrName, 1.0, 1.0);
		}
		
		/** Transforms the given texture coordinates from the local coordinate system
		 *  into the root texture's coordinate system. */
		public static function localToGlobal(texture:IStarlingTexture,u:Number, v:Number, out:Point=null):Point
		{
			if (out == null) out = new Point();
			if (texture == texture.root) out.setTo(u, v);
			else MatrixUtil.transformCoords(texture.transformationMatrixToRoot, u, v, out);
			return out;
		}
		
		/** Transforms the given texture coordinates from the root texture's coordinate system
		 *  to the local coordinate system. */
		public static function globalToLocal(texture:IStarlingTexture,u:Number, v:Number, out:Point=null):Point
		{
			if (out == null) out = new Point();
			if (texture == texture.root) out.setTo(u, v);
			else
			{
				sMatrix.identity();
				sMatrix.copyFrom(texture.transformationMatrixToRoot);
				sMatrix.invert();
				MatrixUtil.transformCoords(sMatrix, u, v, out);
			}
			return out;
		}
		
		/** Writes the given texture coordinates to a VertexData instance after transforming
		 *  them into the root texture's coordinate system. That way, the texture coordinates
		 *  can be used directly to sample the texture in the fragment shader. */
		public static function setTexCoords(texture:IStarlingTexture,vertexData:VertexData, vertexID:int, attrName:String,
									 u:Number, v:Number):void
		{
			localToGlobal(texture,u, v, sPoint);
			vertexData.setPoint(vertexID, attrName, sPoint.x, sPoint.y);
		}
		
		/** Reads a pair of texture coordinates from the given VertexData instance and transforms
		 *  them into the current texture's coordinate system. (Remember, the VertexData instance
		 *  will always contain the coordinates in the root texture's coordinate system!) */
		public static function getTexCoords(texture:IStarlingTexture,vertexData:VertexData, vertexID:int,
									 attrName:String="texCoords", out:Point=null):Point
		{
			if (out == null) out = new Point();
			vertexData.getPoint(vertexID, attrName, out);
			return globalToLocal(texture,out.x, out.y, out);
		}
		
		public static function get maxSize():int
		{
			var target:Starling = Starling.current;
			var profile:String = target ? target.profile : "baseline";
			
			if (profile == "baseline" || profile == "baselineConstrained")
				return 2048;
			else
				return 4096;
		}
	}
}