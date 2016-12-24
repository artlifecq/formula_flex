package com.editor.manager
{
	import com.editor.data.FuncTagInfo;
	import com.editor.data.TabelData;
	import com.editor.enum.FeaturesType;
	import com.editor.operate.TrailEditOperate;
	
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;

	/**
	 *
	 * 键盘管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-23 上午11:03:17
	 *
	 */
	public class KeyboardManager
	{
		private static var _instance : KeyboardManager;

		public static function getInstance() : KeyboardManager
		{
			if (!_instance)
			{
				_instance = new KeyboardManager();
			}
			return _instance;
		}

		public var plus : Boolean;
		public var minus : Boolean;
		public var ctrl : Boolean;

		public function KeyboardManager()
		{
		}

		public function setup(stage : Stage) : void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}

		private function onKeyDown(e : KeyboardEvent) : void
		{
			if (!SceneManager.getInstance().cameraOpen)
			{
				onKeyUp(e);
				return;
			}
			var tempVec : Vector3D;
			var pos : Vector3D;
			var info : FuncTagInfo = FuncTagManager.getInstance().currSelectedFuncTag;
			var subInfo : FuncTagInfo = FuncTagManager.getInstance().currSelectedSubFuncTag;
			if (e.keyCode == Keyboard.ESCAPE)
			{
				DecorateEntitiesManager.getInstance().cancelSelect();
				TrailManager.getInstance().cancelSelect();
				SceneRoleManager.getInstance().cancelSelect();
				DataManager.getInstance().cancelSelect();
				plus = false;
				minus = false;
			}
			else if (e.keyCode == Keyboard.SPACE)
			{
				if (info && info.featureType == FeaturesType.SPELL_TYPE)
				{
					var tabel : TabelData = DataStructuresManager.getInstance().getTabel(info.tabelName);
					if (tabel && tabel.desc && tabel.desc.selectedData)
						SpellFightManager.getInstance().onReleaseSpell(tabel.desc.selectedData);
				}

				if (EditorCameraManager.cameraMode == 0)
				{
					KeyMoveManager.getInstance().jump(e.ctrlKey);
				}

				if (info && info.featureType == FeaturesType.TRAIL_TYPE)
				{
					TrailManager.getInstance().togglePlay();
				}
			}
			else if (e.keyCode == 187)
			{
				plus = true;
				TrailEditOperate.clickPlusKey();
			}
			else if (e.keyCode == 189)
			{
				minus = true;
				TrailEditOperate.clickMinusKey();
			}
			else if (e.keyCode == 17)
			{
				ctrl = true;
			}
			else if (e.keyCode == 46)
			{

			}
			else if (e.keyCode == 87) //w
			{
				KeyMoveManager.getInstance().walkForward(true);
			}
			else if (e.keyCode == 65) //a
			{
				KeyMoveManager.getInstance().walkLeft(true);
			}
			else if (e.keyCode == 83) //s
			{
				KeyMoveManager.getInstance().walkBackward(true);
			}
			else if (e.keyCode == 68) //d
			{
				KeyMoveManager.getInstance().walkRight(true);
			}
			else if (e.keyCode == 82) //R
			{
				KeyMoveManager.getInstance().walkUp(true);
			}
			else if (e.keyCode == 70) //f
			{
				KeyMoveManager.getInstance().walkDown(true);
			}
		}

		private function onKeyUp(e : KeyboardEvent) : void
		{
			if (e.keyCode == 187)
			{
				plus = false;
			}
			else if (e.keyCode == 189)
			{
				minus = false;
			}
			else if (e.keyCode == 17)
			{
				ctrl = false;
			}
			else if (e.keyCode == 87) //w
			{
				KeyMoveManager.getInstance().walkForward(false);
			}
			else if (e.keyCode == 65) //a
			{
				KeyMoveManager.getInstance().walkLeft(false);
			}
			else if (e.keyCode == 83) //s
			{
				KeyMoveManager.getInstance().walkBackward(false);
			}
			else if (e.keyCode == 68) //d
			{
				KeyMoveManager.getInstance().walkRight(false);
			}
			else if (e.keyCode == 82) //R
			{
				KeyMoveManager.getInstance().walkUp(false);
			}
			else if (e.keyCode == 70) //f
			{
				KeyMoveManager.getInstance().walkDown(false);
			}
		}
	}
}
