package org.mokylin.skin.app.country.guild
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.text.TextInputV3_2Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildCreatePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var banner:feathers.controls.TextInput;

		public var closeBtn:feathers.controls.Button;

		public var dikuang_1:feathers.controls.UIAsset;

		public var dikuang_2:feathers.controls.UIAsset;

		public var dikuang_3:feathers.controls.UIAsset;

		public var dikuang_select:feathers.controls.UIAsset;

		public var diwen_1:feathers.controls.UIAsset;

		public var diwen_2:feathers.controls.UIAsset;

		public var diwen_3:feathers.controls.UIAsset;

		public var diwen_4:feathers.controls.UIAsset;

		public var diwen_5:feathers.controls.UIAsset;

		public var diwen_select:feathers.controls.UIAsset;

		public var guildName:feathers.controls.TextInput;

		public var sure:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildCreatePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__GuildCreatePanelSkin_UIAsset1_i(),__GuildCreatePanelSkin_UIAsset2_i(),__GuildCreatePanelSkin_UIAsset3_i(),__GuildCreatePanelSkin_UIAsset4_i(),__GuildCreatePanelSkin_UIAsset5_i(),__GuildCreatePanelSkin_Label1_i(),__GuildCreatePanelSkin_Label2_i(),__GuildCreatePanelSkin_Label3_i(),__GuildCreatePanelSkin_Label4_i(),__GuildCreatePanelSkin_Label5_i(),__GuildCreatePanelSkin_UIAsset6_i(),__GuildCreatePanelSkin_UIAsset7_i(),__GuildCreatePanelSkin_UIAsset8_i(),__GuildCreatePanelSkin_UIAsset9_i(),__GuildCreatePanelSkin_UIAsset10_i(),__GuildCreatePanelSkin_UIAsset11_i(),__GuildCreatePanelSkin_UIAsset12_i(),__GuildCreatePanelSkin_UIAsset13_i(),dikuang_1_i(),dikuang_2_i(),dikuang_3_i(),diwen_1_i(),diwen_2_i(),diwen_3_i(),diwen_4_i(),diwen_5_i(),dikuang_select_i(),diwen_select_i(),__GuildCreatePanelSkin_UIAsset14_i(),guildName_i(),banner_i(),sure_i(),closeBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildCreatePanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "输入旗号:";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 63;
			temp.y = 147;
			return temp;
		}

		private function __GuildCreatePanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "帮派创建";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 192;
			temp.y = 12;
			return temp;
		}

		private function __GuildCreatePanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "底框选择:";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 63;
			temp.y = 177;
			return temp;
		}

		private function __GuildCreatePanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "底纹选择:";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 63;
			temp.y = 224;
			return temp;
		}

		private function __GuildCreatePanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "样式预览:";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 63;
			temp.y = 277;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_3.png";
			temp.x = 223;
			temp.y = 221;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_3.png";
			temp.x = 178;
			temp.y = 221;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_3.png";
			temp.x = 270;
			temp.y = 221;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_3.png";
			temp.x = 316;
			temp.y = 221;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_4.png";
			temp.x = 134;
			temp.y = 275;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 462;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 456;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 373;
			temp.styleName = "ui/common/kang/sanjimianban.png";
			temp.width = 422;
			temp.x = 17;
			temp.y = 39;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 360;
			temp.styleName = "ui/big_bg/bang_pai_xie_yi_bei_jing_tu.png";
			temp.width = 409;
			temp.x = 21;
			temp.y = 43;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/bang_pai_ming_cheng.png";
			temp.x = 57;
			temp.y = 63;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/bang_pai_qi_hao.png";
			temp.x = 72;
			temp.y = 102;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_3.png";
			temp.x = 131;
			temp.y = 174;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_3.png";
			temp.x = 177;
			temp.y = 174;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_3.png";
			temp.x = 223;
			temp.y = 174;
			return temp;
		}

		private function __GuildCreatePanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_3.png";
			temp.x = 131;
			temp.y = 221;
			return temp;
		}

		private function banner_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			banner = temp;
			temp.name = "banner";
			temp.maxChars = 1;
			temp.styleClass = org.mokylin.skin.component.text.TextInputV3_2Skin;
			temp.width = 90;
			temp.x = 133;
			temp.y = 143;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 416;
			temp.y = 8;
			return temp;
		}

		private function dikuang_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dikuang_1 = temp;
			temp.name = "dikuang_1";
			temp.styleName = "ui/common/version_3/Q_qihao/mc/flag_biankuang/bian_kuang_1.png";
			temp.x = 134;
			temp.y = 177;
			return temp;
		}

		private function dikuang_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dikuang_2 = temp;
			temp.name = "dikuang_2";
			temp.styleName = "ui/common/version_3/Q_qihao/mc/flag_biankuang/bian_kuang_2.png";
			temp.x = 180;
			temp.y = 177;
			return temp;
		}

		private function dikuang_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dikuang_3 = temp;
			temp.name = "dikuang_3";
			temp.styleName = "ui/common/version_3/Q_qihao/mc/flag_biankuang/bian_kuang_3.png";
			temp.x = 227;
			temp.y = 177;
			return temp;
		}

		private function dikuang_select_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dikuang_select = temp;
			temp.name = "dikuang_select";
			temp.height = 38;
			temp.styleName = "ui/common/version_3/x_xuanzhongkuang/xuan_zhong.png";
			temp.width = 38;
			temp.x = 135;
			temp.y = 177;
			return temp;
		}

		private function diwen_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			diwen_1 = temp;
			temp.name = "diwen_1";
			temp.styleName = "ui/common/version_3/Q_qihao/mc/flag_diwen/di_wen_1.png";
			temp.x = 135;
			temp.y = 225;
			return temp;
		}

		private function diwen_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			diwen_2 = temp;
			temp.name = "diwen_2";
			temp.styleName = "ui/common/version_3/Q_qihao/mc/flag_diwen/di_wen_2.png";
			temp.x = 182;
			temp.y = 225;
			return temp;
		}

		private function diwen_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			diwen_3 = temp;
			temp.name = "diwen_3";
			temp.styleName = "ui/common/version_3/Q_qihao/mc/flag_diwen/di_wen_3.png";
			temp.x = 227;
			temp.y = 225;
			return temp;
		}

		private function diwen_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			diwen_4 = temp;
			temp.name = "diwen_4";
			temp.styleName = "ui/common/version_3/Q_qihao/mc/flag_diwen/di_wen_4.png";
			temp.x = 274;
			temp.y = 225;
			return temp;
		}

		private function diwen_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			diwen_5 = temp;
			temp.name = "diwen_5";
			temp.styleName = "ui/common/version_3/Q_qihao/mc/flag_diwen/di_wen_5.png";
			temp.x = 320;
			temp.y = 224;
			return temp;
		}

		private function diwen_select_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			diwen_select = temp;
			temp.name = "diwen_select";
			temp.height = 38;
			temp.styleName = "ui/common/version_3/x_xuanzhongkuang/xuan_zhong.png";
			temp.width = 38;
			temp.x = 136;
			temp.y = 225;
			return temp;
		}

		private function guildName_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			guildName = temp;
			temp.name = "guildName";
			temp.maxChars = 7;
			temp.prompt = "请输入名称";
			temp.styleClass = org.mokylin.skin.component.text.TextInputV3_2Skin;
			temp.width = 232;
			temp.x = 152;
			temp.y = 62;
			return temp;
		}

		private function sure_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sure = temp;
			temp.name = "sure";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "创 建";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 108;
			temp.x = 174;
			temp.y = 414;
			return temp;
		}

	}
}