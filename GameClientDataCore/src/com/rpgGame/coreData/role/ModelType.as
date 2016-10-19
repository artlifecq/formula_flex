package com.rpgGame.coreData.role
{

	/**
	 * 模型数据类型
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-25 下午5:50:25
	 *
	 */
	public class ModelType
	{
		/**
		 * 开始的bit
		 */
		private var startBits : int;
		private var startBitsIdx : int;

		/**
		 * 结束的bit，不包括
		 */
		private var endBits : int;
		private var endBitsIdx : int;

		/**
		 * 最大值(不包括)，用来做检测
		 */
		private var maxValue : int;

		/**
		 * 最大的mask
		 */
		private var maxMask : int;

		public function ModelType(preType : ModelType, useBits : int)
		{
			this.startBits = preType ? preType.endBits : 0;
			this.startBitsIdx = startBits >> 5;
			this.endBits = startBits + useBits;
			this.endBitsIdx = endBits >> 5;
			this.maxValue = 1 << useBits;
			this.maxMask = maxValue - 1;
		}

		public function getValue(resources : Array) : int
		{
			if(!resources)return 0;
			// version 暂时不用，以后可能会有不同的版本
			var firstMask : int = resources[startBitsIdx];
			if (startBitsIdx == endBitsIdx)
			{
				return (firstMask >>> startBits) & maxMask;
			}
			var endMask : int = resources[endBitsIdx];
			return ((firstMask >>> startBits) | (endMask << -endBits)) & maxMask;
		}
	}
}
