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
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;

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
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btnJuan1:feathers.controls.Button;

		public var btnJuan2:feathers.controls.Button;

		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var grpFlip:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var lbLast:feathers.controls.Label;

		public var lbNum:feathers.controls.text.TextFieldTextEditor;

		public var lbNum1:feathers.controls.Label;

		public var lbNum2:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var skinSelect1:feathers.controls.SkinnableContainer;

		public var skinSelect2:feathers.controls.SkinnableContainer;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TanKuang_JuanXian()
		{
			super();
			
			this.currentState = "normal";
			this.height = 389;
			this.width = 556;
			this.elementsContent = [bg_i(),__TanKuang_JuanXian_UIAsset1_i(),__TanKuang_JuanXian_UIAsset2_i(),title_i(),btnClose_i(),__TanKuang_JuanXian_Group1_i(),__TanKuang_JuanXian_Group2_i(),list_i(),grpFlip_i(),icon1_i(),skinSelect1_i(),btnJuan1_i(),__TanKuang_JuanXian_Label1_i(),lbNum1_i(),icon2_i(),skinSelect2_i(),btnJuan2_i(),__TanKuang_JuanXian_Label2_i(),lbNum2_i(),lbLast_i(),__TanKuang_JuanXian_UIAsset10_i(),__TanKuang_JuanXian_Label3_i(),__TanKuang_JuanXian_Label4_i()];
			
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
			temp.x = 15;
			temp.y = 44;
			temp.elementsContent = [__TanKuang_JuanXian_UIAsset3_i(),__TanKuang_JuanXian_UIAsset4_i(),__TanKuang_JuanXian_UIAsset5_i(),__TanKuang_JuanXian_UIAsset6_i()];
			return temp;
		}

		private function __TanKuang_JuanXian_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 284;
			temp.y = 44;
			temp.elementsContent = [__TanKuang_JuanXian_UIAsset7_i(),__TanKuang_JuanXian_UIAsset8_i()];
			return temp;
		}

		private function __TanKuang_JuanXian_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前拥有：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 290;
			temp.y = 136;
			return temp;
		}

		private function __TanKuang_JuanXian_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前拥有：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 290;
			temp.y = 218;
			return temp;
		}

		private function __TanKuang_JuanXian_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "1令牌=100帮派活跃+100帮贡";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 297;
			temp.y = 276;
			return temp;
		}

		private function __TanKuang_JuanXian_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "1元宝=1帮派活跃+10帮贡";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 297;
			temp.y = 296;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 51;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 249;
			temp.x = 289;
			temp.y = 269;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 301;
			temp.styleName = "ui/app/banghui/kuang1.png";
			temp.width = 271;
			temp.x = 9;
			temp.y = 38;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 301;
			temp.styleName = "ui/app/banghui/kuang1.png";
			temp.width = 271;
			temp.x = 280;
			temp.y = 38;
			return temp;
		}

		private function __TanKuang_JuanXian_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/titlebg1.png";
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
			temp.styleName = "ui/app/banghui/titlebg1.png";
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

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 389;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 556;
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
			temp.y = 7;
			return temp;
		}

		private function btnJuan1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJuan1 = temp;
			temp.name = "btnJuan1";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "捐献";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.width = 79;
			temp.x = 459;
			temp.y = 87;
			return temp;
		}

		private function btnJuan2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJuan2 = temp;
			temp.name = "btnJuan2";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "捐献";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.width = 79;
			temp.x = 459;
			temp.y = 169;
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
			temp.x = 106;
			temp.y = 324;
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

		private function lbLast_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLast = temp;
			temp.name = "lbLast";
			temp.htmlText = "今日还可捐献<font color='#5DBD37'>999</font>元宝";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 228;
			temp.x = 291;
			temp.y = 238;
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
			temp.x = 361;
			temp.y = 136;
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
			temp.x = 361;
			temp.y = 218;
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
			temp.height = 250;
			temp.width = 254;
			temp.x = 18;
			temp.y = 78;
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
			temp.x = 352;
			temp.y = 91;
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
			temp.x = 352;
			temp.y = 173;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "捐献";
			temp.textAlign = "center";
			temp.color = 0xDDE2B1;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 240;
			temp.x = 158;
			temp.y = 11;
			return temp;
		}

	}
}