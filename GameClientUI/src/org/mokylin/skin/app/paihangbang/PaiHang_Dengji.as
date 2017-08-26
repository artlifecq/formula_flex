package org.mokylin.skin.app.paihangbang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;
	import org.mokylin.skin.common.Flip1_Skin;
	import org.mokylin.skin.component.button.ButtonSkin_putong;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiHang_Dengji extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnAll:feathers.controls.Button;

		public var cellgroup:feathers.controls.Group;

		public var skinFlip:feathers.controls.SkinnableContainer;

		public var skinRight:feathers.controls.SkinnableContainer;

		public var uiTongjizhong:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHang_Dengji()
		{
			super();
			
			this.currentState = "normal";
			this.height = 522;
			this.width = 766;
			this.elementsContent = [skinRight_i(),btnAll_i(),skinFlip_i(),__PaiHang_Dengji_Group1_i(),cellgroup_i(),__PaiHang_Dengji_Group2_i(),uiTongjizhong_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PaiHang_Dengji_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 417;
			temp.elementsContent = [__PaiHang_Dengji_UIAsset1_i(),__PaiHang_Dengji_UIAsset2_i()];
			return temp;
		}

		private function __PaiHang_Dengji_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 18;
			temp.elementsContent = [__PaiHang_Dengji_UIAsset3_i(),__PaiHang_Dengji_UIAsset4_i(),__PaiHang_Dengji_UIAsset5_i(),__PaiHang_Dengji_UIAsset6_i(),__PaiHang_Dengji_UIAsset7_i(),__PaiHang_Dengji_UIAsset8_i(),__PaiHang_Dengji_UIAsset9_i(),__PaiHang_Dengji_UIAsset10_i()];
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/dengji.png";
			temp.x = 312;
			temp.y = 5;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/wenzikuang.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/wodepaiming.png";
			temp.x = 170;
			temp.y = 4;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 50;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 173;
			temp.x = 50;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 43;
			temp.x = 223;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 128;
			temp.x = 266;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/paiming.png";
			temp.x = 11;
			temp.y = 5;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/xingming.png";
			temp.x = 113;
			temp.y = 5;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/zhiye.png";
			temp.x = 230;
			temp.y = 5;
			return temp;
		}

		private function btnAll_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAll = temp;
			temp.name = "btnAll";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "全平台排行榜";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 121;
			temp.x = 260;
			temp.y = 479;
			return temp;
		}

		private function cellgroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			cellgroup = temp;
			temp.name = "cellgroup";
			temp.x = 0;
			temp.y = 45;
			return temp;
		}

		private function skinFlip_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFlip = temp;
			temp.name = "skinFlip";
			var skin:StateSkin = new org.mokylin.skin.common.Flip1_Skin()
			temp.skin = skin
			temp.width = 122;
			temp.x = 100;
			temp.y = 484;
			return temp;
		}

		private function skinRight_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRight = temp;
			temp.name = "skinRight";
			temp.height = 522;
			var skin:StateSkin = new org.mokylin.skin.app.paihangbang.PaiHang_Right()
			temp.skin = skin
			temp.width = 370;
			temp.x = 396;
			temp.y = 0;
			return temp;
		}

		private function uiTongjizhong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTongjizhong = temp;
			temp.name = "uiTongjizhong";
			temp.styleName = "ui/app/paihangbang/word/paimingtongji.png";
			temp.x = 23;
			temp.y = 192;
			return temp;
		}

	}
}