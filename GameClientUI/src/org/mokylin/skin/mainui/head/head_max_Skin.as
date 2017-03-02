package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.head.button.ButtonSkin_cha;
	import org.mokylin.skin.mainui.head.button.ButtonSkin_gengduo;
	import org.mokylin.skin.mainui.head.button.ButtonSkin_yi;
	import org.mokylin.skin.mainui.head.button.ButtonSkin_zu;
	import org.mokylin.skin.mainui.head.npc_xuecao1;

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
		public var UI_bingjia:feathers.controls.UIAsset;

		public var UI_mojia:feathers.controls.UIAsset;

		public var UI_yijia:feathers.controls.UIAsset;

		public var btn_cha:feathers.controls.Button;

		public var btn_more:feathers.controls.Button;

		public var btn_yi:feathers.controls.Button;

		public var btn_zu:feathers.controls.Button;

		public var buff1:feathers.controls.UIAsset;

		public var buff2:feathers.controls.UIAsset;

		public var buff3:feathers.controls.UIAsset;

		public var grp_buff:feathers.controls.Group;

		public var grp_more:feathers.controls.Group;

		public var grp_zhiye:feathers.controls.Group;

		public var role_name:feathers.controls.Label;

		public var role_xuecao:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function head_max_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 91;
			this.width = 310;
			this.elementsContent = [__head_max_Skin_UIAsset1_i(),role_xuecao_i(),__head_max_Skin_UIAsset2_i(),role_name_i(),grp_zhiye_i(),grp_more_i(),grp_buff_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function UI_bingjia_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			UI_bingjia = temp;
			temp.name = "UI_bingjia";
			temp.styleName = "ui/mainui/head/zhiye/bingjia.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function UI_mojia_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			UI_mojia = temp;
			temp.name = "UI_mojia";
			temp.styleName = "ui/mainui/head/zhiye/mojia.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function UI_yijia_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			UI_yijia = temp;
			temp.name = "UI_yijia";
			temp.styleName = "ui/mainui/head/zhiye/yijia.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __head_max_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/mainui/head/npcxuechao.png";
			temp.x = 64;
			temp.y = 10;
			return temp;
		}

		private function __head_max_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/mainui/head/npctouxiangkuang.png";
			temp.x = 2;
			temp.y = 9;
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
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSkin_gengduo;
			temp.x = 84;
			temp.y = 0;
			return temp;
		}

		private function btn_yi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_yi = temp;
			temp.name = "btn_yi";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSkin_yi;
			temp.x = 56;
			temp.y = 0;
			return temp;
		}

		private function btn_zu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zu = temp;
			temp.name = "btn_zu";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSkin_zu;
			temp.x = 28;
			temp.y = 0;
			return temp;
		}

		private function buff1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			buff1 = temp;
			temp.name = "buff1";
			temp.styleName = "ui/mainui/head/BAFF/buff_dix24.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function buff2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			buff2 = temp;
			temp.name = "buff2";
			temp.styleName = "ui/mainui/head/BAFF/buff_dix24.png";
			temp.x = 30;
			temp.y = 0;
			return temp;
		}

		private function buff3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			buff3 = temp;
			temp.name = "buff3";
			temp.styleName = "ui/mainui/head/BAFF/buff_dix24.png";
			temp.x = 60;
			temp.y = 0;
			return temp;
		}

		private function grp_buff_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_buff = temp;
			temp.name = "grp_buff";
			temp.x = 97;
			temp.y = 52;
			temp.elementsContent = [buff1_i(),buff2_i(),buff3_i()];
			return temp;
		}

		private function grp_more_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_more = temp;
			temp.name = "grp_more";
			temp.x = 187;
			temp.y = 53;
			temp.elementsContent = [btn_cha_i(),btn_zu_i(),btn_yi_i(),btn_more_i()];
			return temp;
		}

		private function grp_zhiye_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhiye = temp;
			temp.name = "grp_zhiye";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [UI_bingjia_i(),UI_mojia_i(),UI_yijia_i()];
			return temp;
		}

		private function role_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			role_name = temp;
			temp.name = "role_name";
			temp.bold = false;
			temp.text = "角色名六个字 (120级)";
			temp.color = 0xC3C198;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.x = 92;
			temp.y = 10;
			return temp;
		}

		private function role_xuecao_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			role_xuecao = temp;
			temp.name = "role_xuecao";
			temp.height = 12;
			var skin:StateSkin = new org.mokylin.skin.mainui.head.npc_xuecao1()
			temp.skin = skin
			temp.width = 200;
			temp.x = 90;
			temp.y = 33;
			return temp;
		}

	}
}