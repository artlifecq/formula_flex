package starling.rendering.deferred
{
	import flash.utils.Dictionary;
	
	import away3d.core.managers.Stage3DProxy;
	
	import starling.core.Starling;
	import starling.core.starling_internal;
	import starling.display.Mesh;
	import starling.rendering.MeshDataMerger;
	import starling.rendering.MeshEffect;
	import starling.rendering.Painter;
	import starling.rendering.RenderState;
	import starling.styles.MeshStyle;

	use namespace starling_internal;
	public class RenderMeshListOperator extends Context3DOperator
	{
		
		private static var _effectDict:Dictionary = new Dictionary;
		
		public var meshDataMerger:MeshDataMerger;
		public var firstRenderable:Mesh;
		
		
		public var firstVertexID:int;
		public var lastVertexID:int;
		
		public var firstIndexID:int;
		public var lastIndexID:int;
		
		public var renderState:RenderState;
		
		public function RenderMeshListOperator()
		{
			renderState = new RenderState(Stage3DProxy.getInstance());
		}
		
		override public function execute():void
		{
			var style:MeshStyle = firstRenderable.style;
			var effect:MeshEffect = _effectDict[style.type];
			if(!effect)
			{
				effect = _effectDict[style.type] = style.createEffect();
			}
			
			renderState.alpha = 1.0;
			
			var painter:Painter = Starling.current.painter;
			var oldState:RenderState = painter._state;
			painter._state = renderState;
			painter.prepareToDraw();
			effect.explicitVertexBuffer = meshDataMerger.getVertexBuffer();
			effect.explicitIndexBuffer = meshDataMerger.getIndexBuffer();
			style.updateEffect(effect, renderState);
			effect.tinted = meshDataMerger._mergedVertexData.tinted;
			effect.render(firstIndexID, (lastIndexID - firstIndexID)/3);
			
			painter._state = oldState;
		}
		
		override public function clear():void
		{
			firstRenderable = null;
			firstVertexID = lastVertexID = firstIndexID = lastIndexID = -1;
		}
	}
}