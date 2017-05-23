package starling.rendering.deferred
{
	import flash.utils.getQualifiedClassName;
	
	import away3d.core.managers.Stage3DProxy;
	import away3d.log.Log;
	
	import starling.core.Starling;
	import starling.core.starling_internal;
	import starling.rendering.Effect;
	import starling.rendering.Painter;
	import starling.rendering.RenderState;

	use namespace starling_internal;
	public class RenderEffectOperator extends Context3DOperator
	{
		
		public var effect:Effect;
		public var numTriangles:int;
		public var renderState:RenderState;
		
		public function RenderEffectOperator():void
		{
			renderState = new RenderState(Stage3DProxy.getInstance());
		}
		
		override public function execute():void
		{
			var painter:Painter = Starling.current.painter;
			var oldState:RenderState = painter._state;
			painter._state = renderState;
			painter.prepareToDraw();
			
			try
			{
				effect.render(0, numTriangles);
			}
			catch(e:Error)
			{
				Log.error("RenderEffectOperator Execute Error: effect=" + effect + "," + getQualifiedClassName(effect) + "\n" + e.message);
			}
			
			painter._state = oldState;
		}
		
		override public function clear():void
		{
			effect = null;
		}
	}
}