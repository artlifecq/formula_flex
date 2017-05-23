package starling.rendering.deferred
{
	import starling.display.Interoperation3DContainer;

	public class Inter3DOperator extends Context3DOperator
	{
		public var interContainer:Interoperation3DContainer;
		
		public function RenderEffectOperator():void
		{
		}
		
		override public function execute():void
		{
			interContainer.doRender();
		}
		
		override public function clear():void
		{
			interContainer = null;
		}
	}
}