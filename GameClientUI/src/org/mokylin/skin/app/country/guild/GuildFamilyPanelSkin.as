package org.mokylin.skin.app.country.guild
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.list.ListSkin2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildFamilyPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var closeBtn:feathers.controls.Button;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildFamilyPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__GuildFamilyPanelSkin_UIAsset1_i(),__GuildFamilyPanelSkin_UIAsset2_i(),__GuildFamilyPanelSkin_UIAsset3_i(),closeBtn_i(),__GuildFamilyPanelSkin_Label1_i(),__GuildFamilyPanelSkin_Label2_i(),__GuildFamilyPanelSkin_Label3_i(),__GuildFamilyPanelSkin_Label4_i(),__GuildFamilyPanelSkin_Label5_i(),__GuildFamilyPanelSkin_Label6_i(),__GuildFamilyPanelSkin_Label7_i(),list_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildFamilyPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "家族成员";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 293;
			temp.y = 14;
			return temp;
		}

		private function __GuildFamilyPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "家族名称";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 70;
			temp.y = 48;
			return temp;
		}

		private function __GuildFamilyPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "等级";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 170;
			temp.y = 48;
			return temp;
		}

		private function __GuildFamilyPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "贡献";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 242;
			temp.y = 48;
			return temp;
		}

		private function __GuildFamilyPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "战力";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 329;
			temp.y = 48;
			return temp;
		}

		private function __GuildFamilyPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "家族职位";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 417;
			temp.y = 48;
			return temp;
		}

		private function __GuildFamilyPanelSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "官职";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 531;
			temp.y = 48;
			return temp;
		}

		private function __GuildFamilyPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 452;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 645;
			return temp;
		}

		private function __GuildFamilyPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 404;
			temp.styleName = "ui/common/kang/sanjimianban.png";
			temp.width = 618;
			temp.x = 13;
			temp.y = 38;
			return temp;
		}

		private function __GuildFamilyPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/L_liebiao/lie_biao_di_1.png";
			temp.width = 608;
			temp.x = 19;
			temp.y = 43;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 610;
			temp.y = 3;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 359;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListSkin2);
			temp.width = 602;
			temp.x = 21;
			temp.y = 72;
			return temp;
		}

	}
}