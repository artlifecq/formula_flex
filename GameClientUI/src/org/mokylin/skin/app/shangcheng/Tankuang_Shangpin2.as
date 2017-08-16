package org.mokylin.skin.app.shangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.text.textInput3_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tankuang_Shangpin2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnCancle:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnOK:feathers.controls.Button;

		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var icons:feathers.controls.UIAsset;

		public var imgPriceType0:feathers.controls.UIAsset;

		public var imgPriceType1:feathers.controls.UIAsset;

		public var imgPriceType2:feathers.controls.UIAsset;

		public var input_txt:feathers.controls.TextInput;

		public var lbDanjiaNum:feathers.controls.Label;

		public var lbLijingNun:feathers.controls.Label;

		public var lbZongjiaNum:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tankuang_Shangpin2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.elementsContent = [bg_i(),btnClose_i(),__Tankuang_Shangpin2_UIAsset1_i(),btnCancle_i(),btnOK_i(),input_txt_i(),btn_min_i(),btn_max_i(),lbl_name_i(),icons_i(),__Tankuang_Shangpin2_Label1_i(),imgPriceType0_i(),lbLijingNun_i(),lbZongjiaNum_i(),__Tankuang_Shangpin2_Label2_i(),__Tankuang_Shangpin2_Label3_i(),imgPriceType1_i(),imgPriceType2_i(),lbDanjiaNum_i(),__Tankuang_Shangpin2_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tankuang_Shangpin2_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 19;
			temp.text = "礼金余额";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 61;
			temp.x = 39;
			temp.y = 151;
			return temp;
		}

		private function __Tankuang_Shangpin2_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "单价：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 171;
			temp.y = 68;
			return temp;
		}

		private function __Tankuang_Shangpin2_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "总价：";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 171;
			temp.y = 106;
			return temp;
		}

		private function __Tankuang_Shangpin2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/xian_shu.png";
			temp.x = 139;
			temp.y = 51;
			return temp;
		}

		private function __Tankuang_Shangpin2_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.name = "确 认";
			temp.styleName = "ui/common/background/head_tishi.png";
			temp.x = 142;
			temp.y = 9;
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
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
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
			temp.x = 293;
			temp.y = 5;
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
			temp.x = 256;
			temp.y = 155;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 175;
			temp.y = 155;
			return temp;
		}

		private function icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icons = temp;
			temp.name = "icons";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 34;
			temp.y = 76;
			return temp;
		}

		private function imgPriceType0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgPriceType0 = temp;
			temp.name = "imgPriceType0";
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.x = 41;
			temp.y = 172;
			return temp;
		}

		private function imgPriceType1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgPriceType1 = temp;
			temp.name = "imgPriceType1";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 220;
			temp.y = 67;
			return temp;
		}

		private function imgPriceType2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgPriceType2 = temp;
			temp.name = "imgPriceType2";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 220;
			temp.y = 103;
			return temp;
		}

		private function input_txt_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			input_txt = temp;
			temp.name = "input_txt";
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.textAlign = "center";
			temp.width = 59;
			temp.x = 197;
			temp.y = 155;
			return temp;
		}

		private function lbDanjiaNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDanjiaNum = temp;
			temp.name = "lbDanjiaNum";
			temp.text = "20000";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 51;
			temp.x = 251;
			temp.y = 68;
			return temp;
		}

		private function lbLijingNun_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLijingNun = temp;
			temp.name = "lbLijingNun";
			temp.height = 21;
			temp.text = "100";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 56;
			temp.x = 73;
			temp.y = 175;
			return temp;
		}

		private function lbZongjiaNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZongjiaNum = temp;
			temp.name = "lbZongjiaNum";
			temp.height = 24;
			temp.text = "100";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 58;
			temp.x = 251;
			temp.y = 106;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = false;
			temp.height = 22;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "流星护甲";
			temp.textAlign = "center";
			temp.color = 0xFF00FF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 28;
			temp.y = 55;
			return temp;
		}

	}
}