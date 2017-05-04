package feathers.tests
{
	import feathers.controls.AutoSizeMode;
	import feathers.controls.LayoutGroup;
	import feathers.controls.ScrollContainer;
	import feathers.core.PopUpManager;

	import org.flexunit.Assert;

	import starling.display.DisplayObject;

	import starling.display.Quad;

	import starling.display.Sprite;

	public class PopUpManagerTests
	{
		private static const OVERLAY_NAME:String = "PopUpManagerOverlay";
		
		private var _popUp1:Quad;
		private var _popUp2:Quad;
		private var _customRoot:Sprite;
		
		[After]
		public function cleanup():void
		{
			if(this._customRoot)
			{
				this._customRoot.removeFromParent(true);
				this._customRoot = null;
			}
			if(this._popUp1)
			{
				this._popUp1.removeFromParent(true);
				this._popUp1 = null;
			}
			if(this._popUp2)
			{
				this._popUp2.removeFromParent(true);
				this._popUp2 = null;
			}
			
			PopUpManager.root = TestFeathers.starlingRoot.stage;
			
			PopUpManager.overlayFactory = PopUpManager.defaultOverlayFactory;

			Assert.assertStrictlyEquals("Child not removed from Starling root on cleanup.", 0, TestFeathers.starlingRoot.numChildren);
		}
		
		private function createOverlay():DisplayObject
		{
			var overlay:Quad = new Quad(1, 1, 0xff00ff);
			overlay.alpha = 0.5;
			overlay.name = OVERLAY_NAME;
			return overlay;
		}

		[Test]
		public function testCustomRoot():void
		{
			this._customRoot = new Sprite();
			TestFeathers.starlingRoot.addChild(this._customRoot);
			PopUpManager.root = this._customRoot;
			Assert.assertFalse("PopUpManager.root property incorrectly returns stage", PopUpManager.root === TestFeathers.starlingRoot.stage);

			this._popUp1 = new Quad(200, 200, 0xff00ff);
			PopUpManager.addPopUp(this._popUp1);

			Assert.assertStrictlyEquals("Pop-up added to wrong parent when a custom PopUpManager.root is set", this._customRoot, this._popUp1.parent);
		}

		[Test]
		public function testOverlayFactory():void
		{
			PopUpManager.overlayFactory = this.createOverlay;
			
			this._popUp1 = new Quad(200, 200, 0xff00ff);
			PopUpManager.addPopUp(this._popUp1, true);

			var overlay:DisplayObject = PopUpManager.root.getChildByName(OVERLAY_NAME);
			Assert.assertNotNull("PopUpManager.overlayFactory failed to create overlay", overlay);
		}

		[Test]
		public function testIsPopUp():void
		{
			PopUpManager.overlayFactory = this.createOverlay;

			this._popUp1 = new Quad(200, 200, 0xff00ff);
			PopUpManager.addPopUp(this._popUp1, true);
			
			this._popUp2 = new Quad(200, 200, 0x00ff00);
			TestFeathers.starlingRoot.addChild(this._popUp2);

			Assert.assertTrue("PopUpManager.isPopUp() failed to indentify a pop-up", PopUpManager.isPopUp(this._popUp1));
			Assert.assertFalse("PopUpManager.isPopUp() incorrectly indentified a display object that is not a pop-up", PopUpManager.isPopUp(this._popUp2));
		}

		[Test]
		public function testLayoutGroupAutoSizeModeStage():void
		{
			var group:LayoutGroup = new LayoutGroup();
			PopUpManager.addPopUp(group);
			Assert.assertStrictlyEquals("LayoutGroup added to PopUpManager should default to autoSizeMode === AutoSizeMode.CONTENT", AutoSizeMode.CONTENT, group.autoSizeMode);
			PopUpManager.removePopUp(group, true);
		}

		[Test]
		public function testScrollContainerAutoSizeModeStage():void
		{
			var container:ScrollContainer = new ScrollContainer();
			PopUpManager.addPopUp(container);
			Assert.assertStrictlyEquals("ScrollContainer added to PopUpManager should default to autoSizeMode === AutoSizeMode.CONTENT", AutoSizeMode.CONTENT, container.autoSizeMode);
			PopUpManager.removePopUp(container, true);
		}
	}
}
