package com.game.engine3D.core.interfaces
{
	import away3d.containers.ObjectContainer3D;

	public interface IObject
	{
		function get graphicDis() : ObjectContainer3D;
		function set graphicDis(value : ObjectContainer3D) : void;
		function get parent() : ObjectContainer3D;
		function set parent(value : ObjectContainer3D) : void;
		function get visible() : Boolean;
		function set visible(value : Boolean) : void;
		function get alpha():Number;
		function set alpha(value:Number):void;
		function get x() : Number;
		function set x(value : Number) : void;
		function get y() : Number;
		function set y(value : Number) : void;
		function get scaleX() : Number;
		function set scaleX(value : Number) : void;
		function get scaleY() : Number;
		function set scaleY(value : Number) : void;
		function get offsetX() : Number;
		function set offsetX(value : Number) : void;
		function get offsetY() : Number;
		function set offsetY(value : Number) : void;
		function destroy() : void;
	}
}