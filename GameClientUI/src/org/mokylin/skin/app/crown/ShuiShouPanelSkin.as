package org.mokylin.skin.app.crown
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShuiShouPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var des:feathers.controls.Label;

		public var group:feathers.controls.Group;

		public var newShuiLv:feathers.controls.Label;

		public var shuishou:feathers.controls.Label;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShuiShouPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__ShuiShouPanelSkin_UIAsset1_i(),__ShuiShouPanelSkin_UIAsset2_i(),__ShuiShouPanelSkin_UIAsset3_i(),__ShuiShouPanelSkin_Label1_i(),__ShuiShouPanelSkin_UIAsset4_i(),closeBtn_i(),title_i(),group_i(),btn_i(),shuishou_i(),__ShuiShouPanelSkin_Label2_i(),newShuiLv_i(),des_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShuiShouPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 7;
			return temp;
		}

		private function __ShuiShouPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 25;
			temp.fontSize = 14;
			temp.text = "当前税率：";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 85;
			temp.x = 31;
			temp.y = 59;
			return temp;
		}

		private function __ShuiShouPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "调整税率：";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 79;
			temp.x = 51;
			temp.y = 90;
			return temp;
		}

		private function __ShuiShouPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 210;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 360;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ShuiShouPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 147;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 315;
			temp.x = 22;
			temp.y = 51;
			return temp;
		}

		private function __ShuiShouPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 102;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 292;
			temp.x = 33;
			temp.y = 87;
			return temp;
		}

		private function __ShuiShouPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 332;
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
			temp.label = "设  定";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 145;
			temp.y = 151;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 324;
			temp.y = 6;
			return temp;
		}

		private function des_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			des = temp;
			temp.name = "des";
			temp.fontSize = 14;
			temp.text = "税率说明";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 70;
			temp.x = 269;
			temp.y = 57;
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.x = 51;
			temp.y = 126;
			temp.layout = __ShuiShouPanelSkin_HorizontalLayout1_i();
			return temp;
		}

		private function newShuiLv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			newShuiLv = temp;
			temp.name = "newShuiLv";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "10%";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 125;
			temp.y = 90;
			return temp;
		}

		private function shuishou_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			shuishou = temp;
			temp.name = "shuishou";
			temp.height = 25;
			temp.fontSize = 14;
			temp.text = "10%";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 115;
			temp.x = 101;
			temp.y = 59;
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
			temp.text = "税率";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 175;
			temp.x = 97;
			temp.y = 5;
			return temp;
		}

	}
}