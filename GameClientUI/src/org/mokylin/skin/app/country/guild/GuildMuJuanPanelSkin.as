package org.mokylin.skin.app.country.guild
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;
	import org.mokylin.skin.component.text.TextInput4Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildMuJuanPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var group:feathers.controls.Group;

		public var juankuan:feathers.controls.TextInput;

		public var juankuanLbl:feathers.controls.Label;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildMuJuanPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__GuildMuJuanPanelSkin_UIAsset1_i(),__GuildMuJuanPanelSkin_UIAsset2_i(),__GuildMuJuanPanelSkin_UIAsset3_i(),__GuildMuJuanPanelSkin_Label1_i(),__GuildMuJuanPanelSkin_Label2_i(),__GuildMuJuanPanelSkin_UIAsset4_i(),closeBtn_i(),title_i(),btn_i(),juankuanLbl_i(),group_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildMuJuanPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 10;
			return temp;
		}

		private function __GuildMuJuanPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "捐款金额:";
			temp.color = 0xCAAF94;
			temp.width = 90;
			temp.x = 56;
			temp.y = 90;
			return temp;
		}

		private function __GuildMuJuanPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 25;
			temp.fontSize = 14;
			temp.text = "捐款至帮派";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 32;
			temp.y = 59;
			return temp;
		}

		private function __GuildMuJuanPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 216;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 351;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __GuildMuJuanPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 152;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 315;
			temp.x = 20;
			temp.y = 50;
			return temp;
		}

		private function __GuildMuJuanPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 105;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 292;
			temp.x = 33;
			temp.y = 87;
			return temp;
		}

		private function __GuildMuJuanPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 325;
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
			temp.x = 137;
			temp.y = 155;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 313;
			temp.y = 6;
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.x = 57;
			temp.y = 123;
			temp.layout = __GuildMuJuanPanelSkin_HorizontalLayout1_i();
			temp.elementsContent = [juankuan_i()];
			return temp;
		}

		private function juankuanLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			juankuanLbl = temp;
			temp.name = "juankuanLbl";
			temp.height = 24;
			temp.color = 0xF6D621;
			temp.width = 146;
			temp.x = 133;
			temp.y = 90;
			return temp;
		}

		private function juankuan_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			juankuan = temp;
			temp.name = "juankuan";
			temp.height = 24;
			temp.maxChars = 8;
			temp.restrict = "0123456789";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput4Skin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 48;
			temp.x = 151;
			temp.y = 120;
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
			temp.text = "募  捐";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 175;
			temp.x = 90;
			temp.y = 3;
			return temp;
		}

	}
}