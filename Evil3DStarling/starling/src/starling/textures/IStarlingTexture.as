package starling.textures
{
	import flash.geom.Matrix;
	
	import away3d.events.IEventDispatcher;
	import away3d.textures.ITexture;
	
	public interface IStarlingTexture extends ITexture,IEventDispatcher
	{
		function get transformationMatrix():Matrix;
		
		function get transformationMatrixToRoot():Matrix;
		
		function get root():ConcreteTexture;

		function get disposed():Boolean;
		
		function get referencedMeshCount():int;
		function set referencedMeshCount(value:int):void;
		
		function set isDynamic(value:Boolean):void;
		function get isDynamic():Boolean;
		
		function set key(value:String):void;
		function get key():String;
	}
}