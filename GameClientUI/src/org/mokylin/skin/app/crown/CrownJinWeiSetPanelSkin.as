package org.mokylin.skin.app.crown
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.CommonInputTextSkin;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;
	import org.mokylin.skin.component.check.CheckBoxSkin_3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CrownJinWeiSetPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var fightAmount:feathers.controls.TextInput;

		public var fightRank:feathers.controls.TextInput;

		public var isSelfCountry:feathers.controls.Check;

		public var level:feathers.controls.TextInput;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CrownJinWeiSetPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__CrownJinWeiSetPanelSkin_UIAsset1_i(),__CrownJinWeiSetPanelSkin_UIAsset2_i(),__CrownJinWeiSetPanelSkin_Label1_i(),__CrownJinWeiSetPanelSkin_Label2_i(),__CrownJinWeiSetPanelSkin_Label3_i(),__CrownJinWeiSetPanelSkin_Label4_i(),isSelfCountry_i(),__CrownJinWeiSetPanelSkin_UIAsset3_i(),closeBtn_i(),title_i(),level_i(),__CrownJinWeiSetPanelSkin_Label5_i(),fightAmount_i(),__CrownJinWeiSetPanelSkin_Label6_i(),fightRank_i(),btn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CrownJinWeiSetPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "等级需求";
			temp.color = 0xCAAF94;
			temp.width = 85;
			temp.x = 62;
			temp.y = 66;
			return temp;
		}

		private function __CrownJinWeiSetPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "以上";
			temp.color = 0xCAAF94;
			temp.width = 85;
			temp.x = 272;
			temp.y = 66;
			return temp;
		}

		private function __CrownJinWeiSetPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "以上";
			temp.color = 0xCAAF94;
			temp.width = 85;
			temp.x = 272;
			temp.y = 106;
			return temp;
		}

		private function __CrownJinWeiSetPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "名以内";
			temp.color = 0xCAAF94;
			temp.width = 85;
			temp.x = 272;
			temp.y = 146;
			return temp;
		}

		private function __CrownJinWeiSetPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "战力需求";
			temp.color = 0xCAAF94;
			temp.width = 85;
			temp.x = 62;
			temp.y = 106;
			return temp;
		}

		private function __CrownJinWeiSetPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "战力排名";
			temp.color = 0xCAAF94;
			temp.width = 85;
			temp.x = 62;
			temp.y = 146;
			return temp;
		}

		private function __CrownJinWeiSetPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 250;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 495;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CrownJinWeiSetPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 144;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 452;
			temp.x = 22;
			temp.y = 50;
			return temp;
		}

		private function __CrownJinWeiSetPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 476;
			temp.x = 12;
			temp.y = 8;
			return temp;
		}

		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.height = 31;
			temp.label = "确  定";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 216;
			temp.y = 199;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 462;
			temp.y = 4;
			return temp;
		}

		private function fightAmount_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			fightAmount = temp;
			temp.name = "fightAmount";
			temp.height = 24;
			temp.restrict = "0123456789";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.common.CommonInputTextSkin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 148;
			temp.y = 108;
			return temp;
		}

		private function fightRank_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			fightRank = temp;
			temp.name = "fightRank";
			temp.height = 24;
			temp.restrict = "0123456789";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.common.CommonInputTextSkin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 148;
			temp.y = 148;
			return temp;
		}

		private function isSelfCountry_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			isSelfCountry = temp;
			temp.name = "isSelfCountry";
			temp.label = "本国排名";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_3);
			temp.x = 336;
			temp.y = 147;
			return temp;
		}

		private function level_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			level = temp;
			temp.name = "level";
			temp.height = 24;
			temp.restrict = "0123456789";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.common.CommonInputTextSkin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 148;
			temp.y = 68;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.height = 24;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 18;
			temp.text = "禁卫需求设置";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 175;
			temp.x = 167;
			temp.y = 4;
			return temp;
		}

	}
}