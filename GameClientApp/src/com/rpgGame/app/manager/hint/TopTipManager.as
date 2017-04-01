package com.rpgGame.app.manager.hint
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.HintCfgData;
	import com.rpgGame.coreData.clientConfig.HintTypeSetInfo;
	
	import flash.events.Event;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.core.Starling;

	/**
	 * 屏幕提示管理器
	 * x,y坐标不能有小数，字会花的
	 * @author mandragora
	 *
	 */
	public class TopTipManager
	{
		private static var _instance : TopTipManager;

		public static function getInstance() : TopTipManager
		{
			if (!_instance)
			{
				_instance = new TopTipManager();
			}
			return _instance;
		}

		private var _hintMap : HashMap;

		public function TopTipManager()
		{
			//初始化配置的提示类型
			var hints : Array = HintCfgData.hintTypeSetHashMap.getValues();
			hints.sortOn("layerOrder", Array.NUMERIC);
			_hintMap = new HashMap();
			var hintBox : HintBaseBox;
			for each (var hintset : HintTypeSetInfo in hints)
			{
				hintBox = new HintBaseBox(hintset.type);
				if (hintset.type == NoticeManager.MOUSE_FOLLOW_TIP)
				{
					hintBox.touchable = false;
				}
				_hintMap.add(hintset.type, hintBox);
				if (hintset.type != NoticeManager.BATTLE_HINT)
				{
					StarlingLayerManager.hintUILayer.addChild(hintBox);
				}
			}

			Starling.current.nativeStage.addEventListener(Event.RESIZE, resize);
			resize();
		}

		public function addHintByType(type : int, value : String) : void
		{
			var hintBox : HintBaseBox = _hintMap.getValue(type);
			if (!hintBox)
			{
				type = NoticeManager.CENTER_BOTTOM;
				hintBox = _hintMap.getValue(type);
			}
			if (hintBox)
			{
				hintBox.addHint(value);
			}
		}

		public function getHintBox(type : int) : HintBaseBox
		{
			var hintBox : HintBaseBox = _hintMap.getValue(type);
			return hintBox;
		}

		public function clearAll() : void
		{

		}

		/**
		 * 更新位置
		 *
		 */
		public function resize(e : Event = null) : void
		{
			var hints : Array = _hintMap.getValues();
			var hintSet : HintTypeSetInfo;
			for each (var hintBox : HintBaseBox in hints)
			{
				hintSet = HintCfgData.getHintTypeSet(hintBox.noticeType);
				if (!hintSet)
					continue;
				if (hintSet.posX == 0 && hintSet.posY == 0)
					continue;

				if (hintSet.posX >= 0 && hintSet.posX <= 1)
				{
					//是个小数应该就是百分比
					hintBox.x = int((Starling.current.stage.stageWidth - hintSet.width) * hintSet.posX);
				}
				else if (hintSet.posX > 1)
				{
					hintBox.x = hintSet.posX;
				}
				else if (hintSet.posX < 0)
				{
					//小于0就反向了
					hintBox.x = int(Starling.current.stage.stageWidth + hintSet.posX);
				}

				if (hintSet.posY >= 0 && hintSet.posY <= 1)
				{
					//是个小数应该就是百分比
					hintBox.y = int((Starling.current.stage.stageHeight - hintSet.height) * hintSet.posY);
				}
				else if (hintSet.posY > 1)
				{
					hintBox.y = hintSet.posY;
				}
				else if (hintSet.posY < 0)
				{
					//小于0就反向了
					hintBox.y = int(Starling.current.stage.stageHeight + hintSet.posY);
				}
				trace(hintBox.x, hintBox.y);
			}
		}

		/**
		 * 在鼠标当前位置弹出的文字提示
		 * @param $msg
		 *
		 */
		public function addMouseFollowTip(type : int, value : String) : void
		{
			var hintBox : HintBaseBox = _hintMap.getValue(type);
			if (hintBox)
			{
				hintBox.addHint(value);
				if (hintBox.hintTypeSet && hintBox.hintTypeSet.posX == 0 && hintBox.hintTypeSet.posY == 0)
				{
					hintBox.x = int(Starling.current.nativeStage.mouseX); //int(Starling.current.nativeStage.mouseX - (hintBox.width / 2));
					hintBox.y = Math.max(0,int(Starling.current.nativeStage.mouseY - hintBox.height));
				}
			}
		}
		//----------------------------------------
	}
}
