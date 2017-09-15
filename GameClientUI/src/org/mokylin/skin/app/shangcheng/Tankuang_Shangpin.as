package org.mokylin.skin.app.shangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_putong3;

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
		public var bg:feathers.controls.SkinnableContainer;

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

		public var lbDiejia1:feathers.controls.Label;

		public var lbShengyu:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;

		public var lbl_num:feathers.controls.Label;

		public var lbl_num1:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tankuang_Shangpin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.width = 326;
			this.elementsContent = [bg_i(),btnClose_i(),btnCancle_i(),btnOK_i(),btns_i(),contents_i(),__Tankuang_Shangpin_Label2_i(),lbAll_i(),imgMoneyType2_i(),lbShengyu_i(),__Tankuang_Shangpin_UIAsset1_i()];
			
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
			temp.color = 0xBBBDAA;
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
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 74;
			temp.x = 40;
			temp.y = 171;
			return temp;
		}

		private function __Tankuang_Shangpin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/art_txt/common/background/head_tishi.png";
			temp.x = 142;
			temp.y = 9;
			return temp;
		}

		private function bg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg0 = temp;
			temp.name = "bg0";
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 59;
			temp.x = 92;
			temp.y = 2;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 264;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 326;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnCancle_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancle = temp;
			temp.name = "btnCancle";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "取 消";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 181;
			temp.y = 216;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 290;
			temp.y = 4;
			return temp;
		}

		private function btnMax_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMax = temp;
			temp.name = "btnMax";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "MAX";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong3;
			temp.color = 0xCFC6AE;
			temp.x = 173;
			temp.y = 2;
			return temp;
		}

		private function btnOK_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOK = temp;
			temp.name = "btnOK";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "购 买";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 57;
			temp.y = 216;
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
			temp.width = 243;
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
			temp.width = 257;
			temp.x = 41;
			temp.y = 51;
			temp.elementsContent = [lbl_name_i(),lbl_num1_i(),lbDiejia_i(),icons_i(),imgPriceType_i(),lbl_num_i(),lbDiejia1_i()];
			return temp;
		}

		private function icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icons = temp;
			temp.name = "icons";
			temp.height = 76;
			temp.styleName = "ui/common/grid/normal/64.png";
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
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
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
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 54;
			temp.x = 94;
			temp.y = 5;
			return temp;
		}

		private function lbDiejia1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDiejia1 = temp;
			temp.name = "lbDiejia1";
			temp.text = "20000";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 98;
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
			temp.color = 0xBBBDAA;
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
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 119;
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
			temp.color = 0xFF00FF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 173;
			temp.x = 80;
			temp.y = 3;
			return temp;
		}

		private function lbl_num1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_num1 = temp;
			temp.name = "lbl_num1";
			temp.height = 24;
			temp.text = "10";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 97;
			temp.x = 155;
			temp.y = 33;
			return temp;
		}

		private function lbl_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_num = temp;
			temp.name = "lbl_num";
			temp.text = "售价：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 48;
			temp.x = 81;
			temp.y = 33;
			return temp;
		}

	}
}