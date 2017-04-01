package com.rpgGame.app.ui.main.smallmap
{
	public class SmallMapUtil
	{
		private static var icoPool : Vector.<MapPathIcon> = new Vector.<MapPathIcon>;

		public function SmallMapUtil()
		{
		}

		public static function getMapIco() : MapPathIcon
		{
			var ico : MapPathIcon;
			if (icoPool.length > 0)
				ico = icoPool.shift();
			else
				ico = new MapPathIcon();
			return ico;
		}

		public static function putMapIco(ico : MapPathIcon) : void
		{
			icoPool.push(ico);
		}
		private static var roleIcoPool : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>;

		public static function getMapRoleIco() : SmallMapRoleIcon
		{
			var ico : SmallMapRoleIcon;
			if (roleIcoPool.length > 0)
				ico = roleIcoPool.shift();
			else
				ico = new SmallMapRoleIcon();

			ico.visible = true;
			return ico;
		}

		public static function putMapRoleIco(ico : SmallMapRoleIcon) : void
		{
			ico.removeMyself();
			roleIcoPool.push(ico);
		}
	}
}
