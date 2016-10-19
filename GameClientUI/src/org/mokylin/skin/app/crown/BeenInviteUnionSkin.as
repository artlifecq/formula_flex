package org.mokylin.skin.app.crown
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BeenInviteUnionSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var btn0:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var countryName:feathers.controls.Label;

		public var text:feathers.controls.Label;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BeenInviteUnionSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 250;
			this.width = 350;
			this.elementsContent = [__BeenInviteUnionSkin_UIAsset1_i(),btn0_i(),btn_i(),__BeenInviteUnionSkin_UIAsset2_i(),__BeenInviteUnionSkin_UIAsset3_i(),closeBtn_i(),title_i(),__BeenInviteUnionSkin_Label1_i(),text_i(),__BeenInviteUnionSkin_UIAsset4_i(),__BeenInviteUnionSkin_Label2_i(),countryName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BeenInviteUnionSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "邀请信息：";
			temp.color = 0xF4BD63;
			temp.width = 69;
			temp.x = 29;
			temp.y = 85;
			return temp;
		}

		private function __BeenInviteUnionSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "发起国家：";
			temp.color = 0xCAAF94;
			temp.width = 85;
			temp.x = 22;
			temp.y = 52;
			return temp;
		}

		private function __BeenInviteUnionSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 250;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 350;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __BeenInviteUnionSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 126;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 315;
			temp.x = 20;
			temp.y = 80;
			return temp;
		}

		private function __BeenInviteUnionSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 330;
			temp.x = 12;
			temp.y = 8;
			return temp;
		}

		private function __BeenInviteUnionSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/shurukuang.png";
			temp.width = 189;
			temp.x = 97;
			temp.y = 52;
			return temp;
		}

		private function btn0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn0 = temp;
			temp.name = "btn0";
			temp.height = 31;
			temp.label = "拒绝盟约";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 217;
			temp.y = 209;
			return temp;
		}

		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.height = 31;
			temp.label = "同意盟约";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 77;
			temp.y = 209;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 312;
			temp.y = 4;
			return temp;
		}

		private function countryName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			countryName = temp;
			temp.name = "countryName";
			temp.text = "益州";
			temp.color = 0xCAAF94;
			temp.width = 179;
			temp.x = 112;
			temp.y = 52;
			return temp;
		}

		private function text_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			text = temp;
			temp.name = "text";
			temp.height = 87;
			temp.fontSize = 14;
			temp.color = 0xCAAF94;
			temp.width = 292;
			temp.x = 29;
			temp.y = 103;
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
			temp.text = "结 盟";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 175;
			temp.x = 87;
			temp.y = 5;
			return temp;
		}

	}
}