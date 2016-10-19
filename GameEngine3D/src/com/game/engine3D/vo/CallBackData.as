package com.game.engine3D.vo
{
	/**
	 *
	 * 回调数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 下午1:26:38
	 *
	 */
	public class CallBackData
	{
		public var callBackFun : Function;
		public var cbFunParames : Array = [];

		public function CallBackData($callBackFun : Function, $cbFunParames : Array)
		{
			callBackFun = $callBackFun;
			cbFunParames = $cbFunParames;
		}
	}
}
