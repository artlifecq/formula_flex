package org.mokylin.skin.app.zhanchang.shangdian
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_putong3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TanKuang_DuiHuan extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bg0:feathers.controls.UIAsset;

		public var btnCancel:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var btn_all:feathers.controls.Button;

		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var btns:feathers.controls.Group;

		public var contents:feathers.controls.Group;

		public var isLock:feathers.controls.Label;

		public var isLock0:feathers.controls.Label;

		public var lbBuyNum:feathers.controls.text.TextFieldTextEditor;

		public var lbl_name:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TanKuang_DuiHuan()
		{
			super();
			
			this.currentState = "normal";
			this.height = 265;
			this.width = 331;
			this.elementsContent = [bg_i(),__TanKuang_DuiHuan_UIAsset1_i(),__TanKuang_DuiHuan_UIAsset2_i(),lbl_title_i(),btnClose_i(),btnOk_i(),btnCancel_i(),btns_i(),contents_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TanKuang_DuiHuan_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "兑换数量：";
			temp.color = 0xC2992B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 76;
			temp.x = 15;
			temp.y = 4;
			return temp;
		}

		private function __TanKuang_DuiHuan_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "总价：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 42;
			temp.y = 33;
			return temp;
		}

		private function __TanKuang_DuiHuan_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "售价：";
			temp.color = 0xcfc6ae;
			temp.width = 47;
			temp.x = 82;
			temp.y = 43;
			return temp;
		}

		private function __TanKuang_DuiHuan_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/erji_bg.jpg";
			temp.x = 12;
			temp.y = 40;
			return temp;
		}

		private function __TanKuang_DuiHuan_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/xian_heng.png";
			temp.x = 35;
			temp.y = 128;
			return temp;
		}

		private function __TanKuang_DuiHuan_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/shengwang.png";
			temp.x = 85;
			temp.y = 28;
			return temp;
		}

		private function __TanKuang_DuiHuan_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/shengwang.png";
			temp.x = 128;
			temp.y = 39;
			return temp;
		}

		private function bg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg0 = temp;
			temp.name = "bg0";
			temp.styleName = "ui/component/text/input_bg.png";
			temp.width = 56;
			temp.x = 112;
			temp.y = 1;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 265;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 331;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "取 消";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 95;
			temp.x = 169;
			temp.y = 215;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 297;
			temp.y = 7;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "兑 换";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 88;
			temp.x = 56;
			temp.y = 217;
			return temp;
		}

		private function btn_all_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_all = temp;
			temp.name = "btn_all";
			temp.label = "MAX";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong3;
			temp.x = 205;
			temp.y = 2;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 169;
			temp.y = 3;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 88;
			temp.y = 3;
			return temp;
		}

		private function btns_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btns = temp;
			temp.name = "btns";
			temp.width = 268;
			temp.x = 32;
			temp.y = 138;
			temp.elementsContent = [__TanKuang_DuiHuan_Label1_i(),__TanKuang_DuiHuan_Label2_i(),isLock0_i(),__TanKuang_DuiHuan_UIAsset3_i(),btn_min_i(),btn_max_i(),btn_all_i(),bg0_i(),lbBuyNum_i()];
			return temp;
		}

		private function contents_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			contents = temp;
			temp.name = "contents";
			temp.x = 33;
			temp.y = 52;
			temp.elementsContent = [lbl_name_i(),__TanKuang_DuiHuan_Label3_i(),isLock_i(),__TanKuang_DuiHuan_UIAsset4_i()];
			return temp;
		}

		private function isLock0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			isLock0 = temp;
			temp.name = "isLock0";
			temp.text = "30000";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 77;
			temp.x = 112;
			temp.y = 33;
			return temp;
		}

		private function isLock_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			isLock = temp;
			temp.name = "isLock";
			temp.text = "30000";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 77;
			temp.x = 155;
			temp.y = 44;
			return temp;
		}

		private function lbBuyNum_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			lbBuyNum = temp;
			temp.name = "lbBuyNum";
			temp.height = 21;
			temp.text = "1000";
			temp.textAlign = "center";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 53;
			temp.x = 112;
			temp.y = 5;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = false;
			temp.height = 26;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "侍宠·雪姬";
			temp.color = 0x9d4aa8;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 196;
			temp.x = 80;
			temp.y = 3;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "批量使用";
			temp.textAlign = "center";
			temp.color = 0xDDE2B1;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 240;
			temp.x = 48;
			temp.y = 11;
			return temp;
		}

	}
}