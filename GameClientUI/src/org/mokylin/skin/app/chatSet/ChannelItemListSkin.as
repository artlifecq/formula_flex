package org.mokylin.skin.app.chatSet
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Check;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.check.CheckBoxSkin_4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ChannelItemListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var checkBox:feathers.controls.Check;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ChannelItemListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),checkBox_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 31;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 258;
			temp.x = 2;
			temp.y = 1;
			return temp;
		}

		private function checkBox_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			checkBox = temp;
			temp.name = "checkBox";
			temp.bold = false;
			temp.label = "复选框";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_4);
			temp.textAlign = "left";
			temp.width = 238;
			temp.x = 10;
			temp.y = 7;
			return temp;
		}

	}
}