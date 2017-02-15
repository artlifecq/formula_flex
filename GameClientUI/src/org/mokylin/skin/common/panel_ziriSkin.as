package org.mokylin.skin.common
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class panel_ziriSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btn_close:feathers.controls.Button;

		public var scroll_Bar:feathers.controls.ScrollContainer;

		public var tab_zizhi:feathers.controls.TabBar;

		public var titleDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function panel_ziriSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),titleDisplay_i(),btn_close_i(),__panel_ziriSkin_UIAsset1_i(),scroll_Bar_i(),tab_zizhi_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __panel_ziriSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['全部','传闻','系统'];
			return temp;
		}

		private function __panel_ziriSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -1;
			return temp;
		}

		private function __panel_ziriSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 492;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 315;
			temp.x = 13;
			temp.y = 69;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 581;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 337;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 302;
			temp.y = 6;
			return temp;
		}

		private function scroll_Bar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scroll_Bar = temp;
			temp.name = "scroll_Bar";
			temp.height = 466;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
			temp.x = 303;
			temp.y = 76;
			return temp;
		}

		private function tab_zizhi_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_zizhi = temp;
			temp.name = "tab_zizhi";
			temp.btnWidth = 66;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.x = 21;
			temp.y = 41;
			temp.layout = __panel_ziriSkin_HorizontalLayout1_i();
			temp.dataProvider = __panel_ziriSkin_ArrayCollection1_i();
			return temp;
		}

		private function titleDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			titleDisplay = temp;
			temp.name = "titleDisplay";
			temp.bold = true;
			temp.height = 26;
			temp.fontSize = 16;
			temp.text = "日志记录";
			temp.textAlign = "center";
			temp.color = 0xb8ad80;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 91;
			temp.x = 114;
			temp.y = 8;
			return temp;
		}

	}
}