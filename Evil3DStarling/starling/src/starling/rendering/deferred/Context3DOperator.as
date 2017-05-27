package starling.rendering.deferred
{
	import starling.core.starling_internal;

	use namespace starling_internal;
	public class Context3DOperator
	{
		public static const RENDER_MESH_LIST:int = 0;
		public static const STENCIL_TEST:int = 1;
		public static const RENDER_EFFECT:int = 2;
		public static const INTER_3D:int = 3;
		
		starling_internal var _type:int;
		
		public function execute():void
		{
			
		}
		
		public function clear():void
		{
			
		}
		
		public static function createOperator(type:int):Context3DOperator
		{
			var operator:Context3DOperator;
			switch(type)
			{
				case RENDER_MESH_LIST:
					operator =  new RenderMeshListOperator();
					break;
				case STENCIL_TEST:
					operator =  new StencilOperator();
					break;
				case RENDER_EFFECT:
					operator =  new RenderEffectOperator();
					break;
				case INTER_3D:
					operator = new Inter3DOperator();
			}
			operator._type = type;
			return operator;
		}
	}
}