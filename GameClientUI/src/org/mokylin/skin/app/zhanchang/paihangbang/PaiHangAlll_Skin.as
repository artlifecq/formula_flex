package org.mokylin.skin.app.zhanchang.paihangbang
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber3;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiHangAlll_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var grpPaihang:feathers.controls.Group;

		public var imgDi:feathers.controls.UIAsset;

		public var imgMing:feathers.controls.UIAsset;

		public var listItem:feathers.controls.List;

		public var numZhanli:feathers.controls.UINumber;

		public var title:feathers.controls.UIAsset;

		public var uiWRB:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHangAlll_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 557;
			this.width = 321;
			this.elementsContent = [bg_i(),listItem_i(),__PaiHangAlll_Skin_UIAsset2_i(),__PaiHangAlll_Skin_UIAsset3_i(),__PaiHangAlll_Skin_UIAsset4_i(),__PaiHangAlll_Skin_UIAsset5_i(),grpPaihang_i(),uiWRB_i(),title_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PaiHangAlll_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/bg2.png";
			temp.x = 6;
			temp.y = 445;
			return temp;
		}

		private function __PaiHangAlll_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/wodepaihang.png";
			temp.x = 124;
			temp.y = 458;
			return temp;
		}

		private function __PaiHangAlll_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 51;
			temp.y = 463;
			return temp;
		}

		private function __PaiHangAlll_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 203;
			temp.y = 463;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 557;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
			temp.width = 321;
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
			temp.top = 4;
			temp.x = 285;
			return temp;
		}

		private function grpPaihang_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpPaihang = temp;
			temp.name = "grpPaihang";
			temp.x = 107;
			temp.y = 493;
			temp.elementsContent = [imgMing_i(),numZhanli_i(),imgDi_i()];
			return temp;
		}

		private function imgDi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgDi = temp;
			temp.name = "imgDi";
			temp.styleName = "ui/app/zhanchang/jingjichang/di2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgMing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgMing = temp;
			temp.name = "imgMing";
			temp.styleName = "ui/app/zhanchang/jingjichang/ming2.png";
			temp.x = 98;
			temp.y = 0;
			return temp;
		}

		private function listItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listItem = temp;
			temp.name = "listItem";
			temp.height = 410;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 302;
			temp.x = 12;
			temp.y = 34;
			return temp;
		}

		private function numZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numZhanli = temp;
			temp.name = "numZhanli";
			temp.gap = -2;
			temp.height = 25;
			temp.label = "2000";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber3;
			temp.width = 76;
			temp.x = 26;
			temp.y = 0;
			return temp;
		}

		private function title_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			title = temp;
			temp.name = "title";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/zhanchang/zhoupaihangjiangli.png";
			temp.x = 107;
			temp.y = 8;
			return temp;
		}

		private function uiWRB_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiWRB = temp;
			temp.name = "uiWRB";
			temp.styleName = "ui/app/zhanchang/paihangbang/weirubang.png";
			temp.x = 130;
			temp.y = 495;
			return temp;
		}

	}
}