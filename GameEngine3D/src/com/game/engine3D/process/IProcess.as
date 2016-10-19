package com.game.engine3D.process
{

	/**
	 *
	 * 流程接口
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午3:12:31
	 *
	 */
	public interface IProcess
	{
		function set fromPercent(value : Number) : void;
		function set toPercent(value : Number) : void;
		function setProcessPercent(value : Number) : void;
		function processHandler(percent : Number) : void;
		function startProcess() : void;
		function completeProcess() : void;
		function get isProcessing() : Boolean;
		function get isProcessed() : Boolean;
		function setOnCompleteNotify(fun : Function) : void;
		function getState() : String;
		function dispose() : void;
	}
}
