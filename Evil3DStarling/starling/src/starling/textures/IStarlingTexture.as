package starling.textures
{
	import flash.geom.Matrix;
	
	import away3d.events.IEventDispatcher;
	import away3d.textures.ITexture;
	
	public interface IStarlingTexture extends ITexture,IEventDispatcher
	{
		function get transformationMatrix():Matrix;
		
		function get transformationMatrixToRoot():Matrix;
		
		function get key():String;
		function set key(value:String):void;
		
		function get root():ConcreteTexture;

		function get disposed():Boolean;
		
		function get referencedMeshCount():uint;
		function set referencedMeshCount(value:uint):void;
	}
}