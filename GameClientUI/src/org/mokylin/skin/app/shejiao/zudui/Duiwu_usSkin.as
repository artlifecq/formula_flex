package org.mokylin.skin.app.shejiao.zudui
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
	import org.mokylin.skin.app.shejiao.zudui.Zudui_Head;
	import org.mokylin.skin.app.shejiao.zudui.number.UINumberJiacheng;
	import org.mokylin.skin.component.button.ButtonSkin_putong4;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Duiwu_usSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_add:feathers.controls.Button;

		public var btn_create:feathers.controls.Button;

		public var btn_exit:feathers.controls.Button;

		public var chk_accept_apply:feathers.controls.Check;

		public var chk_accept_invite:feathers.controls.Check;

		public var dui1:feathers.controls.UIAsset;

		public var dui2:feathers.controls.UIAsset;

		public var dui3:feathers.controls.UIAsset;

		public var dui4:feathers.controls.UIAsset;

		public var dui5:feathers.controls.UIAsset;

		public var gPlayer1:feathers.controls.Group;

		public var gPlayer2:feathers.controls.Group;

		public var gPlayer3:feathers.controls.Group;

		public var gPlayer4:feathers.controls.Group;

		public var gPlayer5:feathers.controls.Group;

		public var grp_jingyan:feathers.controls.Group;

		public var head1:feathers.controls.SkinnableContainer;

		public var head2:feathers.controls.SkinnableContainer;

		public var head3:feathers.controls.SkinnableContainer;

		public var head4:feathers.controls.SkinnableContainer;

		public var head5:feathers.controls.SkinnableContainer;

		public var imgCaptain:feathers.controls.UIAsset;

		public var jingyanbg:feathers.controls.UIAsset;

		public var jingyanbg2:feathers.controls.UIAsset;

		public var jingyanjiacheng:feathers.controls.UIAsset;

		public var lab_map1:feathers.controls.Label;

		public var lab_map2:feathers.controls.Label;

		public var lab_map3:feathers.controls.Label;

		public var lab_map4:feathers.controls.Label;

		public var lab_map5:feathers.controls.Label;

		public var num_jingyan:feathers.controls.UINumber;

		public var ui_weijiaru:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Duiwu_usSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 445;
			this.width = 912;
			this.elementsContent = [__Duiwu_usSkin_UIAsset1_i(),__Duiwu_usSkin_UIAsset2_i(),ui_weijiaru_i(),chk_accept_invite_i(),chk_accept_apply_i(),grp_jingyan_i(),btn_exit_i(),btn_add_i(),btn_create_i(),gPlayer1_i(),gPlayer5_i(),gPlayer2_i(),gPlayer3_i(),gPlayer4_i(),imgCaptain_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Duiwu_usSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/shejiao/zudui/bg1.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Duiwu_usSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/shejiao/zudui/dizuo.png";
			temp.x = 35;
			temp.y = 317;
			return temp;
		}

		private function btn_add_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_add = temp;
			temp.name = "btn_add";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "添加队员";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 808;
			temp.y = 412;
			return temp;
		}

		private function btn_create_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_create = temp;
			temp.name = "btn_create";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "创建队伍";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 808;
			temp.y = 397;
			return temp;
		}

		private function btn_exit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_exit = temp;
			temp.name = "btn_exit";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "退出队伍";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 808;
			temp.y = 382;
			return temp;
		}

		private function chk_accept_apply_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_accept_apply = temp;
			temp.name = "chk_accept_apply";
			temp.height = 23;
			temp.label = "我是队长时，自动接收他人发出的入队申请";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.width = 300;
			temp.x = 11;
			temp.y = 417;
			return temp;
		}

		private function chk_accept_invite_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_accept_invite = temp;
			temp.name = "chk_accept_invite";
			temp.height = 23;
			temp.label = "没有组队时，自动接收他人发出的组队邀请";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.width = 300;
			temp.x = 11;
			temp.y = 386;
			return temp;
		}

		private function dui1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dui1 = temp;
			temp.name = "dui1";
			temp.height = 10;
			temp.width = 10;
			temp.x = 67;
			temp.y = 277;
			return temp;
		}

		private function dui2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dui2 = temp;
			temp.name = "dui2";
			temp.height = 10;
			temp.width = 10;
			temp.x = 65;
			temp.y = 307;
			return temp;
		}

		private function dui3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dui3 = temp;
			temp.name = "dui3";
			temp.height = 10;
			temp.width = 10;
			temp.x = 72;
			temp.y = 334;
			return temp;
		}

		private function dui4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dui4 = temp;
			temp.name = "dui4";
			temp.height = 10;
			temp.width = 10;
			temp.x = 62;
			temp.y = 312;
			return temp;
		}

		private function dui5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dui5 = temp;
			temp.name = "dui5";
			temp.height = 10;
			temp.width = 10;
			temp.x = 63;
			temp.y = 280;
			return temp;
		}

		private function gPlayer1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer1 = temp;
			temp.name = "gPlayer1";
			temp.height = 305;
			temp.width = 143;
			temp.x = 37;
			temp.y = 55;
			temp.elementsContent = [dui1_i(),head1_i(),lab_map1_i()];
			return temp;
		}

		private function gPlayer2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer2 = temp;
			temp.name = "gPlayer2";
			temp.height = 330;
			temp.width = 143;
			temp.x = 187;
			temp.y = 40;
			temp.elementsContent = [dui2_i(),head2_i(),lab_map2_i()];
			return temp;
		}

		private function gPlayer3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer3 = temp;
			temp.name = "gPlayer3";
			temp.height = 350;
			temp.width = 158;
			temp.x = 373;
			temp.y = 20;
			temp.elementsContent = [dui3_i(),head3_i(),lab_map3_i()];
			return temp;
		}

		private function gPlayer4_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer4 = temp;
			temp.name = "gPlayer4";
			temp.height = 331;
			temp.width = 145;
			temp.x = 572;
			temp.y = 38;
			temp.elementsContent = [dui4_i(),head4_i(),lab_map4_i()];
			return temp;
		}

		private function gPlayer5_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gPlayer5 = temp;
			temp.name = "gPlayer5";
			temp.height = 307;
			temp.width = 143;
			temp.x = 744;
			temp.y = 55;
			temp.elementsContent = [dui5_i(),head5_i(),lab_map5_i()];
			return temp;
		}

		private function grp_jingyan_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_jingyan = temp;
			temp.name = "grp_jingyan";
			temp.x = 495;
			temp.y = 380;
			temp.elementsContent = [jingyanbg_i(),jingyanbg2_i(),jingyanjiacheng_i(),num_jingyan_i()];
			return temp;
		}

		private function head1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head1 = temp;
			temp.name = "head1";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.app.shejiao.zudui.Zudui_Head()
			temp.skin = skin
			temp.width = 143;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function head2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head2 = temp;
			temp.name = "head2";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.app.shejiao.zudui.Zudui_Head()
			temp.skin = skin
			temp.width = 143;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function head3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head3 = temp;
			temp.name = "head3";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.app.shejiao.zudui.Zudui_Head()
			temp.skin = skin
			temp.width = 143;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function head4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head4 = temp;
			temp.name = "head4";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.app.shejiao.zudui.Zudui_Head()
			temp.skin = skin
			temp.width = 143;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function head5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head5 = temp;
			temp.name = "head5";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.app.shejiao.zudui.Zudui_Head()
			temp.skin = skin
			temp.width = 143;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgCaptain_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgCaptain = temp;
			temp.name = "imgCaptain";
			temp.height = 83;
			temp.styleName = "ui/app/shejiao/zudui/duizhang.png";
			temp.width = 27;
			temp.x = 7;
			temp.y = 77;
			return temp;
		}

		private function jingyanbg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jingyanbg2 = temp;
			temp.name = "jingyanbg2";
			temp.styleName = "ui/app/shejiao/zudui/jingyankuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function jingyanbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jingyanbg = temp;
			temp.name = "jingyanbg";
			temp.styleName = "ui/app/shejiao/zudui/jingyankuang_disable.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function jingyanjiacheng_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jingyanjiacheng = temp;
			temp.name = "jingyanjiacheng";
			temp.styleName = "ui/app/shejiao/zudui/jingyanjiacheng.png";
			temp.x = 64;
			temp.y = 20;
			return temp;
		}

		private function lab_map1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_map1 = temp;
			temp.name = "lab_map1";
			temp.fontSize = 12;
			temp.text = "玩家名六个字【69级】";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 0;
			temp.y = 289;
			return temp;
		}

		private function lab_map2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_map2 = temp;
			temp.name = "lab_map2";
			temp.fontSize = 12;
			temp.text = "玩家名六个字【69级】";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 2;
			temp.y = 314;
			return temp;
		}

		private function lab_map3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_map3 = temp;
			temp.name = "lab_map3";
			temp.fontSize = 12;
			temp.text = "玩家名六个字【69级】";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 19;
			temp.y = 334;
			return temp;
		}

		private function lab_map4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_map4 = temp;
			temp.name = "lab_map4";
			temp.fontSize = 12;
			temp.text = "玩家名六个字【69级】";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 6;
			temp.y = 315;
			return temp;
		}

		private function lab_map5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_map5 = temp;
			temp.name = "lab_map5";
			temp.fontSize = 12;
			temp.text = "马贼营寨";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 2;
			temp.y = 291;
			return temp;
		}

		private function num_jingyan_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_jingyan = temp;
			temp.name = "num_jingyan";
			temp.gap = -1;
			temp.height = 25;
			temp.label = "20x";
			temp.styleClass = org.mokylin.skin.app.shejiao.zudui.number.UINumberJiacheng;
			temp.width = 124;
			temp.x = 160;
			temp.y = 19;
			return temp;
		}

		private function ui_weijiaru_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_weijiaru = temp;
			temp.name = "ui_weijiaru";
			temp.styleName = "ui/app/shejiao/zudui/shangweijiaru.png";
			temp.x = 285;
			temp.y = 168;
			return temp;
		}

	}
}