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
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class YaoQinList extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var grpFlip:feathers.controls.Group;

		public var lbNum:feathers.controls.text.TextFieldTextEditor;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function YaoQinList()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),__YaoQinList_UIAsset1_i(),btnClose_i(),grpFlip_i(),list_i(),__YaoQinList_Group1_i(),__YaoQinList_UIAsset10_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __YaoQinList_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.styleName = "ui/common/titilebg/headbg1.png";
			temp.x = 11;
			temp.y = 40;
			temp.elementsContent = [__YaoQinList_UIAsset3_i(),__YaoQinList_UIAsset4_i(),__YaoQinList_UIAsset5_i(),__YaoQinList_UIAsset6_i(),__YaoQinList_UIAsset7_i(),__YaoQinList_UIAsset8_i(),__YaoQinList_UIAsset9_i()];
			return temp;
		}

		private function __YaoQinList_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/yaoqingliebiao.png";
			temp.x = 246;
			temp.y = 8;
			return temp;
		}

		private function __YaoQinList_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 309;
			temp.styleName = "ui/app/banghui/kuang1.png";
			temp.width = 566;
			temp.x = 6;
			temp.y = 34;
			return temp;
		}

		private function __YaoQinList_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiantoubg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __YaoQinList_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/headbg1.png";
			temp.width = 558;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __YaoQinList_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangpaimingcheng.png";
			temp.x = 29;
			temp.y = 6;
			return temp;
		}

		private function __YaoQinList_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/dengji.png";
			temp.x = 158;
			temp.y = 6;
			return temp;
		}

		private function __YaoQinList_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangzhu.png";
			temp.x = 230;
			temp.y = 6;
			return temp;
		}

		private function __YaoQinList_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/renshu.png";
			temp.x = 326;
			temp.y = 6;
			return temp;
		}

		private function __YaoQinList_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/zongzhanli.png";
			temp.x = 401;
			temp.y = 6;
			return temp;
		}

		private function __YaoQinList_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/caozuo.png";
			temp.x = 496;
			temp.y = 6;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 357;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 578;
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
			temp.y = 327;
			temp.elementsContent = [__YaoQinList_UIAsset2_i(),lbNum_i(),btnPrev_i(),btnNext_i()];
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
			temp.visible = false;
			temp.width = 549;
			temp.x = 16;
			temp.y = 72;
			return temp;
		}

	}
}