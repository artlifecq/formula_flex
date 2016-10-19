package com.rpgGame.coreData.info.upgrade
{
	import app.message.AmountType;
	import app.message.AmountValue;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 各种数值类型的消耗
	 * @author luguozheng
	 *
	 */
	public class AmountInfo
	{
		private var amountMap : HashMap;

		public function AmountInfo()
		{
			amountMap = new HashMap();
		}

		/**
		 * 设置数据
		 * @param amount
		 *
		 */
		public function setData(amount : Array) : void
		{
			amountMap.clear();

			if (amount == null)
				return;

			var amountValue : AmountValue;
			var len : int = amount.length;
			for (var i : int = 0; i < len; i++)
			{
				amountValue = amount[i];
				amountMap.add(amountValue.type, amountValue.amount);
			}
		}

//		public function setAmountByProto(proto : amount) : void
//		{
//			
//		}

		/**
		 * 指定类型的值
		 * @param type		AmountType
		 * @return
		 *
		 */
		public function getAmountByType(type : int) : int
		{
			if (!hasSomeType(type))
				return 0;

			return amountMap.getValue(type);
		}

		/**
		 * 是否有某个类型的值
		 * @param type		AmountType
		 * @return
		 *
		 */
		public function hasSomeType(type : int) : Boolean
		{
			if (amountMap.getValue(type) == null)
				return false;

			return true;
		}

		/**
		 * 原来类型上加减某值
		 * @param type
		 * @param amount
		 *
		 */
		public function addSomeType(type : int, amount : int) : void
		{
			if (amountMap.getValue(type) == null)
				amountMap.add(type, amount); //原来没值就用现在的值

			//原来有值就是加上原来的值
			amountMap.add(type, amountMap.getValue(type) + amount);
		}

		/**
		 * 直接设置某个值
		 * @param type
		 * @param amount
		 */
		public function setSomeType(type : int, amount : int) : void
		{
			amountMap.add(type, amount);
		}

		public function getAllTyps() : Array
		{
			return amountMap.keys();
		}

		public function getAllDatas() : Array
		{
			return amountMap.getValues();
		}
	}
}
