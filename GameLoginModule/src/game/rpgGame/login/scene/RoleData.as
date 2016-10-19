package game.rpgGame.login.scene
{
	/**
	 *
	 * 角色数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-31 上午11:32:15
	 *
	 */
	public class RoleData
	{
		private var _id : Number = 0;
		/** 名字 */
		public var name : String = "";
		/**
		 * 换装信息
		 */
		public var avatarInfo : AvatarInfo;
		
		public function RoleData()
		{
			avatarInfo = new AvatarInfo();
		}
		
		/**
		 * 标识id (也是场景唯一标识符ID)
		 * @return
		 *
		 */
		public function get id() : Number
		{
			return _id;
		}
		
		/**
		 * @private
		 */
		public function set id(value : Number) : void
		{
			_id = value;
		}
	}
}