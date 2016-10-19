package org.mokylin.skin.app.stall
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.tabbar.TabBarSkin_normal;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class StallAreaPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var area_wang_cheng:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var tabBar:feathers.controls.TabBar;

		public var title:feathers.controls.Label;

		public var title0:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function StallAreaPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__StallAreaPanelSkin_UIAsset1_i(),btnClose_i(),title_i(),title0_i(),area_wang_cheng_i(),tabBar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __StallAreaPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['王城','洛阳城郊'];
			return temp;
		}

		private function __StallAreaPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 6;
			return temp;
		}

		private function __StallAreaPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 590;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 662;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function area_wang_cheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			area_wang_cheng = temp;
			temp.name = "area_wang_cheng";
			temp.styleName = "ui/big_bg/wang_cheng.jpg";
			temp.x = 21;
			temp.y = 68;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 631;
			temp.y = 5;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 80;
			temp.gap = 0;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_normal;
			temp.width = 311;
			temp.x = 23;
			temp.y = 41;
			temp.layout = __StallAreaPanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __StallAreaPanelSkin_ArrayCollection1_i();
			return temp;
		}

		private function title0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title0 = temp;
			temp.name = "title0";
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "红色区域为摆摊区域";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 276;
			temp.x = 26;
			temp.y = 552;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "查看摆摊区域";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 276;
			temp.x = 191;
			temp.y = 12;
			return temp;
		}

	}
}