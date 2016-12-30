package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_btn1;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class bpack_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon0:feathers.controls.UIAsset;

		public var Icon1:feathers.controls.UIAsset;

		public var Icon2:feathers.controls.UIAsset;

		public var Icon3:feathers.controls.UIAsset;

		public var Icon4:feathers.controls.UIAsset;

		public var Icons:feathers.controls.Group;

		public var btn_getYuanbao:feathers.controls.Button;

		public var mIcon0:feathers.controls.UIAsset;

		public var mIcon1:feathers.controls.UIAsset;

		public var mIcon2:feathers.controls.UIAsset;

		public var mIcon3:feathers.controls.UIAsset;

		public var money:feathers.controls.Group;

		public var tab_pack:feathers.controls.TabBar;

		public var txt0:feathers.controls.Label;

		public var txt1:feathers.controls.Label;

		public var txt2:feathers.controls.Label;

		public var txt3:feathers.controls.Label;

		public var vs_Bar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function bpack_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__bpack_Skin_UIAsset1_i(),__bpack_Skin_UIAsset2_i(),__bpack_Skin_UIAsset3_i(),__bpack_Skin_UIAsset4_i(),__bpack_Skin_UIAsset5_i(),tab_pack_i(),money_i(),Icons_i(),vs_Bar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon0 = temp;
			temp.name = "Icon0";
			temp.styleName = "ui/app/beibao/beibaoIcon/chushou.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function Icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon1 = temp;
			temp.name = "Icon1";
			temp.styleName = "ui/app/beibao/beibaoIcon/zhengli.png";
			temp.x = 43;
			temp.y = 0;
			return temp;
		}

		private function Icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon2 = temp;
			temp.name = "Icon2";
			temp.styleName = "ui/app/beibao/beibaoIcon/cangku.png";
			temp.x = 87;
			temp.y = 0;
			return temp;
		}

		private function Icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon3 = temp;
			temp.name = "Icon3";
			temp.styleName = "ui/app/beibao/beibaoIcon/shangdian.png";
			temp.x = 130;
			temp.y = 0;
			return temp;
		}

		private function Icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon4 = temp;
			temp.name = "Icon4";
			temp.styleName = "ui/app/beibao/beibaoIcon/paimaihang.png";
			temp.x = 174;
			temp.y = 0;
			return temp;
		}

		private function Icons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			Icons = temp;
			temp.name = "Icons";
			temp.x = 12;
			temp.y = 406;
			temp.elementsContent = [Icon0_i(),Icon1_i(),Icon2_i(),Icon3_i(),Icon4_i(),btn_getYuanbao_i()];
			return temp;
		}

		private function __bpack_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['全部','装备','药品','材料','其他'];
			return temp;
		}

		private function __bpack_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __bpack_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 449;
			temp.styleName = "ui/app/beibao/xikuangdi.png";
			temp.width = 343;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __bpack_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 422;
			temp.styleName = "ui/app/beibao/cukuangdi.png";
			temp.width = 339;
			temp.x = 2;
			temp.y = 27;
			return temp;
		}

		private function __bpack_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/huawendi.png";
			temp.x = 6;
			temp.y = 405;
			return temp;
		}

		private function __bpack_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/fengexian.png";
			temp.width = 333;
			temp.x = 5;
			temp.y = 341;
			return temp;
		}

		private function __bpack_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/fengexian.png";
			temp.width = 333;
			temp.x = 5;
			temp.y = 399;
			return temp;
		}

		private function __bpack_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/neikuang.png";
			temp.width = 128;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __bpack_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/beibao/neikuang.png";
			temp.width = 128;
			temp.x = 0;
			temp.y = 26;
			return temp;
		}

		private function __bpack_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/neikuang.png";
			temp.width = 128;
			temp.x = 163;
			temp.y = 0;
			return temp;
		}

		private function __bpack_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/beibao/neikuang.png";
			temp.width = 128;
			temp.x = 163;
			temp.y = 26;
			return temp;
		}

		private function btn_getYuanbao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_getYuanbao = temp;
			temp.name = "btn_getYuanbao";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.label = "获取元宝";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_btn1;
			temp.color = 0xE1D4A9;
			temp.x = 243;
			temp.y = 4;
			return temp;
		}

		private function mIcon0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mIcon0 = temp;
			temp.name = "mIcon0";
			temp.styleName = "ui/common/tubiao/yinzi_24.png";
			temp.x = 131;
			temp.y = 0;
			return temp;
		}

		private function mIcon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mIcon1 = temp;
			temp.name = "mIcon1";
			temp.styleName = "ui/common/tubiao/yinzib_24.png";
			temp.x = 294;
			temp.y = 0;
			return temp;
		}

		private function mIcon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mIcon2 = temp;
			temp.name = "mIcon2";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 131;
			temp.y = 27;
			return temp;
		}

		private function mIcon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mIcon3 = temp;
			temp.name = "mIcon3";
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.x = 294;
			temp.y = 27;
			return temp;
		}

		private function money_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			money = temp;
			temp.name = "money";
			temp.x = 12;
			temp.y = 349;
			temp.elementsContent = [__bpack_Skin_UIAsset6_i(),__bpack_Skin_UIAsset7_i(),__bpack_Skin_UIAsset8_i(),__bpack_Skin_UIAsset9_i(),txt0_i(),txt2_i(),txt1_i(),txt3_i(),mIcon0_i(),mIcon2_i(),mIcon1_i(),mIcon3_i()];
			return temp;
		}

		private function tab_pack_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_pack = temp;
			temp.name = "tab_pack";
			temp.btnWidth = 65;
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.width = 326;
			temp.x = 9;
			temp.y = 0;
			temp.layout = __bpack_Skin_HorizontalLayout1_i();
			temp.dataProvider = __bpack_Skin_ArrayCollection1_i();
			return temp;
		}

		private function txt0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt0 = temp;
			temp.name = "txt0";
			temp.text = "1000";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function txt1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt1 = temp;
			temp.name = "txt1";
			temp.text = "1000";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 172;
			temp.y = 0;
			return temp;
		}

		private function txt2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt2 = temp;
			temp.name = "txt2";
			temp.text = "1000";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 2;
			temp.y = 25;
			return temp;
		}

		private function txt3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt3 = temp;
			temp.name = "txt3";
			temp.text = "1000";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 172;
			temp.y = 25;
			return temp;
		}

		private function vs_Bar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vs_Bar = temp;
			temp.name = "vs_Bar";
			temp.height = 314;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
			temp.x = 320;
			temp.y = 31;
			return temp;
		}

	}
}