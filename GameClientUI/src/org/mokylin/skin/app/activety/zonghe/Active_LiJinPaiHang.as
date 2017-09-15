package org.mokylin.skin.app.activety.zonghe
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Active_LiJinPaiHang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var list0:feathers.controls.SkinnableContainer;

		public var list1:feathers.controls.SkinnableContainer;

		public var list10:feathers.controls.SkinnableContainer;

		public var list2:feathers.controls.SkinnableContainer;

		public var list3:feathers.controls.SkinnableContainer;

		public var list4:feathers.controls.SkinnableContainer;

		public var list5:feathers.controls.SkinnableContainer;

		public var list6:feathers.controls.SkinnableContainer;

		public var list7:feathers.controls.SkinnableContainer;

		public var list8:feathers.controls.SkinnableContainer;

		public var list9:feathers.controls.SkinnableContainer;

		public var tishi:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Active_LiJinPaiHang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 498;
			this.width = 421;
			this.elementsContent = [bg_i(),__Active_LiJinPaiHang_UIAsset1_i(),btnClose_i(),__Active_LiJinPaiHang_Group1_i(),__Active_LiJinPaiHang_Group2_i(),list0_i(),list1_i(),list2_i(),list3_i(),list4_i(),list5_i(),list6_i(),list7_i(),list8_i(),list9_i(),list10_i(),tishi_i(),__Active_LiJinPaiHang_UIAsset12_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Active_LiJinPaiHang_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 11;
			temp.y = 41;
			temp.elementsContent = [__Active_LiJinPaiHang_UIAsset2_i(),__Active_LiJinPaiHang_UIAsset3_i(),__Active_LiJinPaiHang_UIAsset4_i(),__Active_LiJinPaiHang_UIAsset5_i(),__Active_LiJinPaiHang_UIAsset6_i(),__Active_LiJinPaiHang_UIAsset7_i(),__Active_LiJinPaiHang_UIAsset8_i(),__Active_LiJinPaiHang_UIAsset9_i()];
			return temp;
		}

		private function __Active_LiJinPaiHang_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 11;
			temp.y = 402;
			temp.elementsContent = [__Active_LiJinPaiHang_UIAsset10_i(),__Active_LiJinPaiHang_UIAsset11_i()];
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 399;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/wodepaiming.png";
			temp.x = 171;
			temp.y = 5;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/activety/zonghe/lijingpaihang.png";
			temp.x = 166;
			temp.y = 6;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 441;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 405;
			temp.x = 8;
			temp.y = 38;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 50;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 145;
			temp.x = 50;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 145;
			temp.x = 195;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 59;
			temp.x = 340;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/paiming.png";
			temp.x = 10;
			temp.y = 6;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/mingzi.png";
			temp.x = 109;
			temp.y = 6;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/banghui.png";
			temp.x = 249;
			temp.y = 6;
			return temp;
		}

		private function __Active_LiJinPaiHang_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/bangdingyuanbao.png";
			temp.x = 353;
			temp.y = 6;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 498;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
			temp.width = 421;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 385;
			temp.y = 4;
			return temp;
		}

		private function list0_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			list0 = temp;
			temp.name = "list0";
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item()
			temp.skin = skin
			temp.width = 395;
			temp.x = 12;
			temp.y = 72;
			return temp;
		}

		private function list10_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			list10 = temp;
			temp.name = "list10";
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item()
			temp.skin = skin
			temp.width = 395;
			temp.x = 12;
			temp.y = 435;
			return temp;
		}

		private function list1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			list1 = temp;
			temp.name = "list1";
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item()
			temp.skin = skin
			temp.width = 395;
			temp.x = 12;
			temp.y = 105;
			return temp;
		}

		private function list2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			list2 = temp;
			temp.name = "list2";
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item()
			temp.skin = skin
			temp.width = 395;
			temp.x = 12;
			temp.y = 138;
			return temp;
		}

		private function list3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			list3 = temp;
			temp.name = "list3";
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item()
			temp.skin = skin
			temp.width = 395;
			temp.x = 12;
			temp.y = 171;
			return temp;
		}

		private function list4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			list4 = temp;
			temp.name = "list4";
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item()
			temp.skin = skin
			temp.width = 395;
			temp.x = 12;
			temp.y = 204;
			return temp;
		}

		private function list5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			list5 = temp;
			temp.name = "list5";
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item()
			temp.skin = skin
			temp.width = 395;
			temp.x = 12;
			temp.y = 237;
			return temp;
		}

		private function list6_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			list6 = temp;
			temp.name = "list6";
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item()
			temp.skin = skin
			temp.width = 395;
			temp.x = 12;
			temp.y = 270;
			return temp;
		}

		private function list7_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			list7 = temp;
			temp.name = "list7";
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item()
			temp.skin = skin
			temp.width = 395;
			temp.x = 12;
			temp.y = 303;
			return temp;
		}

		private function list8_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			list8 = temp;
			temp.name = "list8";
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item()
			temp.skin = skin
			temp.width = 395;
			temp.x = 12;
			temp.y = 336;
			return temp;
		}

		private function list9_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			list9 = temp;
			temp.name = "list9";
			temp.height = 32;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item()
			temp.skin = skin
			temp.width = 395;
			temp.x = 12;
			temp.y = 369;
			return temp;
		}

		private function tishi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tishi = temp;
			temp.name = "tishi";
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/henyihan.png";
			temp.x = 72;
			temp.y = 441;
			return temp;
		}

	}
}