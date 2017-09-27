package org.mokylin.skin.app.activety.jixiantiaozhan
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_hide;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_putong4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiXianTiaoZhan_ZhuiZong extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var head_left:feathers.controls.UIAsset;

		public var head_right:feathers.controls.UIAsset;

		public var icons:feathers.controls.UIAsset;

		public var ionbg:feathers.controls.UIAsset;

		public var lbHeadName:feathers.controls.Label;

		public var lbInfo1:feathers.controls.Label;

		public var lbInfo2:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lb_time:feathers.controls.Label;

		public var scroll_box:feathers.controls.Group;

		public var sec_Exit:feathers.controls.Button;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_ico1_1:feathers.controls.UIAsset;

		public var sec_ico1_2:feathers.controls.UIAsset;

		public var sec_subbut1:feathers.controls.Button;

		public var sec_subbut2:feathers.controls.Button;

		public var secondary_box:feathers.controls.Group;

		public var task_box:feathers.controls.Group;

		public var uiJiSha:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiXianTiaoZhan_ZhuiZong()
		{
			super();
			
			this.currentState = "normal";
			this.width = 253;
			this.elementsContent = [task_box_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiXianTiaoZhan_ZhuiZong_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "推荐：同时激活2种增伤BUFF";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 232;
			temp.x = 7;
			temp.y = 304;
			return temp;
		}

		private function __JiXianTiaoZhan_ZhuiZong_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "【伤害强化】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 91;
			return temp;
		}

		private function __JiXianTiaoZhan_ZhuiZong_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "【最后一击奖励】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 223;
			return temp;
		}

		private function __JiXianTiaoZhan_ZhuiZong_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 430;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __JiXianTiaoZhan_ZhuiZong_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/renwuzhuizongbg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_hide;
			temp.x = 221;
			temp.y = 8;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_hide;
			temp.x = 243;
			temp.y = 8;
			return temp;
		}

		private function head_left_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_left = temp;
			temp.name = "head_left";
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 38;
			temp.y = 15;
			return temp;
		}

		private function head_right_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_right = temp;
			temp.name = "head_right";
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 213;
			temp.y = 15;
			return temp;
		}

		private function icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icons = temp;
			temp.name = "icons";
			temp.styleName = "ui/icon/activity/jixian/bosshead/bosstouxiang.png";
			temp.x = 20;
			temp.y = 11;
			return temp;
		}

		private function ionbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ionbg = temp;
			temp.name = "ionbg";
			temp.styleName = "ui/icon/activity/jixian/quan.png";
			temp.x = 12;
			temp.y = 0;
			return temp;
		}

		private function lbHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeadName = temp;
			temp.name = "lbHeadName";
			temp.fontSize = 16;
			temp.text = "极限挑战";
			temp.textAlign = "center";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.width = 205;
			temp.x = 24;
			temp.y = 8;
			return temp;
		}

		private function lbInfo1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo1 = temp;
			temp.name = "lbInfo1";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "增益:23";
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 63;
			temp.x = 44;
			temp.y = 166;
			return temp;
		}

		private function lbInfo2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo2 = temp;
			temp.name = "lbInfo2";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "增益:23";
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 74;
			temp.x = 151;
			temp.y = 166;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 16;
			temp.text = "极限-秦始皇";
			temp.color = 0xEE0699;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 128;
			temp.x = 110;
			temp.y = 33;
			return temp;
		}

		private function lb_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_time = temp;
			temp.name = "lb_time";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "活动结束倒计时：00:22:08";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 232;
			temp.x = 7;
			temp.y = 322;
			return temp;
		}

		private function scroll_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			scroll_box = temp;
			temp.name = "scroll_box";
			temp.width = 234;
			temp.x = 0;
			temp.y = 37;
			temp.elementsContent = [lbInfo1_i(),__JiXianTiaoZhan_ZhuiZong_Label1_i(),lb_time_i(),lbInfo2_i(),lbName_i(),ionbg_i(),icons_i(),sec_ico1_0_i(),sec_ico1_1_i(),sec_ico1_2_i(),sec_subbut1_i(),sec_Exit_i(),sec_subbut2_i(),uiJiSha_i(),__JiXianTiaoZhan_ZhuiZong_Label2_i(),__JiXianTiaoZhan_ZhuiZong_Label3_i()];
			return temp;
		}

		private function sec_Exit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_Exit = temp;
			temp.name = "sec_Exit";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "退出活动";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 81;
			temp.y = 348;
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 46;
			temp.y = 117;
			return temp;
		}

		private function sec_ico1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_1 = temp;
			temp.name = "sec_ico1_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 151;
			temp.y = 117;
			return temp;
		}

		private function sec_ico1_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_2 = temp;
			temp.name = "sec_ico1_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 46;
			temp.y = 247;
			return temp;
		}

		private function sec_subbut1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut1 = temp;
			temp.name = "sec_subbut1";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "购买激活";
			temp.labelOffsetY = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xFFFFFF;
			temp.width = 80;
			temp.x = 31;
			temp.y = 187;
			return temp;
		}

		private function sec_subbut2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut2 = temp;
			temp.name = "sec_subbut2";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "购买激活";
			temp.labelOffsetY = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xFFFFFF;
			temp.width = 80;
			temp.x = 136;
			temp.y = 187;
			return temp;
		}

		private function secondary_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			secondary_box = temp;
			temp.name = "secondary_box";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [lbHeadName_i(),head_left_i(),head_right_i(),scroll_box_i()];
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__JiXianTiaoZhan_ZhuiZong_UIAsset1_i(),__JiXianTiaoZhan_ZhuiZong_UIAsset2_i(),secondary_box_i()];
			return temp;
		}

		private function uiJiSha_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJiSha = temp;
			temp.name = "uiJiSha";
			temp.styleName = "ui/common/yijisha2.png";
			temp.x = 155;
			temp.y = 19;
			return temp;
		}

	}
}