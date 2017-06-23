package org.mokylin.skin.app.activety.zonghe.qinlinmibao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.activety.zonghe.qinlinmibao.PaiMing_Item;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Act_MiBao_ZhuiZong extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var head_left:feathers.controls.UIAsset;

		public var head_right:feathers.controls.UIAsset;

		public var lbHeadName:feathers.controls.Label;

		public var lbItem:feathers.controls.Label;

		public var lbJifen:feathers.controls.Label;

		public var lbZhenqi:feathers.controls.Label;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_ico1_1:feathers.controls.UIAsset;

		public var sec_ico1_2:feathers.controls.UIAsset;

		public var sec_ico1_3:feathers.controls.UIAsset;

		public var sec_ico2_0:feathers.controls.UIAsset;

		public var sec_ico2_1:feathers.controls.UIAsset;

		public var sec_ico2_2:feathers.controls.UIAsset;

		public var sec_ico2_3:feathers.controls.UIAsset;

		public var sec_info:feathers.controls.Label;

		public var sec_navi0:feathers.controls.Label;

		public var sec_navi1:feathers.controls.Label;

		public var sec_navi2:feathers.controls.Label;

		public var sec_subbut1:feathers.controls.Button;

		public var task_box:feathers.controls.Group;

		public var uiYiTiaoZhan:feathers.controls.UIAsset;

		public var ui_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Act_MiBao_ZhuiZong()
		{
			super();
			
			this.currentState = "normal";
			this.height = 613;
			this.width = 253;
			this.elementsContent = [task_box_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Act_MiBao_ZhuiZong_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 17;
			temp.y = 330;
			temp.elementsContent = [__Act_MiBao_ZhuiZong_UIAsset3_i(),__Act_MiBao_ZhuiZong_Label1_i(),__Act_MiBao_ZhuiZong_Label2_i(),__Act_MiBao_ZhuiZong_Label3_i()];
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "名次";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 1;
			temp.y = 4;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "玩家名称";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 47;
			temp.y = 4;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "伤害输出";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 141;
			temp.y = 4;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.qinlinmibao.PaiMing_Item()
			temp.skin = skin
			temp.width = 217;
			temp.x = 18;
			temp.y = 360;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/hengtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 141;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 224;
			temp.x = 13;
			temp.y = 326;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activety/zonghe/yeqian.png";
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

		private function lbHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeadName = temp;
			temp.name = "lbHeadName";
			temp.fontSize = 16;
			temp.text = "秦陵密宝";
			temp.textAlign = "center";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.width = 205;
			temp.x = 27;
			temp.y = 6;
			return temp;
		}

		private function lbItem_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbItem = temp;
			temp.name = "lbItem";
			temp.text = "击杀：秦国守卫（99/99）";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 203;
			temp.x = 26;
			temp.y = 65;
			return temp;
		}

		private function lbJifen_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJifen = temp;
			temp.name = "lbJifen";
			temp.text = "获得积分：$";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 203;
			temp.x = 26;
			temp.y = 170;
			return temp;
		}

		private function lbZhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhenqi = temp;
			temp.name = "lbZhenqi";
			temp.text = "获得积分：$";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 203;
			temp.x = 26;
			temp.y = 194;
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 21;
			temp.y = 221;
			return temp;
		}

		private function sec_ico1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_1 = temp;
			temp.name = "sec_ico1_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 73;
			temp.y = 221;
			return temp;
		}

		private function sec_ico1_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_2 = temp;
			temp.name = "sec_ico1_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 125;
			temp.y = 221;
			return temp;
		}

		private function sec_ico1_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_3 = temp;
			temp.name = "sec_ico1_3";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 177;
			temp.y = 221;
			return temp;
		}

		private function sec_ico2_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_0 = temp;
			temp.name = "sec_ico2_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 21;
			temp.y = 476;
			return temp;
		}

		private function sec_ico2_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_1 = temp;
			temp.name = "sec_ico2_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 73;
			temp.y = 476;
			return temp;
		}

		private function sec_ico2_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_2 = temp;
			temp.name = "sec_ico2_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 125;
			temp.y = 476;
			return temp;
		}

		private function sec_ico2_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_3 = temp;
			temp.name = "sec_ico2_3";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 177;
			temp.y = 476;
			return temp;
		}

		private function sec_info_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_info = temp;
			temp.name = "sec_info";
			temp.letterSpacing = -1;
			temp.fontSize = 16;
			temp.text = "倒计时：00：22：08";
			temp.textAlign = "center";
			temp.color = 0xD23735;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 190;
			temp.x = 31;
			temp.y = 536;
			return temp;
		}

		private function sec_navi0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi0 = temp;
			temp.name = "sec_navi0";
			temp.text = "[阶段一·当前目标]";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 7;
			temp.y = 43;
			return temp;
		}

		private function sec_navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi1 = temp;
			temp.name = "sec_navi1";
			temp.text = "[积分奖励]";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 7;
			temp.y = 145;
			return temp;
		}

		private function sec_navi2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi2 = temp;
			temp.name = "sec_navi2";
			temp.text = "[伤害奖励]";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 7;
			temp.y = 302;
			return temp;
		}

		private function sec_subbut1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut1 = temp;
			temp.name = "sec_subbut1";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "退出副本";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 86;
			temp.x = 84;
			temp.y = 568;
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
			temp.elementsContent = [ui_bg_i(),__Act_MiBao_ZhuiZong_UIAsset1_i(),lbHeadName_i(),head_left_i(),head_right_i(),sec_navi0_i(),sec_navi1_i(),sec_navi2_i(),sec_ico1_0_i(),sec_ico1_1_i(),sec_ico1_2_i(),sec_ico1_3_i(),sec_ico2_0_i(),sec_ico2_1_i(),sec_ico2_2_i(),sec_ico2_3_i(),sec_subbut1_i(),sec_info_i(),lbItem_i(),lbJifen_i(),lbZhenqi_i(),uiYiTiaoZhan_i(),__Act_MiBao_ZhuiZong_UIAsset2_i(),__Act_MiBao_ZhuiZong_Group1_i(),__Act_MiBao_ZhuiZong_SkinnableContainer1_i()];
			return temp;
		}

		private function uiYiTiaoZhan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiYiTiaoZhan = temp;
			temp.name = "uiYiTiaoZhan";
			temp.styleName = "ui/common/yijisha2.png";
			temp.x = 173;
			temp.y = 34;
			return temp;
		}

		private function ui_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_bg = temp;
			temp.name = "ui_bg";
			temp.height = 613;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}