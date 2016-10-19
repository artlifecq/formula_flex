package org.mokylin.skin.app.country
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_xiao_red;
	import org.mokylin.skin.component.list.ListRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryExchequerSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var dangQianSuiLvTxt:feathers.controls.Label;

		public var guoKuZhuangTaiTxt:feathers.controls.Label;

		public var guoKuZongErTxt:feathers.controls.Label;

		public var juankuan:feathers.controls.Button;

		public var list:feathers.controls.List;

		public var zuoRiZongShouYiTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryExchequerSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__CountryExchequerSkin_UIAsset1_i(),__CountryExchequerSkin_UIAsset2_i(),__CountryExchequerSkin_UIAsset3_i(),__CountryExchequerSkin_UIAsset4_i(),__CountryExchequerSkin_UIAsset5_i(),__CountryExchequerSkin_UIAsset6_i(),__CountryExchequerSkin_UIAsset7_i(),list_i(),__CountryExchequerSkin_Label1_i(),__CountryExchequerSkin_Label2_i(),__CountryExchequerSkin_Label3_i(),__CountryExchequerSkin_Label4_i(),__CountryExchequerSkin_Label5_i(),guoKuZongErTxt_i(),__CountryExchequerSkin_Label6_i(),guoKuZhuangTaiTxt_i(),__CountryExchequerSkin_Label7_i(),dangQianSuiLvTxt_i(),__CountryExchequerSkin_Label8_i(),zuoRiZongShouYiTxt_i(),juankuan_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CountryExchequerSkin_Label1_i():feathers.controls.Label
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
			temp.y = 117;
			return temp;
		}

		private function __CountryExchequerSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国库状态";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 483;
			temp.y = 17;
			return temp;
		}

		private function __CountryExchequerSkin_Label3_i():feathers.controls.Label
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
			temp.y = 117;
			return temp;
		}

		private function __CountryExchequerSkin_Label4_i():feathers.controls.Label
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
			temp.y = 117;
			return temp;
		}

		private function __CountryExchequerSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国库总额：";
			temp.color = 0x5B2812;
			temp.width = 87;
			temp.x = 278;
			temp.y = 53;
			return temp;
		}

		private function __CountryExchequerSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国库状态：";
			temp.color = 0x5B2812;
			temp.width = 86;
			temp.x = 278;
			temp.y = 84;
			return temp;
		}

		private function __CountryExchequerSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "当前税率：";
			temp.color = 0x5B2812;
			temp.width = 88;
			temp.x = 600;
			temp.y = 53;
			return temp;
		}

		private function __CountryExchequerSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "昨日总收益：";
			temp.color = 0x5B2812;
			temp.width = 92;
			temp.x = 600;
			temp.y = 84;
			return temp;
		}

		private function __CountryExchequerSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 483;
			temp.styleName = "ui/app/country/shu.png";
			temp.width = 3;
			temp.x = 215;
			temp.y = 6;
			return temp;
		}

		private function __CountryExchequerSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 482;
			temp.styleName = "ui/big_bg/guo_jia_jin_ku.jpg";
			temp.width = 212;
			temp.x = 5;
			temp.y = 5;
			return temp;
		}

		private function __CountryExchequerSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 485;
			temp.styleName = "ui/app/country/niupizhi/di.png";
			temp.width = 658;
			temp.x = 219;
			temp.y = 6;
			return temp;
		}

		private function __CountryExchequerSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiaodi.png";
			temp.x = 220;
			temp.y = 109;
			return temp;
		}

		private function __CountryExchequerSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiaodi.png";
			temp.x = 220;
			temp.y = 8;
			return temp;
		}

		private function __CountryExchequerSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 260;
			temp.y = 120;
			return temp;
		}

		private function __CountryExchequerSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 471;
			temp.y = 120;
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
			temp.x = 676;
			temp.y = 53;
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
			temp.x = 354;
			temp.y = 84;
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
			temp.x = 352;
			temp.y = 53;
			return temp;
		}

		private function juankuan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			juankuan = temp;
			temp.name = "juankuan";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "捐款";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_xiao_red);
			temp.color = 0xD4C996;
			temp.x = 462;
			temp.y = 52;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 325;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 650;
			temp.x = 221;
			temp.y = 146;
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
			temp.x = 690;
			temp.y = 84;
			return temp;
		}

	}
}