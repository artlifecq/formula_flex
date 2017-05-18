package org.mokylin.skin.app.shangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.shangcheng.button.ButtonCz;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_you;
	import org.mokylin.skin.component.button.ButtonSkin_zuo;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShangCheng_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bg0:feathers.controls.UIAsset;

		public var btnChongZhi:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var grpLijing:feathers.controls.Group;

		public var grpYuanbao:feathers.controls.Group;

		public var lbLijing:feathers.controls.Label;

		public var lbPage:feathers.controls.Label;

		public var lbYuanbao:feathers.controls.Label;

		public var tab_nv:feathers.controls.TabBar;

		public var uiLijing:feathers.controls.UIAsset;

		public var uiYuanbao:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShangCheng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 600;
			this.width = 1061;
			this.elementsContent = [bg_i(),__ShangCheng_Skin_UIAsset1_i(),tab_nv_i(),btn_min_i(),btn_max_i(),grpYuanbao_i(),grpLijing_i(),btnChongZhi_i(),__ShangCheng_Skin_UIAsset2_i(),btnClose_i(),bg0_i(),lbPage_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShangCheng_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['热销道具','变强道具','礼金商城','VIP商城'];
			return temp;
		}

		private function __ShangCheng_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -2;
			return temp;
		}

		private function __ShangCheng_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/shangcheng/sd.png";
			temp.x = 520;
			temp.y = 13;
			return temp;
		}

		private function __ShangCheng_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/shangcheng/ren.png";
			temp.x = -64;
			temp.y = -15;
			return temp;
		}

		private function bg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg0 = temp;
			temp.name = "bg0";
			temp.left = 545;
			temp.styleName = "ui/component/text/input_bg.png";
			temp.width = 56;
			temp.y = 528;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/shangcheng/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnChongZhi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChongZhi = temp;
			temp.name = "btnChongZhi";
			temp.styleClass = org.mokylin.skin.app.shangcheng.button.ButtonCz;
			temp.x = 818;
			temp.y = 539;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 954;
			temp.y = 41;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_you;
			temp.x = 603;
			temp.y = 531;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zuo;
			temp.x = 522;
			temp.y = 531;
			return temp;
		}

		private function grpLijing_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpLijing = temp;
			temp.name = "grpLijing";
			temp.x = 583;
			temp.y = 555;
			temp.elementsContent = [uiLijing_i(),lbLijing_i()];
			return temp;
		}

		private function grpYuanbao_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpYuanbao = temp;
			temp.name = "grpYuanbao";
			temp.x = 510;
			temp.y = 555;
			temp.elementsContent = [uiYuanbao_i(),lbYuanbao_i()];
			return temp;
		}

		private function lbLijing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLijing = temp;
			temp.name = "lbLijing";
			temp.text = "100";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 68;
			temp.x = 28;
			temp.y = 3;
			return temp;
		}

		private function lbPage_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPage = temp;
			temp.name = "lbPage";
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 56;
			temp.x = 545;
			temp.y = 533;
			return temp;
		}

		private function lbYuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbYuanbao = temp;
			temp.name = "lbYuanbao";
			temp.text = "100";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 68;
			temp.x = 24;
			temp.y = 3;
			return temp;
		}

		private function tab_nv_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_nv = temp;
			temp.name = "tab_nv";
			temp.btnWidth = 77;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.width = 326;
			temp.x = 281;
			temp.y = 42;
			temp.layout = __ShangCheng_Skin_HorizontalLayout1_i();
			temp.dataProvider = __ShangCheng_Skin_ArrayCollection1_i();
			return temp;
		}

		private function uiLijing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLijing = temp;
			temp.name = "uiLijing";
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiYuanbao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiYuanbao = temp;
			temp.name = "uiYuanbao";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}