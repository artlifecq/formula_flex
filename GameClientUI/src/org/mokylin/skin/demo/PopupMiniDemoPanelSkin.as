package org.mokylin.skin.demo
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.SkinnablePanel;
	import feathers.controls.StateSkin;
	import feathers.controls.GradientLabel;
	import org.mokylin.skin.common.PanelSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PopupMiniDemoPanelSkin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PopupMiniDemoPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 578;
			this.width = 768;
			this.elementsContent = [__PopupMiniDemoPanelSkin_Panel1_i(),__PopupMiniDemoPanelSkin_GradientLabel1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PopupMiniDemoPanelSkin_GradientLabel1_i():feathers.controls.GradientLabel
		{
			var temp:feathers.controls.GradientLabel = new feathers.controls.GradientLabel();
			temp.colorRotation = 0.6;
			temp.gradientColor_a = 0xD0FFEA;
			temp.gradientColor_b = 0xB56857;
			temp.height = 32;
			temp.fontSize = 16;
			temp.text = "渐变文本";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 348;
			temp.y = 19;
			return temp;
		}

		private function __PopupMiniDemoPanelSkin_Panel1_i():feathers.controls.SkinnablePanel
		{
			var temp:feathers.controls.SkinnablePanel = new feathers.controls.SkinnablePanel();
			temp.height = 572;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.common.PanelSkin);
			temp.title = "技能";
			temp.width = 774;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}