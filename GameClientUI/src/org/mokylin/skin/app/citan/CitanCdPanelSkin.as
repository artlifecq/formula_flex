package org.mokylin.skin.app.citan
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CitanCdPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnJoin:feathers.controls.Button;

		public var lbTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CitanCdPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 136;
			this.width = 488;
			this.elementsContent = [__CitanCdPanelSkin_UIAsset1_i(),__CitanCdPanelSkin_Label1_i(),lbTime_i(),btnJoin_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CitanCdPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.letterSpacing = 2;
			temp.fontSize = 14;
			temp.text = "倒计时：";
			temp.color = 0xF4BD63;
			temp.width = 68;
			temp.x = 122;
			temp.y = 62;
			return temp;
		}

		private function __CitanCdPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/citan/guotan_bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnJoin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJoin = temp;
			temp.name = "btnJoin";
			temp.height = 31;
			temp.label = "参加";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_yellow2);
			temp.width = 76;
			temp.x = 293;
			temp.y = 57;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.height = 24;
			temp.letterSpacing = 2;
			temp.fontSize = 14;
			temp.text = "59分 58秒";
			temp.color = 0xF4BD63;
			temp.width = 99;
			temp.x = 200;
			temp.y = 63;
			return temp;
		}

	}
}