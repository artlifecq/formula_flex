package com.rpgGame.app.ui.main.miniMap
{
	public class MiniMapUtil
	{
		private static var icoPool : Vector.<MapPathIco> = new Vector.<MapPathIco>;

		public function MiniMapUtil()
		{
		}

		public static function getMapIco() : MapPathIco
		{
			var ico : MapPathIco;
			if (icoPool.length > 0)
				ico = icoPool.shift();
			else
				ico = new MapPathIco();
			return ico;
		}

		public static function putMapIco(ico : MapPathIco) : void
		{
			icoPool.push(ico);
		}
		private static var roleIcoPool : Vector.<MapRoleIco> = new Vector.<MapRoleIco>;

		public static function getMapRoleIco() : MapRoleIco
		{
			var ico : MapRoleIco;
			if (roleIcoPool.length > 0)
				ico = roleIcoPool.shift();
			else
				ico = new MapRoleIco();

			ico.visible = true;
			return ico;
		}

		public static function putMapRoleIco(ico : MapRoleIco) : void
		{
			ico.removeMyself();
			roleIcoPool.push(ico);
		}
	}
}
