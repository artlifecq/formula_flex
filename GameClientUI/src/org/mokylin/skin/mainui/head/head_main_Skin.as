package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
	import org.mokylin.skin.mainui.head.button.ButtonSkin_banghui;
	import org.mokylin.skin.mainui.head.button.ButtonSkin_duiwu;
	import org.mokylin.skin.mainui.head.button.ButtonSkin_heping;
	import org.mokylin.skin.mainui.head.button.ButtonSkin_quanti;
	import org.mokylin.skin.mainui.head.button.ButtonSkin_shane;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class head_main_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var UI_bingjia:feathers.controls.UIAsset;

		public var UI_mojia:feathers.controls.UIAsset;

		public var UI_yijia:feathers.controls.UIAsset;

		public var btn_banghui:feathers.controls.Button;

		public var btn_duiwu:feathers.controls.Button;

		public var btn_heping:feathers.controls.Button;

		public var btn_quanti:feathers.controls.Button;

		public var btn_shane:feathers.controls.Button;

		public var grp_mode:feathers.controls.Group;

		public var grp_zhiye:feathers.controls.Group;

		public var role_name:feathers.controls.Label;

		public var role_zhandou:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function head_main_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 102;
			this.width = 283;
			this.elementsContent = [__head_main_Skin_UIAsset1_i(),__head_main_Skin_UIAsset2_i(),role_zhandou_i(),role_name_i(),grp_zhiye_i(),grp_mode_i()];
			
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

		private function __head_main_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 98;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/mainui/head/zhujuetouxiangkuang.png";
			temp.width = 281;
			temp.x = 2;
			temp.y = 4;
			return temp;
		}

		private function __head_main_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/zhandouli.png";
			temp.x = 101;
			temp.y = 28;
			return temp;
		}

		private function btn_banghui_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_banghui = temp;
			temp.name = "btn_banghui";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSkin_banghui;
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_duiwu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_duiwu = temp;
			temp.name = "btn_duiwu";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSkin_duiwu;
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_heping_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_heping = temp;
			temp.name = "btn_heping";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSkin_heping;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_quanti_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_quanti = temp;
			temp.name = "btn_quanti";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSkin_quanti;
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_shane_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shane = temp;
			temp.name = "btn_shane";
			temp.styleClass = org.mokylin.skin.mainui.head.button.ButtonSkin_shane;
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_mode_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_mode = temp;
			temp.name = "grp_mode";
			temp.x = 73;
			temp.y = 80;
			temp.elementsContent = [btn_heping_i(),btn_banghui_i(),btn_duiwu_i(),btn_quanti_i(),btn_shane_i()];
			return temp;
		}

		private function grp_zhiye_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhiye = temp;
			temp.name = "grp_zhiye";
			temp.x = 0;
			temp.y = 12;
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
			temp.x = 88;
			temp.y = 0;
			return temp;
		}

		private function role_zhandou_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			role_zhandou = temp;
			temp.name = "role_zhandou";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "6521478";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
			temp.width = 109;
			temp.x = 155;
			temp.y = 31;
			return temp;
		}

	}
}