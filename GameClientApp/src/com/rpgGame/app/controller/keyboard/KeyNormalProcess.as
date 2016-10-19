package com.rpgGame.app.controller.keyboard
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.utils.StatsUtil;
	import com.game.mainCore.core.manager.LayerManager;
	import com.rpgGame.app.manager.MainUIManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.core.utils.ConsoleDesk;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.info.key.KeyInfo;

	public class KeyNormalProcess
	{
		private static var _interval : uint;
		private static var _userFtModel : uint = 0;
		private static var _petFtModel : uint = 1;

		public static function exec(info : KeyInfo) : void
		{
			if (ClientConfig.isBanShu)
			{
				return;
			}
			var dataID : uint = info.dataID;
			var funcID : String = info.funcS;
			var isNet : Boolean = true;

			switch (funcID)
			{
				case "1": //UP
				case "32": //W
					break;
				case "2": //DOWN
				case "28": //S
					break;
				case "3": //LEFT
				case "10": //A
					break;
				case "4": //RIGHT
				case "13": //D
					break;
				//-------------------------------
				case "1_3": //左上
				case "10_32": //A-W
					break;
				case "2_3": //左下
				case "10_28": //A-S
					break;
				case "1_4": //右上
				case "13_32": //D-W
					break;
				case "2_4": //右下
				case "13_28": //D-S
					break;
				////////////////////////////////////////////////////////////////
				case "6_35": //Ctrl+Z
					break;
				case "6_10": //Ctrl+E--切换角色攻击模式
					break;
				case "6_27": //Ctrl+R--切换群侠攻击模式
					_petFtModel++;
					break;
				case "29_30_34": //t+u+y
					trace(111);
					break;
				case "19_20_21": //JKL
					MainUIManager.showOrHide();
					break;
				case "59_60": //+-
					if (!ClientConfig.isRelease)
					{
						StatsUtil.showOrHideAwayStats(Stage3DLayerManager.stage, Stage3DLayerManager.stage3DProxy);
						LayerManager.showOrHideMM();
						ConsoleDesk.showOrHide(Stage3DLayerManager.stage);
					}
					break;
			}
		}
	}
}
