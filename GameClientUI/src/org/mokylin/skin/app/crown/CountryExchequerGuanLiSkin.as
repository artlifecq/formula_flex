package org.mokylin.skin.app.crown
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_button;
	import org.mokylin.skin.component.list.ListRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryExchequerGuanLiSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var dangQianSuiLvTxt:feathers.controls.Label;

		public var donationsBtn:feathers.controls.Button;

		public var guoKuZhuangTaiTxt:feathers.controls.Label;

		public var guoKuZongErTxt:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var militaryBtn:feathers.controls.Button;

		public var revenueSetBtn:feathers.controls.Button;

		public var zuoRiZongShouYiTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryExchequerGuanLiSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__CountryExchequerGuanLiSkin_UIAsset1_i(),__CountryExchequerGuanLiSkin_UIAsset2_i(),__CountryExchequerGuanLiSkin_UIAsset3_i(),__CountryExchequerGuanLiSkin_UIAsset4_i(),__CountryExchequerGuanLiSkin_Label1_i(),__CountryExchequerGuanLiSkin_Label2_i(),guoKuZongErTxt_i(),__CountryExchequerGuanLiSkin_Label3_i(),guoKuZhuangTaiTxt_i(),__CountryExchequerGuanLiSkin_Label4_i(),dangQianSuiLvTxt_i(),__CountryExchequerGuanLiSkin_Label5_i(),zuoRiZongShouYiTxt_i(),list_i(),__CountryExchequerGuanLiSkin_UIAsset5_i(),militaryBtn_i(),revenueSetBtn_i(),donationsBtn_i(),__CountryExchequerGuanLiSkin_UIAsset6_i(),__CountryExchequerGuanLiSkin_UIAsset7_i(),__CountryExchequerGuanLiSkin_Label6_i(),__CountryExchequerGuanLiSkin_Label7_i(),__CountryExchequerGuanLiSkin_Label8_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CountryExchequerGuanLiSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国库状态";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 110;
			temp.x = 488;
			temp.y = 23;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国库总额：";
			temp.color = 0x5B2812;
			temp.width = 87;
			temp.x = 272;
			temp.y = 62;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国库状态：";
			temp.color = 0x5B2812;
			temp.width = 86;
			temp.x = 272;
			temp.y = 93;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "当前税率：";
			temp.color = 0x5B2812;
			temp.width = 88;
			temp.x = 634;
			temp.y = 62;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "昨日总收益：";
			temp.color = 0x5B2812;
			temp.width = 92;
			temp.x = 634;
			temp.y = 93;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "时间";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 252;
			temp.y = 132;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "事件";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 442;
			temp.y = 132;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "收支明细";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 683;
			temp.y = 132;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/neikuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 445;
			temp.styleName = "ui/app/crown/di.png";
			temp.x = 219;
			temp.y = 6;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiaodi.png";
			temp.x = 218;
			temp.y = 14;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/guo_jia_jin_ku.jpg";
			temp.x = 5;
			temp.y = 5;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiaodi.png";
			temp.x = 218;
			temp.y = 124;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 260;
			temp.y = 135;
			return temp;
		}

		private function __CountryExchequerGuanLiSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 471;
			temp.y = 135;
			return temp;
		}

		private function dangQianSuiLvTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			dangQianSuiLvTxt = temp;
			temp.name = "dangQianSuiLvTxt";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "8%";
			temp.color = 0x239D02;
			temp.width = 108;
			temp.x = 710;
			temp.y = 62;
			return temp;
		}

		private function donationsBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			donationsBtn = temp;
			temp.name = "donationsBtn";
			temp.height = 32;
			temp.label = "募  捐";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 114;
			temp.x = 753;
			temp.y = 453;
			return temp;
		}

		private function guoKuZhuangTaiTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guoKuZhuangTaiTxt = temp;
			temp.name = "guoKuZhuangTaiTxt";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "富饶";
			temp.color = 0x5B2812;
			temp.width = 108;
			temp.x = 348;
			temp.y = 93;
			return temp;
		}

		private function guoKuZongErTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guoKuZongErTxt = temp;
			temp.name = "guoKuZongErTxt";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "8888888";
			temp.color = 0x239D02;
			temp.width = 155;
			temp.x = 346;
			temp.y = 62;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 286;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 650;
			temp.x = 220;
			temp.y = 156;
			return temp;
		}

		private function militaryBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			militaryBtn = temp;
			temp.name = "militaryBtn";
			temp.height = 33;
			temp.label = "军  费";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 112;
			temp.x = 526;
			temp.y = 453;
			return temp;
		}

		private function revenueSetBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			revenueSetBtn = temp;
			temp.name = "revenueSetBtn";
			temp.height = 33;
			temp.label = "税收设定";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 114;
			temp.x = 639;
			temp.y = 453;
			return temp;
		}

		private function zuoRiZongShouYiTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			zuoRiZongShouYiTxt = temp;
			temp.name = "zuoRiZongShouYiTxt";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "15锭25两";
			temp.color = 0x239D02;
			temp.width = 143;
			temp.x = 724;
			temp.y = 93;
			return temp;
		}

	}
}