package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.head.button.ButtonMoreMiddle;
	import org.mokylin.skin.mainui.head.button.ButtonSkin_cha;
	import org.mokylin.skin.mainui.head.button.ButtonSkin_zu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class head_max_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_cha:feathers.controls.Button;

		public var btn_more:feathers.controls.Button;

		public var btn_zu:feathers.controls.Button;

		public var grp_more:feathers.controls.Group;

		public var icon:feathers.controls.UIAsset;

		public var lbLevel:feathers.controls.Label;

		public var lbl_num:feathers.controls.Label;

		public var role_name:feathers.controls.Label;

		public var role_xuecao:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function head_max_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 80;
			this.width = 242;
			this.elementsContent = [__head_max_Skin_UIAsset1_i(),__head_max_Skin_UIAsset2_i(),role_xuecao_i(),__head_max_Skin_UIAsset3_i(),icon_i(),role_name_i(),grp_more_i(),lbl_num_i(),__head_max_Skin_UIAsset4_i(),lbLevel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __head_max_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/mainui/head/headBg_middle_tiao.png";
			temp.x = 74;
			temp.y = 33;
			return temp;
		}

		private function __head_max_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/xuetiao/xuetiaobg_middle.png";
			temp.width = 180;
			temp.x = 62;
			temp.y = 17;
			return temp;
		}

		private function __head_max_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/mainui/head/headBg_middle_quan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __head_max_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/dengjikuang.png";
			temp.x = 0;
			temp.y = 53;
			return temp;
		}

		private function btn_cha_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_cha = temp;
			temp.name = "btn_cha";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSkin_cha;
			temp.y = 0;
			return temp;
		}

		private function btn_more_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_more = temp;
			temp.name = "btn_more";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonMoreMiddle;
			temp.x = 46;
			temp.y = 0;
			return temp;
		}

		private function btn_zu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zu = temp;
			temp.name = "btn_zu";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSkin_zu;
			temp.x = 23;
			temp.y = 0;
			return temp;
		}

		private function grp_more_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_more = temp;
			temp.name = "grp_more";
			temp.x = 77;
			temp.y = 55;
			temp.elementsContent = [btn_cha_i(),btn_zu_i(),btn_more_i()];
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/mainui/head/touxiang/mojia/middle.png";
			temp.x = 9;
			temp.y = 6;
			return temp;
		}

		private function lbLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLevel = temp;
			temp.name = "lbLevel";
			temp.bold = false;
			temp.height = 16;
			temp.fontSize = 12;
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 22;
			temp.x = 0;
			temp.y = 57;
			return temp;
		}

		private function lbl_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_num = temp;
			temp.name = "lbl_num";
			temp.fontSize = 12;
			temp.text = "2000/3000";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 148;
			temp.x = 76;
			temp.y = 18;
			return temp;
		}

		private function role_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			role_name = temp;
			temp.name = "role_name";
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "名字是六个字";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 99;
			temp.x = 79;
			temp.y = 34;
			return temp;
		}

		private function role_xuecao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			role_xuecao = temp;
			temp.name = "role_xuecao";
			temp.styleName = "ui/mainui/head/xuetiao/xuetiaobar_middle.png";
			temp.width = 155;
			temp.x = 74;
			temp.y = 21;
			return temp;
		}

	}
}