package org.mokylin.skin.mainui.head
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.button.ButtonSkin_yellow;
	import org.mokylin.skin.component.uinumber.UINumberSkin_yellow_min;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SelectRoleHeadBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnMenu:feathers.controls.Button;

		public var imgJob:feathers.controls.UIAsset;

		public var imgLife:feathers.controls.UIAsset;

		public var labHP:feathers.controls.Label;

		public var labLevel:feathers.controls.UINumber;

		public var labName:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SelectRoleHeadBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 76;
			this.width = 191;
			labelFilterBlack_i();
			this.elementsContent = [bg_i(),imgLife_i(),labHP_i(),labName_i(),imgJob_i(),btnMenu_i(),labLevel_i(),__SelectRoleHeadBarSkin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SelectRoleHeadBarSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/head/zudui_lan.png";
			temp.x = 41;
			temp.y = 45;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 46;
			temp.styleName = "ui/mainui/head/zudui_di.png";
			temp.width = 162;
			temp.x = 1;
			temp.y = 13;
			return temp;
		}

		private function btnMenu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMenu = temp;
			temp.name = "btnMenu";
			temp.label = "菜单";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_yellow);
			temp.visible = false;
			temp.x = 36;
			temp.y = 49;
			return temp;
		}

		private function imgJob_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgJob = temp;
			temp.name = "imgJob";
			temp.styleName = "ui/mainui/head/job/fashizhiyedatu.png";
			temp.x = 12;
			temp.y = 23;
			return temp;
		}

		private function imgLife_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLife = temp;
			temp.name = "imgLife";
			temp.styleName = "ui/mainui/head/zudui_xue.png";
			temp.width = 110;
			temp.x = 45;
			temp.y = 35;
			return temp;
		}

		private function labHP_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labHP = temp;
			temp.name = "labHP";
			temp.bold = false;
			temp.height = 16;
			temp.text = "1000/1000";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.width = 110;
			temp.x = 44;
			temp.y = 28;
			return temp;
		}

		private function labLevel_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			labLevel = temp;
			temp.name = "labLevel";
			temp.gap = -7;
			temp.height = 21;
			temp.label = "100";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.uinumber.UINumberSkin_yellow_min);
			temp.width = 40;
			temp.x = 47;
			temp.y = 12;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.text = "名字";
			temp.color = 0xDFB777;
			temp.width = 82;
			temp.x = 83;
			temp.y = 13;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1.00;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 4;
			return temp;
		}

	}
}