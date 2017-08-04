package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BangHui_Home_left extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCreate:feathers.controls.Button;

		public var chk1:feathers.controls.Check;

		public var chk2:feathers.controls.Check;

		public var lbName:feathers.controls.text.TextFieldTextEditor;

		public var lbPay1:feathers.controls.Label;

		public var lbPay2:feathers.controls.Label;

		public var lbXuanYan:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BangHui_Home_left()
		{
			super();
			
			this.currentState = "normal";
			this.height = 504;
			this.width = 269;
			this.elementsContent = [__BangHui_Home_left_UIAsset1_i(),__BangHui_Home_left_UIAsset2_i(),__BangHui_Home_left_UIAsset3_i(),__BangHui_Home_left_Group1_i(),__BangHui_Home_left_Group2_i(),__BangHui_Home_left_UIAsset10_i(),__BangHui_Home_left_UIAsset11_i(),lbName_i(),lbXuanYan_i(),lbPay1_i(),lbPay2_i(),chk1_i(),chk2_i(),btnCreate_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BangHui_Home_left_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 35;
			temp.y = 82;
			temp.elementsContent = [__BangHui_Home_left_UIAsset4_i(),__BangHui_Home_left_UIAsset5_i(),__BangHui_Home_left_UIAsset6_i()];
			return temp;
		}

		private function __BangHui_Home_left_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 35;
			temp.y = 155;
			temp.elementsContent = [__BangHui_Home_left_UIAsset7_i(),__BangHui_Home_left_UIAsset8_i(),__BangHui_Home_left_UIAsset9_i()];
			return temp;
		}

		private function __BangHui_Home_left_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 31;
			temp.styleName = "ui/app/banghui/kuang2.png";
			temp.width = 205;
			temp.x = 32;
			temp.y = 96;
			return temp;
		}

		private function __BangHui_Home_left_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 130;
			temp.styleName = "ui/app/banghui/kuang2.png";
			temp.width = 205;
			temp.x = 32;
			temp.y = 169;
			return temp;
		}

		private function __BangHui_Home_left_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/bg1_left.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Home_left_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/headbg1.png";
			temp.width = 261;
			temp.x = 5;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_Home_left_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/chuangjianbangpai.png";
			temp.x = 103;
			temp.y = 10;
			return temp;
		}

		private function __BangHui_Home_left_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangpaimingcheng.png";
			temp.x = 70;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Home_left_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/huawen1.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __BangHui_Home_left_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/app/banghui/huawen1.png";
			temp.x = 200;
			temp.y = 4;
			return temp;
		}

		private function __BangHui_Home_left_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangpaixuanyan.png";
			temp.x = 71;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Home_left_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/huawen1.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __BangHui_Home_left_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/app/banghui/huawen1.png";
			temp.x = 200;
			temp.y = 4;
			return temp;
		}

		private function btnCreate_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCreate = temp;
			temp.name = "btnCreate";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "创建帮派";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 112;
			temp.x = 78.5;
			temp.y = 418;
			return temp;
		}

		private function chk1_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk1 = temp;
			temp.name = "chk1";
			temp.styleClass = org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
			temp.x = 23;
			temp.y = 330;
			return temp;
		}

		private function chk2_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk2 = temp;
			temp.name = "chk2";
			temp.styleClass = org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
			temp.x = 23;
			temp.y = 372;
			return temp;
		}

		private function lbName_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			lbName = temp;
			temp.name = "lbName";
			temp.height = 18;
			temp.text = "请输入帮派名称（3-7个字）";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 188;
			temp.x = 40;
			temp.y = 101;
			return temp;
		}

		private function lbPay1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPay1 = temp;
			temp.name = "lbPay1";
			temp.bold = false;
			temp.htmlText = "花费<font color='#e8c958'>$</font>创建<font color='#e8c958'>$级</font>帮派<br><font color='#e8c958'>$级帮派</font>可直接参加<font color='#e8c958'>皇城争霸</font>";
			temp.leading = 4;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 200;
			temp.x = 50;
			temp.y = 323;
			return temp;
		}

		private function lbPay2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPay2 = temp;
			temp.name = "lbPay2";
			temp.bold = false;
			temp.htmlText = "花费<font color='#e8c958'>$</font>创建<font color='#e8c958'>$级</font>帮派";
			temp.leading = 4;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 200;
			temp.x = 50;
			temp.y = 374;
			return temp;
		}

		private function lbXuanYan_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			lbXuanYan = temp;
			temp.name = "lbXuanYan";
			temp.height = 114;
			temp.text = "请输入帮派宣言（50字以内）";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 189;
			temp.x = 40;
			temp.y = 175;
			return temp;
		}

	}
}