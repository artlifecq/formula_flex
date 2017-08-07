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
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BangHui_List extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListItem:feathers.controls.List;

		public var btnExit:feathers.controls.Button;

		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var grpFlip:feathers.controls.Group;

		public var lbNum:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BangHui_List()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__BangHui_List_UIAsset2_i(),btnExit_i(),__BangHui_List_UIAsset3_i(),__BangHui_List_Group1_i(),ListItem_i(),grpFlip_i()];
			
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
			temp.x = 299;
			temp.y = 119;
			return temp;
		}

		private function __BangHui_List_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 295;
			temp.y = 90;
			temp.elementsContent = [__BangHui_List_UIAsset4_i(),__BangHui_List_UIAsset5_i(),__BangHui_List_UIAsset6_i(),__BangHui_List_UIAsset7_i(),__BangHui_List_UIAsset8_i(),__BangHui_List_UIAsset9_i(),__BangHui_List_UIAsset10_i()];
			return temp;
		}

		private function __BangHui_List_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/zongzhanli.png";
			temp.x = 535;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_List_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiantoubg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_List_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/dibg.png";
			temp.x = 293;
			temp.y = 527;
			return temp;
		}

		private function __BangHui_List_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 442;
			temp.styleName = "ui/app/banghui/kuang1.png";
			temp.width = 645;
			temp.x = 290;
			temp.y = 85;
			return temp;
		}

		private function __BangHui_List_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/headbg1.png";
			temp.width = 636;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_List_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/paiming.png";
			temp.x = 33;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_List_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangpaimingcheng.png";
			temp.x = 114;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_List_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/dengji.png";
			temp.x = 233;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_List_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangzhu.png";
			temp.x = 327;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_List_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/renshu.png";
			temp.x = 437;
			temp.y = 6;
			return temp;
		}

		private function btnExit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnExit = temp;
			temp.name = "btnExit";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "退出帮派";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 112;
			temp.x = 802;
			temp.y = 545;
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
			temp.x = 576;
			temp.y = 513;
			temp.elementsContent = [__BangHui_List_UIAsset11_i(),lbNum_i(),btnPrev_i(),btnNext_i()];
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

	}
}