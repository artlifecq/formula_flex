package com.game.engine3D.vo
{

	/**
	 *
	 * 异常上报数据
	 * @author L.L.M.Sunny
	 * 创建时间：2017-03-10 上午10:42:33
	 *
	 */
	public class ErrorReportData
	{
		/**
		 * 报错时的内存
		 */
		public var memory : uint = 0;
		/**
		 * 报错时的显存
		 */
		public var displayMemory : uint = 0;
		/**
		 * 最大可用显存
		 */
		public var maxDM : uint = 0;
		/**
		 * 报错时的帧率
		 */
		public var fps : uint = 0;
		/**
		 * 报错时的平均帧率
		 */
		public var avgFps : uint = 0;
		/**
		 * 客户端运行时间
		 */
		public var runTime : uint = 0;
		/**
		 * 2D顶点数
		 */
		public var vex2D : uint = 0;
		/**
		 * 3D顶点数
		 */
		public var vex3D : uint = 0;
		/**
		 * domainMemory
		 */
		public var heap : uint = 0;
		/**
		 * 2D drawCall
		 */
		public var draw2D : uint = 0;
		/**
		 * 3D drawCall
		 */
		public var draw3D : uint = 0;
		/**
		 * 舞台宽度
		 */
		public var stageWidth : uint = 0;
		/**
		 * 舞台高度
		 */
		public var stageHeight : uint = 0;
		/**
		 * 浏览器内核信息
		 */
		public var kernelInfo : String = "";
		/**
		 * 硬件驱动信息
		 */
		public var driverInfo : String = "";
		/**
		 * 错误信息
		 */
		public var errorInfo : String = "";

		public function ErrorReportData()
		{
		}
	}
}
