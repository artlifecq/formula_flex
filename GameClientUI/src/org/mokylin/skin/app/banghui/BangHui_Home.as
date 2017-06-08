package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.button.ButtonJiantou;
	import org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BangHui_Home extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListItem:feathers.controls.List;

		public var btnJoin:feathers.controls.Button;

		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var chkGuolv:feathers.controls.Check;

		public var grpFlip:feathers.controls.Group;

		public var lbList:feathers.controls.Label;

		public var lbNum:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BangHui_Home()
		{
			super();
			
			this.currentState = "normal";
			this.height = 600;
			this.width = 947;
			this.elementsContent = [__BangHui_Home_UIAsset2_i(),chkGuolv_i(),__BangHui_Home_Label1_i(),lbList_i(),__BangHui_Home_UIAsset3_i(),__BangHui_Home_Group1_i(),ListItem_i(),btnJoin_i(),grpFlip_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ListItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListItem = temp;
			temp.name = "ListItem";
			temp.height = 401;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 631;
			temp.x = 295;
			temp.y = 115;
			return temp;
		}

		private function __BangHui_Home_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 291;
			temp.y = 86;
			temp.elementsContent = [__BangHui_Home_UIAsset4_i(),__BangHui_Home_UIAsset5_i(),__BangHui_Home_UIAsset6_i(),__BangHui_Home_UIAsset7_i(),__BangHui_Home_UIAsset8_i(),__BangHui_Home_UIAsset9_i(),__BangHui_Home_UIAsset10_i(),__BangHui_Home_UIAsset11_i()];
			return temp;
		}

		private function __BangHui_Home_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "过滤满员帮会";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 339;
			temp.y = 546;
			return temp;
		}

		private function __BangHui_Home_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/zongzhanli.png";
			temp.x = 469;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_Home_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/caozuo.png";
			temp.x = 564;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_Home_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiantoubg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Home_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/dibg.png";
			temp.x = 289;
			temp.y = 524;
			return temp;
		}

		private function __BangHui_Home_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 442;
			temp.styleName = "ui/app/banghui/kuang1.png";
			temp.width = 645;
			temp.x = 286;
			temp.y = 81;
			return temp;
		}

		private function __BangHui_Home_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/titlebg2.png";
			temp.width = 636;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Home_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/paiming.png";
			temp.x = 33;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_Home_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangpaimingcheng.png";
			temp.x = 99;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_Home_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/dengji.png";
			temp.x = 210;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_Home_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangzhu.png";
			temp.x = 292;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_Home_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/renshu.png";
			temp.x = 390;
			temp.y = 6;
			return temp;
		}

		private function btnJoin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJoin = temp;
			temp.name = "btnJoin";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "快速加入";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 112;
			temp.x = 798;
			temp.y = 541;
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

		private function chkGuolv_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkGuolv = temp;
			temp.name = "chkGuolv";
			temp.styleClass = org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
			temp.x = 308;
			temp.y = 544;
			return temp;
		}

		private function grpFlip_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFlip = temp;
			temp.name = "grpFlip";
			temp.x = 572;
			temp.y = 509;
			temp.elementsContent = [__BangHui_Home_UIAsset12_i(),lbNum_i(),btnPrev_i(),btnNext_i()];
			return temp;
		}

		private function lbList_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbList = temp;
			temp.name = "lbList";
			temp.text = "邀请列表";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 721;
			temp.y = 546;
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

	}
}