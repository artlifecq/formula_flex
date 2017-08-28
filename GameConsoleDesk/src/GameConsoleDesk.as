package
{
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.manager.GameScene3DManager;
	import com.game.engine3D.manager.Stage3DLayerManager;

	import flash.display.Sprite;

	import away3d.Away3D;

	import uk.co.soulwire.gui.SimpleGUI;

	/**
	 *
	 * 游戏控制台
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-10 下午5:26:37
	 *
	 */
	public class GameConsoleDesk extends Sprite
	{
		private static const MAIN_SCENE_NAME : String = "MAIN_SCENE";
		private var _gui : SimpleGUI;

		public function GameConsoleDesk()
		{
			super();

			_gui = new SimpleGUI(this, "");
			_gui.addColumn("Generic:");

			_gui.addStepper("screenAntiAlias", 0, 4, {label: "screenAntiAlias"});
			_gui.addStepper("viewAntiAlias", 0, 4, {label: "viewAntiAlias"});
			_gui.addStepper("displayLevel", 0, 4, {label: "displayLevel"});
			_gui.addStepper("frameRate", 1, 6, {label: "frameRate"});
			_gui.addButton("full screen", {label: "fullScreen", callback: fullScreen});
			_gui.addToggle("showDistrictWireframe", {label: "showDistrict"});
			_gui.addToggle("errorChecking", {label: "errorChecking"});
			_gui.addToggle("useRingDepthOfFieldFilter", {label: "useRingDepth"});
			_gui.addToggle("blendPass", {label: "blendPass"});

			_gui.addLabel("Shadow:");
			_gui.addStepper("shadowLevel", 0, 5, {label: "shadowLevel"});
			_gui.addStepper("lightRange", 0, 50, {label: "lightRange"});
			_gui.addStepper("lightNumSamples", 0, 50, {label: "lightNumSamples"});

			_gui.addLabel("FilterQuality:");
			_gui.addSlider("filterQuality", 2, 10, {label: "filterQuality"});

			_gui.show();
			_gui.hide();
		}

		public function get screenAntiAlias() : int
		{
			return Stage3DLayerManager.screenAntiAlias;
		}

		public function set screenAntiAlias(value : int) : void
		{
			Stage3DLayerManager.screenAntiAlias = value;
		}

		public function get viewAntiAlias() : int
		{
			return Stage3DLayerManager.viewAntiAlias;
		}

		public function set viewAntiAlias(value : int) : void
		{
			Stage3DLayerManager.viewAntiAlias = value;
		}

		public function get displayLevel() : int
		{
			return Away3D.DISPLAY_LEVEL;
		}

		public function set displayLevel(value : int) : void
		{
			Away3D.DISPLAY_LEVEL = value;
		}

		public function get blendPass() : Boolean
		{
			return Away3D.BLEND_PASS;
		}

		public function set blendPass(value : Boolean) : void
		{
			Away3D.BLEND_PASS = value;
		}

		public function get shadowLevel() : Number
		{
			var scene : GameScene3D = GameScene3DManager.getScene(MAIN_SCENE_NAME);
			return scene.shadowLevel;
		}

		public function set shadowLevel(value : Number) : void
		{
			var scene : GameScene3D = GameScene3DManager.getScene(MAIN_SCENE_NAME);
			scene.shadowLevel = value;
		}

		public function get filterQuality() : Number
		{
			var scene : GameScene3D = GameScene3DManager.getScene(MAIN_SCENE_NAME);
			return scene.view.filter3DQuality * 10;
		}

		public function set filterQuality(value : Number) : void
		{
			var scene : GameScene3D = GameScene3DManager.getScene(MAIN_SCENE_NAME);
			scene.view.filter3DQuality = value / 10;
		}

		public function get showDistrictWireframe() : Boolean
		{
			var scene : GameScene3D = GameScene3DManager.getScene(MAIN_SCENE_NAME);
			return scene.sceneMapLayer.showDistrictWireframe;
		}

		public function set showDistrictWireframe(value : Boolean) : void
		{
			var scene : GameScene3D = GameScene3DManager.getScene(MAIN_SCENE_NAME);
			scene.sceneMapLayer.showDistrictWireframe = value;
		}

		public function get errorChecking() : Boolean
		{
			return false;
//			return Stage3DLayerManager.errorChecking;
		}

		public function set errorChecking(value : Boolean) : void
		{
//			Stage3DLayerManager.errorChecking = value;
		}

		public function get useRingDepthOfFieldFilter() : Boolean
		{
			var scene : GameScene3D = GameScene3DManager.getScene(MAIN_SCENE_NAME);
			return scene.useRingDepthOfFieldFilter;
		}

		public function set useRingDepthOfFieldFilter(value : Boolean) : void
		{
			var scene : GameScene3D = GameScene3DManager.getScene(MAIN_SCENE_NAME);
			scene.useRingDepthOfFieldFilter = value;
		}

		public function get lightRange() : Number
		{
			var scene : GameScene3D = GameScene3DManager.getScene(MAIN_SCENE_NAME);
			return scene.lightRange;
		}

		public function set lightRange(value : Number) : void
		{
			var scene : GameScene3D = GameScene3DManager.getScene(MAIN_SCENE_NAME);
			scene.lightRange = value;
		}

		public function get lightNumSamples() : int
		{
			var scene : GameScene3D = GameScene3DManager.getScene(MAIN_SCENE_NAME);
			return scene.lightNumSamples;
		}

		public function set lightNumSamples(value : int) : void
		{
			var scene : GameScene3D = GameScene3DManager.getScene(MAIN_SCENE_NAME);
			scene.lightNumSamples = value;
		}

		public function fullScreen(... args) : void
		{
			Stage3DLayerManager.fullScreen();
		}

		public function get frameRate() : int
		{
			return Stage3DLayerManager.frameRate / 10;
		}

		public function set frameRate(value : int) : void
		{
			Stage3DLayerManager.frameRate = value * 10;
		}
	}
}
