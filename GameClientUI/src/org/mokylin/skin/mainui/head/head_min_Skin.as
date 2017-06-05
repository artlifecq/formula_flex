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
	import org.mokylin.skin.mainui.head.npc_xuecao2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class head_min_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var UI_bing:feathers.controls.UIAsset;

		public var UI_mo:feathers.controls.UIAsset;

		public var UI_yi:feathers.controls.UIAsset;

		public var btn_cha:feathers.controls.Button;

		public var grp_zhiye:feathers.controls.Group;

		public var qizi:feathers.controls.UIAsset;

		public var role_buffer:feathers.controls.UIAsset;

		public var role_name:feathers.controls.Label;

		public var xuecao_bar:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function head_min_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 56;
			this.width = 243;
			this.elementsContent = [__head_min_Skin_UIAsset1_i(),grp_zhiye_i(),qizi_i(),role_buffer_i(),role_name_i(),xuecao_bar_i(),btn_cha_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function UI_bing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			UI_bing = temp;
			temp.name = "UI_bing";
			temp.styleName = "ui/mainui/head/zhiye/bing.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function UI_mo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			UI_mo = temp;
			temp.name = "UI_mo";
			temp.styleName = "ui/mainui/head/zhiye/mo.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function UI_yi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			UI_yi = temp;
			temp.name = "UI_yi";
			temp.styleName = "ui/mainui/head/zhiye/yi.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __head_min_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 49;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/mainui/head/duiyoutouxiangkuang.png";
			temp.width = 210;
			temp.x = 7;
			temp.y = 5;
			return temp;
		}

		private function btn_cha_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_cha = temp;
			temp.name = "btn_cha";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSkin_cha;
			temp.x = 214;
			temp.y = 2;
			return temp;
		}

		private function grp_zhiye_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhiye = temp;
			temp.name = "grp_zhiye";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [UI_bing_i(),UI_mo_i(),UI_yi_i()];
			return temp;
		}

		private function qizi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qizi = temp;
			temp.name = "qizi";
			temp.styleName = "ui/mainui/head/duiyou.png";
			temp.x = 1;
			temp.y = 38;
			return temp;
		}

		private function role_buffer_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			role_buffer = temp;
			temp.name = "role_buffer";
			temp.height = 18;
			temp.styleName = "ui/mainui/head/BAFF/17.png";
			temp.width = 18;
			temp.x = 57;
			temp.y = 34;
			return temp;
		}

		private function role_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			role_name = temp;
			temp.name = "role_name";
			temp.height = 22;
			temp.fontSize = 12;
			temp.text = "角色名六个字 (120级)";
			temp.color = 0xC3C198;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 144;
			temp.x = 58;
			temp.y = 8;
			return temp;
		}

		private function xuecao_bar_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			xuecao_bar = temp;
			temp.name = "xuecao_bar";
			temp.height = 11;
			var skin:StateSkin = new org.mokylin.skin.mainui.head.npc_xuecao2()
			temp.skin = skin
			temp.width = 155;
			temp.x = 57;
			temp.y = 24;
			return temp;
		}

	}
}