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
	import org.mokylin.skin.component.button.ButtonSkin_hide;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

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

		public var jf_num:feathers.controls.Label;

		public var jisha0:feathers.controls.UIAsset;

		public var jisha1:feathers.controls.UIAsset;

		public var jisha2:feathers.controls.UIAsset;

		public var lbHeadName:feathers.controls.Label;

		public var lbItem0:feathers.controls.Label;

		public var lbItem1:feathers.controls.Label;

		public var lbItem2:feathers.controls.Label;

		public var lbJifen:feathers.controls.Label;

		public var lbZhenqi:feathers.controls.Label;

		public var pmItem0:feathers.controls.SkinnableContainer;

		public var pmItem1:feathers.controls.SkinnableContainer;

		public var pmItem2:feathers.controls.SkinnableContainer;

		public var pmItem3:feathers.controls.SkinnableContainer;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_ico2_0:feathers.controls.UIAsset;

		public var sec_info:feathers.controls.Label;

		public var sec_navi0:feathers.controls.Label;

		public var sec_navi1:feathers.controls.Label;

		public var sec_navi2:feathers.controls.Label;

		public var sec_subbut1:feathers.controls.Button;

		public var shanghai_List:feathers.controls.Group;

		public var task_box:feathers.controls.Group;

		public var ui_bg:feathers.controls.UIAsset;

		public var zq_num:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Act_MiBao_ZhuiZong()
		{
			super();
			
			this.currentState = "normal";
			this.width = 248;
			this.elementsContent = [task_box_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Act_MiBao_ZhuiZong_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "名次";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 1;
			temp.y = 8;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "玩家名称";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 64;
			temp.y = 8;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "伤害输出";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 175;
			temp.y = 8;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/renwuzhuizongbg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 141;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 32;
			temp.x = 2;
			temp.y = 4;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 132;
			temp.x = 34;
			temp.y = 4;
			return temp;
		}

		private function __Act_MiBao_ZhuiZong_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 80;
			temp.x = 166;
			temp.y = 4;
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

		private function jf_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			jf_num = temp;
			temp.name = "jf_num";
			temp.text = "9999999";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 127;
			temp.x = 112;
			temp.y = 112;
			return temp;
		}

		private function jisha0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jisha0 = temp;
			temp.name = "jisha0";
			temp.styleName = "ui/common/yijisha2.png";
			temp.x = 170;
			temp.y = 44;
			return temp;
		}

		private function jisha1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jisha1 = temp;
			temp.name = "jisha1";
			temp.styleName = "ui/common/yijisha2.png";
			temp.x = 170;
			temp.y = 44;
			return temp;
		}

		private function jisha2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jisha2 = temp;
			temp.name = "jisha2";
			temp.styleName = "ui/common/yijisha2.png";
			temp.x = 170;
			temp.y = 44;
			return temp;
		}

		private function lbHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeadName = temp;
			temp.name = "lbHeadName";
			temp.height = 29;
			temp.fontSize = 16;
			temp.text = "秦陵密宝";
			temp.textAlign = "center";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.width = 188;
			temp.x = 34;
			temp.y = 9;
			return temp;
		}

		private function lbItem0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbItem0 = temp;
			temp.name = "lbItem0";
			temp.height = 20;
			temp.text = "击杀：秦国守卫（99/99）";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 203;
			temp.x = 26;
			temp.y = 66;
			return temp;
		}

		private function lbItem1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbItem1 = temp;
			temp.name = "lbItem1";
			temp.height = 20;
			temp.text = "击杀：秦国守卫（99/99）";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 203;
			temp.x = 26;
			temp.y = 66;
			return temp;
		}

		private function lbItem2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbItem2 = temp;
			temp.name = "lbItem2";
			temp.height = 20;
			temp.text = "击杀：秦国守卫（99/99）";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 203;
			temp.x = 26;
			temp.y = 66;
			return temp;
		}

		private function lbJifen_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJifen = temp;
			temp.name = "lbJifen";
			temp.text = "累积积分：";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 78;
			temp.x = 26;
			temp.y = 112;
			return temp;
		}

		private function lbZhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhenqi = temp;
			temp.name = "lbZhenqi";
			temp.text = "获得真气：";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 78;
			temp.x = 26;
			temp.y = 133;
			return temp;
		}

		private function pmItem0_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pmItem0 = temp;
			temp.name = "pmItem0";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.qinlinmibao.PaiMing_Item()
			temp.skin = skin
			temp.width = 240;
			temp.x = 1;
			temp.y = 31;
			return temp;
		}

		private function pmItem1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pmItem1 = temp;
			temp.name = "pmItem1";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.qinlinmibao.PaiMing_Item()
			temp.skin = skin
			temp.width = 240;
			temp.x = 1;
			temp.y = 57;
			return temp;
		}

		private function pmItem2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pmItem2 = temp;
			temp.name = "pmItem2";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.qinlinmibao.PaiMing_Item()
			temp.skin = skin
			temp.width = 240;
			temp.x = 1;
			temp.y = 84;
			return temp;
		}

		private function pmItem3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pmItem3 = temp;
			temp.name = "pmItem3";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.activety.zonghe.qinlinmibao.PaiMing_Item()
			temp.skin = skin
			temp.width = 240;
			temp.x = 1;
			temp.y = 110;
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 101;
			temp.y = 158;
			return temp;
		}

		private function sec_ico2_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_0 = temp;
			temp.name = "sec_ico2_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 101;
			temp.y = 385;
			return temp;
		}

		private function sec_info_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_info = temp;
			temp.name = "sec_info";
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "倒计时：00：22：08";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 190;
			temp.x = 31;
			temp.y = 439;
			return temp;
		}

		private function sec_navi0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi0 = temp;
			temp.name = "sec_navi0";
			temp.height = 20;
			temp.text = "【阶段一·当前目标】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 43;
			return temp;
		}

		private function sec_navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi1 = temp;
			temp.name = "sec_navi1";
			temp.text = "【积分奖励】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 90;
			return temp;
		}

		private function sec_navi2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi2 = temp;
			temp.name = "sec_navi2";
			temp.text = "【伤害奖励】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 213;
			return temp;
		}

		private function sec_subbut1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut1 = temp;
			temp.name = "sec_subbut1";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.height = 36;
			temp.label = "退出副本";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 84;
			temp.y = 463;
			return temp;
		}

		private function shanghai_List_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			shanghai_List = temp;
			temp.name = "shanghai_List";
			temp.height = 141;
			temp.x = 0;
			temp.y = 233;
			temp.elementsContent = [__Act_MiBao_ZhuiZong_UIAsset2_i(),__Act_MiBao_ZhuiZong_UIAsset3_i(),__Act_MiBao_ZhuiZong_UIAsset4_i(),__Act_MiBao_ZhuiZong_UIAsset5_i(),__Act_MiBao_ZhuiZong_Label1_i(),__Act_MiBao_ZhuiZong_Label2_i(),__Act_MiBao_ZhuiZong_Label3_i(),pmItem0_i(),pmItem1_i(),pmItem2_i(),pmItem3_i()];
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [ui_bg_i(),__Act_MiBao_ZhuiZong_UIAsset1_i(),lbHeadName_i(),head_left_i(),head_right_i(),sec_navi0_i(),sec_navi1_i(),sec_ico1_0_i(),sec_subbut1_i(),sec_info_i(),lbItem0_i(),lbItem1_i(),lbItem2_i(),lbJifen_i(),lbZhenqi_i(),jf_num_i(),zq_num_i(),jisha0_i(),jisha1_i(),jisha2_i(),sec_navi2_i(),sec_ico2_0_i(),shanghai_List_i()];
			return temp;
		}

		private function ui_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_bg = temp;
			temp.name = "ui_bg";
			temp.height = 509;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function zq_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			zq_num = temp;
			temp.name = "zq_num";
			temp.text = "99999999";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 127;
			temp.x = 112;
			temp.y = 133;
			return temp;
		}

	}
}