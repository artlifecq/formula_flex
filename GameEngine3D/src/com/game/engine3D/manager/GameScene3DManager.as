package com.game.engine3D.manager
{
	import com.game.engine3D.core.GameScene3D;

	import away3d.containers.View3D;

	import org.client.mainCore.ds.DHash;

	/**
	 *
	 * 游戏3D场景管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-21 下午8:32:33
	 *
	 */
	public class GameScene3DManager
	{
		private static var _sceneMap : DHash = new DHash();

		public function GameScene3DManager()
		{
		}

		public static function createScene(name : String, view : View3D, viewDistance : int, areaMapLayer : int) : GameScene3D
		{
			var gameScene : GameScene3D = _sceneMap.getValue(name);
			if (!gameScene)
			{
				gameScene = new GameScene3D(name, view, viewDistance, areaMapLayer);
				_sceneMap.addForKey(name, gameScene);
			}
			view.scene.addChild(gameScene);
			return gameScene;
		}

		public static function getScene(name : String) : GameScene3D
		{
			return _sceneMap.getValue(name) as GameScene3D;
		}

		public static function removeScene(name : String) : void
		{
			var gameScene : GameScene3D = _sceneMap.getValue(name);
			if (gameScene)
			{
				gameScene.destroy();
				_sceneMap.removeForKey(name);
			}
		}
	}
}
