package com.client.view.loading
{
	import flash.display.DisplayObjectContainer;

	public interface ILoading
	{
		function set percent(value : Number) : void;
		function set title(text : String) : void;
		function destroy() : void;
		function show(parent : DisplayObjectContainer) : void;
		function hide() : void;
		function resize() : void;
	}
}
