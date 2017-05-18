package org.mokylin.skin.app.shangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tankuang_Shangpin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bg0:feathers.controls.UIAsset;

		public var btnCancle:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnMax:feathers.controls.Button;

		public var btnOK:feathers.controls.Button;

		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var btns:feathers.controls.Group;

		public var contents:feathers.controls.Group;

		public var icons:feathers.controls.UIAsset;

		public var imgMoneyType2:feathers.controls.UIAsset;

		public var imgPriceType:feathers.controls.UIAsset;

		public var lbAll:feathers.controls.Label;

		public var lbBuyNum:feathers.controls.Label;

		public var lbDiejia:feathers.controls.Label;

		public var lbDiejia0:feathers.controls.Label;

		public var lbShengyu:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;

		public var lbl_num:feathers.controls.Label;

		public var lbl_num0:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tankuang_Shangpin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 270;
			this.width = 332;
			this.elementsContent = [bg_i(),__Tankuang_Shangpin_UIAsset1_i(),__Tankuang_Shangpin_UIAsset2_i(),lbl_title_i(),btnClose_i(),btnCancle_i(),btnOK_i(),btns_i(),contents_i(),__Tankuang_Shangpin_Label2_i(),lbAll_i(),imgMoneyType2_i(),lbShengyu_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tankuang_Shangpin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "购买数量：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 76;
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function __Tankuang_Shangpin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "所需总价：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 74;
			temp.x = 40;
			temp.y = 171;
			return temp;
		}

		private function __Tankuang_Shangpin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 161;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 310;
			temp.x = 11;
			temp.y = 41;
			return temp;
		}

		private function __Tankuang_Shangpin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/erji_bg.jpg";
			temp.x = 15;
			temp.y = 44;
			return temp;
		}

		private function bg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg0 = temp;
			temp.name = "bg0";
			temp.styleName = "ui/component/text/input_bg.png";
			temp.width = 56;
			temp.x = 93;
			temp.y = 1;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 270;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 332;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnCancle_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancle = temp;
			temp.name = "btnCancle";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "取 消";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 95;
			temp.x = 57;
			temp.y = 214;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 298;
			temp.y = 7;
			return temp;
		}

		private function btnMax_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMax = temp;
			temp.name = "btnMax";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "MAX";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.width = 65;
			temp.x = 192;
			temp.y = -5;
			return temp;
		}

		private function btnOK_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOK = temp;
			temp.name = "btnOK";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "购 买";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 87;
			temp.x = 189;
			temp.y = 218;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 151;
			temp.y = 2;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 70;
			temp.y = 2;
			return temp;
		}

		private function btns_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btns = temp;
			temp.name = "btns";
			temp.width = 268;
			temp.x = 41;
			temp.y = 135;
			temp.elementsContent = [__Tankuang_Shangpin_Label1_i(),bg0_i(),lbBuyNum_i(),btn_min_i(),btn_max_i(),btnMax_i()];
			return temp;
		}

		private function contents_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			contents = temp;
			temp.name = "contents";
			temp.x = 31;
			temp.y = 51;
			temp.elementsContent = [lbl_name_i(),lbl_num_i(),lbDiejia_i(),icons_i(),imgPriceType_i(),lbl_num0_i(),lbDiejia0_i()];
			return temp;
		}

		private function icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icons = temp;
			temp.name = "icons";
			temp.height = 76;
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/64.png";
			temp.width = 76;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgMoneyType2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgMoneyType2 = temp;
			temp.name = "imgMoneyType2";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 110;
			temp.y = 168;
			return temp;
		}

		private function imgPriceType_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgPriceType = temp;
			temp.name = "imgPriceType";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 124;
			temp.y = 29;
			return temp;
		}

		private function lbAll_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAll = temp;
			temp.name = "lbAll";
			temp.height = 22;
			temp.text = "10";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 46;
			temp.x = 136;
			temp.y = 171;
			return temp;
		}

		private function lbBuyNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBuyNum = temp;
			temp.name = "lbBuyNum";
			temp.height = 19;
			temp.text = "1000";
			temp.textAlign = "center";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 95;
			temp.y = 4;
			return temp;
		}

		private function lbDiejia0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDiejia0 = temp;
			temp.name = "lbDiejia0";
			temp.text = "20000";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 150;
			temp.y = 53;
			return temp;
		}

		private function lbDiejia_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDiejia = temp;
			temp.name = "lbDiejia";
			temp.text = "最大叠加：";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 81;
			temp.x = 80;
			temp.y = 53;
			return temp;
		}

		private function lbShengyu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShengyu = temp;
			temp.name = "lbShengyu";
			temp.text = "剩余元宝：10";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 129;
			temp.x = 195;
			temp.y = 171;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = false;
			temp.height = 26;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "虾米宝贝";
			temp.color = 0x9d4aa8;
			temp.width = 196;
			temp.x = 80;
			temp.y = 3;
			return temp;
		}

		private function lbl_num0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_num0 = temp;
			temp.name = "lbl_num0";
			temp.height = 24;
			temp.text = "售价";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 42;
			temp.x = 81;
			temp.y = 33;
			return temp;
		}

		private function lbl_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_num = temp;
			temp.name = "lbl_num";
			temp.height = 24;
			temp.text = "10";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 104;
			temp.x = 157;
			temp.y = 33;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "提 示";
			temp.textAlign = "center";
			temp.color = 0xb8ad80;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 165;
			temp.x = 90;
			temp.y = 11;
			return temp;
		}

	}
}