package com.rpgGame.app.ui.main.miniMap
{
	import com.game.engine3D.vo.map.ClientMapData;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;

	import flash.geom.Point;

	import org.mokylin.skin.mainui.map.MiniMapMainPlayerIcoSkin;

	import starling.display.Sprite;

	/**
	 * 主角图标
	 * @author luguozheng
	 *
	 */
	public class MiniMapMainPlayerIco extends Sprite
	{
		private var skinIco : Sprite;

		private var oldPosX : Number;
		private var oldPosY : Number;

		public function MiniMapMainPlayerIco()
		{
			skinIco = new MiniMapMainPlayerIcoSkin().toSprite();
			addChild(skinIco);
			touchable = false;
		}

		public function updatePos(point : Point) : void
		{
			if (null == point)
			{
				return;
			}
			if (oldPosX == point.x && oldPosY == point.y)
				return;

			var mapData : ClientMapData = SceneManager.clientMapData;
			if (mapData == null)
				return;

			oldPosX = x = point.x;
			oldPosY = y = point.y;

			var role : SceneRole = MainRoleManager.actor;
			var radius : Number;
//			if (role.rotationY < 0)
//				radius = 180 + (180 + role.rotationY);
//			else
				radius = 180 + role.rotationY;
			radius += mapData.miniCorrectRoll;

			rotation = (radius + 180) * Math.PI / 180;
		}
	}
}
