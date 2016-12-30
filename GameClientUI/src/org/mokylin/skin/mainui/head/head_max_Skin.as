package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
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

		public var grp_txt:feathers.controls.Group;

		public var grp_zhiye:feathers.controls.Group;

		public var role_buffer:feathers.controls.UIAsset;

		public var role_name:feathers.controls.Label;

		public var role_xuecao:feathers.controls.SkinnableContainer;

		public var txt_cha:feathers.controls.Label;

		public var txt_more:feathers.controls.Label;

		public var txt_yi:feathers.controls.Label;

		public var txt_zu:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function head_max_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 91;
			this.width = 309;
			this.elementsContent = [__head_max_Skin_UIAsset1_i(),role_xuecao_i(),__head_max_Skin_UIAsset2_i(),role_name_i(),grp_zhiye_i(),role_buffer_i(),grp_txt_i()];
			
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

		private function grp_txt_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_txt = temp;
			temp.name = "grp_txt";
			temp.x = 190;
			temp.y = 53;
			temp.elementsContent = [txt_cha_i(),txt_zu_i(),txt_yi_i(),txt_more_i()];
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

		private function role_buffer_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			role_buffer = temp;
			temp.name = "role_buffer";
			temp.styleName = "ui/mainui/head/BAFF/24.png";
			temp.x = 99;
			temp.y = 54;
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
			temp.y = 7;
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

		private function txt_cha_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_cha = temp;
			temp.name = "txt_cha";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "查";
			temp.color = 0x525252;
			temp.width = 20;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function txt_more_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_more = temp;
			temp.name = "txt_more";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "更多";
			temp.color = 0x525252;
			temp.width = 42;
			temp.x = 74;
			temp.y = 0;
			return temp;
		}

		private function txt_yi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_yi = temp;
			temp.name = "txt_yi";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "易";
			temp.color = 0x525252;
			temp.width = 20;
			temp.x = 44;
			temp.y = 0;
			return temp;
		}

		private function txt_zu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_zu = temp;
			temp.name = "txt_zu";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "组";
			temp.color = 0x525252;
			temp.width = 20;
			temp.x = 22;
			temp.y = 0;
			return temp;
		}

	}
}