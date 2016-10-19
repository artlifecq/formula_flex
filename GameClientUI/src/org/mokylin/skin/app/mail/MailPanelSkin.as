package org.mokylin.skin.app.mail
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Rect;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MailPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bgTitle:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var position:feathers.controls.Rect;

		public var title:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MailPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),bgTitle_i(),btnClose_i(),title_i(),position_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bgTitle_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgTitle = temp;
			temp.name = "bgTitle";
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/gao_guang.png";
			temp.width = 274;
			temp.x = 58;
			temp.y = 4;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 594;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/di_ban.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 366;
			temp.y = 0;
			return temp;
		}

		private function position_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			position = temp;
			temp.name = "position";
			temp.height = 10;
			temp.width = 10;
			temp.x = 16;
			temp.y = 46;
			return temp;
		}

		private function title_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			title = temp;
			temp.name = "title";
			temp.touchable = false;
			temp.styleName = "ui/app/mail/you_jian.png";
			temp.x = 171;
			temp.y = 6;
			return temp;
		}

	}
}