package org.mokylin.skin.app.country.guild
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListRedSkin;
	import org.mokylin.skin.component.radio.RadioSkin_3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildEventPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var eventType0:feathers.controls.Radio;

		public var eventType1:feathers.controls.Radio;

		public var eventType2:feathers.controls.Radio;

		public var eventType3:feathers.controls.Radio;

		public var eventType4:feathers.controls.Radio;

		public var eventType5:feathers.controls.Radio;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildEventPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__GuildEventPanelSkin_UIAsset1_i(),list_i(),__GuildEventPanelSkin_UIAsset2_i(),__GuildEventPanelSkin_UIAsset3_i(),__GuildEventPanelSkin_UIAsset4_i(),__GuildEventPanelSkin_Label1_i(),__GuildEventPanelSkin_Label2_i(),eventType0_i(),eventType1_i(),eventType2_i(),eventType3_i(),eventType4_i(),eventType5_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildEventPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "时间";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 727;
			temp.y = 21;
			return temp;
		}

		private function __GuildEventPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "动态事件";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 301;
			temp.y = 21;
			return temp;
		}

		private function __GuildEventPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 426;
			temp.styleName = "ui/app/country/niupizhi/di.png";
			temp.width = 870;
			temp.x = 7;
			temp.y = 5;
			return temp;
		}

		private function __GuildEventPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/heng.png";
			temp.width = 871;
			temp.x = 6;
			temp.y = 425;
			return temp;
		}

		private function __GuildEventPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 51;
			temp.styleName = "ui/app/country/niupizhi/liebiaodi_da.png";
			temp.width = 867;
			temp.x = 8;
			temp.y = 6;
			return temp;
		}

		private function __GuildEventPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 538;
			temp.y = 19;
			return temp;
		}

		private function eventType0_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			eventType0 = temp;
			temp.name = "eventType0";
			temp.groupName = "guildEventRadio";
			temp.label = "全部动态";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.textAlign = "left";
			temp.width = 107;
			temp.x = 69;
			temp.y = 447;
			return temp;
		}

		private function eventType1_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			eventType1 = temp;
			temp.name = "eventType1";
			temp.groupName = "guildEventRadio";
			temp.label = "成员变更";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.textAlign = "left";
			temp.width = 107;
			temp.x = 200.5;
			temp.y = 447;
			return temp;
		}

		private function eventType2_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			eventType2 = temp;
			temp.name = "eventType2";
			temp.groupName = "guildEventRadio";
			temp.label = "职位变更";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.textAlign = "left";
			temp.width = 107;
			temp.x = 331.5;
			temp.y = 447;
			return temp;
		}

		private function eventType3_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			eventType3 = temp;
			temp.name = "eventType3";
			temp.groupName = "guildEventRadio";
			temp.label = "重大捐款";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.textAlign = "left";
			temp.width = 107;
			temp.x = 463.5;
			temp.y = 447;
			return temp;
		}

		private function eventType4_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			eventType4 = temp;
			temp.name = "eventType4";
			temp.groupName = "guildEventRadio";
			temp.label = "日常维护";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.textAlign = "left";
			temp.width = 107;
			temp.x = 594.5;
			temp.y = 447;
			return temp;
		}

		private function eventType5_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			eventType5 = temp;
			temp.name = "eventType5";
			temp.groupName = "guildEventRadio";
			temp.label = "帮派活动";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.textAlign = "left";
			temp.width = 107;
			temp.x = 726;
			temp.y = 447;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 376;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 861;
			temp.x = 11;
			temp.y = 44;
			return temp;
		}

	}
}