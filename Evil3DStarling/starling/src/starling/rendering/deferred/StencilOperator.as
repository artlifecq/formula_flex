package starling.rendering.deferred
{
	import flash.display3D.Context3D;
	
	import away3d.core.managers.Stage3DProxy;

	public class StencilOperator extends Context3DOperator
	{
		public static const SET_STENCIL_ACTIONS:int = 0;
		public static const SET_STENCIL_REFERENCE:int = 1;
		
		public var triangleFace:String = "frontAndBack";
		public var compareMode:String = "always";
		public var actionOnBothPass:String = "keep";
		public var actionOnDepthFail:String = "keep";
		public var actionOnDepthPassStencilFail:String = "keep";
		
		
		public var referenceValue:uint;
		public var readMask:uint;
		public var writeMask:uint;
		
		
		public var op:int;
		
		
		override public function execute():void
		{
			var context3D:Context3D = Stage3DProxy.getInstance().context3D;
			switch(op)
			{
				case SET_STENCIL_ACTIONS:
					context3D.setStencilActions(triangleFace, compareMode, actionOnBothPass, actionOnDepthFail, actionOnDepthPassStencilFail);
					break;
				case SET_STENCIL_REFERENCE:
					context3D.setStencilReferenceValue(referenceValue, readMask, writeMask);
					break;
			}
		}
		
		override public function clear():void
		{
			triangleFace = "frontAndBack";
			compareMode = "always";
			actionOnBothPass = "keep";
			actionOnDepthFail = "keep";
			actionOnDepthPassStencilFail = "keep";
		}
		
	}
}