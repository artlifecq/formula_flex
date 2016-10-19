package org.mokylin.skin.app.biaoju
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.button.ButtonV3_t_tongyonganniuhuang;
	import org.mokylin.skin.component.list.ListRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BiaoJuFenPeiSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var autoFenPei:feathers.controls.Button;

		public var bg:feathers.controls.UIAsset;

		public var biaoJuSilver:feathers.controls.Label;

		public var btnClose:feathers.controls.Button;

		public var kuCunSilver:feathers.controls.Label;

		public var kuCunSilver0:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var reset:feathers.controls.Button;

		public var sure:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BiaoJuFenPeiSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),__BiaoJuFenPeiSkin_UIAsset1_i(),__BiaoJuFenPeiSkin_UIAsset2_i(),__BiaoJuFenPeiSkin_UIAsset3_i(),__BiaoJuFenPeiSkin_UIAsset4_i(),__BiaoJuFenPeiSkin_UIAsset5_i(),__BiaoJuFenPeiSkin_UIAsset6_i(),__BiaoJuFenPeiSkin_Label1_i(),__BiaoJuFenPeiSkin_Label2_i(),__BiaoJuFenPeiSkin_Label3_i(),__BiaoJuFenPeiSkin_Label4_i(),__BiaoJuFenPeiSkin_Label5_i(),__BiaoJuFenPeiSkin_Label6_i(),kuCunSilver_i(),__BiaoJuFenPeiSkin_Label7_i(),kuCunSilver0_i(),biaoJuSilver_i(),__BiaoJuFenPeiSkin_Label8_i(),sure_i(),autoFenPei_i(),reset_i(),__BiaoJuFenPeiSkin_UIAsset7_i(),__BiaoJuFenPeiSkin_UIAsset8_i(),__BiaoJuFenPeiSkin_UIAsset9_i(),__BiaoJuFenPeiSkin_UIAsset10_i(),list_i(),__BiaoJuFenPeiSkin_UIAsset11_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BiaoJuFenPeiSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "库存资金：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 93;
			temp.y = 54;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "成员名称";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 82;
			temp.y = 162;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "职位";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 243;
			temp.y = 162;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "等级";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 349;
			temp.y = 162;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "分配额度";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 460;
			temp.y = 162;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "*每天只可进行1次利润分配";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 94;
			temp.y = 83;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "即将分配总额：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 295;
			temp.y = 407;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "可分配利润：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 303;
			temp.y = 54;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/xin_shui_fp2.png";
			temp.x = 258;
			temp.y = 5;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/fen_ge_xian.png";
			temp.width = 522;
			temp.x = 44;
			temp.y = 390;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/gao_guang.png";
			temp.width = 503;
			temp.x = 48;
			temp.y = 4;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 408;
			temp.styleName = "ui/common/version_3/D_di/di_2.png";
			temp.width = 579;
			temp.x = 13;
			temp.y = 36;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 73;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 572;
			temp.x = 16;
			temp.y = 41;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 66;
			temp.styleName = "ui/big_bg/bei_jing_tu_1.png";
			temp.width = 564;
			temp.x = 20;
			temp.y = 43;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 321;
			temp.styleName = "ui/app/biaoju/di_3.jpg";
			temp.width = 568;
			temp.x = 19;
			temp.y = 117;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/biao_ti_2.png";
			temp.x = 16;
			temp.y = 155;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/hua_bian.png";
			temp.x = 128;
			temp.y = 144;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/hua_bian_2.png";
			temp.x = 361;
			temp.y = 144;
			return temp;
		}

		private function __BiaoJuFenPeiSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/xin_shui_fp.png";
			temp.x = 258;
			temp.y = 134;
			return temp;
		}

		private function autoFenPei_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			autoFenPei = temp;
			temp.name = "autoFenPei";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 32;
			temp.label = "平均分配";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_t_tongyonganniuhuang);
			temp.color = 0xF9F0CC;
			temp.width = 93;
			temp.x = 52;
			temp.y = 399;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 458;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/di_ban.png";
			temp.width = 605;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function biaoJuSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			biaoJuSilver = temp;
			temp.name = "biaoJuSilver";
			temp.text = "99锭 99两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 158;
			temp.x = 387;
			temp.y = 54;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 581;
			temp.y = 1;
			return temp;
		}

		private function kuCunSilver0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			kuCunSilver0 = temp;
			temp.name = "kuCunSilver0";
			temp.text = "99锭 99两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 84;
			temp.x = 393;
			temp.y = 407;
			return temp;
		}

		private function kuCunSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			kuCunSilver = temp;
			temp.name = "kuCunSilver";
			temp.text = "99锭 99两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 134;
			temp.x = 165;
			temp.y = 54;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 198;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 544;
			temp.x = 32;
			temp.y = 186;
			return temp;
		}

		private function reset_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			reset = temp;
			temp.name = "reset";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 32;
			temp.label = "重新分配";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_t_tongyonganniuhuang);
			temp.color = 0xF9F0CC;
			temp.width = 93;
			temp.x = 154;
			temp.y = 399;
			return temp;
		}

		private function sure_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sure = temp;
			temp.name = "sure";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 32;
			temp.label = "同 意";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 93;
			temp.x = 477;
			temp.y = 399;
			return temp;
		}

	}
}