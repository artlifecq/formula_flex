package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.button.ButtonJiantou;
	import org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

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
		public var btnJoin:feathers.controls.Button;

		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var chkGuolv:feathers.controls.Check;

		public var grpFlip:feathers.controls.Group;

		public var lbList:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BangHui_Home()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [chkGuolv_i(),__BangHui_Home_Label1_i(),lbList_i(),__BangHui_Home_UIAsset2_i(),__BangHui_Home_Group1_i(),btnJoin_i(),grpFlip_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BangHui_Home_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 291;
			temp.y = 89;
			temp.elementsContent = [__BangHui_Home_UIAsset3_i(),__BangHui_Home_UIAsset4_i(),__BangHui_Home_UIAsset5_i(),__BangHui_Home_UIAsset6_i(),__BangHui_Home_UIAsset7_i(),__BangHui_Home_UIAsset8_i(),__BangHui_Home_UIAsset9_i(),__BangHui_Home_UIAsset10_i(),__BangHui_Home_UIAsset11_i(),__BangHui_Home_UIAsset12_i(),__BangHui_Home_UIAsset13_i(),__BangHui_Home_UIAsset14_i(),__BangHui_Home_UIAsset15_i(),__BangHui_Home_UIAsset16_i()];
			return temp;
		}

		private function __BangHui_Home_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "过滤满员帮派";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 343;
			temp.y = 549;
			return temp;
		}

		private function __BangHui_Home_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/paiming.png";
			temp.x = 25;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_Home_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangpaimingcheng.png";
			temp.x = 113;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_Home_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/dengji.png";
			temp.x = 217;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_Home_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/bangzhu.png";
			temp.x = 308;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_Home_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/renshu.png";
			temp.x = 410;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_Home_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/zongzhanli.png";
			temp.x = 487;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_Home_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/caozuo.png";
			temp.x = 581;
			temp.y = 5;
			return temp;
		}

		private function __BangHui_Home_UIAsset17_i():feathers.controls.UIAsset
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
			temp.height = 442;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 649;
			temp.x = 288;
			temp.y = 86;
			return temp;
		}

		private function __BangHui_Home_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 69;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Home_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 134;
			temp.x = 69;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Home_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 59;
			temp.x = 203;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Home_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 124;
			temp.x = 262;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Home_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 79;
			temp.x = 386;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Home_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 86;
			temp.x = 465;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Home_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 92;
			temp.x = 551;
			temp.y = 0;
			return temp;
		}

		private function btnJoin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJoin = temp;
			temp.name = "btnJoin";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "快速加入";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 90;
			temp.x = 811;
			temp.y = 539;
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
			temp.x = 312;
			temp.y = 547;
			return temp;
		}

		private function grpFlip_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFlip = temp;
			temp.name = "grpFlip";
			temp.x = 576;
			temp.y = 513;
			temp.elementsContent = [__BangHui_Home_UIAsset17_i(),lbNum_i(),btnPrev_i(),btnNext_i()];
			return temp;
		}

		private function lbList_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbList = temp;
			temp.name = "lbList";
			temp.text = "邀请列表";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 725;
			temp.y = 549;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.height = 19;
			temp.fontSize = 14;
			temp.text = "1/99";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 11;
			temp.y = 2;
			return temp;
		}

	}
}