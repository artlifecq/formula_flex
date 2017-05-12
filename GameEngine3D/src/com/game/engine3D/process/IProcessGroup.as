package com.game.engine3D.process
{
	/**
	 *
	 * 流程接口
	 * @author L.L.M.Sunny
	 * 创建时间：2017-03-17 下午3:12:31
	 *
	 */
	public interface IProcessGroup extends IProcess
	{
		function isHangUpMaster(process : IProcess) : Boolean;
	}
}
