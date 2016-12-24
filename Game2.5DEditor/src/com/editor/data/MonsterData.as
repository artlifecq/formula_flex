package com.editor.data
{
	/**
	 *
	 * 怪物数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class MonsterData extends RoleData
	{
		//-------有xml数据的模版ID(怪物,坐骑,群侠,npc等等)----------
		protected var _modelID : uint;
		
		/**模版ID**/
		public function get modelID() : uint
		{
			return _modelID;
		}
		
		public function set modelID(value : uint) : void
		{
			_modelID = value;
		}
		/**怪物颜色类别 (攻击色怪 1)(防御色怪2)(暴击色怪3)闪避色怪(4)(血厚色怪5)(金钱色怪6)*/
		public var colorList : Array = [];
		/**攻击怪物方式 */
		public var atkType : int = -1;
		
		public function MonsterData() : void
		{
			super();
		}
	}
}