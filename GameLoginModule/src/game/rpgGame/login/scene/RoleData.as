package game.rpgGame.login.scene
{
	import flash.geom.Point;
	
	import game.rpgGame.login.scene.AvatarInfo;

	/**
	 *
	 * 角色数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class RoleData  extends BaseEntityData
	{

		private var _type : int;
		/**
		 * 换装信息
		 */
		public var avatarInfo : AvatarInfo;

		/**
		 *
		 * @param type 角色类型
		 *
		 */
		public function RoleData(type : int)
		{
			_type = type;
			avatarInfo = new AvatarInfo();
		}

		/**
		 * 角色类型
		 * @return
		 *
		 */
		public function get type() : int
		{
			return _type;
		}


	}
}
