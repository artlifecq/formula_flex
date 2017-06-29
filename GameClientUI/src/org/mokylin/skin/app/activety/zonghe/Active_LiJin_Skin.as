package org.mokylin.skin.app.activety.zonghe
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.activety.number.UINumberNum;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Active_LiJin_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var btn_qiang_close:feathers.controls.Button;

		public var btn_qiang_open:feathers.controls.Button;

		public var chkAotu:feathers.controls.Check;

		public var chkLab:feathers.controls.Label;

		public var grpshuaxin:feathers.controls.Group;

		public var grpto:feathers.controls.Group;

		public var head_left:feathers.controls.UIAsset;

		public var head_left0:feathers.controls.UIAsset;

		public var head_right:feathers.controls.UIAsset;

		public var head_right0:feathers.controls.UIAsset;

		public var icon:feathers.controls.UIAsset;

		public var killbut0:feathers.controls.SkinnableContainer;

		public var killbut1:feathers.controls.SkinnableContainer;

		public var killbut2:feathers.controls.SkinnableContainer;

		public var lbHeadName:feathers.controls.Label;

		public var lbHeadName0:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbName2:feathers.controls.Label;

		public var lbPaiHang:feathers.controls.Label;

		public var lbRenWu:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbTime1:feathers.controls.Label;

		public var lbTo:feathers.controls.Label;

		public var numLiJin:feathers.controls.UINumber;

		public var qiang_box:feathers.controls.Group;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_ico1_1:feathers.controls.UIAsset;

		public var sec_ico1_2:feathers.controls.UIAsset;

		public var sec_ico1_3:feathers.controls.UIAsset;

		public var sec_ico1_4:feathers.controls.UIAsset;

		public var sec_ico1_5:feathers.controls.UIAsset;

		public var sec_ico1_6:feathers.controls.UIAsset;

		public var sec_ico1_7:feathers.controls.UIAsset;

		public var sec_ico2_0:feathers.controls.UIAsset;

		public var sec_ico2_1:feathers.controls.UIAsset;

		public var sec_ico2_2:feathers.controls.UIAsset;

		public var sec_ico2_3:feathers.controls.UIAsset;

		public var sec_ico2_4:feathers.controls.UIAsset;

		public var sec_ico2_5:feathers.controls.UIAsset;

		public var sec_ico2_6:feathers.controls.UIAsset;

		public var sec_ico2_7:feathers.controls.UIAsset;

		public var sec_navi0:feathers.controls.Label;

		public var sec_navi1:feathers.controls.Label;

		public var sec_subbut1:feathers.controls.Button;

		public var sec_subbut2:feathers.controls.Button;

		public var task_box:feathers.controls.Group;

		public var uiJia:feathers.controls.UIAsset;

		public var ui_bg:feathers.controls.UIAsset;

		public var ui_bg0:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Active_LiJin_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 575;
			this.width = 255;
			this.elementsContent = [qiang_box_i(),btn_qiang_open_i(),btn_qiang_close_i(),task_box_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Active_LiJin_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "刷新时间：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 76;
			temp.x = 0;
			temp.y = 20;
			return temp;
		}

		private function __Active_LiJin_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "累积获得绑定元宝：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 21;
			temp.y = 85;
			return temp;
		}

		private function __Active_LiJin_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/hengtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Active_LiJin_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/bg.png";
			temp.x = 15;
			temp.y = 126;
			return temp;
		}

		private function __Active_LiJin_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/hengtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shouhui;
			temp.x = 234;
			temp.y = 0;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.visible = false;
			temp.x = 234;
			temp.y = 0;
			return temp;
		}

		private function btn_qiang_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_qiang_close = temp;
			temp.name = "btn_qiang_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shouhui;
			temp.x = 234;
			temp.y = 363;
			return temp;
		}

		private function btn_qiang_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_qiang_open = temp;
			temp.name = "btn_qiang_open";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.x = 234;
			temp.y = 363;
			return temp;
		}

		private function chkAotu_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkAotu = temp;
			temp.name = "chkAotu";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.height = 23;
			temp.labelOffsetX = 0;
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0x8B8D7B;
			temp.width = 27;
			temp.x = 119;
			temp.y = 69;
			temp.visible=false;
			return temp;
		}

		private function chkLab_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			chkLab = temp;
			temp.name = "chkLab";
			temp.text = "自动";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 145;
			temp.y = 71;
			temp.visible=false;
			return temp;
		}

		private function grpshuaxin_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpshuaxin = temp;
			temp.name = "grpshuaxin";
			temp.visible = false;
			temp.x = 21;
			temp.y = 42;
			temp.elementsContent = [lbName2_i(),__Active_LiJin_Skin_Label1_i(),lbTime_i()];
			return temp;
		}

		private function grpto_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpto = temp;
			temp.name = "grpto";
			temp.x = 21;
			temp.y = 50;
			temp.elementsContent = [lbName_i(),lbTo_i()];
			return temp;
		}

		private function head_left0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_left0 = temp;
			temp.name = "head_left0";
			temp.height = 10;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.width = 45;
			temp.x = 40;
			temp.y = 12;
			return temp;
		}

		private function head_left_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_left = temp;
			temp.name = "head_left";
			temp.height = 10;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.width = 45;
			temp.x = 40;
			temp.y = 12;
			return temp;
		}

		private function head_right0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_right0 = temp;
			temp.name = "head_right0";
			temp.height = 10;
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.width = 45;
			temp.x = 213;
			temp.y = 12;
			return temp;
		}

		private function head_right_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_right = temp;
			temp.name = "head_right";
			temp.height = 10;
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.width = 45;
			temp.x = 213;
			temp.y = 12;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/lijin.png";
			temp.x = 27;
			temp.y = 106;
			return temp;
		}

		private function killbut0_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			killbut0 = temp;
			temp.name = "killbut0";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 214;
			temp.x = 18;
			temp.y = 96;
			return temp;
		}

		private function killbut1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			killbut1 = temp;
			temp.name = "killbut1";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 214;
			temp.x = 18;
			temp.y = 96;
			return temp;
		}

		private function killbut2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			killbut2 = temp;
			temp.name = "killbut2";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 214;
			temp.x = 18;
			temp.y = 96;
			return temp;
		}

		private function lbHeadName0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeadName0 = temp;
			temp.name = "lbHeadName0";
			temp.fontSize = 16;
			temp.text = "礼金抢夺";
			temp.textAlign = "center";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.width = 205;
			temp.x = 27;
			temp.y = 6;
			return temp;
		}

		private function lbHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeadName = temp;
			temp.name = "lbHeadName";
			temp.fontSize = 16;
			temp.text = "天降礼金";
			temp.textAlign = "center";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.width = 205;
			temp.x = 27;
			temp.y = 6;
			return temp;
		}

		private function lbName2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName2 = temp;
			temp.name = "lbName2";
			temp.text = "盗宝小怪(4)";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.htmlText = "盗宝小怪(4)<font color='#e8c958'>已抢夺完毕</font>";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbPaiHang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPaiHang = temp;
			temp.name = "lbPaiHang";
			temp.text = "礼金排行";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 70;
			temp.x = 21;
			temp.y = 180;
			return temp;
		}

		private function lbRenWu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbRenWu = temp;
			temp.name = "lbRenWu";
			temp.height = 16;
			temp.text = "目标任务";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 16;
			temp.y = 71;
			return temp;
		}

		private function lbTime1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime1 = temp;
			temp.name = "lbTime1";
			temp.text = "00:14:21";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 86;
			temp.x = 126;
			temp.y = 35;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "00:00:53";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 76;
			temp.x = 72;
			temp.y = 20;
			return temp;
		}

		private function lbTo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTo = temp;
			temp.name = "lbTo";
			temp.text = "前往";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 35;
			temp.x = 180;
			temp.y = 0;
			return temp;
		}

		private function numLiJin_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numLiJin = temp;
			temp.name = "numLiJin";
			temp.gap = -3;
			temp.height = 38;
			temp.label = "15";
			temp.styleClass = org.mokylin.skin.app.activety.number.UINumberNum;
			temp.width = 87;
			temp.x = 136;
			temp.y = 124;
			return temp;
		}

		private function qiang_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			qiang_box = temp;
			temp.name = "qiang_box";
			temp.width = 253;
			temp.x = 0;
			temp.y = 363;
			temp.elementsContent = [ui_bg0_i(),__Active_LiJin_Skin_UIAsset1_i(),lbHeadName0_i(),head_left0_i(),head_right0_i(),grpto_i(),grpshuaxin_i(),__Active_LiJin_Skin_Label2_i(),lbPaiHang_i(),__Active_LiJin_Skin_UIAsset2_i(),icon_i(),uiJia_i(),numLiJin_i()];
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 21;
			temp.y = 124;
			return temp;
		}

		private function sec_ico1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_1 = temp;
			temp.name = "sec_ico1_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 73;
			temp.y = 124;
			return temp;
		}

		private function sec_ico1_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_2 = temp;
			temp.name = "sec_ico1_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 125;
			temp.y = 124;
			return temp;
		}

		private function sec_ico1_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_3 = temp;
			temp.name = "sec_ico1_3";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 177;
			temp.y = 124;
			return temp;
		}

		private function sec_ico1_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_4 = temp;
			temp.name = "sec_ico1_4";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.visible = false;
			temp.x = 21;
			temp.y = 177;
			return temp;
		}

		private function sec_ico1_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_5 = temp;
			temp.name = "sec_ico1_5";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.visible = false;
			temp.x = 73;
			temp.y = 177;
			return temp;
		}

		private function sec_ico1_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_6 = temp;
			temp.name = "sec_ico1_6";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.visible = false;
			temp.x = 125;
			temp.y = 177;
			return temp;
		}

		private function sec_ico1_7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_7 = temp;
			temp.name = "sec_ico1_7";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.visible = false;
			temp.x = 177;
			temp.y = 177;
			return temp;
		}

		private function sec_ico2_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_0 = temp;
			temp.name = "sec_ico2_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 21;
			temp.y = 215;
			return temp;
		}

		private function sec_ico2_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_1 = temp;
			temp.name = "sec_ico2_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 73;
			temp.y = 215;
			return temp;
		}

		private function sec_ico2_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_2 = temp;
			temp.name = "sec_ico2_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 125;
			temp.y = 215;
			return temp;
		}

		private function sec_ico2_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_3 = temp;
			temp.name = "sec_ico2_3";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 177;
			temp.y = 215;
			return temp;
		}

		private function sec_ico2_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_4 = temp;
			temp.name = "sec_ico2_4";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.visible = false;
			temp.x = 21;
			temp.y = 268;
			return temp;
		}

		private function sec_ico2_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_5 = temp;
			temp.name = "sec_ico2_5";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.visible = false;
			temp.x = 73;
			temp.y = 268;
			return temp;
		}

		private function sec_ico2_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_6 = temp;
			temp.name = "sec_ico2_6";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.visible = false;
			temp.x = 125;
			temp.y = 268;
			return temp;
		}

		private function sec_ico2_7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_7 = temp;
			temp.name = "sec_ico2_7";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.visible = false;
			temp.x = 177;
			temp.y = 268;
			return temp;
		}

		private function sec_navi0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi0 = temp;
			temp.name = "sec_navi0";
			temp.htmlText = "【完成5环额外奖励】";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 192;
			return temp;
		}

		private function sec_navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi1 = temp;
			temp.name = "sec_navi1";
			temp.htmlText = "【剩余活动时间】";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 35;
			return temp;
		}

		private function sec_subbut1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut1 = temp;
			temp.name = "sec_subbut1";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 36;
			temp.label = "自动任务";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 95;
			temp.x = 22;
			temp.y = 295;
			return temp;
		}

		private function sec_subbut2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut2 = temp;
			temp.name = "sec_subbut2";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 36;
			temp.label = "离开场景";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 95;
			temp.x = 137;
			temp.y = 295;
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.height = 359;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [ui_bg_i(),__Active_LiJin_Skin_UIAsset3_i(),lbHeadName_i(),head_left_i(),head_right_i(),sec_ico1_0_i(),sec_ico1_1_i(),sec_ico1_2_i(),sec_ico1_3_i(),sec_ico1_4_i(),sec_ico1_5_i(),sec_ico1_6_i(),sec_ico1_7_i(),sec_ico2_0_i(),sec_ico2_1_i(),sec_ico2_2_i(),sec_ico2_3_i(),sec_ico2_4_i(),sec_ico2_5_i(),sec_ico2_6_i(),sec_ico2_7_i(),sec_navi0_i(),sec_subbut1_i(),sec_subbut2_i(),lbRenWu_i(),chkAotu_i(),chkLab_i(),killbut0_i(),killbut1_i(),killbut2_i(),lbTime1_i(),sec_navi1_i()];
			return temp;
		}

		private function uiJia_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJia = temp;
			temp.name = "uiJia";
			temp.styleName = "ui/app/activety/zonghe/tianjianglijin/jia.png";
			temp.x = 97;
			temp.y = 128;
			return temp;
		}

		private function ui_bg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_bg0 = temp;
			temp.name = "ui_bg0";
			temp.height = 212;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function ui_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_bg = temp;
			temp.name = "ui_bg";
			temp.height = 357;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}