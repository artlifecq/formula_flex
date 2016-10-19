package org.mokylin.skin.app.toujing
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_big;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TouJingSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var labNpcName:feathers.controls.Label;

		public var labTaskDec:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TouJingSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 350;
			this.width = 940;
			this.elementsContent = [__TouJingSkin_UIAsset1_i(),labTaskDec_i(),labNpcName_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TouJingSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 349;
			temp.styleName = "ui/app/npc/bg.png";
			temp.width = 939;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 37;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_big);
			temp.width = 41;
			temp.x = 822;
			temp.y = 71;
			return temp;
		}

		private function labNpcName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labNpcName = temp;
			temp.name = "labNpcName";
			temp.height = 23;
			temp.letterSpacing = 1;
			temp.fontSize = 14;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xF6D621;
			temp.width = 172;
			temp.x = 89;
			temp.y = 275;
			return temp;
		}

		private function labTaskDec_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTaskDec = temp;
			temp.name = "labTaskDec";
			temp.bold = false;
			temp.height = 65;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "这里是护国寺。";
			temp.textAlign = "left";
			temp.color = 0xDED8C7;
			temp.width = 450;
			temp.x = 316;
			temp.y = 94;
			return temp;
		}

	}
}