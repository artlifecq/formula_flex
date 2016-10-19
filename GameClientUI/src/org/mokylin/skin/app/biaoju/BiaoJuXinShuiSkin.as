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
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniuhuang;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.list.ListRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BiaoJuXinShuiSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var chongXinFenPei:feathers.controls.Button;

		public var chongXinFenPei0:feathers.controls.Button;

		public var fenpeiSilver:feathers.controls.Label;

		public var kucunSilver:feathers.controls.Label;

		public var kucunSilver0:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var pingjunFenPei:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BiaoJuXinShuiSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),__BiaoJuXinShuiSkin_UIAsset1_i(),btnClose_i(),__BiaoJuXinShuiSkin_UIAsset2_i(),__BiaoJuXinShuiSkin_UIAsset3_i(),__BiaoJuXinShuiSkin_UIAsset4_i(),__BiaoJuXinShuiSkin_UIAsset5_i(),__BiaoJuXinShuiSkin_UIAsset6_i(),__BiaoJuXinShuiSkin_UIAsset7_i(),__BiaoJuXinShuiSkin_Label1_i(),__BiaoJuXinShuiSkin_Label2_i(),kucunSilver_i(),__BiaoJuXinShuiSkin_Label3_i(),kucunSilver0_i(),fenpeiSilver_i(),__BiaoJuXinShuiSkin_UIAsset8_i(),__BiaoJuXinShuiSkin_Label4_i(),__BiaoJuXinShuiSkin_Label5_i(),__BiaoJuXinShuiSkin_Label6_i(),__BiaoJuXinShuiSkin_Label7_i(),__BiaoJuXinShuiSkin_Label8_i(),pingjunFenPei_i(),chongXinFenPei_i(),chongXinFenPei0_i(),list_i(),__BiaoJuXinShuiSkin_UIAsset9_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BiaoJuXinShuiSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "*每天只可进行1次利润分配";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 94;
			temp.y = 83;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "库存资金：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 93;
			temp.y = 53;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "即将分配总额";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 295;
			temp.y = 406;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "成员名称";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 82;
			temp.y = 161;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "职位";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 244;
			temp.y = 161;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "等级";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 349;
			temp.y = 161;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "分配额度";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 461;
			temp.y = 161;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "可分配利润：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 303;
			temp.y = 53;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 408;
			temp.styleName = "ui/common/version_3/D_di/di_2.png";
			temp.width = 579;
			temp.x = 13;
			temp.y = 36;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/di_3.jpg";
			temp.x = 16;
			temp.y = 116;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/xin_shui_fp2.png";
			temp.x = 259;
			temp.y = 3;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/xin_shui_fp.png";
			temp.x = 258;
			temp.y = 133;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/hua_bian.png";
			temp.x = 128;
			temp.y = 143;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 72;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 572;
			temp.x = 16;
			temp.y = 41;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/hua_bian_2.png";
			temp.x = 362;
			temp.y = 143;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/biao_ti_2.png";
			temp.x = 16;
			temp.y = 154;
			return temp;
		}

		private function __BiaoJuXinShuiSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/fen_ge_xian.png";
			temp.width = 525;
			temp.x = 40;
			temp.y = 387;
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

		private function chongXinFenPei0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			chongXinFenPei0 = temp;
			temp.name = "chongXinFenPei0";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "提交分配";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 95;
			temp.x = 476;
			temp.y = 396;
			return temp;
		}

		private function chongXinFenPei_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			chongXinFenPei = temp;
			temp.name = "chongXinFenPei";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "重新分配";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniuhuang);
			temp.color = 0xF9F0CC;
			temp.width = 95;
			temp.x = 152;
			temp.y = 396;
			return temp;
		}

		private function fenpeiSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			fenpeiSilver = temp;
			temp.name = "fenpeiSilver";
			temp.text = "999锭 333两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 391;
			temp.y = 53;
			return temp;
		}

		private function kucunSilver0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			kucunSilver0 = temp;
			temp.name = "kucunSilver0";
			temp.text = "999锭 333两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 389;
			temp.y = 406;
			return temp;
		}

		private function kucunSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			kucunSilver = temp;
			temp.name = "kucunSilver";
			temp.text = "999锭 333两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 163;
			temp.y = 53;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 200;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 550;
			temp.x = 31;
			temp.y = 184;
			return temp;
		}

		private function pingjunFenPei_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			pingjunFenPei = temp;
			temp.name = "pingjunFenPei";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "平均分配";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniuhuang);
			temp.color = 0xF9F0CC;
			temp.width = 95;
			temp.x = 50;
			temp.y = 396;
			return temp;
		}

	}
}