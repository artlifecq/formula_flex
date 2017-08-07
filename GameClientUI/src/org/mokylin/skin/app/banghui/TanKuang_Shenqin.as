package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.Group;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.button.ButtonJiantou;
	import org.mokylin.skin.common.TongYongTanKuang_bg2;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TanKuang_Shenqin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnCancel:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnNext:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var grpFlip:feathers.controls.Group;

		public var lbNum:feathers.controls.text.TextFieldTextEditor;

		public var list:feathers.controls.List;

		public var uiNull:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TanKuang_Shenqin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 357;
			this.width = 578;
			this.elementsContent = [bg_i(),__TanKuang_Shenqin_UIAsset1_i(),btnClose_i(),grpFlip_i(),btnOk_i(),btnCancel_i(),__TanKuang_Shenqin_Group1_i(),list_i(),__TanKuang_Shenqin_UIAsset8_i(),uiNull_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TanKuang_Shenqin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 12;
			temp.y = 40;
			temp.elementsContent = [__TanKuang_Shenqin_UIAsset3_i(),__TanKuang_Shenqin_UIAsset4_i(),__TanKuang_Shenqin_UIAsset5_i(),__TanKuang_Shenqin_UIAsset6_i(),__TanKuang_Shenqin_UIAsset7_i()];
			return temp;
		}

		private function __TanKuang_Shenqin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 264;
			temp.styleName = "ui/app/banghui/kuang1.png";
			temp.width = 566;
			temp.x = 6;
			temp.y = 34;
			return temp;
		}

		private function __TanKuang_Shenqin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiantoubg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TanKuang_Shenqin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/headbg1.png";
			temp.width = 558;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TanKuang_Shenqin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/wanjiamingcheng.png";
			temp.x = 52;
			temp.y = 6;
			return temp;
		}

		private function __TanKuang_Shenqin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/zhandouli.png";
			temp.x = 191;
			temp.y = 6;
			return temp;
		}

		private function __TanKuang_Shenqin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/dengjizhiye.png";
			temp.x = 315;
			temp.y = 6;
			return temp;
		}

		private function __TanKuang_Shenqin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/caozuo.png";
			temp.x = 467;
			temp.y = 6;
			return temp;
		}

		private function __TanKuang_Shenqin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/banghui/word/head_shengqingbiao.png";
			temp.x = 247;
			temp.y = 8;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 357;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg2()
			temp.skin = skin
			temp.width = 578;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "全部拒绝";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 367;
			temp.y = 307;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 545;
			temp.y = 5;
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

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "全部同意";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 462;
			temp.y = 307;
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
			temp.x = 253;
			temp.y = 284;
			temp.elementsContent = [__TanKuang_Shenqin_UIAsset2_i(),lbNum_i(),btnPrev_i(),btnNext_i()];
			return temp;
		}

		private function lbNum_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			lbNum = temp;
			temp.name = "lbNum";
			temp.height = 19;
			temp.fontSize = 14;
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
			temp.height = 222;
			temp.visible = false;
			temp.width = 552;
			temp.x = 13;
			temp.y = 68;
			return temp;
		}

		private function uiNull_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiNull = temp;
			temp.name = "uiNull";
			temp.styleName = "ui/app/banghui/word/zanwushenqing.png";
			temp.x = 66.5;
			temp.y = 80;
			return temp;
		}

	}
}