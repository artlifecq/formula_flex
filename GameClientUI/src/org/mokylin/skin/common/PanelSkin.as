package org.mokylin.skin.common
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.PanelHeadSkin;
	import org.mokylin.skin.component.button.ButtonSkin_closeBtn;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var closeBtn:feathers.controls.Button;

		public var titleDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 432;
			this.width = 581;
			this.elementsContent = [bg_i(),closeBtn_i(),__PanelSkin_SkinnableContainer1_i(),titleDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PanelSkin_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 58;
			temp.horizontalCenter = 0;
			var skin:StateSkin = new org.mokylin.skin.common.PanelHeadSkin()
			temp.skin = skin
			temp.width = 412;
			temp.y = -29;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.bottom = 0;
			temp.left = 0;
			temp.repeatScale9Skin = true;
			temp.right = 0;
			temp.styleName = "ui/component/scaleView/skin_1.png";
			temp.top = 0;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			temp.height = 29;
			temp.right = 30;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_closeBtn);
			temp.width = 30;
			temp.y = 19;
			return temp;
		}

		private function titleDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			titleDisplay = temp;
			temp.name = "titleDisplay";
			temp.bold = true;
			temp.height = 25;
			temp.horizontalCenter = 6.5;
			temp.fontSize = 18;
			temp.text = "标题";
			temp.textAlign = "center";
			temp.color = 0x72C9FF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.visible = false;
			temp.width = 176;
			temp.y = 22;
			return temp;
		}

	}
}