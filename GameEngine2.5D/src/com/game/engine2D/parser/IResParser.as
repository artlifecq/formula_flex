package com.game.engine2D.parser
{
	import org.client.load.loader.multi.vo.LoadData;

	/**
	 *
	 * 资源解析器接口
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-29 上午10:12:35
	 *
	 */
	public interface IResParser
	{
		function load(fullSourchPath : String, priority : int, userData : Object = null) : void;
		function unload() : void;
		function get loadData() : LoadData;
		function extractor(className : String) : Object;
		function onLoadComplete(func : Function) : IResParser;
		function onLoadError(func : Function) : IResParser;
		function dispose() : void;
	}
}
