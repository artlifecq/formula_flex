package org.mokylin.skin.app.biaoju
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.common.version_3.J_jindutiao.ProgressBar_Yellow_1Skin;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.button.ButtonV3_l_liebiaoanniu;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BiaoJuPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var biaoJuSilver:feathers.controls.Label;

		public var btnClose:feathers.controls.Button;

		public var changfuBar:feathers.controls.ProgressBar;

		public var chongru:feathers.controls.Button;

		public var countryBiaoJu:feathers.controls.Label;

		public var countryName:feathers.controls.Label;

		public var dailyPeiFu:feathers.controls.Label;

		public var fenpei:feathers.controls.Button;

		public var isOpen:feathers.controls.Label;

		public var kuCunSilver:feathers.controls.Label;

		public var openBiaoJu:feathers.controls.Button;

		public var tab:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BiaoJuPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 458;
			this.width = 605;
			this.elementsContent = [bg_i(),__BiaoJuPanelSkin_UIAsset1_i(),__BiaoJuPanelSkin_UIAsset2_i(),btnClose_i(),__BiaoJuPanelSkin_UIAsset3_i(),__BiaoJuPanelSkin_UIAsset4_i(),__BiaoJuPanelSkin_UIAsset5_i(),__BiaoJuPanelSkin_UIAsset6_i(),__BiaoJuPanelSkin_UIAsset7_i(),countryBiaoJu_i(),countryName_i(),__BiaoJuPanelSkin_Label1_i(),kuCunSilver_i(),biaoJuSilver_i(),dailyPeiFu_i(),__BiaoJuPanelSkin_Label2_i(),__BiaoJuPanelSkin_Label3_i(),__BiaoJuPanelSkin_Label4_i(),openBiaoJu_i(),chongru_i(),fenpei_i(),tab_i(),__BiaoJuPanelSkin_UIAsset8_i(),isOpen_i(),changfuBar_i()];
			
			states = {
				init:[
						{target:"changfuBar",
							name:"paddingLeft",
							value:8
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BiaoJuPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['镖局说明','详细数据','历史记录'];
			return temp;
		}

		private function __BiaoJuPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "库存资金：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 353;
			temp.y = 51;
			return temp;
		}

		private function __BiaoJuPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "偿付能力：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 353;
			temp.y = 76;
			return temp;
		}

		private function __BiaoJuPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "镖局利润：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 353;
			temp.y = 101;
			return temp;
		}

		private function __BiaoJuPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "今日赔付：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 353;
			temp.y = 126;
			return temp;
		}

		private function __BiaoJuPanelSkin_UIAsset1_i():feathers.controls.UIAsset
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

		private function __BiaoJuPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 408;
			temp.styleName = "ui/common/version_3/D_di/di_2.png";
			temp.width = 579;
			temp.x = 12;
			temp.y = 36;
			return temp;
		}

		private function __BiaoJuPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/biaoju/biao_ju.png";
			temp.x = 279;
			temp.y = 6;
			return temp;
		}

		private function __BiaoJuPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 112;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 571;
			temp.x = 16;
			temp.y = 41;
			return temp;
		}

		private function __BiaoJuPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/bei_jing_tu_1.png";
			temp.width = 563;
			temp.x = 20;
			temp.y = 43;
			return temp;
		}

		private function __BiaoJuPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/di_1.jpg";
			temp.x = 160;
			temp.y = 154;
			return temp;
		}

		private function __BiaoJuPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/di_2.jpg";
			temp.x = 17;
			temp.y = 153;
			return temp;
		}

		private function __BiaoJuPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 289;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/fen_ge_xian_shu.png";
			temp.x = 157;
			temp.y = 152;
			return temp;
		}

		private function __BiaoJuPanelSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = -5;
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
			temp.width = 94;
			temp.x = 427;
			temp.y = 102;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 581;
			temp.y = 1;
			return temp;
		}

		private function changfuBar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			changfuBar = temp;
			temp.name = "changfuBar";
			temp.height = 15;
			temp.maximum = 100;
			temp.paddingRight = 8;
			temp.styleClass = org.mokylin.skin.common.version_3.J_jindutiao.ProgressBar_Yellow_1Skin;
			temp.value = 100;
			temp.width = 142;
			temp.x = 427;
			temp.y = 79;
			return temp;
		}

		private function chongru_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			chongru = temp;
			temp.name = "chongru";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "充入";
			temp.letterSpacing = 3;
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 50;
			temp.x = 524;
			temp.y = 49;
			return temp;
		}

		private function countryBiaoJu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			countryBiaoJu = temp;
			temp.name = "countryBiaoJu";
			temp.fontSize = 22;
			temp.text = "荆州国营镖局";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 146;
			temp.y = 55;
			return temp;
		}

		private function countryName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			countryName = temp;
			temp.name = "countryName";
			temp.text = "墨势力网游公会";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 149;
			temp.y = 84;
			return temp;
		}

		private function dailyPeiFu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			dailyPeiFu = temp;
			temp.name = "dailyPeiFu";
			temp.text = "99锭 99两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 94;
			temp.x = 427;
			temp.y = 127;
			return temp;
		}

		private function fenpei_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			fenpei = temp;
			temp.name = "fenpei";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "分配";
			temp.leading = 2;
			temp.letterSpacing = 3;
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 50;
			temp.x = 524;
			temp.y = 100;
			return temp;
		}

		private function isOpen_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			isOpen = temp;
			temp.name = "isOpen";
			temp.fontSize = 18;
			temp.text = "运营中";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 154;
			temp.y = 119;
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
			temp.width = 94;
			temp.x = 427;
			temp.y = 52;
			return temp;
		}

		private function openBiaoJu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			openBiaoJu = temp;
			temp.name = "openBiaoJu";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "镖局开启";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 73;
			temp.x = 216;
			temp.y = 118;
			return temp;
		}

		private function tab_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab = temp;
			temp.name = "tab";
			temp.btnWidth = 140;
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_l_liebiaoanniu;
			temp.width = 140;
			temp.x = 16;
			temp.y = 160;
			temp.layout = __BiaoJuPanelSkin_VerticalLayout1_i();
			temp.dataProvider = __BiaoJuPanelSkin_ArrayCollection1_i();
			return temp;
		}

	}
}