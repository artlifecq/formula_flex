package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.button.ButtonJiantou;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BangHui_List extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnExit:feathers.controls.Button;

		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var grpFlip:feathers.controls.Group;

		public var lbNum:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BangHui_List()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [btnExit_i(),__BangHui_List_UIAsset2_i(),__BangHui_List_Group1_i(),grpFlip_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BangHui_List_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 291;
			temp.y = 89;
			temp.elementsContent = [__BangHui_List_UIAsset3_i(),__BangHui_List_UIAsset4_i(),__BangHui_List_UIAsset5_i(),__BangHui_List_UIAsset6_i(),__BangHui_List_UIAsset7_i(),__BangHui_List_UIAsset8_i(),__BangHui_List_UIAsset9_i(),__BangHui_List_UIAsset10_i(),__BangHui_List_UIAsset11_i(),__BangHui_List_UIAsset12_i(),__BangHui_List_UIAsset13_i(),__BangHui_List_UIAsset14_i()];
			return temp;
		}

		private function __BangHui_List_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangpaimingcheng.png";
			temp.x = 118;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_List_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/dengji.png";
			temp.x = 237;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_List_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangzhu.png";
			temp.x = 338;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_List_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/renshu.png";
			temp.x = 448;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_List_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/zongzhanli.png";
			temp.x = 553;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_List_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiantoubg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_List_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 442;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 647;
			temp.x = 288;
			temp.y = 86;
			return temp;
		}

		private function __BangHui_List_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 69;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_List_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 157;
			temp.x = 69;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_List_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 53;
			temp.x = 226;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_List_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 146;
			temp.x = 279;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_List_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 79;
			temp.x = 425;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_List_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 137;
			temp.x = 504;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_List_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/paiming.png";
			temp.x = 28;
			temp.y = 5;
			return temp;
		}

		private function btnExit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnExit = temp;
			temp.name = "btnExit";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "退出帮派";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 112;
			temp.x = 802;
			temp.y = 544;
			return temp;
		}

		private function btnNext_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNext = temp;
			temp.name = "btnNext";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonJiantou;
			temp.x = 72;
			temp.y = 1;
			return temp;
		}

		private function btnPrev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPrev = temp;
			temp.name = "btnPrev";
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonJiantou;
			temp.x = 2;
			temp.y = 1;
			return temp;
		}

		private function grpFlip_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFlip = temp;
			temp.name = "grpFlip";
			temp.x = 576;
			temp.y = 513;
			temp.elementsContent = [__BangHui_List_UIAsset15_i(),lbNum_i(),btnPrev_i(),btnNext_i()];
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.height = 19;
			temp.fontSize = 14;
			temp.text = "1/99";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 11;
			temp.y = 2;
			return temp;
		}

	}
}