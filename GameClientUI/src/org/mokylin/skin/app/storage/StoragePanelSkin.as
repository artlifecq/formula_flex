package org.mokylin.skin.app.storage
{
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.tabbar.TabBarSkin_green;
	import org.mokylin.skin.component.text.TextAreaSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class StoragePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBatchUnlock:feathers.controls.Button;

		public var btnClearUp:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var gridList:feathers.controls.List;

		public var lb1:feathers.controls.Label;

		public var lb2:feathers.controls.Label;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function StoragePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 511;
			this.width = 383;
			this.elementsContent = [__StoragePanelSkin_UIAsset1_i(),btnClose_i(),tabBar_i(),btnBatchUnlock_i(),btnClearUp_i(),lb1_i(),lb2_i(),gridList_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __StoragePanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['1','2','3','4','5'];
			return temp;
		}

		private function __StoragePanelSkin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			return temp;
		}

		private function __StoragePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 511;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 383;
			temp.x = 1;
			temp.y = 2;
			return temp;
		}

		private function btnBatchUnlock_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBatchUnlock = temp;
			temp.name = "btnBatchUnlock";
			temp.height = 29;
			temp.label = "批量开格子";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 100;
			temp.x = 22;
			temp.y = 431;
			return temp;
		}

		private function btnClearUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClearUp = temp;
			temp.name = "btnClearUp";
			temp.height = 29;
			temp.label = "整理";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 80;
			temp.x = 288;
			temp.y = 431;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close);
			temp.x = 350;
			temp.y = 5;
			return temp;
		}

		private function gridList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			gridList = temp;
			temp.name = "gridList";
			temp.height = 354;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextAreaSkin);
			temp.width = 364;
			temp.x = 12;
			temp.y = 72;
			temp.layout = __StoragePanelSkin_TileLayout1_i();
			return temp;
		}

		private function lb1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb1 = temp;
			temp.name = "lb1";
			temp.text = "在线即可免费开仓库格子";
			temp.color = 0x308606;
			temp.width = 336;
			temp.x = 20;
			temp.y = 465;
			return temp;
		}

		private function lb2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb2 = temp;
			temp.name = "lb2";
			temp.text = "1号仓库的格子全部开启听到，可激活２号仓库";
			temp.color = 0x308606;
			temp.width = 337;
			temp.x = 19;
			temp.y = 487;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.gap = -28;
			temp.height = 26;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarSkin_green);
			temp.left = 0;
			temp.width = 361;
			temp.x = 15;
			temp.y = 39;
			temp.dataProvider = __StoragePanelSkin_ArrayCollection1_i();
			return temp;
		}

	}
}