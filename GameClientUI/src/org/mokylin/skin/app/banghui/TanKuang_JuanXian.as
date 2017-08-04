package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.button.ButtonJiantou;
	import org.mokylin.skin.common.Flip_Skin;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TanKuang_JuanXian extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btnJuan1:feathers.controls.Button;

		public var btnJuan2:feathers.controls.Button;

		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var grpFlip:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var lbBanggong:feathers.controls.Label;

		public var lbHuoyue:feathers.controls.Label;

		public var lbLast:feathers.controls.Label;

		public var lbNum:feathers.controls.text.TextFieldTextEditor;

		public var lbNum1:feathers.controls.Label;

		public var lbNum2:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var skinSelect1:feathers.controls.SkinnableContainer;

		public var skinSelect2:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TanKuang_JuanXian()
		{
			super();
			
			this.currentState = "normal";
			this.height = 384;
			this.width = 552;
			this.elementsContent = [bg_i(),__TanKuang_JuanXian_UIAsset1_i(),__TanKuang_JuanXian_UIAsset2_i(),btnClose_i(),__TanKuang_JuanXian_Group1_i(),__TanKuang_JuanXian_Group2_i(),list_i(),grpFlip_i(),icon1_i(),skinSelect1_i(),btnJuan1_i(),__TanKuang_JuanXian_Label1_i(),lbNum1_i(),icon2_i(),skinSelect2_i(),btnJuan2_i(),__TanKuang_JuanXian_Label2_i(),lbNum2_i(),__TanKuang_JuanXian_Label3_i(),lbHuoyue_i(),__TanKuang_JuanXian_Label4_i(),lbBanggong_i(),lbLast_i(),__TanKuang_JuanXian_UIAsset10_i(),__TanKuang_JuanXian_Label5_i(),__TanKuang_JuanXian_Label6_i(),__TanKuang_JuanXian_UIAsset11_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TanKuang_JuanXian_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 12;
			temp.y = 40;
			temp.elementsContent = [__TanKuang_JuanXian_UIAsset3_i(),__TanKuang_JuanXian_UIAsset4_i(),__TanKuang_JuanXian_UIAsset5_i(),__TanKuang_JuanXian_UIAsset6_i()];
			return temp;
		}

		private function __TanKuang_JuanXian_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 281;
			temp.y = 40;
			temp.elementsContent = [__TanKuang_JuanXian_UIAsset7_i(),__TanKuang_JuanXian_UIAsset8_i()];
			return temp;
		}

		private function __TanKuang_JuanXian_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前拥有：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 287;
			temp.y = 132;
			return temp;
		}

		private function __TanKuang_JuanXian_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前拥有：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 287;
			temp.y = 214;
			return temp;
		}

		private function __TanKuang_JuanXian_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派活跃：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 236;
			temp.y = 347;
			return temp;
		}

		private function __TanKuang_JuanXian_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "我的帮贡：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 391;
			temp.y = 347;
			return temp;
		}

		private function __TanKuang_JuanXian_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "1令牌=100帮派活跃+100帮贡";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 293;
			temp.y = 272;
			return temp;
		}

		private function __TanKuang_JuanXian_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "1元宝=1帮派活跃+10帮贡";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 293;
			temp.y = 292;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 51;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 249;
			temp.x = 286;
			temp.y = 265;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/juanxian.png";
			temp.x = 254;
			temp.y = 9;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 300;
			temp.styleName = "ui/app/banghui/kuang1.png";
			temp.width = 271;
			temp.x = 6;
			temp.y = 35;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 300;
			temp.styleName = "ui/app/banghui/kuang1.png";
			temp.width = 271;
			temp.x = 275;
			temp.y = 35;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/headbg1.png";
			temp.width = 260;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/paiming.png";
			temp.x = 24;
			temp.y = 5;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/chengyuanmingcheng.png";
			temp.x = 86;
			temp.y = 5;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/benzhouhuoyue.png";
			temp.x = 180;
			temp.y = 5;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/headbg1.png";
			temp.width = 260;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/woyaojuanxian.png";
			temp.x = 95;
			temp.y = 5;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiantoubg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 384;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
			temp.width = 552;
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
			temp.x = 521;
			temp.y = 5;
			return temp;
		}

		private function btnJuan1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJuan1 = temp;
			temp.name = "btnJuan1";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "捐献";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 75;
			temp.x = 459;
			temp.y = 82;
			return temp;
		}

		private function btnJuan2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJuan2 = temp;
			temp.name = "btnJuan2";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "捐献";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 75;
			temp.x = 459;
			temp.y = 164;
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
			temp.x = 105;
			temp.y = 319;
			temp.elementsContent = [__TanKuang_JuanXian_UIAsset9_i(),lbNum_i(),btnPrev_i(),btnNext_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 288;
			temp.y = 74;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 288;
			temp.y = 156;
			return temp;
		}

		private function lbBanggong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBanggong = temp;
			temp.name = "lbBanggong";
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 81;
			temp.x = 462;
			temp.y = 347;
			return temp;
		}

		private function lbHuoyue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHuoyue = temp;
			temp.name = "lbHuoyue";
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 81;
			temp.x = 307;
			temp.y = 347;
			return temp;
		}

		private function lbLast_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLast = temp;
			temp.name = "lbLast";
			temp.text = "今日还可捐献999元宝";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 228;
			temp.x = 288;
			temp.y = 234;
			return temp;
		}

		private function lbNum1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum1 = temp;
			temp.name = "lbNum1";
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 119;
			temp.x = 358;
			temp.y = 132;
			return temp;
		}

		private function lbNum2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum2 = temp;
			temp.name = "lbNum2";
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 119;
			temp.x = 358;
			temp.y = 214;
			return temp;
		}

		private function lbNum_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			lbNum = temp;
			temp.name = "lbNum";
			temp.height = 19;
			temp.text = "1/99";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 11;
			temp.y = 2;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 256;
			temp.width = 254;
			temp.x = 14;
			temp.y = 67;
			return temp;
		}

		private function skinSelect1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinSelect1 = temp;
			temp.name = "skinSelect1";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.common.Flip_Skin()
			temp.skin = skin
			temp.width = 102;
			temp.x = 349;
			temp.y = 86;
			return temp;
		}

		private function skinSelect2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinSelect2 = temp;
			temp.name = "skinSelect2";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.common.Flip_Skin()
			temp.skin = skin
			temp.width = 102;
			temp.x = 349;
			temp.y = 168;
			return temp;
		}

	}
}