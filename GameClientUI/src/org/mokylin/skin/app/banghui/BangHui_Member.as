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
	public class BangHui_Member extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListItem:feathers.controls.List;

		public var arrowDengji_Down:feathers.controls.UIAsset;

		public var arrowDengji_Up:feathers.controls.UIAsset;

		public var arrowZhanli_Down:feathers.controls.UIAsset;

		public var arrowZhanli_Up:feathers.controls.UIAsset;

		public var arrowZhiwei_Down:feathers.controls.UIAsset;

		public var arrowZhiwei_Up:feathers.controls.UIAsset;

		public var arrowZhouHuoyue_Down:feathers.controls.UIAsset;

		public var arrowZhouHuoyue_Up:feathers.controls.UIAsset;

		public var arrowZongHuoyue_Down:feathers.controls.UIAsset;

		public var arrowZongHuoyue_Up:feathers.controls.UIAsset;

		public var btnApply:feathers.controls.Button;

		public var btnJoin:feathers.controls.Button;

		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var btnZhaoJi:feathers.controls.Button;

		public var btnZhaoMu:feathers.controls.Button;

		public var chkAuto:feathers.controls.Check;

		public var chkOnLine:feathers.controls.Check;

		public var grpFlip:feathers.controls.Group;

		public var grpHead:feathers.controls.Group;

		public var lbNum:feathers.controls.text.TextFieldTextEditor;

		public var uiDengji:feathers.controls.UIAsset;

		public var uiZhanli:feathers.controls.UIAsset;

		public var uiZhiWei:feathers.controls.UIAsset;

		public var uiZhouHuoYue:feathers.controls.UIAsset;

		public var uiZongHuoYue:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BangHui_Member()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__BangHui_Member_UIAsset2_i(),__BangHui_Member_UIAsset3_i(),__BangHui_Member_UIAsset4_i(),grpHead_i(),grpFlip_i(),ListItem_i(),chkOnLine_i(),__BangHui_Member_Label1_i(),chkAuto_i(),__BangHui_Member_Label2_i(),btnZhaoJi_i(),btnZhaoMu_i(),btnApply_i(),btnJoin_i()];
			
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
			temp.width = 899;
			temp.x = 27;
			temp.y = 115;
			return temp;
		}

		private function __BangHui_Member_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "只显示在线玩家";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 55;
			temp.y = 546;
			return temp;
		}

		private function __BangHui_Member_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "自动通过玩家加入申请";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 197;
			temp.y = 546;
			return temp;
		}

		private function __BangHui_Member_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 443;
			temp.styleName = "ui/app/banghui/kuang1.png";
			temp.width = 912;
			temp.x = 19;
			temp.y = 80;
			return temp;
		}

		private function __BangHui_Member_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/dibg.png";
			temp.x = 289;
			temp.y = 524;
			return temp;
		}

		private function __BangHui_Member_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/dibg_from.png";
			temp.x = 20;
			temp.y = 524;
			return temp;
		}

		private function __BangHui_Member_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/titlebg2.png";
			temp.width = 904;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Member_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/wanjiamingcheng.png";
			temp.x = 175;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_Member_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/zhuangtai.png";
			temp.x = 831;
			temp.y = 6;
			return temp;
		}

		private function __BangHui_Member_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiantoubg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function arrowDengji_Down_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrowDengji_Down = temp;
			temp.name = "arrowDengji_Down";
			temp.styleName = "ui/app/banghui/jiantou.png";
			temp.x = 505;
			temp.y = 8;
			return temp;
		}

		private function arrowDengji_Up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrowDengji_Up = temp;
			temp.name = "arrowDengji_Up";
			temp.scaleY = -1;
			temp.styleName = "ui/app/banghui/jiantou.png";
			temp.visible = false;
			temp.x = 505;
			temp.y = 22;
			return temp;
		}

		private function arrowZhanli_Down_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrowZhanli_Down = temp;
			temp.name = "arrowZhanli_Down";
			temp.styleName = "ui/app/banghui/jiantou.png";
			temp.x = 365;
			temp.y = 8;
			return temp;
		}

		private function arrowZhanli_Up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrowZhanli_Up = temp;
			temp.name = "arrowZhanli_Up";
			temp.scaleY = -1;
			temp.styleName = "ui/app/banghui/jiantou.png";
			temp.visible = false;
			temp.x = 365;
			temp.y = 22;
			return temp;
		}

		private function arrowZhiwei_Down_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrowZhiwei_Down = temp;
			temp.name = "arrowZhiwei_Down";
			temp.styleName = "ui/app/banghui/jiantou.png";
			temp.x = 103;
			temp.y = 8;
			return temp;
		}

		private function arrowZhiwei_Up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrowZhiwei_Up = temp;
			temp.name = "arrowZhiwei_Up";
			temp.scaleY = -1;
			temp.styleName = "ui/app/banghui/jiantou.png";
			temp.visible = false;
			temp.x = 103;
			temp.y = 22;
			return temp;
		}

		private function arrowZhouHuoyue_Down_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrowZhouHuoyue_Down = temp;
			temp.name = "arrowZhouHuoyue_Down";
			temp.styleName = "ui/app/banghui/jiantou.png";
			temp.x = 620;
			temp.y = 8;
			return temp;
		}

		private function arrowZhouHuoyue_Up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrowZhouHuoyue_Up = temp;
			temp.name = "arrowZhouHuoyue_Up";
			temp.scaleY = -1;
			temp.styleName = "ui/app/banghui/jiantou.png";
			temp.visible = false;
			temp.x = 620;
			temp.y = 22;
			return temp;
		}

		private function arrowZongHuoyue_Down_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrowZongHuoyue_Down = temp;
			temp.name = "arrowZongHuoyue_Down";
			temp.styleName = "ui/app/banghui/jiantou.png";
			temp.x = 746;
			temp.y = 8;
			return temp;
		}

		private function arrowZongHuoyue_Up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrowZongHuoyue_Up = temp;
			temp.name = "arrowZongHuoyue_Up";
			temp.scaleY = -1;
			temp.styleName = "ui/app/banghui/jiantou.png";
			temp.visible = false;
			temp.x = 746;
			temp.y = 22;
			return temp;
		}

		private function btnApply_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnApply = temp;
			temp.name = "btnApply";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "申请列表";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 112;
			temp.x = 681;
			temp.y = 541;
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
			temp.x = 799;
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

		private function btnZhaoJi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZhaoJi = temp;
			temp.name = "btnZhaoJi";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "召集成员";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 112;
			temp.x = 444;
			temp.y = 541;
			return temp;
		}

		private function btnZhaoMu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZhaoMu = temp;
			temp.name = "btnZhaoMu";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "招募成员";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 112;
			temp.x = 563;
			temp.y = 541;
			return temp;
		}

		private function chkAuto_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkAuto = temp;
			temp.name = "chkAuto";
			temp.styleClass = org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
			temp.x = 170;
			temp.y = 544;
			return temp;
		}

		private function chkOnLine_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkOnLine = temp;
			temp.name = "chkOnLine";
			temp.styleClass = org.mokylin.skin.app.banghui.check.CheckBoxSkin_2;
			temp.x = 28;
			temp.y = 544;
			return temp;
		}

		private function grpFlip_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFlip = temp;
			temp.name = "grpFlip";
			temp.x = 430;
			temp.y = 509;
			temp.elementsContent = [__BangHui_Member_UIAsset8_i(),lbNum_i(),btnPrev_i(),btnNext_i()];
			return temp;
		}

		private function grpHead_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpHead = temp;
			temp.name = "grpHead";
			temp.x = 24;
			temp.y = 86;
			temp.elementsContent = [__BangHui_Member_UIAsset5_i(),uiZhiWei_i(),__BangHui_Member_UIAsset6_i(),uiZhanli_i(),uiDengji_i(),uiZhouHuoYue_i(),uiZongHuoYue_i(),__BangHui_Member_UIAsset7_i(),arrowZhiwei_Down_i(),arrowZhanli_Down_i(),arrowDengji_Down_i(),arrowZhouHuoyue_Down_i(),arrowZongHuoyue_Down_i(),arrowZhiwei_Up_i(),arrowZhanli_Up_i(),arrowDengji_Up_i(),arrowZhouHuoyue_Up_i(),arrowZongHuoyue_Up_i()];
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

		private function uiDengji_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiDengji = temp;
			temp.name = "uiDengji";
			temp.styleName = "ui/app/banghui/word/dengjizhiye.png";
			temp.x = 442;
			temp.y = 6;
			return temp;
		}

		private function uiZhanli_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiZhanli = temp;
			temp.name = "uiZhanli";
			temp.styleName = "ui/app/banghui/word/zhandouli.png";
			temp.x = 319;
			temp.y = 6;
			return temp;
		}

		private function uiZhiWei_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiZhiWei = temp;
			temp.name = "uiZhiWei";
			temp.styleName = "ui/app/banghui/word/bangpaizhiwei.png";
			temp.x = 42;
			temp.y = 6;
			return temp;
		}

		private function uiZhouHuoYue_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiZhouHuoYue = temp;
			temp.name = "uiZhouHuoYue";
			temp.styleName = "ui/app/banghui/word/zhouhuoyue.png";
			temp.x = 574;
			temp.y = 6;
			return temp;
		}

		private function uiZongHuoYue_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiZongHuoYue = temp;
			temp.name = "uiZongHuoYue";
			temp.styleName = "ui/app/banghui/word/zonghuoyue.png";
			temp.x = 700;
			temp.y = 6;
			return temp;
		}

	}
}